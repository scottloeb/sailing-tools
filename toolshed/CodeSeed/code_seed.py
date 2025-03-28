#!/usr/bin/env python3
"""
CodeSeed: Semantic Forest Mapper v1.0

A metadata extraction system designed to reveal the structural patterns and cognitive
anchors within codebases. Unlike traditional static analyzers that focus on
syntax or dependencies, CodeSeed maps the thoughtflows embedded in code through
a rich metadata extraction process.

This tool embodies a forest-first approach to code analysis:
- Trees = Individual files with unique growth patterns
- Roots = Core dependencies and foundations
- Canopy = Interface layers that interact with users
- Seeds = Reusable patterns and concepts that can spread
- Forest Floor = Shared resources and utilities

CORE CAPABILITIES:
1. Deep structural analysis of multiple file types
2. Semantic relationship extraction between identifiers and documentation
3. Temporal pattern detection through version control integration
4. Cognitive marker identification (comments, TODOs, metaphors)
5. Multi-dimensional representation through layered metadata extraction

This codebase serves as a reference implementation for clear semantic linking
between identifiers, inline documentation, and formal docstrings.
"""

import os
import sys
import re
import csv
import json
import time
import datetime
import hashlib
import logging
from pathlib import Path
from collections import defaultdict, Counter
from typing import Dict, List, Tuple, Set, Any, Optional, Union, Iterator

# ======================================================================
# META4 STACK TRACE
# ======================================================================
"""
Layer 1 (Forest Metaphor):
- Files → Trees of different species
- Directories → Groves with similar ecology
- Identifiers → Leaves with unique patterns
- Documentation → Growth rings showing history
- Semantic links → Root systems connecting trees

Layer 2 (Knowledge Network Metaphor):
- Files → Nodes in knowledge graph (trees → nodes)
- Directories → Neighborhoods (groves → neighborhoods)
- Identifiers → Concept anchors (leaves → anchors) 
- Documentation → Context providers (rings → context)
- Semantic links → Explicit connections (roots → connections)

Layer 3 (Code Structure):
- AST representation of syntax and relationships
- Parse tree mapping intention to implementation
- Documentation extraction and association
- Identifier tracking and reference mapping
- Pattern identification across scopes

Invariant Properties:
- Relationship importance prioritized over individual elements
- Documentation treated as first-class structural component
- Temporal information preserved across representations
- Patterns recognized at multiple levels of abstraction
- Cognitive markers highlighted as navigational waypoints
"""

# Configure logging to track analysis process
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger('codeseed')


# ======================================================================
# SeedCore: Fundamental Components of the Forest
# ======================================================================

