import React, { useState, useCallback, useRef, useEffect } from 'react';
import { Plus, DollarSign, TrendingUp, Target, Calendar, Settings, Download, Upload, BarChart3, AlertTriangle, FileText } from 'lucide-react';

// Initial budget structure using Grassroots approach
const initialBudgetStructure = {
  nodes: [
    // Root Category Nodes
    { id: 'income', type: 'category', title: 'Income Sources', amount: 0, level: 0, x: 400, y: 100, color: '#22c55e' },
    { id: 'fixed', type: 'category', title: 'Fixed Expenses', amount: 0, level: 0, x: 200, y: 300, color: '#ef4444' },
    { id: 'variable', type: 'category', title: 'Variable Expenses', amount: 0, level: 0, x: 600, y: 300, color: '#f59e0b' },
    { id: 'goals', type: 'category', title: 'Financial Goals', amount: 0, level: 0, x: 400, y: 500, color: '#3b82f6' },
    
    // Income Subcategories
    { id: 'salary', type: 'subcategory', title: 'Primary Salary', amount: 0, level: 1, x: 300, y: 150, color: '#16a34a', parent: 'income' },
    { id: 'freelance', type: 'subcategory', title: 'Freelance/Side Hustle', amount: 0, level: 1, x: 500, y: 150, color: '#16a34a', parent: 'income' },
    
    // Fixed Expense Subcategories
    { id: 'housing', type: 'subcategory', title: 'Housing', amount: 0, level: 1, x: 100, y: 250, color: '#dc2626', parent: 'fixed' },
    { id: 'insurance', type: 'subcategory', title: 'Insurance', amount: 0, level: 1, x: 150, y: 350, color: '#dc2626', parent: 'fixed' },
    { id: 'debt', type: 'subcategory', title: 'Debt Payments', amount: 0, level: 1, x: 250, y: 400, color: '#dc2626', parent: 'fixed' },
    
    // Variable Expense Subcategories
    { id: 'food', type: 'subcategory', title: 'Food & Dining', amount: 0, level: 1, x: 550, y: 250, color: '#d97706', parent: 'variable' },
    { id: 'transport', type: 'subcategory', title: 'Transportation', amount: 0, level: 1, x: 650, y: 350, color: '#d97706', parent: 'variable' },
    { id: 'entertainment', type: 'subcategory', title: 'Entertainment', amount: 0, level: 1, x: 700, y: 400, color: '#d97706', parent: 'variable' },
    
    // Goal Subcategories
    { id: 'emergency', type: 'subcategory', title: 'Emergency Fund', amount: 0, level: 1, x: 300, y: 550, color: '#2563eb', parent: 'goals' },
    { id: 'vacation', type: 'subcategory', title: 'Vacation Fund', amount: 0, level: 1, x: 500, y: 550, color: '#2563eb', parent: 'goals' },
  ],
  edges: [
    // Parent-child relationships
    { source: 'income', target: 'salary', type: 'contains' },
    { source: 'income', target: 'freelance', type: 'contains' },
    { source: 'fixed', target: 'housing', type: 'contains' },
    { source: 'fixed', target: 'insurance', type: 'contains' },
    { source: 'fixed', target: 'debt', type: 'contains' },
    { source: 'variable', target: 'food', type: 'contains' },
    { source: 'variable', target: 'transport', type: 'contains' },
    { source: 'variable', target: 'entertainment', type: 'contains' },
    { source: 'goals', target: 'emergency', type: 'contains' },
    { source: 'goals', target: 'vacation', type: 'contains' },
  ]
};

