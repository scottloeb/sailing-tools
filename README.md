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
to persist data:

`LOCAL_VOLUME=<data directory here>`
`NEO4J_VERSION=4.4.26`
`podman run -dt --name=neo4jgarden4426 --env=NEO4J_AUTH=neo4j/neo4j-dev --env=dbms.db.timezone=SYSTEM --publish=7474:7474 --publish=7687:7687 --volume=$LOCAL_VOLUME:/data neo4j:<VERSION>`

Note: I am working with 4.4.26 right now to ensure backwards compatibility with another project.

## Useful Links
Neo4j Python Driver 4.4 Documentation: https://neo4j.com/docs/api/python-driver/4.4/
Neo4j Python Driver 5 Documentation: https://neo4j.com/docs/api/python-driver/current/
Podman basics: https://github.com/containers/podman/blob/main/docs/tutorials/podman_tutorial.md