class IdentifierTracker:
    """
    Tracks and analyzes code identifiers with their semantic context.
    
    The IdentifierTracker serves as the leaf recognition system within our forest,
    mapping each unique identifier to its documentation, usage patterns, and 
    semantic relationships. Like how leaves capture sunlight to power a tree,
    identifiers capture developer intention to power code understanding.
    
    Attributes:
        patterns: Regular expression patterns for identifying different types
            of code identifiers across multiple languages.
        contexts: Documentation and usage contexts associated with identifiers.
        relationship_map: Network of connections between related identifiers.
    """
    
    def __init__(self) -> None:
        """
        Initialize the identifier tracking system with language-specific patterns.
        
        The initialization creates specialized pattern recognition for different
        programming languages, establishing a taxonomy of identifier types that's
        used throughout the analysis process.
        """
        # Language-specific identifier patterns
        self.patterns = {
            # Python identifier patterns
            'python': {
                'function': r'def\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\(',
                'class': r'class\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*(?:\(|:)',
                'variable': r'([a-zA-Z_][a-zA-Z0-9_]*)\s*=',
                'import': r'import\s+([a-zA-Z_][a-zA-Z0-9_]*)',
                'from_import': r'from\s+([a-zA-Z_][a-zA-Z0-9_.]*)\s+import',
                'parameter': r'def\s+[a-zA-Z0-9_]+\s*\(([^)]*)\)',
                'attribute': r'self\.([a-zA-Z_][a-zA-Z0-9_]*)',
            },
            # JavaScript identifier patterns
            'javascript': {
                'function': r'function\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\(',
                'class': r'class\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*(?:\{|extends)',
                'const': r'const\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*=',
                'let': r'let\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*=',
                'var': r'var\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*=',
                'import': r'import\s+(\{[^}]*\}|\*\s+as\s+[a-zA-Z_][a-zA-Z0-9_]*|[a-zA-Z_][a-zA-Z0-9_]*)',
                'method': r'([a-zA-Z_][a-zA-Z0-9_]*)\s*\([^)]*\)\s*\{',
                'arrow_function': r'(?:const|let|var)\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*\([^)]*\)\s*=>',
                'parameter': r'function\s+[a-zA-Z0-9_]+\s*\(([^)]*)\)',
                'property': r'this\.([a-zA-Z_][a-zA-Z0-9_]*)',
            },
            # HTML identifier patterns
            'html': {
                'id': r'id=[\'"]([^\'"]*)[\'"]',
                'class': r'class=[\'"]([^\'"]*)[\'"]',
                'tag': r'<([a-zA-Z][a-zA-Z0-9_-]*)(?:\s|>|/>)',
                'attribute': r'\s([a-zA-Z][a-zA-Z0-9_-]*)\s*=',
            },
            # CSS identifier patterns
            'css': {
                'class': r'\.([a-zA-Z][a-zA-Z0-9_-]*)',
                'id': r'#([a-zA-Z][a-zA-Z0-9_-]*)',
                'selector': r'([a-zA-Z][a-zA-Z0-9_-]*)\s*\{',
                'property': r'([a-zA-Z-]+)\s*:',
                'media': r'@media\s+(.*?)\s*\{',
                'keyframes': r'@keyframes\s+([a-zA-Z][a-zA-Z0-9_-]*)',
            },
            # Markdown identifier patterns
            'markdown': {
                'heading': r'^#+\s+(.+)$',
                'list_item': r'^\s*[\*\-\+]\s+(.+)$',
                'link': r'\[([^\]]+)\]\(([^)]+)\)',
                'code_block': r'```([a-zA-Z0-9_]*)$',
                'emphasis': r'\*\*([^\*]+)\*\*',
            }
        }
        
        # Storage for identifier contexts
        self.contexts: Dict[str, Dict[str, Any]] = {}
        
        # Network of relationships between identifiers
        self.relationship_map: Dict[str, Set[str]] = defaultdict(set)
        
        logger.debug("IdentifierTracker initialized with patterns for multiple languages")
    
    def extract_identifiers(self, content: str, file_type: str) -> Dict[str, List[Dict[str, Any]]]:
        """
        Extract identifiers from content based on file type patterns.
        
        This method acts as a specialized scanner, moving through the code
        like a botanist examining a forest floor, identifying different species
        of identifiers based on their unique characteristics.
        
        Args:
            content: The file content to analyze.
            file_type: The type of file (python, javascript, etc.)
            
        Returns:
            Dictionary mapping identifier types to lists of found identifiers.
        """
        language = self._determine_language(file_type)
        patterns = self.patterns.get(language, {})
        
        # Container for findings
        identifiers: Dict[str, List[Dict[str, Any]]] = defaultdict(list)
        
        # Apply each pattern for the detected language
        for id_type, pattern in patterns.items():
            matches = re.finditer(pattern, content, re.MULTILINE)
            
            # Extract and store each match with its context
            for match in matches:
                # Handle special cases like parameters that need parsing
                if id_type == 'parameter':
                    param_str = match.group(1).strip()
                    if param_str:
                        # Split and process individual parameters
                        params = [p.strip() for p in param_str.split(',')]
                        for param in params:
                            # Handle default values, type hints, etc.
                            param_name = param.split('=')[0].split(':')[0].strip()
                            if param_name and param_name != 'self':
                                # Create an identifier record
                                identifier = {
                                    'name': param_name,
                                    'type': 'parameter',
                                    'line': content.count('\n', 0, match.start()) + 1,
                                    'pos': match.start(),
                                    'context': self._extract_context(content, match)
                                }
                                identifiers['parameter'].append(identifier)
                else:
                    # Standard identifier extraction
                    id_name = match.group(1)
                    identifier = {
                        'name': id_name,
                        'type': id_type,
                        'line': content.count('\n', 0, match.start()) + 1,
                        'pos': match.start(),
                        'context': self._extract_context(content, match)
                    }
                    identifiers[id_type].append(identifier)
                    
                    # Update relationship map for this identifier
                    self._update_relationships(content, id_name, match)
        
        logger.debug(f"Extracted {sum(len(ids) for ids in identifiers.values())} identifiers "
                     f"of {len(identifiers)} types from {language} content")
        return identifiers
    
    def _determine_language(self, file_type: str) -> str:
        """
        Map file type to appropriate language pattern set.
        
        Acts as a linguistic interpreter, determining which set of patterns
        to apply based on the detected file type.
        
        Args:
            file_type: MIME type or file extension.
            
        Returns:
            Language key for pattern lookup.
        """
        # Map common file types/extensions to language pattern sets
        type_to_language = {
            'text/x-python': 'python',
            'application/javascript': 'javascript',
            'text/javascript': 'javascript',
            'text/html': 'html',
            'text/css': 'css',
            'text/markdown': 'markdown',
            '.py': 'python',
            '.js': 'javascript',
            '.html': 'html',
            '.css': 'css',
            '.md': 'markdown',
        }
        
        # Check for direct MIME type match
        if file_type in type_to_language:
            return type_to_language[file_type]
        
        # Check for extension match
        for ext, lang in type_to_language.items():
            if file_type.endswith(ext):
                return lang
        
        # Default to a basic set of patterns
        return 'python'  # Default to Python patterns
    
    def _extract_context(self, content: str, match: re.Match) -> str:
        """
        Extract surrounding context for an identifier.
        
        Gathers the ecosystem around each identifier, capturing the nearby
        code that gives it meaning - like examining a leaf in the context
        of its branch and neighboring leaves.
        
        Args:
            content: Full file content.
            match: Regex match for the identifier.
            
        Returns:
            Context string surrounding the identifier.
        """
        # Find the start and end of the line containing the match
        line_start = content.rfind('\n', 0, match.start()) + 1
        line_end = content.find('\n', match.end())
        if line_end == -1:
            line_end = len(content)
        
        # Get the content of the line
        line = content[line_start:line_end].strip()
        
        # Check for comments on the same line
        comment_start = line.find('#')
        if comment_start != -1:
            inline_comment = line[comment_start:].strip()
        else:
            inline_comment = ""
        
        # Look for docstring or comment above
        prev_lines = []
        current_pos = line_start - 2  # Start before the newline
        
        # Collect up to 3 non-empty lines above
        line_count = 0
        while current_pos >= 0 and line_count < 3:
            prev_line_end = current_pos
            prev_line_start = content.rfind('\n', 0, prev_line_end) + 1
            
            prev_line = content[prev_line_start:prev_line_end].strip()
            if prev_line:
                prev_lines.insert(0, prev_line)
                line_count += 1
            
            current_pos = prev_line_start - 2  # Move to the next line up
        
        # Combine collected context
        context = []
        if prev_lines:
            context.append("Previous lines: " + " | ".join(prev_lines))
        context.append("Line: " + line)
        if inline_comment:
            context.append("Comment: " + inline_comment)
        
        return " | ".join(context)
    
    def _update_relationships(self, content: str, id_name: str, match: re.Match) -> None:
        """
        Update relationship map for an identifier.
        
        Maps connections between identifiers, like tracing how tree roots
        intertwine beneath the forest floor - revealing hidden dependencies
        and relationships.
        
        Args:
            content: Full file content.
            id_name: Name of the identifier.
            match: Regex match for the identifier.
        """
        # Skip very common or short identifiers to reduce noise
        if len(id_name) <= 2 or id_name in {'i', 'j', 'k', 'x', 'y', 'z'}:
            return
        
        # Find related identifiers in the same scope
        # (simplified: look in the same function/class or nearby)
        scope_start = content.rfind('\n\n', 0, match.start())
        if scope_start == -1:
            scope_start = 0
        
        scope_end = content.find('\n\n', match.end())
        if scope_end == -1:
            scope_end = len(content)
        
        scope = content[scope_start:scope_end]
        
        # Find other identifiers in this scope
        for pattern_type, patterns in self.patterns.items():
            for _, pattern in patterns.items():
                other_matches = re.finditer(pattern, scope, re.MULTILINE)
                for other_match in other_matches:
                    other_id = other_match.group(1)
                    if other_id != id_name and len(other_id) > 2:
                        # Add bidirectional relationship
                        self.relationship_map[id_name].add(other_id)
                        self.relationship_map[other_id].add(id_name)
    
    def get_identifier_data(self) -> List[Dict[str, Any]]:
        """
        Get structured data for all tracked identifiers.
        
        Compiles the complete forest taxonomy, organizing all identified
        code elements with their contexts, relationships, and patterns
        into a harvestable format.
        
        Returns:
            List of identifier records with full metadata.
        """
        identifier_data = []
        
        # Process each identifier type
        for id_type, identifiers in self.contexts.items():
            # Process each identifier instance
            for identifier in identifiers:
                record = {
                    'identifier': identifier['name'],
                    'type': identifier['type'],
                    'line': identifier['line'],
                    'context': identifier['context'],
                    'related': ','.join(self.relationship_map.get(identifier['name'], set())),
                    'relationship_count': len(self.relationship_map.get(identifier['name'], set()))
                }
                identifier_data.append(record)
        
        return identifier_data