const BudgetNodePad = () => {
  const [budgetData, setBudgetData] = useState(initialBudgetStructure);
  const [selectedNode, setSelectedNode] = useState(null);
  const [isDragging, setIsDragging] = useState(false);
  const [dragOffset, setDragOffset] = useState({ x: 0, y: 0 });
  const [showAddForm, setShowAddForm] = useState(false);
  const [newNodeData, setNewNodeData] = useState({ title: '', amount: '', color: '#22c55e' });
  const [viewMode, setViewMode] = useState('structure');
  const [transactions, setTransactions] = useState([]);
  const [spendingPatterns, setSpendingPatterns] = useState([]);
  const [showImportModal, setShowImportModal] = useState(false);
  const [showPatterns, setShowPatterns] = useState(false);
  const [importProgress, setImportProgress] = useState({ show: false, progress: 0, status: '' });
  const svgRef = useRef(null);
  const fileInputRef = useRef(null);

  // Handle node selection
  const handleNodeClick = (node) => {
    if (!isDragging) {
      setSelectedNode(node);
    }
  };

  // Handle node dragging
  const handleMouseDown = (e, node) => {
    e.preventDefault();
    setIsDragging(true);
    const rect = svgRef.current.getBoundingClientRect();
    setDragOffset({
      x: e.clientX - rect.left - node.x,
      y: e.clientY - rect.top - node.y
    });
    setSelectedNode(node);
  };

  const handleMouseMove = useCallback((e) => {
    if (isDragging && selectedNode) {
      const rect = svgRef.current.getBoundingClientRect();
      const newX = e.clientX - rect.left - dragOffset.x;
      const newY = e.clientY - rect.top - dragOffset.y;
      
      setBudgetData(prev => ({
        ...prev,
        nodes: prev.nodes.map(node => 
          node.id === selectedNode.id 
            ? { ...node, x: newX, y: newY }
            : node
        )
      }));
    }
  }, [isDragging, selectedNode, dragOffset]);

  const handleMouseUp = () => {
    setIsDragging(false);
  };

  useEffect(() => {
    if (isDragging) {
      document.addEventListener('mousemove', handleMouseMove);
      document.addEventListener('mouseup', handleMouseUp);
      return () => {
        document.removeEventListener('mousemove', handleMouseMove);
        document.removeEventListener('mouseup', handleMouseUp);
      };
    }
  }, [isDragging, handleMouseMove]);

  // Add new node
  const addNode = () => {
    if (!newNodeData.title) return;
    
    const newNode = {
      id: `node_${Date.now()}`,
      title: newNodeData.title,
      type: selectedNode?.isParent ? 'subcategory' : 'category',
      amount: parseFloat(newNodeData.amount) || 0,
      level: selectedNode?.isParent ? 1 : 0,
      color: newNodeData.color,
      parent: selectedNode?.isParent ? selectedNode.id : null,
      x: 400 + Math.random() * 100,
      y: 300 + Math.random() * 100,
    };
    
    setBudgetData(prev => ({
      ...prev,
      nodes: [...prev.nodes, newNode]
    }));
    
    // Add edge if parent specified
    if (newNodeData.parent || selectedNode?.isParent) {
      const newEdge = {
        source: selectedNode?.isParent ? selectedNode.id : newNodeData.parent,
        target: newNode.id,
        type: 'contains'
      };
      setBudgetData(prev => ({
        ...prev,
        edges: [...prev.edges, newEdge]
      }));
    }
    
    setShowAddForm(false);
    setNewNodeData({ title: '', amount: '', color: '#22c55e' });
  };

  // Update node amount
  const updateNodeAmount = (nodeId, amount) => {
    setBudgetData(prev => ({
      ...prev,
      nodes: prev.nodes.map(node => 
        node.id === nodeId 
          ? { ...node, amount: parseFloat(amount) || 0 }
          : node
      )
    }));
  };

  // Smart categorization using keywords and patterns
  const categorizeTransaction = (description, amount) => {
    const desc = description.toLowerCase();
    
    // Income patterns
    if (desc.includes('payroll') || desc.includes('salary') || desc.includes('direct deposit')) {
      return { category: 'salary', confidence: 0.9 };
    }
    if (desc.includes('freelance') || desc.includes('consultant') || desc.includes('1099')) {
      return { category: 'freelance', confidence: 0.85 };
    }
    
    // Housing patterns
    if (desc.includes('rent') || desc.includes('mortgage') || desc.includes('property') || 
        desc.includes('utilities') || desc.includes('electric') || desc.includes('gas') || desc.includes('water')) {
      return { category: 'housing', confidence: 0.9 };
    }
    
    // Food patterns
    if (desc.includes('grocery') || desc.includes('food') || desc.includes('restaurant') || 
        desc.includes('cafe') || desc.includes('starbucks') || desc.includes('mcdonald') ||
        desc.includes('uber eats') || desc.includes('doordash') || desc.includes('grubhub')) {
      return { category: 'food', confidence: 0.85 };
    }
    
    // Transportation patterns
    if (desc.includes('gas') || desc.includes('fuel') || desc.includes('uber') || desc.includes('lyft') ||
        desc.includes('parking') || desc.includes('metro') || desc.includes('transit') || desc.includes('car')) {
      return { category: 'transport', confidence: 0.8 };
    }
    
    // Entertainment patterns
    if (desc.includes('movie') || desc.includes('netflix') || desc.includes('spotify') || 
        desc.includes('entertainment') || desc.includes('game') || desc.includes('concert')) {
      return { category: 'entertainment', confidence: 0.75 };
    }
    
    // Insurance patterns
    if (desc.includes('insurance') || desc.includes('premium') || desc.includes('policy')) {
      return { category: 'insurance', confidence: 0.9 };
    }
    
    // Debt patterns
    if (desc.includes('loan') || desc.includes('credit card') || desc.includes('payment') ||
        desc.includes('student') || desc.includes('interest')) {
      return { category: 'debt', confidence: 0.8 };
    }
    
    // Default to variable expenses for unknown spending
    if (amount < 0) {
      return { category: 'entertainment', confidence: 0.3 };
    }
    
    return { category: 'freelance', confidence: 0.2 };
  };

  // CSV Import functionality with progress
  const handleFileUpload = (event) => {
    const file = event.target.files[0];
    if (!file) return;
    
    setImportProgress({ show: true, progress: 0, status: 'Reading file...' });
    
    const reader = new FileReader();
    reader.onload = (e) => {
      setImportProgress({ show: true, progress: 20, status: 'Parsing CSV data...' });
      
      setTimeout(() => {
        const text = e.target.result;
        const lines = text.split('\n');
        const headers = lines[0].split(',').map(h => h.trim().toLowerCase());
        
        setImportProgress({ show: true, progress: 40, status: 'Processing transactions...' });
        
        const newTransactions = [];
        const totalLines = lines.length - 1;
        
        for (let i = 1; i < lines.length; i++) {
          // Update progress every 100 lines
          if (i % 100 === 0) {
            const progress = 40 + Math.round((i / totalLines) * 40);
            setImportProgress({ show: true, progress, status: `Processing transaction ${i} of ${totalLines}...` });
          }
          
          const values = lines[i].split(',');
          if (values.length < 2) continue;
          
          // Try to parse common CSV formats
          let transaction = {};
          
          // Find date column
          const dateIndex = headers.findIndex(h => h.includes('date') || h.includes('posted'));
          if (dateIndex >= 0) transaction.date = values[dateIndex]?.trim();
          
          // Find description column
          const descIndex = headers.findIndex(h => h.includes('description') || h.includes('memo') || h.includes('merchant'));
          if (descIndex >= 0) transaction.description = values[descIndex]?.trim().replace(/"/g, '');
          
          // Find amount column
          const amountIndex = headers.findIndex(h => h.includes('amount') || h.includes('debit') || h.includes('credit'));
          if (amountIndex >= 0) {
            const amountStr = values[amountIndex]?.trim().replace(/[,$"]/g, '');
            transaction.amount = parseFloat(amountStr) || 0;
          }
          
          if (transaction.description && transaction.amount !== undefined) {
            // Auto-categorize
            const categorization = categorizeTransaction(transaction.description, transaction.amount);
            transaction.suggestedCategory = categorization.category;
            transaction.confidence = categorization.confidence;
            transaction.id = `tx_${Date.now()}_${i}`;
            
            newTransactions.push(transaction);
          }
        }
        
        setImportProgress({ show: true, progress: 80, status: 'Analyzing spending patterns...' });
        
        setTimeout(() => {
          setTransactions(prev => [...prev, ...newTransactions]);
          analyzeSpendingPatterns([...transactions, ...newTransactions]);
          updateBudgetFromTransactions(newTransactions);
          
          setImportProgress({ show: true, progress: 100, status: `Successfully imported ${newTransactions.length} transactions!` });
          
          setTimeout(() => {
            setImportProgress({ show: false, progress: 0, status: '' });
            setShowImportModal(false);
          }, 2000);
        }, 500);
      }, 300);
    };
    
    reader.readAsText(file);
  };

  // Update budget amounts based on imported transactions
  const updateBudgetFromTransactions = (newTransactions) => {
    const categoryTotals = {};
    
    newTransactions.forEach(tx => {
      const category = tx.suggestedCategory;
      if (!categoryTotals[category]) categoryTotals[category] = 0;
      categoryTotals[category] += Math.abs(tx.amount);
    });
    
    setBudgetData(prev => ({
      ...prev,
      nodes: prev.nodes.map(node => {
        if (categoryTotals[node.id]) {
          return { ...node, amount: categoryTotals[node.id] };
        }
        return node;
      })
    }));
  };

  // Spending Pattern Analysis
  const analyzeSpendingPatterns = (txData) => {
    const patterns = [];
    
    if (txData.length === 0) return;
    
    // 1. Day of week spending patterns
    const daySpending = { 0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0 };
    const dayCount = { 0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0 };
    
    txData.forEach(tx => {
      if (tx.amount < 0 && tx.date) {
        const date = new Date(tx.date);
        if (!isNaN(date)) {
          const day = date.getDay();
          daySpending[day] += Math.abs(tx.amount);
          dayCount[day]++;
        }
      }
    });
    
    const weekdayAvg = (daySpending[1] + daySpending[2] + daySpending[3] + daySpending[4] + daySpending[5]) / 5;
    const weekendAvg = (daySpending[0] + daySpending[6]) / 2;
    
    if (weekendAvg > weekdayAvg * 1.3) {
      patterns.push({
        type: 'weekend_surge',
        title: 'Weekend Spending Surge',
        description: `You spend ${Math.round(((weekendAvg / weekdayAvg) - 1) * 100)}% more on weekends`,
        impact: 'high',
        suggestion: 'Consider setting weekend spending limits or planning activities that cost less',
        amount: weekendAvg - weekdayAvg
      });
    }
    
    // 2. Large transaction analysis
    const amounts = txData.filter(tx => tx.amount < 0).map(tx => Math.abs(tx.amount)).sort((a, b) => b - a);
    const median = amounts[Math.floor(amounts.length / 2)] || 0;
    const large = amounts.filter(a => a > median * 3);
    
    if (large.length > amounts.length * 0.1) {
      patterns.push({
        type: 'large_transactions',
        title: 'Frequent Large Purchases',
        description: `${large.length} transactions over ${Math.round(median * 3)}`,
        impact: 'medium',
        suggestion: 'Review large purchases - consider if they align with your budget priorities',
        amount: large.reduce((sum, amt) => sum + amt, 0)
      });
    }
    
    // 3. Category concentration
    const categorySpending = {};
    txData.forEach(tx => {
      if (tx.amount < 0) {
        const cat = tx.suggestedCategory || 'other';
        categorySpending[cat] = (categorySpending[cat] || 0) + Math.abs(tx.amount);
      }
    });
    
    const totalSpending = Object.values(categorySpending).reduce((sum, amt) => sum + amt, 0);
    Object.entries(categorySpending).forEach(([category, amount]) => {
      const percentage = (amount / totalSpending) * 100;
      if (percentage > 40) {
        patterns.push({
          type: 'category_concentration',
          title: `High ${category} Spending`,
          description: `${Math.round(percentage)}% of spending goes to ${category}`,
          impact: percentage > 50 ? 'high' : 'medium',
          suggestion: `Consider ways to reduce ${category} expenses or ensure this aligns with your priorities`,
          amount: amount
        });
      }
    });
    
    // 4. Subscription detection
    const recurring = {};
    txData.forEach(tx => {
      if (tx.amount < 0) {
        const amount = Math.abs(tx.amount);
        const key = `${tx.description?.substring(0, 10)}_${amount}`;
        recurring[key] = (recurring[key] || 0) + 1;
      }
    });
    
    const subscriptions = Object.entries(recurring).filter(([key, count]) => count >= 2);
    if (subscriptions.length > 0) {
      const subTotal = subscriptions.reduce((sum, [key]) => {
        const amount = parseFloat(key.split('_')[1]) || 0;
        return sum + amount;
      }, 0);
      
      patterns.push({
        type: 'subscriptions',
        title: 'Recurring Subscriptions',
        description: `${subscriptions.length} recurring charges detected`,
        impact: 'medium',
        suggestion: 'Review subscriptions - cancel unused services to free up monthly budget',
        amount: subTotal
      });
    }
    
    setSpendingPatterns(patterns);
  };
  const calculateTotal = (parentId) => {
    return budgetData.nodes
      .filter(node => node.parent === parentId)
      .reduce((sum, node) => sum + (node.amount || 0), 0);
  };

  return (
    <div className="w-full h-screen bg-gray-50 flex">
      {/* Left Sidebar - Structure View */}
      <div className="w-80 bg-white border-r border-gray-200 flex flex-col">
        {/* Header */}
        <div className="p-4 border-b border-gray-200">
          <h1 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <DollarSign className="w-6 h-6 text-green-600" />
            Budget NodePad
          </h1>
          <p className="text-sm text-gray-600 mt-1">Grassroots Budget Structure</p>
        </div>

        {/* View Mode Tabs */}
        <div className="flex border-b border-gray-200">
          {[
            { id: 'structure', label: 'Structure', icon: TrendingUp },
            { id: 'transactions', label: 'Transactions', icon: Calendar },
            { id: 'goals', label: 'Goals', icon: Target }
          ].map(({ id, label, icon: Icon }) => (
            <button
              key={id}
              onClick={() => setViewMode(id)}
              className={`flex-1 px-3 py-2 text-sm font-medium flex items-center justify-center gap-1 ${
                viewMode === id 
                  ? 'text-blue-600 border-b-2 border-blue-600 bg-blue-50' 
                  : 'text-gray-600 hover:text-gray-900 hover:bg-gray-50'
              }`}
            >
              <Icon className="w-4 h-4" />
              {label}
            </button>
          ))}
        </div>

        {/* Category Structure */}
        <div className="flex-1 overflow-y-auto p-4">
          {budgetData.nodes.filter(node => node.level === 0).map(category => (
            <div key={category.id} className="mb-4">
              <div 
                className={`p-3 rounded-lg border-2 cursor-pointer transition-all ${
                  selectedNode?.id === category.id 
                    ? 'border-blue-500 bg-blue-50' 
                    : 'border-gray-200 hover:border-gray-300'
                }`}
                style={{ borderLeftColor: category.color, borderLeftWidth: '4px' }}
                onClick={() => handleNodeClick(category)}
              >
                <div className="flex justify-between items-center">
                  <h3 className="font-medium text-gray-900">{category.title}</h3>
                  <span className="text-lg font-bold" style={{ color: category.color }}>
                    ${calculateTotal(category.id).toLocaleString()}
                  </span>
                </div>
              </div>
              
              {/* Subcategories */}
              <div className="ml-4 mt-2 space-y-2">
                {budgetData.nodes
                  .filter(node => node.parent === category.id)
                  .map(subcategory => (
                    <div 
                      key={subcategory.id}
                      className={`p-2 rounded border cursor-pointer transition-all ${
                        selectedNode?.id === subcategory.id 
                          ? 'border-blue-500 bg-blue-50' 
                          : 'border-gray-100 hover:border-gray-200'
                      }`}
                      onClick={() => handleNodeClick(subcategory)}
                    >
                      <div className="flex justify-between items-center">
                        <span className="text-sm text-gray-700">{subcategory.title}</span>
                        <input
                          type="number"
                          value={subcategory.amount || ''}
                          onChange={(e) => updateNodeAmount(subcategory.id, e.target.value)}
                          className="w-20 text-sm text-right border-none bg-transparent font-medium"
                          style={{ color: subcategory.color }}
                          placeholder="$0"
                          onClick={(e) => e.stopPropagation()}
                        />
                      </div>
                    </div>
                  ))}
                
                {/* Add subcategory button */}
                <button 
                  onClick={() => {
                    setShowAddForm(true);
                    setSelectedNode({ ...category, isParent: true });
                  }}
                  className="w-full p-2 border border-dashed border-gray-300 rounded text-sm text-gray-500 hover:border-gray-400 hover:text-gray-700 flex items-center justify-center gap-1"
                >
                  <Plus className="w-4 h-4" />
                  Add subcategory
                </button>
              </div>
            </div>
          ))}
        </div>

        {/* Action Buttons */}
        <div className="p-4 border-t border-gray-200 space-y-2">
          <button 
            onClick={() => setShowAddForm(true)}
            className="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 flex items-center justify-center gap-2"
          >
            <Plus className="w-4 h-4" />
            Add Category
          </button>
          <div className="flex gap-2">
            <button 
              onClick={() => setShowImportModal(true)}
              className="flex-1 bg-green-100 text-green-700 py-2 px-3 rounded-lg hover:bg-green-200 flex items-center justify-center gap-1"
            >
              <Upload className="w-4 h-4" />
              Import CSV
            </button>
            <button 
              onClick={() => setShowPatterns(true)}
              className="flex-1 bg-purple-100 text-purple-700 py-2 px-3 rounded-lg hover:bg-purple-200 flex items-center justify-center gap-1"
            >
              <BarChart3 className="w-4 h-4" />
              Patterns
            </button>
          </div>
        </div>
      </div>

      {/* Main Graph View */}
      <div className="flex-1 flex flex-col">
        {/* Top Bar */}
        <div className="bg-white border-b border-gray-200 p-4 flex justify-between items-center">
          <div>
            <h2 className="text-lg font-semibold text-gray-900">
              Budget Structure Visualization
            </h2>
            <p className="text-sm text-gray-600">
              Drag nodes to reorganize • Click to select and edit
              {transactions.length > 0 && (
                <span className="ml-2 text-blue-600">
                  • {transactions.length} transactions imported
                </span>
              )}
            </p>
          </div>
          <div className="flex gap-2">
            {spendingPatterns.length > 0 && (
              <button 
                onClick={() => setShowPatterns(true)}
                className="bg-purple-600 text-white px-3 py-1 rounded-lg text-sm flex items-center gap-1 hover:bg-purple-700"
              >
                <AlertTriangle className="w-4 h-4" />
                {spendingPatterns.length} Patterns Found
              </button>
            )}
            <button className="p-2 text-gray-400 hover:text-gray-600">
              <Settings className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* SVG Graph */}
        <div className="flex-1 relative overflow-hidden">
          <svg 
            ref={svgRef}
            className="w-full h-full cursor-move"
            style={{ background: 'radial-gradient(circle at 50% 50%, #f8fafc 0%, #f1f5f9 100%)' }}
          >
            {/* Grid Pattern */}
            <defs>
              <pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse">
                <path d="M 20 0 L 0 0 0 20" fill="none" stroke="#e2e8f0" strokeWidth="0.5"/>
              </pattern>
            </defs>
            <rect width="100%" height="100%" fill="url(#grid)" />
            
            {/* Edges */}
            {budgetData.edges.map((edge, index) => {
              const sourceNode = budgetData.nodes.find(n => n.id === edge.source);
              const targetNode = budgetData.nodes.find(n => n.id === edge.target);
              if (!sourceNode || !targetNode) return null;
              
              return (
                <line
                  key={index}
                  x1={sourceNode.x}
                  y1={sourceNode.y}
                  x2={targetNode.x}
                  y2={targetNode.y}
                  stroke="#94a3b8"
                  strokeWidth="2"
                  strokeDasharray={edge.type === 'contains' ? '5,5' : 'none'}
                />
              );
            })}
            
            {/* Nodes */}
            {budgetData.nodes.map(node => {
              const total = node.level === 0 ? calculateTotal(node.id) : node.amount || 0;
              const radius = node.level === 0 ? 40 : 30;
              
              return (
                <g key={node.id}>
                  {/* Node Circle */}
                  <circle
                    cx={node.x}
                    cy={node.y}
                    r={radius}
                    fill={selectedNode?.id === node.id ? node.color : `${node.color}E6`}
                    stroke={selectedNode?.id === node.id ? '#1f2937' : 'white'}
                    strokeWidth={selectedNode?.id === node.id ? 3 : 2}
                    className="cursor-pointer transition-all hover:stroke-gray-700"
                    onMouseDown={(e) => handleMouseDown(e, node)}
                    onClick={() => handleNodeClick(node)}
                  />
                  
                  {/* Node Label */}
                  <text
                    x={node.x}
                    y={node.y - radius - 10}
                    textAnchor="middle"
                    className="text-sm font-medium fill-gray-700 pointer-events-none"
                  >
                    {node.title}
                  </text>
                  
                  {/* Amount */}
                  <text
                    x={node.x}
                    y={node.y + 4}
                    textAnchor="middle"
                    className="text-xs font-bold fill-white pointer-events-none"
                  >
                    ${total.toLocaleString()}
                  </text>
                </g>
              );
            })}
          </svg>
        </div>
      </div>

      {/* CSV Import Modal */}
      {showImportModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg p-6 w-96 max-w-full mx-4">
            <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
              <Upload className="w-5 h-5 text-green-600" />
              Import CSV Transactions
            </h3>
            
            <div className="space-y-4">
              <div className="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center">
                <FileText className="w-12 h-12 text-gray-400 mx-auto mb-2" />
                <p className="text-sm text-gray-600 mb-3">
                  Upload your bank statement CSV file
                </p>
                <input
                  ref={fileInputRef}
                  type="file"
                  accept=".csv"
                  onChange={handleFileUpload}
                  className="hidden"
                />
                <button
                  onClick={() => fileInputRef.current?.click()}
                  className="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700"
                  disabled={importProgress.show}
                >
                  {importProgress.show ? 'Processing...' : 'Choose CSV File'}
                </button>
              </div>
              
              {/* Progress Bar */}
              {importProgress.show && (
                <div className="mt-4">
                  <div className="flex justify-between text-sm text-gray-600 mb-1">
                    <span>{importProgress.status}</span>
                    <span>{importProgress.progress}%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-3">
                    <div 
                      className="bg-green-600 h-3 rounded-full transition-all duration-300 ease-out"
                      style={{ width: `${importProgress.progress}%` }}
                    />
                  </div>
                </div>
              )}
              
              <div className="text-xs text-gray-500 space-y-1">
                <p><strong>Supported formats:</strong></p>
                <p>• Date, Description, Amount columns</p>
                <p>• Most bank CSV exports</p>
                <p>• Transactions will be auto-categorized</p>
              </div>
            </div>
            
            <div className="flex gap-3 mt-6">
              <button
                onClick={() => setShowImportModal(false)}
                className="flex-1 bg-gray-100 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-200"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Spending Patterns Modal */}
      {showPatterns && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg p-6 w-2xl max-w-full mx-4 max-h-[80vh] overflow-y-auto">
            <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
              <BarChart3 className="w-5 h-5 text-purple-600" />
              Spending Pattern Analysis
            </h3>
            
            {spendingPatterns.length === 0 ? (
              <div className="text-center py-8">
                <TrendingUp className="w-12 h-12 text-gray-400 mx-auto mb-3" />
                <p className="text-gray-600">No patterns detected yet.</p>
                <p className="text-sm text-gray-500 mt-1">Import transactions to see spending insights.</p>
              </div>
            ) : (
              <div className="space-y-4">
                {spendingPatterns.map((pattern, index) => (
                  <div key={index} className="border rounded-lg p-4">
                    <div className="flex justify-between items-start mb-2">
                      <div className="flex items-center gap-2">
                        <div className={`w-3 h-3 rounded-full ${
                          pattern.impact === 'high' ? 'bg-red-500' : 
                          pattern.impact === 'medium' ? 'bg-yellow-500' : 'bg-green-500'
                        }`} />
                        <h4 className="font-medium text-gray-900">{pattern.title}</h4>
                      </div>
                      <span className="text-lg font-bold text-gray-700">
                        ${pattern.amount?.toLocaleString()}
                      </span>
                    </div>
                    
                    <p className="text-gray-600 text-sm mb-3">{pattern.description}</p>
                    
                    <div className="bg-blue-50 border border-blue-200 rounded p-3">
                      <p className="text-sm text-blue-800">
                        <strong>💡 Suggestion:</strong> {pattern.suggestion}
                      </p>
                    </div>
                  </div>
                ))}
                
                <div className="mt-6 p-4 bg-gray-50 rounded-lg">
                  <h4 className="font-medium text-gray-900 mb-2">Quick Actions</h4>
                  <div className="space-y-2 text-sm">
                    <button className="w-full text-left p-2 bg-white rounded border hover:bg-gray-50">
                      📊 Export detailed spending report
                    </button>
                    <button className="w-full text-left p-2 bg-white rounded border hover:bg-gray-50">
                      🎯 Set spending limits based on patterns
                    </button>
                    <button className="w-full text-left p-2 bg-white rounded border hover:bg-gray-50">
                      📅 Schedule monthly pattern review
                    </button>
                  </div>
                </div>
              </div>
            )}
            
            <div className="flex gap-3 mt-6">
              <button
                onClick={() => setShowPatterns(false)}
                className="flex-1 bg-gray-100 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-200"
              >
                Close
              </button>
              {spendingPatterns.length > 0 && (
                <button className="flex-1 bg-purple-600 text-white py-2 px-4 rounded-lg hover:bg-purple-700">
                  Apply Suggestions
                </button>
              )}
            </div>
          </div>
        </div>
      )}
      {showAddForm && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg p-6 w-96 max-w-full mx-4">
            <h3 className="text-lg font-semibold mb-4">
              Add {selectedNode?.isParent ? 'Subcategory' : 'Category'}
            </h3>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Name
                </label>
                <input
                  type="text"
                  value={newNodeData.title}
                  onChange={(e) => setNewNodeData({...newNodeData, title: e.target.value})}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2"
                  placeholder="e.g., Groceries, Mortgage"
                />
              </div>
              
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Budget Amount
                </label>
                <input
                  type="number"
                  step="0.01"
                  value={newNodeData.amount}
                  onChange={(e) => setNewNodeData({...newNodeData, amount: e.target.value})}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2"
                  placeholder="0.00"
                />
              </div>
              
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Color
                </label>
                <select 
                  value={newNodeData.color}
                  onChange={(e) => setNewNodeData({...newNodeData, color: e.target.value})}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2"
                >
                  <option value="#22c55e">Green (Income)</option>
                  <option value="#ef4444">Red (Expenses)</option>
                  <option value="#f59e0b">Orange (Variable)</option>
                  <option value="#3b82f6">Blue (Goals)</option>
                  <option value="#8b5cf6">Purple (Other)</option>
                </select>
              </div>
            </div>
            
            <div className="flex gap-3 mt-6">
              <button
                onClick={() => setShowAddForm(false)}
                className="flex-1 bg-gray-100 text-gray-700 py-2 px-4 rounded-lg hover:bg-gray-200"
              >
                Cancel
              </button>
              <button
                onClick={addNode}
                className="flex-1 bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700"
              >
                Add
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default BudgetNodePad;