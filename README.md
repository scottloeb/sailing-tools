# Graph Algorithms, Research, Development, Enhancements, and Novelties (G.A.R.D.E.N.)

A repository for various excursions into:

- Graph databases, graph modeling, graph development
- Algorithm development, benchmarking, testing, comparison
- Research into new methods for working with graph data
- Development of new, self-contained graph products
- Enhancements to existing graph products, such as neo4j plugins.
- Novel graph development efforts just because they're neat.

Useful commands:

Replace <DATA_DIRECTORY> with the path on your system where you want
to persist data.

`podman run -p 7474:7474 -p 7687:7687 -v $LOCAL_VOLUME:/data --name=neo4j4426 -e NEO4J_AUTH=neo4j/neo4j-dev -e dbms.db.timezone=SYSTEM -e NEO4JLABS_PLUGINS=\[\"apoc\"\] neo4j:4.4.26 `

Note: I am working with 4.4.26 right now to ensure compatibility with another project.

## Useful Links
Neo4j Python Driver 4.4 Documentation: https://neo4j.com/docs/api/python-driver/4.4/
Neo4j Python Driver 5 Documentation: https://neo4j.com/docs/api/python-driver/current/
Podman basics: https://github.com/containers/podman/blob/main/docs/tutorials/podman_tutorial.md