class DocumentationExtractor:
    """
    Extracts and analyzes documentation from code files.
    
    The DocumentationExtractor serves as our forest historian, reading the
    growth rings that tell the story of code evolution and intention. It seeks
    out formal documentation, inline comments, and other narrative elements
    that explain why code exists and how it functions.
    
    Attributes:
        doc_patterns: Regular expression patterns for different types of
            documentation across multiple languages.
        cognitive_markers: Patterns identifying special documentation elements
            that reveal developer thought processes.
    """
    
    def __init__(self) -> None:
        """
        Initialize documentation extraction patterns.
        
        Sets up the specialized lenses needed to distinguish different types
        of documentation, from formal docstrings to quick notes and TODOs.
        """
        # Patterns for documentation extraction
        self.doc_patterns = {
            # Python documentation patterns
            'python': {
                'docstring': r'"""(.*?)"""',
                'docstring_single': r"'''(.*?)'''",
                'inline_comment': r'#\s*(.*?)$',
                'function_docstring': r'def\s+[a-zA-Z0-9_]+\s*\([^)]*\):\s*(?:"""|\'\'\')(.*?)(?:"""|\'\'\')'}
            ,
            # JavaScript documentation patterns
            'javascript': {
                'block_comment': r'/\*\*(.*?)\*/',
                'jsdoc': r'/\*\*(.*?)\*/',
                'inline_comment': r'//\s*(.*?)$',
                'function_jsdoc': r'(?:/\*\*(.*?)\*/\s*)?function\s+[a-zA-Z0-9_]+\s*\('}
            ,
            # HTML documentation patterns
            'html': {
                'comment': r'<!--(.*?)-->',
                'meta_description': r'<meta\s+name=[\'"]description[\'"]\s+content=[\'"]([^\'"]*)[\'"]'}
            ,
            # CSS documentation patterns
            'css': {
                'block_comment': r'/\*(.*?)\*/',
                'section_comment': r'/\*\s*={3,}\s*(.*?)\s*={3,}\s*\*/'}
            ,
            # Markdown documentation patterns
            'markdown': {
                'code_comment': r'<!--(.*?)-->'}
            }
        
        # Patterns for identifying cognitive markers
        self.cognitive_markers = {
            'todo': r'TODO[:\s]+(.*?)(?:\n|$)',
            'fixme': r'FIXME[:\s]+(.*?)(?:\n|$)',
            'note': r'NOTE[:\s]+(.*?)(?:\n|$)',
            'warning': r'WARNING[:\s]+(.*?)(?:\n|$)',
            'important': r'IMPORTANT[:\s]+(.*?)(?:\n|$)',
            'hack': r'HACK[:\s]+(.*?)(?:\n|$)',
            'metaphor': r'(?:like|as)\s+(?:a|an)\s+([a-z]+)',  # Detect metaphors
            'question': r'\?{2,}',  # Multiple question marks often indicate uncertainty
            'emphasis': r'!{2,}',  # Multiple exclamation points indicate emphasis
        }
        
        logger.debug("DocumentationExtractor initialized with patterns for multiple languages")
    
    def extract_documentation(self, content: str, file_type: str) -> Dict[str, List[Dict[str, Any]]]:
        """
        Extract documentation elements from file content.
        
        Like a careful archaeologist, this method uncovers the narrative
        layers within code, separating formal documentation, casual comments,
        and special markers that reveal developer thought processes.
        
        Args:
            content: The file content to analyze.
            file_type: The type of file (python, javascript, etc.)
            
        Returns:
            Dictionary mapping documentation types to lists of extracted elements.
        """
        language = self._determine_language(file_type)
        patterns = self.doc_patterns.get(language, {})
        
        # Container for findings
        documentation: Dict[str, List[Dict[str, Any]]] = defaultdict(list)
        
        # Extract standard documentation based on language
        for doc_type, pattern in patterns.items():
            matches = re.finditer(pattern, content, re.MULTILINE | re.DOTALL)
            
            for match in matches:
                doc_content = match.group(1) if match.groups() else ""
                doc_content = self._clean_doc_content(doc_content)
                
                # Skip empty documentation
                if not doc_content.strip():
                    continue
                
                # Create documentation record
                doc_record = {
                    'type': doc_type,
                    'content': doc_content,
                    'line': content.count('\n', 0, match.start()) + 1,
                    'length': len(doc_content),
                    'markers': self._extract_cognitive_markers(doc_content)
                }
                documentation[doc_type].append(doc_record)
        
        # Extract cognitive markers across all content
        for marker_type, pattern in self.cognitive_markers.items():
            matches = re.finditer(pattern, content, re.MULTILINE | re.IGNORECASE)
            
            for match in matches:
                marker_content = match.group(1) if match.groups() else match.group(0)
                marker_record = {
                    'type': marker_type,
                    'content': marker_content.strip(),
                    'line': content.count('\n', 0, match.start()) + 1
                }
                documentation['cognitive_marker'].append(marker_record)
        
        logger.debug(f"Extracted {sum(len(docs) for docs in documentation.values())} documentation "
                     f"elements of {len(documentation)} types from {language} content")
        return documentation
    
    def _determine_language(self, file_type: str) -> str:
        """
        Map file type to appropriate language pattern set.
        
        Acts as a linguistic interpreter, determining which documentation
        patterns to apply based on the detected file type.
        
        Args:
            file_type: MIME type or file extension.
            
        Returns:
            Language key for pattern lookup.
        """
        # Map common file types/extensions to language pattern sets
        type_to_language = {
            'text/x-python': 'python',
            'application/javascript': 'javascript',
            'text/javascript': 'javascript',
            'text/html': 'html',
            'text/css': 'css',
            'text/markdown': 'markdown',
            '.py': 'python',
            '.js': 'javascript',
            '.html': 'html',
            '.css': 'css',
            '.md': 'markdown',
        }
        
        # Check for direct MIME type match
        if file_type in type_to_language:
            return type_to_language[file_type]
        
        # Check for extension match
        for ext, lang in type_to_language.items():
            if file_type.endswith(ext):
                return lang
        
        # Default to a basic set of patterns
        return 'python'  # Default to Python patterns
    
    def _clean_doc_content(self, content: str) -> str:
        """
        Clean up extracted documentation content.
        
        Processes raw documentation to remove formatting artifacts and
        normalize whitespace, making the core information more accessible.
        
        Args:
            content: Raw documentation string.
            
        Returns:
            Cleaned documentation string.
        """
        if not content:
            return ""
        
        # Remove common indentation
        lines = content.split('\n')
        if len(lines) > 1:
            # Find minimum indentation (excluding empty lines)
            indents = [len(line) - len(line.lstrip()) 
                      for line in lines[1:] if line.strip()]
            if indents:
                min_indent = min(indents)
                # Remove the common indentation from all lines after the first
                lines[1:] = [line[min_indent:] if line.strip() else line for line in lines[1:]]
        
        # Rejoin and normalize whitespace
        content = '\n'.join(lines)
        content = re.sub(r'\s+', ' ', content)
        content = content.strip()
        
        return content
    
    def _extract_cognitive_markers(self, content: str) -> Dict[str, List[str]]:
        """
        Extract cognitive markers from documentation.
        
        Identifies special patterns that reveal developer thought processes
        and intentions, like finding trails and signs in the forest.
        
        Args:
            content: Documentation content.
            
        Returns:
            Dictionary mapping marker types to marker instances.
        """
        markers: Dict[str, List[str]] = defaultdict(list)
        
        # Check for each marker type
        for marker_type, pattern in self.cognitive_markers.items():
            matches = re.finditer(pattern, content, re.MULTILINE | re.IGNORECASE)
            
            for match in matches:
                marker_content = match.group(1) if match.groups() else match.group(0)
                markers[marker_type].append(marker_content.strip())
        
        return dict(markers)
    
    def get_documentation_data(self, documentation: Dict[str, List[Dict[str, Any]]]) -> List[Dict[str, Any]]:
        """
        Get structured data for all extracted documentation.
        
        Compiles the complete documentation archive into a structured format
        that can be analyzed for patterns, intentions, and knowledge.
        
        Args:
            documentation: Extracted documentation by type.
            
        Returns:
            List of documentation records with full metadata.
        """
        doc_data = []
        
        # Process each documentation type
        for doc_type, elements in documentation.items():
            # Process each documentation element
            for element in elements:
                record = {
                    'doc_type': doc_type,
                    'content': element['content'],
                    'line': element['line'],
                    'length': element.get('length', len(element['content'])),
                    'has_markers': bool(element.get('markers', {})),
                    'marker_types': ','.join(element.get('markers', {}).keys()),
                }
                
                # Add cognitive markers if present
                if 'markers' in element and element['markers']:
                    for marker_type, instances in element['markers'].items():
                        record[f'marker_{marker_type}'] = '; '.join(instances)
                
                doc_data.append(record)
        
        return doc_data


