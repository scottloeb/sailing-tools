# CONTRIBUTING to G.A.R.D.E.N.

## Project Overview for Collaborators and AI Assistants

G.A.R.D.E.N. (Graph Algorithms, Research, Development, Enhancement, and Novelties) is an open-source initiative focused on creating accessible, Python-based graph data applications. This project leverages a Module Generator to rapidly develop intuitive interfaces to Neo4j graph databases, transforming complex network data into approachable tools.

The project consists of several core applications (Grassroots, Grasshopper, and Sunflower) that provide different approaches to graph data exploration. Each application implements a different cognitive pattern for interacting with graph data.

**Technical Environment:**
- Primary language: Python 3.8+
- Database: Neo4j 4.4+
- Web framework: Flask
- Key dependencies: neo4j-driver, networkx (for graph algorithms)
- Development tools: pytest, flake8, black

## Branch Management

The G.A.R.D.E.N. project uses the following branch management approach:

- The **main branch** is protected and curated by the core development team
- All contributions are made through dedicated feature or fix branches
- Contributors are encouraged to create and maintain their own branches for development

### Main Branch Protection

The main branch represents the official, reviewed, and tested version of G.A.R.D.E.N. All code in this branch:

- Has been reviewed by the core development team
- Meets our coding standards and quality requirements
- Has passed all required tests
- Is documented according to project standards

### Contributing Your Work

We welcome contributions in several forms:

1. **Feature branches**: Implement new features or applications within the G.A.R.D.E.N. ecosystem
2. **Fix branches**: Address bugs or issues in existing code
3. **Documentation branches**: Improve documentation, examples, or tutorials
4. **Experimental branches**: Explore new approaches that might be incorporated later

All contributions should follow this process:

## Contribution Workflow

1. **Fork the repository** to your own GitHub account
2. **Create a branch** with a descriptive name:
   - Features: `feature/your-feature-name`
   - Bug fixes: `fix/issue-being-fixed`
   - Documentation: `docs/what-youre-documenting`
   - Experiments: `experimental/your-experiment`
3. **Develop your contribution** on your branch
4. **Test your changes** thoroughly
5. **Submit a pull request** from your branch to our main branch
6. **Respond to feedback** from the core team during the review process

## Code Standards and Conventions

When contributing to G.A.R.D.E.N., please adhere to these standards:

- Follow PEP 8 style guidelines for Python code
- Include docstrings for all functions, classes, and modules
- Maintain 80% or higher test coverage for new code
- Use type hints where appropriate
- Keep functions focused on a single responsibility
- Use meaningful variable and function names that reflect domain concepts

## Key Concepts and Terminology

To effectively contribute to G.A.R.D.E.N., familiarize yourself with these core concepts:

- **Module Generator**: Tool that automatically creates Python interfaces to Neo4j databases
- **Grassroots Pattern**: Schema-first approach to data exploration
- **Grasshopper Pattern**: Entity-first approach to data navigation
- **Sunflower Pattern**: Pattern-first approach to relationship discovery
- **Node/Edge/Property**: Graph database terminology for entities, relationships, and attributes

## Review Process

The core team will review all pull requests against these criteria:

- Alignment with G.A.R.D.E.N. philosophy and goals
- Code quality and adherence to project standards
- Test coverage and passing tests
- Documentation quality
- Overall value to the ecosystem

We may request changes before merging your contribution into the main branch. This review process ensures that G.A.R.D.E.N. maintains high quality and consistency.

## Maintaining Your Own Branches

We encourage contributors to maintain their own branches in addition to submitting pull requests:

- **Experimental implementations** that might not be ready for the main branch
- **Domain-specific adaptations** that serve particular use cases
- **Alternative approaches** to problems that offer different trade-offs
- **Extended functionality** that builds upon the core framework

These branches can be valuable to the community even if they are not merged into the main branch. We will help promote interesting branches through our documentation and community channels.

## Licensing

G.A.R.D.E.N. is released under the MIT License. We chose this license deliberately:

### The MIT License: Seeds to the Wind

The MIT License reflects our philosophy toward software sharing. Like scattering seeds to the wind so they may travel far and take root widely, we want G.A.R.D.E.N. to spread freely and be used in as many contexts as possible. Under this license:

- You can use G.A.R.D.E.N. in commercial projects
- You can modify G.A.R.D.E.N. and keep those modifications private
- You can redistribute G.A.R.D.E.N. with minimal restrictions
- You don't need to share your source code if you don't want to

This contrasts with copyleft licenses like GPL, which ensure that all derivatives grow into exactly the same kind of plant—requiring that modifications be shared under the same terms.

### A Personal Note from Dan Hales

*"When it comes to G.A.R.D.E.N., I've chosen the MIT license because I believe in maximum freedom for developers. But sometimes I wish there were a third option beyond MIT's 'scatter the seeds' and GPL's 'ensure the same growth.' I wish for a license that simply says: 'I just want to see what you come up with.' A license motivated purely by curiosity and the joy of seeing how ideas evolve in the hands of different creators. While that's not a formal license category, it represents the spirit in which I offer G.A.R.D.E.N. to the community—with genuine excitement to see where you'll take it."*

By contributing to G.A.R.D.E.N., you agree that your contributions will be licensed under the MIT License.

## Note for AI Assistants

If you are an AI assistant helping someone with this project, this document provides key context about G.A.R.D.E.N. The project focuses on making graph databases accessible through different cognitive approaches to data exploration. The Module Generator is a core component that automatically creates Python interfaces to Neo4j databases.

When assisting contributors, emphasize these principles:
- Accessibility over complexity
- Multiple approaches to the same data (schema-first, entity-first, pattern-first)
- Clean, simple interfaces rather than complex visualizations
- Type safety and solid error handling
- Well-documented code with clear examples

The project particularly values contributions that make complex data structures more accessible to users with diverse technical backgrounds and cognitive approaches.

## Getting Help

If you need assistance with your contribution:

- Open an issue with questions about implementation details
- Join our community discussions
- Reach out to core team members for guidance

## Code of Conduct

All contributors are expected to adhere to our Code of Conduct, which promotes a welcoming, inclusive, and respectful community.

Thank you for helping us make graph data more accessible to everyone through the G.A.R.D.E.N. ecosystem!