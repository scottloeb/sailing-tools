#!/bin/bash

# Budget NodePad - Complete Setup Script
# Run this in your budget-nodepad directory after cloning from GitHub

echo "🚀 Setting up Budget NodePad for Vercel deployment..."

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p app components

# Create package.json
echo "📦 Creating package.json..."
cat > package.json << 'EOF'
{
  "name": "budget-nodepad",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start"
  },
  "dependencies": {
    "next": "14.0.3",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "lucide-react": "^0.294.0"
  },
  "devDependencies": {
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.32",
    "tailwindcss": "^3.3.6"
  }
}
EOF

# Create next.config.js
echo "⚙️ Creating next.config.js..."
cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: { unoptimized: true },
  trailingSlash: true
}
module.exports = nextConfig
EOF

# Create tailwind.config.js
echo "🎨 Creating tailwind.config.js..."
cat > tailwind.config.js << 'EOF'
module.exports = {
  content: ['./app/**/*.{js,jsx}', './components/**/*.{js,jsx}'],
  theme: { extend: {} },
  plugins: [],
}
EOF

# Create postcss.config.js
echo "🔧 Creating postcss.config.js..."
cat > postcss.config.js << 'EOF'
module.exports = {
  plugins: { tailwindcss: {}, autoprefixer: {} },
}
EOF

# Create app/globals.css
echo "💄 Creating app/globals.css..."
cat > app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

# Create app/layout.js
echo "🏗️ Creating app/layout.js..."
cat > app/layout.js << 'EOF'
import './globals.css'

export const metadata = {
  title: 'Budget NodePad',
  description: 'Interactive budget visualization with CSV import and spending pattern analysis',
}

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
EOF

# Create app/page.js
echo "📱 Creating app/page.js..."
cat > app/page.js << 'EOF'
'use client'
import BudgetNodePad from '../components/BudgetNodePad'

export default function Home() {
  return <BudgetNodePad />
}
EOF

# Create placeholder for BudgetNodePad component
echo "🧩 Creating components/BudgetNodePad.js..."
cat > components/BudgetNodePad.js << 'EOF'
// TODO: Copy the complete BudgetNodePad component from Claude
// This should be the React component with enhanced CSV import that works with Copilot data

import React from 'react';

const BudgetNodePad = () => {
  return (
    <div className="p-8 text-center">
      <h1 className="text-2xl font-bold mb-4">Budget NodePad</h1>
      <p className="text-gray-600">
        Replace this placeholder with the complete BudgetNodePad component from Claude
      </p>
    </div>
  );
};

export default BudgetNodePad;
EOF

echo ""
echo "✅ Setup complete! Next steps:"
echo ""
echo "1. 📝 Replace components/BudgetNodePad.js with the working component from Claude"
echo "2. 🔄 git add ."
echo "3. 📤 git commit -m 'Initial Budget NodePad setup'"
echo "4. 🚀 git push origin main"
echo "5. 🌐 Deploy on Vercel!"
echo ""
echo "🎯 Your Budget NodePad is ready for deployment!"