class PatternRecognizer:
    """
    Identifies recurring patterns and structures in code.
    
    The PatternRecognizer is our forest ecologist, identifying recurring
    patterns in code that reveal consistent approaches, common solutions,
    and established conventions - like identifying recurring plant
    associations that indicate a healthy ecosystem.
    
    Attributes:
        code_patterns: Templates of common code structures to recognize.
        pattern_frequencies: Occurrence counts for recognized patterns.
        signature_elements: Distinctive elements that define code "signatures".
    """
    
    def __init__(self) -> None:
        """
        Initialize pattern recognition system.
        
        Sets up the specialized pattern detectors that can recognize common
        coding patterns, architectural approaches, and design signatures.
        """
        # Common code pattern templates 
        self.code_patterns = {
            # Design patterns
            'singleton': r'(?:self|this)\.instance\s*(?:=|==)\s*(?:self|this|null)',
            'factory_method': r'(?:create|make|build|generate|construct)[A-Z][a-zA-Z0-9]*\s*=\s*function|def\s+(?:create|make|build|generate|construct)[A-Z]',
            'observer': r'(?:add|remove)(?:Listener|Observer|Handler|Callback)',
            'decorator': r'@\w+',
            'dependency_injection': r'(?:inject|provide)\s*\(',
            
            # Architectural patterns
            'mvc_model': r'class\s+\w+Model',
            'mvc_view': r'class\s+\w+View',
            'mvc_controller': r'class\s+\w+Controller',
            'repository': r'class\s+\w+Repository',
            'service': r'class\s+\w+Service',
            
            # Code structures
            'try_except': r'try\s*:.+?except',
            'if_else': r'if\s+.+?:\s*.*?else\s*:',
            'for_loop': r'for\s+\w+\s+in\s+',
            'while_loop': r'while\s+.+?:',
            'function_call': r'\w+\(.*?\)',
            'class_definition': r'class\s+\w+',
            'async_function': r'async\s+def|async\s+function',
            'promise_chain': r'\.then\(.+?\)',
            'list_comprehension': r'\[.+?\s+for\s+.+?\s+in\s+.+?\]',
            
            # Documentation patterns
            'docstring': r'""".*?"""',
            'jsdoc': r'/\*\*.*?\*/',
            'readme_section': r'^#+\s+.+?$',
            
            # Testing patterns
            'test_function': r'def\s+test_\w+|test\w+\s*\(',
            'assert_statement': r'assert\s+',
            'mock_setup': r'mock\s*\(',
        }
        
        # Counter for pattern occurrences
        self.pattern_frequencies = Counter()
        
        # Code signature elements to identify
        self.signature_elements = {
            'naming_convention': {
                'snake_case': r'[a-z][a-z0-9]*(?:_[a-z0-9]+)+',
                'camel_case': r'[a-z][a-zA-Z0-9]*[A-Z][a-zA-Z0-9]*',
                'pascal_case': r'[A-Z][a-zA-Z0-9]*',
                'kebab_case': r'[a-z][a-z0-9]*(?:-[a-z0-9]+)+',
            },
            'indentation': {
                'spaces_2': r'^  [^ ]',
                'spaces_4': r'^    [^ ]',
                'tabs': r'^\t[^\t]',
            },
            'line_endings': {
                'semicolon': r';\s*$',
                'no_semicolon': r'[^;]\s*$',
            },
            'commenting': {
                'docstrings': r'""".*?"""',
                'inline_comments': r'#.*?$|//.*?$',
                'block_comments': r'/\*.*?\*/',
            },
        }
        
        logger.debug("PatternRecognizer initialized with pattern templates")
    
    def recognize_patterns(self, content: str, file_type: str) -> Dict[str, int]:
        """
        Identify recurring patterns in file content.
        
        Like a naturalist recognizing common plant groupings, this method
        identifies established code patterns that indicate certain approaches
        to problem-solving and design.
        
        Args:
            content: The file content to analyze.
            file_type: The type of file.
            
        Returns:
            Dictionary mapping pattern names to occurrence counts.
        """
        pattern_counts = Counter()
        
        # Apply each pattern
        for pattern_name, pattern in self.code_patterns.items():
            matches = re.finditer(pattern, content, re.MULTILINE | re.DOTALL)
            count = sum(1 for _ in matches)
            
            if count > 0:
                pattern_counts[pattern_name] = count
                self.pattern_frequencies[pattern_name] += count
        
        logger.debug(f"Recognized {sum(pattern_counts.values())} pattern instances "
                     f"across {len(pattern_counts)} pattern types")
        return dict(pattern_counts)
    
    def identify_signatures(self, content: str) -> Dict[str, Dict[str, int]]:
        """
        Identify code style signatures.
        
        Detects distinctive elements that define a codebase's "handwriting" -
        like identifying the unique characteristics that make each forest
        distinct despite using the same types of trees.
        
        Args:
            content: The file content to analyze.
            
        Returns:
            Nested dictionary mapping signature categories to element frequencies.
        """
        signatures = {}
        
        # Check each signature element category
        for category, elements in self.signature_elements.items():
            category_counts = {}
            
            for element_name, pattern in elements.items():
                matches = re.finditer(pattern, content, re.MULTILINE)
                count = sum(1 for _ in matches)
                
                if count > 0:
                    category_counts[element_name] = count
            
            if category_counts:
                signatures[category] = category_counts
        
        return signatures
    
    def get_dominant_patterns(self) -> List[Dict[str, Any]]:
        """
        Get the most frequently occurring patterns.
        
        Identifies the "keystone species" of the code ecosystem - the patterns
        that define its character and approach, like identifying the dominant
        tree species that characterize a forest type.
        
        Returns:
            List of pattern records with frequency data.
        """
        pattern_data = []
        
        # Get the top patterns
        for pattern, count in self.pattern_frequencies.most_common():
            pattern_data.append({
                'pattern': pattern,
                'count': count,
                'category': self._get_pattern_category(pattern),
            })
        
        return pattern_data
    
    def _get_pattern_category(self, pattern: str) -> str:
        """
        Determine the category for a pattern.
        
        Classifies patterns into higher-level groupings, like organizing
        plant species into families based on common characteristics.
        
        Args:
            pattern: The pattern name.
            
        Returns:
            Category name for the pattern.
        """
        # Design patterns
        if pattern in {'singleton', 'factory_method', 'observer', 'decorator', 'dependency_injection'}:
            return 'design_pattern'
        
        # Architectural patterns
        if pattern in {'mvc_model', 'mvc_view', 'mvc_controller', 'repository', 'service'}:
            return 'architectural_pattern'
        
        # Code structures
        if pattern in {'try_except', 'if_else', 'for_loop', 'while_loop', 'function_call',
                      'class_definition', 'async_function', 'promise_chain', 'list_comprehension'}:
            return 'code_structure'
        
        # Documentation patterns
        if pattern in {'docstring', 'jsdoc', 'readme_section'}:
            return 'documentation_pattern'
        
        # Testing patterns
        if pattern in {'test_function', 'assert_statement', 'mock_setup'}:
            return 'testing_pattern'
        
        return 'other'


# ======================================================================
# SeedMapper: Core Analysis Engine
# ======================================================================

class FileAnalyzer:
    """
    Comprehensive analyzer for individual code files.
    
    The FileAnalyzer is our specialized arborist, examining each tree in
    the forest in detail - studying its structure, growth patterns, and
    health indicators to understand its role in the larger ecosystem.
    
    Attributes:
        identifier_tracker: System for tracking and analyzing code identifiers.
        doc_extractor: System for extracting and analyzing documentation.
        pattern_recognizer: System for identifying code patterns.
    """
    
    def __init__(self) -> None:
        """
        Initialize file analysis components.
        
        Creates the specialized analysis systems needed to extract rich
        metadata from individual code files, establishing a comprehensive
        approach to understanding code structure and patterns.
        """
        # Initialize analysis components
        self.identifier_tracker = IdentifierTracker()
        self.doc_extractor = DocumentationExtractor()
        self.pattern_recognizer = PatternRecognizer()
        
        logger.debug("FileAnalyzer initialized with specialized analyzers")
    
    def analyze_file(self, file_path: str) -> Dict[str, Any]:
        """
        Perform comprehensive analysis of a single file.
        
        This method coordinates a multi-faceted examination of code, like
        studying a tree from roots to canopy - examining structure, growth
        patterns, health indicators, and relationships to neighboring trees.
        
        Args:
            file_path: Path to the file for analysis.
            
        Returns:
            Dictionary containing comprehensive file metadata.
        """
        path_obj = Path(file_path)
        
        try:
            # Basic file metadata
            file_stats = path_obj.stat()
            file_info = {
                'path': str(path_obj),
                'name': path_obj.name,
                'extension': path_obj.suffix.lower(),
                'directory': str(path_obj.parent),
                'size_bytes': file_stats.st_size,
                'created_timestamp': file_stats.st_ctime,
                'modified_timestamp': file_stats.st_mtime,
                'accessed_timestamp': file_stats.st_atime,
                'modified_date': datetime.datetime.fromtimestamp(file_stats.st_mtime).strftime('%Y-%m-%d'),
                'created_date': datetime.datetime.fromtimestamp(file_stats.st_ctime).strftime('%Y-%m-%d'),
            }
            
            # Determine if this is a text file we should analyze in detail
            mime_type = self._guess_mime_type(file_path)
            file_info['mime_type'] = mime_type
            
            # For text files, perform deep analysis
            if self._is_text_file(mime_type) and file_stats.st_size < 1000000:  # Limit to 1MB
                try:
                    # Read file content
                    with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
                        content = f.read()
                    
                    # Basic content statistics
                    lines = content.split('\n')
                    file_info.update({
                        'line_count': len(lines),
                        'avg_line_length': sum(len(line) for line in lines) / max(len(lines), 1),
                        'empty_line_count': sum(1 for line in lines if not line.strip()),
                        'content_hash': self._hash_content(content),
                    })
                    
                    # Extract identifiers
                    identifiers = self.identifier_tracker.extract_identifiers(content, mime_type)
                    file_info['identifier_counts'] = {k: len(v) for k, v in identifiers.items()}
                    file_info['total_identifiers'] = sum(len(v) for v in identifiers.values())
                    
                    # Extract documentation
                    documentation = self.doc_extractor.extract_documentation(content, mime_type)
                    file_info['documentation_counts'] = {k: len(v) for k, v in documentation.items()}
                    file_info['total_documentation'] = sum(len(v) for v in documentation.values())
                    
                    # Recognize patterns
                    patterns = self.pattern_recognizer.recognize_patterns(content, mime_type)
                    file_info['pattern_counts'] = patterns
                    file_info['total_patterns'] = sum(patterns.values())
                    
                    # Identify code signatures
                    signatures = self.pattern_recognizer.identify_signatures(content)
                    file_info['code_signatures'] = signatures
                    
                    # Calculate documentation density
                    if file_info['line_count'] > 0:
                        file_info['documentation_density'] = file_info['total_documentation'] / file_info['line_count']
                    else:
                        file_info['documentation_density'] = 0
                    
                    # Extract cognitive markers
                    cognitive_markers = self._extract_file_markers(content)
                    if cognitive_markers:
                        file_info['cognitive_markers'] = cognitive_markers
                    
                    # Create enriched metadata
                    file_info['identifiers'] = self._flatten_identifiers(identifiers)
                    file_info['documentation'] = self._flatten_documentation(documentation)
                    
                except Exception as e:
                    logger.warning(f"Error analyzing content of {file_path}: {e}")
                    file_info['analysis_error'] = str(e)
            else:
                file_info['skipped_content_analysis'] = True
                if not self._is_text_file(mime_type):
                    file_info['skip_reason'] = 'not_text_file'
                else:
                    file_info['skip_reason'] = 'file_too_large'
            
            logger.debug(f"Completed analysis of {file_path}")
            return file_info
            
        except Exception as e:
            logger.error(f"Error analyzing {file_path}: {e}")
            return {
                'path': str(path_obj),
                'name': path_obj.name,
                'error': str(e)
            }
    
    def _guess_mime_type(self, file_path: str) -> str:
        """
        Determine the MIME type of a file.
        
        Identifies the general category of a file to determine appropriate
        analysis approaches, like distinguishing between different tree
        species based on visible characteristics.
        
        Args:
            file_path: Path to the file.
            
        Returns:
            MIME type string.
        """
        extension = Path(file_path).suffix.lower()
        
        # Common extensions to MIME types
        extension_map = {
            '.py': 'text/x-python',
            '.js': 'application/javascript',
            '.html': 'text/html',
            '.css': 'text/css',
            '.md': 'text/markdown',
            '.json': 'application/json',
            '.txt': 'text/plain',
            '.xml': 'application/xml',
            '.csv': 'text/csv',
            '.yml': 'application/x-yaml',
            '.yaml': 'application/x-yaml',
            '.sh': 'text/x-shellscript',
        }
        
        # Try to get MIME type from extension
        if extension in extension_map:
            return extension_map[extension]
        
        # Fall back to simple check
        if extension in {'.c', '.cpp', '.h', '.hpp', '.java', '.go', '.php', '.rb', '.ts'}:
            return 'text/plain'
        
        # Handle binary file types
        if extension in {'.png', '.jpg', '.jpeg', '.gif', '.bmp', '.ico'}:
            return 'image/' + extension[1:]
        
        if extension in {'.pdf', '.doc', '.docx', '.ppt', '.pptx', '.xls', '.xlsx'}:
            return 'application/octet-stream'
        
        # Default
        return 'application/octet-stream'
    
    def _is_text_file(self, mime_type: str) -> bool:
        """
        Determine if a file is a text file based on MIME type.
        
        Distinguishes between files that can be analyzed as text and those
        that require specialized binary analysis, like distinguishing between
        trees that can be identified by their leaves and those that require
        other approaches.
        
        Args:
            mime_type: MIME type string.
            
        Returns:
            Boolean indicating if file is text-based.
        """
        return mime_type.startswith('text/') or mime_type in {
            'application/javascript',
            'application/json',
            'application/xml',
            'application/x-yaml',
        }
    
    def _hash_content(self, content: str) -> str:
        """
        Generate a hash of file content.
        
        Creates a unique fingerprint for file content to identify duplicates
        and track changes, like creating a DNA signature for a tree to track
        its lineage and mutations.
        
        Args:
            content: File content string.
            
        Returns:
            SHA-256 hash of content.
        """
        return hashlib.sha256(content.encode('utf-8')).hexdigest()
    
    def _extract_file_markers(self, content: str) -> Dict[str, List[str]]:
        """
        Extract cognitive markers from file content.
        
        Identifies special patterns that reveal developer intentions and
        thought processes, like finding trail markers in the forest that
        reveal human activity and purpose.
        
        Args:
            content: File content string.
            
        Returns:
            Dictionary mapping marker types to instances.
        """
        markers = defaultdict(list)
        
        # Common cognitive markers
        marker_patterns = {
            'todo': r'TODO[:\s]+(.*?)(?:\n|$)',
            'fixme': r'FIXME[:\s]+(.*?)(?:\n|$)',
            'note': r'NOTE[:\s]+(.*?)(?:\n|$)',
            'hack': r'HACK[:\s]+(.*?)(?:\n|$)',
            'bug': r'BUG[:\s]+(.*?)(?:\n|$)',
            'question': r'(?:\?{3,}|\bQUESTION[:\s]+)(.*?)(?:\n|$)',
            'important': r'IMPORTANT[:\s]+(.*?)(?:\n|$)',
            'emoji': r'([🌱🔍🧩🚀🔧🌉🧠🔄🪢🔨])',  # Track emoji usage
        }
        
        # Extract each marker type
        for marker_type, pattern in marker_patterns.items():
            matches = re.finditer(pattern, content, re.IGNORECASE | re.MULTILINE)
            for match in matches:
                marker_text = match.group(1) if match.groups() else match.group(0)
                markers[marker_type].append(marker_text.strip())
        
        return dict(markers)
    
    def _flatten_identifiers(self, identifiers: Dict[str, List[Dict[str, Any]]]) -> List[Dict[str, Any]]:
        """
        Flatten nested identifier data for output.
        
        Transforms the hierarchical identifier data into a flat structure
        suitable for CSV output, like pressing a 3D forest model into a 2D
        map that preserves essential relationships.
        
        Args:
            identifiers: Nested identifier data by type.
            
        Returns:
            Flattened list of identifier records.
        """
        flattened = []
        
        # Process each identifier type
        for id_type, id_list in identifiers.items():
            # Process each identifier
            for identifier in id_list:
                record = {
                    'identifier_name': identifier['name'],
                    'identifier_type': id_type,
                    'line_number': identifier['line'],
                    'context': identifier.get('context', '')
                }
                flattened.append(record)
        
        return flattened
    
    def _flatten_documentation(self, documentation: Dict[str, List[Dict[str, Any]]]) -> List[Dict[str, Any]]:
        """
        Flatten nested documentation data for output.
        
        Transforms the hierarchical documentation data into a flat structure
        suitable for CSV output, preserving essential relationships.
        
        Args:
            documentation: Nested documentation data by type.
            
        Returns:
            Flattened list of documentation records.
        """
        flattened = []
        
        # Process each documentation type
        for doc_type, doc_list in documentation.items():
            # Process each documentation element
            for doc in doc_list:
                record = {
                    'doc_type': doc_type,
                    'line_number': doc['line'],
                    'content': doc.get('content', '')[:10],  # Limit length for CSV
                    'has_markers': bool(doc.get('markers', {}))
                }
                flattened.append(record)
        
        return flattened


class DirectoryAnalyzer:
    """
    Comprehensive analyzer for directory structures.
    
    The DirectoryAnalyzer is our forest ranger, examining the overall
    structure and patterns of the code forest - how trees are organized into
    groves, how paths connect different areas, and how the ecosystem functions
    as a whole.
    
    Attributes:
        file_analyzer: System for analyzing individual files.
        relationship_map: Network of relationships between files.
    """
    
    def __init__(self) -> None:
        """
        Initialize directory analysis system.
        
        Creates the specialized analysis systems needed to understand
        directory structures and file relationships, establishing a
        comprehensive approach to mapping the code forest.
        """
        # Initialize file analyzer component
        self.file_analyzer = FileAnalyzer()
        
        # Map of file relationships
        self.relationship_map = defaultdict(set)
        
        # Track inaccessible directories
        self.inaccessible_dirs = []
        
        logger.debug("DirectoryAnalyzer initialized with file analyzer")
    
    def scan_directory(self, directory: str, exclude_patterns: List[str] = None) -> Dict[str, Any]:
        """
        Scan a directory recursively, analyzing all files.
        
        Performs a comprehensive survey of the code forest, mapping all trees,
        paths, and clearings to understand the overall ecosystem structure
        and health.
        
        Args:
            directory: Root directory to scan.
            exclude_patterns: Patterns for directories/files to exclude.
            
        Returns:
            Dictionary containing comprehensive directory metadata.
        """
        dir_path = Path(directory)
        
        # Compile exclude patterns
        exclude_regex = None
        if exclude_patterns:
            exclude_pattern = '|'.join(f'({pattern})' for pattern in exclude_patterns)
            exclude_regex = re.compile(exclude_pattern)
        
        # Initialize directory metadata
        dir_info = {
            'path': str(dir_path),
            'name': dir_path.name,
            'file_count': 0,
            'directory_count': 0,
            'total_size_bytes': 0,
            'file_extensions': {},
            'language_breakdown': {},
            'files': [],
            'start_time': time.time(),
        }
        
        # Walk the directory tree
        for root, dirs, files in os.walk(directory):
            # Check if this directory should be excluded
            rel_root = os.path.relpath(root, directory)
            if exclude_regex and exclude_regex.search(rel_root):
                logger.debug(f"Skipping excluded directory: {rel_root}")
                dirs[:] = []  # Skip all subdirectories
                continue
            
            # Check if directory is accessible
            if not os.access(root, os.R_OK):
                self.inaccessible_dirs.append(root)
                logger.warning(f"Directory not accessible: {root}")
                dirs[:] = []  # Skip all subdirectories
                continue
            
            # Count directories
            dir_info['directory_count'] += len(dirs)
            
            # Process each file
            for filename in files:
                # Check if file should be excluded
                file_path = os.path.join(root, filename)
                rel_path = os.path.relpath(file_path, directory)
                if exclude_regex and exclude_regex.search(rel_path):
                    logger.debug(f"Skipping excluded file: {rel_path}")
                    continue
                
                # Analyze file
                try:
                    file_info = self.file_analyzer.analyze_file(file_path)
                    
                    # Update directory statistics
                    dir_info['file_count'] += 1
                    dir_info['total_size_bytes'] += file_info.get('size_bytes', 0)
                    
                    # Update extension statistics
                    extension = file_info.get('extension', '').lower()
                    if extension:
                        dir_info['file_extensions'][extension] = dir_info['file_extensions'].get(extension, 0) + 1
                    
                    # Update language statistics based on MIME type
                    mime_type = file_info.get('mime_type', '')
                    language = self._mime_to_language(mime_type)
                    if language:
                        dir_info['language_breakdown'][language] = dir_info['language_breakdown'].get(language, 0) + 1
                    
                    # Map file relationships
                    self._update_relationship_map(file_info, root, directory)
                    
                    # Add to files list
                    dir_info['files'].append(file_info)
                    
                    # Log progress periodically
                    if dir_info['file_count'] % 100 == 0:
                        elapsed = time.time() - dir_info['start_time']
                        logger.info(f"Processed {dir_info['file_count']} files in {elapsed:.2f} seconds...")
                
                except Exception as e:
                    logger.error(f"Error processing {file_path}: {e}")
        
        # Calculate completion time
        dir_info['end_time'] = time.time()
        dir_info['elapsed_seconds'] = dir_info['end_time'] - dir_info['start_time']
        
        # Add relationship data
        dir_info['file_relationships'] = self._get_relationship_data()
        
        # Extract cross-file patterns
        dir_info['pattern_summary'] = self._extract_pattern_summary()
        
        # Count inaccessible directories
        dir_info['inaccessible_dirs'] = len(self.inaccessible_dirs)
        
        logger.info(f"Completed directory scan of {directory}")
        logger.info(f"Processed {dir_info['file_count']} files in {dir_info['elapsed_seconds']:.2f} seconds")
        
        return dir_info
    
    def _mime_to_language(self, mime_type: str) -> str:
        """
        Convert MIME type to language name.
        
        Maps technical MIME types to more human-readable language names,
        like translating technical tree species names to common names.
        
        Args:
            mime_type: MIME type string.
            
        Returns:
            Language name.
        """
        mime_map = {
            'text/x-python': 'Python',
            'application/javascript': 'JavaScript',
            'text/javascript': 'JavaScript',
            'text/html': 'HTML',
            'text/css': 'CSS',
            'text/markdown': 'Markdown',
            'application/json': 'JSON',
            'text/plain': 'Plain Text',
            'application/xml': 'XML',
            'text/csv': 'CSV',
            'application/x-yaml': 'YAML',
            'text/x-shellscript': 'Shell Script',
        }
        
        return mime_map.get(mime_type, mime_type)
    
    def _update_relationship_map(self, file_info: Dict[str, Any], current_dir: str, base_dir: str) -> None:
        """
        Update the relationship map for a file.
        
        Identifies and records relationships between files, like mapping
        the interconnections between trees through shared root systems,
        proximity, or ecosystem roles.
        
        Args:
            file_info: File metadata.
            current_dir: Current directory being processed.
            base_dir: Base directory of the scan.
        """
        file_path = file_info.get('path')
        if not file_path:
            return
        
        try:
            # Find related files based on directory structure
            parent_dir = os.path.basename(current_dir)
            for other_file in os.listdir(current_dir):
                other_path = os.path.join(current_dir, other_file)
                if os.path.isfile(other_path) and other_path != file_path:
                    # Add relationship based on shared directory
                    self.relationship_map[file_path].add(other_path)
                    self.relationship_map[other_path].add(file_path)
            
            # Find related files based on name patterns
            file_name = file_info.get('name', '')
            base_name = os.path.splitext(file_name)[0]
            
            if base_name:
                # Look for files with similar names in the entire directory tree
                for other_info in self.file_analyzer.pattern_recognizer.pattern_frequencies.keys():
                    if base_name in other_info and other_info != file_path:
                        # Add relationship based on name similarity
                        self.relationship_map[file_path].add(other_info)
                        self.relationship_map[other_info].add(file_path)
        
        except Exception as e:
            logger.debug(f"Error updating relationship map for {file_path}: {e}")
    
    def _get_relationship_data(self) -> Dict[str, List[str]]:
        """
        Get structured relationship data for output.
        
        Transforms the relationship map into a format suitable for analysis
        and visualization, like creating a map of forest trails and
        connections for navigation.
        
        Returns:
            Dictionary mapping file paths to lists of related files.
        """
        relationships = {}
        
        # Convert set values to lists for JSON serialization
        for file_path, related_files in self.relationship_map.items():
            relationships[file_path] = list(related_files)
        
        return relationships
    
    def _extract_pattern_summary(self) -> Dict[str, Any]:
        """
        Extract summary of cross-file patterns.
        
        Identifies patterns that span multiple files, revealing higher-level
        structure and design approaches, like identifying forest-wide ecological
        patterns that emerge from the interactions of multiple trees.
        
        Returns:
            Dictionary containing pattern summary data.
        """
        # Get dominant patterns
        dominant_patterns = self.file_analyzer.pattern_recognizer.get_dominant_patterns()
        
        # Group patterns by category
        patterns_by_category = defaultdict(list)
        for pattern in dominant_patterns:
            category = pattern.get('category', 'other')
            patterns_by_category[category].append(pattern)
        
        return dict(patterns_by_category)


class OutputManager:
    """
    Manages output generation in various formats.
    
    The OutputManager is our forest cartographer, creating maps and guides
    that help others navigate and understand the code forest, translating
    complex ecosystems into accessible representations.
    
    Attributes:
        output_dir: Directory for output files.
    """
    
    def __init__(self, output_dir: str = None) -> None:
        """
        Initialize output management system.
        
        Creates the specialized formatting systems needed to transform
        complex code analysis into clear, structured outputs for further
        analysis and understanding.
        
        Args:
            output_dir: Directory for output files (defaults to current directory).
        """
        # Set output directory
        self.output_dir = output_dir or '.'
        
        # Ensure output directory exists
        os.makedirs(self.output_dir, exist_ok=True)
        
        logger.debug(f"OutputManager initialized with output directory: {self.output_dir}")
    
    def write_csv(self, data: List[Dict[str, Any]], filename: str, max_field_length: int = 32000) -> str:
        """
        Write data records to CSV file.
        
        Transforms complex, nested data structures into flat tabular format
        for analysis in tools like DataTrellis, like creating a field guide
        to the forest that distills complex ecosystem interactions into
        clear, structured information.
        
        Args:
            data: List of data records to write.
            filename: Output filename.
            max_field_length: Maximum length for CSV fields.
            
        Returns:
            Path to the created CSV file.
        """
        if not data:
            logger.warning("No data to write to CSV")
            return ""
        
        # Prepare output path
        output_path = os.path.join(self.output_dir, filename)
        
        # Collect all field names
        all_fields = set()
        for record in data:
            all_fields.update(record.keys())
        
        # Sort fields for consistent output
        fields = sorted(list(all_fields))
        
        # Write to CSV
        with open(output_path, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=fields, extrasaction='ignore')
            writer.writeheader()
            
            # Write each record, truncating long fields
            for record in data:
                # Process record to handle special values and truncate
                processed_record = {}
                for field, value in record.items():
                    if field not in fields:
                        continue
                    
                    if isinstance(value, (dict, list)):
                        # Convert complex types to JSON strings
                        value = json.dumps(value)
                    elif value is None:
                        value = ""
                    else:
                        # Convert to string
                        value = str(value)
                    
                    # Truncate if too long
                    if len(value) > max_field_length:
                        value = value[:max_field_length - 3] + "..."
                    
                    processed_record[field] = value
                
                writer.writerow(processed_record)
        
        logger.info(f"Wrote {len(data)} records to {output_path}")
        return output_path
    
    def generate_file_csv(self, directory_data: Dict[str, Any], filename: str = "codeseed_files.csv") -> str:
        """
        Generate CSV of file-level metadata.
        
        Creates a comprehensive tabular view of file metadata for analysis,
        like creating a census of all trees in the forest with their key
        characteristics.
        
        Args:
            directory_data: Directory analysis results.
            filename: Output filename.
            
        Returns:
            Path to the created CSV file.
        """
        files = directory_data.get('files', [])
        
        # Filter and prepare file records
        file_records = []
        for file_info in files:
            # Create a clean record with essential metadata
            record = {
                'path': file_info.get('path', ''),
                'name': file_info.get('name', ''),
                'extension': file_info.get('extension', ''),
                'directory': file_info.get('directory', ''),
                'size_bytes': file_info.get('size_bytes', 0),
                'line_count': file_info.get('line_count', 0),
                'created_date': file_info.get('created_date', ''),
                'modified_date': file_info.get('modified_date', ''),
                'mime_type': file_info.get('mime_type', ''),
                'total_identifiers': file_info.get('total_identifiers', 0),
                'total_documentation': file_info.get('total_documentation', 0),
                'documentation_density': file_info.get('documentation_density', 0),
                'total_patterns': file_info.get('total_patterns', 0),
            }
            
            # Add pattern counts if available
            if 'pattern_counts' in file_info:
                for pattern, count in file_info['pattern_counts'].items():
                    record[f'pattern_{pattern}'] = count
            
            # Add cognitive markers if available
            if 'cognitive_markers' in file_info:
                for marker, instances in file_info['cognitive_markers'].items():
                    record[f'marker_{marker}'] = len(instances)
                    if instances and len(instances) > 0:
                        record[f'marker_{marker}_sample'] = instances[0]
            
            file_records.append(record)
        
        return self.write_csv(file_records, filename)
    
    def generate_identifier_csv(self, directory_data: Dict[str, Any], 
                             filename: str = "codeseed_identifiers.csv") -> str:
        """
        Generate CSV of identifier metadata.
        
        Creates a detailed tabular view of all code identifiers for analysis,
        like cataloging all the unique species in the forest with their
        characteristics and relationships.
        
        Args:
            directory_data: Directory analysis results.
            filename: Output filename.
            
        Returns:
            Path to the created CSV file.
        """
        files = directory_data.get('files', [])
        
        # Collect all identifiers across files
        identifier_records = []
        for file_info in files:
            # Skip files without identifier analysis
            if 'identifiers' not in file_info or not file_info['identifiers']:
                continue
            
            # Process identifiers
            for identifier in file_info['identifiers']:
                record = {
                    'file_path': file_info.get('path', ''),
                    'file_name': file_info.get('name', ''),
                    'identifier_name': identifier.get('identifier_name', ''),
                    'identifier_type': identifier.get('identifier_type', ''),
                    'line_number': identifier.get('line_number', 0),
                    'context': identifier.get('context', ''),
                    'modified_date': file_info.get('modified_date', ''),
                }
                identifier_records.append(record)
        
        return self.write_csv(identifier_records, filename)
    
    def generate_documentation_csv(self, directory_data: Dict[str, Any], 
                                filename: str = "codeseed_documentation.csv") -> str:
        """
        Generate CSV of documentation metadata.
        
        Creates a detailed tabular view of all code documentation for analysis,
        like collecting all the field notes and observations about the forest
        from different researchers and guides.
        
        Args:
            directory_data: Directory analysis results.
            filename: Output filename.
            
        Returns:
            Path to the created CSV file.
        """
        files = directory_data.get('files', [])
        
        # Collect all documentation across files
        documentation_records = []
        for file_info in files:
            # Skip files without documentation analysis
            if 'documentation' not in file_info or not file_info['documentation']:
                continue
            
            # Process documentation
            for doc in file_info['documentation']:
                record = {
                    'file_path': file_info.get('path', ''),
                    'file_name': file_info.get('name', ''),
                    'doc_type': doc.get('doc_type', ''),
                    'line_number': doc.get('line_number', 0),
                    'content': doc.get('content', ''),
                    'has_markers': doc.get('has_markers', False),
                    'modified_date': file_info.get('modified_date', ''),
                }
                documentation_records.append(record)
        
        return self.write_csv(documentation_records, filename)


# ======================================================================
# SeedCore: Main API
# ======================================================================

class CodeSeed:
    """
    Main API for code metadata extraction and analysis.
    
    CodeSeed is our master forester, coordinating all aspects of forest
    analysis and management, providing a unified interface to the complex
    systems that map, analyze, and understand the code ecosystem.
    
    Attributes:
        directory_analyzer: System for analyzing directory structures.
        output_manager: System for generating output files.
    """
    
    def __init__(self, output_dir: str = None) -> None:
        """
        Initialize the CodeSeed system.
        
        Creates the master coordination system that orchestrates the detailed
        analysis of code forests, establishing the overarching approach to
        understanding code structure, patterns, and relationships.
        
        Args:
            output_dir: Directory for output files.
        """
        # Initialize component systems
        self.directory_analyzer = DirectoryAnalyzer()
        self.output_manager = OutputManager(output_dir)
        
        logger.debug("CodeSeed initialized with component systems")
    
    def analyze_directory(self, directory: str, 
                        exclude_patterns: List[str] = None,
                        output_prefix: str = "codeseed") -> Dict[str, str]:
        """
        Perform comprehensive analysis of a directory.
        
        Orchestrates a complete survey and analysis of the code forest,
        coordinating the various specialized systems to create a
        comprehensive understanding of the code ecosystem.
        
        Args:
            directory: Directory to analyze.
            exclude_patterns: Patterns for directories/files to exclude.
            output_prefix: Prefix for output filenames.
            
        Returns:
            Dictionary mapping output types to file paths.
        """
        logger.info(f"Starting analysis of directory: {directory}")
        
        # Perform directory analysis
        directory_data = self.directory_analyzer.scan_directory(directory, exclude_patterns)
        
        # Generate output files
        output_files = {}
        
        # File metadata CSV
        file_csv = self.output_manager.generate_file_csv(
            directory_data, f"{output_prefix}_files.csv")
        output_files['files_csv'] = file_csv
        
        # Identifier metadata CSV
        identifier_csv = self.output_manager.generate_identifier_csv(
            directory_data, f"{output_prefix}_identifiers.csv")
        output_files['identifiers_csv'] = identifier_csv
        
        # Documentation metadata CSV
        documentation_csv = self.output_manager.generate_documentation_csv(
            directory_data, f"{output_prefix}_documentation.csv")
        output_files['documentation_csv'] = documentation_csv
        
        logger.info(f"Analysis complete. Output files generated in: {self.output_manager.output_dir}")
        
        return output_files
    
    def analyze_file(self, file_path: str) -> Dict[str, Any]:
        """
        Perform comprehensive analysis of a single file.
        
        Provides direct access to detailed file analysis, like focusing on
        a single tree to understand its unique characteristics and health.
        
        Args:
            file_path: Path to the file to analyze.
            
        Returns:
            Dictionary containing comprehensive file metadata.
        """
        return self.directory_analyzer.file_analyzer.analyze_file(file_path)


# ======================================================================
# Command-Line Interface
# ======================================================================

def main():
    """
    Command-line entry point for CodeSeed.
    
    Provides a user-friendly interface to the CodeSeed system, allowing
    easy analysis of code directories and generation of rich metadata.
    """
    import argparse
    
    # Set up argument parser
    parser = argparse.ArgumentParser(
        description="CodeSeed: Extract rich code metadata for analysis in DataTrellis"
    )
    parser.add_argument('directory', nargs='?', default='.',
                       help="Directory to analyze (defaults to current directory)")
    parser.add_argument('--output-dir', '-o', default='.',
                       help="Directory for output files (defaults to current directory)")
    parser.add_argument('--prefix', '-p', default='codeseed',
                       help="Prefix for output filenames")
    parser.add_argument('--exclude', '-e', action='append',
                       help="Patterns to exclude (can be specified multiple times)")
    parser.add_argument('--verbose', '-v', action='store_true',
                       help="Enable verbose logging")
    parser.add_argument('--version', action='store_true',
                       help="Show version information")
    
    # Parse arguments
    args = parser.parse_args()
    
    # Show version if requested
    if args.version:
        print("CodeSeed: Semantic Forest Mapper v1.0")
        return
    
    # Configure logging level
    if args.verbose:
        logger.setLevel(logging.DEBUG)
    
    # Run analysis
    try:
        # Initialize CodeSeed
        code_seed = CodeSeed(args.output_dir)
        
        # Analyze directory
        output_files = code_seed.analyze_directory(
            args.directory, args.exclude, args.prefix)
        
        # Show results
        print("\nAnalysis complete!")
        print(f"Directory: {args.directory}")
        print("\nOutput files:")
        for output_type, file_path in output_files.items():
            print(f"- {output_type}: {file_path}")
        
    except Exception as e:
        logger.error(f"Error during analysis: {e}")
        import traceback
        logger.debug(traceback.format_exc())
        sys.exit(1)


if __name__ == "__main__":
    main()