"""
newgraph.py - Auto-generated Neo4j interface module

This module provides a Python interface to a Neo4j graph database,
abstracting the Cypher query language and Neo4j driver details.

Generated on: 2025-03-06T07:55:09.197000000+00:00
Generated with: modulegenerator version 0.1.0
Neo4j driver version: 4.4.0
"""

import datetime
import neo4j
from neo4j import GraphDatabase


# Neo4j connection details
NEO4J_URI = "bolt://localhost:7687"
NEO4J_USERNAME = "neo4j"
NEO4J_PASSWORD = "neo4j-dev"
NEO4J_DATABASE = "neo4j"

def _authenticated_driver(uri=NEO4J_URI, username=NEO4J_USERNAME, password=NEO4J_PASSWORD):
    """
    Internal method to set up an authenticated driver.

    Parameters
    ----------
    uri: str
        neo4j connection string
    username: str
        username for the neo4j account
    password: str
        password for the neo4j account
    
    Returns
    -------
    neo4j.GraphDatabase.Driver instance to connect to the database.
    """
    return GraphDatabase.driver(uri, auth=(username, password))

def _query(query_text=None, query_params=None):
    """
    Submits a parameterized Cypher query to Neo4j.

    Parameters
    ----------
    query_text: str
        A valid Cypher query string.
    query_params: list(str)
        A list of parameters to be passed along with the query_text.

    Returns
    -------
    A tuple of dictionaries, representing entities returned by the query.
    """
    with _authenticated_driver().session() as session:
        return session.run(query_text, query_params).data()

def _server_timestamp():
    """
    Retrieves a timestamp from the neo4j instance and prints a message 
    to the screen. 

    Parameters
    ----------
    None

    Returns
    -------
    str:
        Timestamp from server.
    """
    text, params = Queries.server_timestamp()
    return _query(query_text=text, query_params=params)[0]['timestamp'].iso_format()

def _neo4j_node_to_dict(node):
    """
    Convert a neo4j Node to a plain Python dictionary.
    Can handle both Neo4j Node objects and dictionaries.
    """
    # If it's already a dictionary, we need to check its structure
    if isinstance(node, dict):
        # If it has all the keys we need, just return it
        if 'uuid' in node and 'labels' in node and 'props' in node:
            return node
        
        # If it's a Neo4j result dictionary, it might not have our expected structure
        props = node
        return {
            'uuid': props.get('uuid', None),
            'labels': props.get('labels', []),
            'props': props
        }
    
    # Otherwise, it's a Neo4j Node object
    props = dict(node.items())
    labels = list(node.labels)
    
    return {
        'uuid': props.get('uuid', None),
        'labels': labels,
        'props': props
    }

def _neo4j_relationship_to_dict(rel):
    """
    Convert a neo4j Relationship to a plain Python dictionary.
    
    Parameters
    ----------
    rel: neo4j.Relationship
        The Neo4j relationship to convert
        
    Returns
    -------
    Dict:
        A dictionary with keys 'uuid', 'type', and 'props'
    """
    # Create a dictionary from the relationship
    props = dict(rel.items())
    # Get the uuid (if it exists)
    uuid = props.get('uuid', None)
    # Get the type
    type = rel.type
    
    return {
        'uuid': uuid,
        'type': type,
        'props': props
    }

class Queries:
    def server_timestamp():
        text = 'RETURN datetime() AS timestamp;'
        params = None
        return text, params
    
    def node(label, **props):
        """
        Node interface cypher -- given a neo4j label (can be a multi-
        label separated by colons, e.g., Label1:Label2) and a dictionary
        of propNames and propValues, construct a parameterized Cypher query 
        to return a list of nodes with that label matching those properties.
        """        
        text = f"""MATCH 
            (n:{label} 
            {'{' if props else ''} 
            {', '.join(f"{prop}: ${prop}" for prop in props)}
            {'}' if props else ''}) 
            RETURN n;"""

        return text, props
    
    def node_labels():
        text = 'CALL db.labels() YIELD label RETURN collect(label) AS labels;'
        params = None
        return text, params
    
    def node_type_properties():
        text = """
        CALL db.schema.nodeTypeProperties() YIELD nodeLabels, propertyName, propertyTypes
        UNWIND nodeLabels AS nodeLabel
        UNWIND propertyTypes AS propertyType
        RETURN
            DISTINCT nodeLabel,
            propertyName,
            collect(propertyType) AS propertyTypes;
        """
        params = None 
        return text, params
    
    def rel_type_properties():
        text = """
        CALL db.schema.relTypeProperties() YIELD relType, propertyName, propertyTypes
        UNWIND propertyTypes AS propertyType
        RETURN
            DISTINCT relType,
            propertyName,
            collect(propertyType) AS propertyTypes;"""
        params = None
        return text, params
    
    def node_properties(label, limit=None):
        text = f"""
            MATCH 
                (n:{label}) 
            WITH n 
            {f"LIMIT {limit}" if limit is not None else ""}
            UNWIND keys(n) AS key
            RETURN DISTINCT key, apoc.meta.type(n[key]) AS type;
        """
        params = None
        return text, params
    
    def edge_types():
        text = 'CALL db.relationshipTypes() YIELD relationshipType RETURN collect(relationshipType) AS relationshipTypes;'
        params = None
        return text, params
    
    def edge_properties(type, limit=1000):
        text = f"""
            MATCH ()-[e:{type}]->()
            WITH e
            {f"LIMIT {limit}" if limit is not None else ""}
            UNWIND keys(e) AS key
            RETURN DISTINCT key, apoc.meta.type(e[key]) AS type;
        """
        params = None 
        return text, params
    
    def edge_endpoints(type, limit=1000):
        text = f"""
            MATCH (a)-[e:{type}]->(b)
            WITH a, e, b
            {f"LIMIT {limit}" if limit is not None else ""}
            RETURN DISTINCT labels(a) AS startLabels, labels(b) AS endLabels;
        """
        params = None 
        return text, params
    
    def edge(type, **props):
        """
        Edge interface cypher -- given a neo4j relationship type and a dictionary
        of propNames and propValues, construct a parameterized Cypher query 
        to return a list of relationships with that type matching those properties.
        """
        text = f"""MATCH 
            (source)-[r:{type} 
            {'{' if props else ''} 
            {', '.join(f"{prop}: ${prop}" for prop in props)}
            {'}' if props else ''}]->(target) 
            RETURN source, r, target;"""

        return text, props


# Metadata about the Neo4j graph
METADATA = {
    "node_labels": [
        "Movie",
        "Person",
        "Category",
        "Product",
        "Supplier",
        "Customer",
        "Order",
        "Ceremony",
        "Studio",
        "Production",
        "Review",
        "GeneratedByClaudeAI",
        "Manual",
        "Part",
        "Chapter"
    ],
    "node_properties": {
        "Movie": {
            "released": "INTEGER",
            "tagline": "STRING",
            "title": "STRING",
            "boxOfficeNA": "INTEGER",
            "boxOfficeEurope": "INTEGER",
            "boxOfficeAsia": "INTEGER",
            "boxOfficeOther": "INTEGER",
            "filmingLocationLong": "double[]",
            "filmingLocationLat": "double[]",
            "budget": "INTEGER",
            "ratings": "double[]",
            "genres": "String[]",
            "certifications": "String[]",
            "digitalRelease": "ZonedDateTime",
            "rating_avg": "FLOAT",
            "runtime_minutes": "INTEGER",
            "revenue": "INTEGER",
            "releaseDate": "LocalDate",
            "isOscarWinner": "BOOLEAN"
        },
        "Person": {
            "born": "INTEGER",
            "name": "STRING",
            "residenceLat": "FLOAT",
            "activeYears": "DurationValue",
            "typicalFilmLengthHrs": "FLOAT",
            "oscarNominations": "INTEGER",
            "nationality": "STRING",
            "isActive": "BOOLEAN",
            "lastDirected": "ZonedDateTime",
            "birthdate": "LocalDate",
            "residenceLong": "FLOAT",
            "preferredAspectRatios": "String[]",
            "collaborators": "String[]",
            "filmCountCrime": "INTEGER",
            "filmCountRomance": "INTEGER",
            "filmCountWestern": "INTEGER",
            "residenceLongs": "double[]",
            "filmCountThriller": "INTEGER",
            "residenceLats": "double[]",
            "filmCountDrama": "INTEGER",
            "oscarWins": "INTEGER",
            "netWorth": "INTEGER",
            "typicalShootScheduleMonths": "INTEGER",
            "languages": "String[]",
            "actingRangeScore": "FLOAT",
            "heightInMeters": "FLOAT",
            "firstOscarWin": "LocalDate",
            "filmography_roles": "String[]",
            "filmography_years": "long[]",
            "filmography_titles": "String[]",
            "typicalDay": "LocalTime",
            "oscarCeremony": "LocalDateTime",
            "firstFilm": "ZonedDateTime",
            "acceptedFilmStart": "OffsetTime",
            "height": "INTEGER",
            "activityDays": "String[]",
            "activityTypes": "String[]",
            "activityDurations": "long[]",
            "isCurrentlyFilming": "BOOLEAN",
            "weight": "INTEGER",
            "methodActingScore": "FLOAT",
            "marriageDate": "LocalDate",
            "oscarWinDate": "LocalDate",
            "filmCountComedy": "INTEGER",
            "filmCountSciFi": "INTEGER",
            "typicalRolePreparationMonths": "FLOAT",
            "spouseName": "STRING"
        },
        "Category": {},
        "Product": {},
        "Supplier": {},
        "Customer": {},
        "Order": {},
        "Ceremony": {
            "established": "LocalDate",
            "locationLat": "FLOAT",
            "viewership2022": "INTEGER",
            "viewership2023": "INTEGER",
            "name": "STRING",
            "typicalDurationHrs": "FLOAT",
            "viewership2020": "INTEGER",
            "viewership2021": "INTEGER",
            "nickname": "STRING",
            "locationHeight": "INTEGER",
            "categories": "String[]",
            "isPrestigious": "BOOLEAN",
            "nextCeremony": "ZonedDateTime",
            "locationLong": "FLOAT",
            "ceremonyTime": "LocalTime"
        },
        "Studio": {
            "studioLotsLong": "double[]",
            "studioLotsLat": "double[]",
            "name": "STRING",
            "distributionMarkets": "String[]",
            "founded": "LocalDate",
            "yearlyRevenue2020": "INTEGER",
            "subsidiaries": "String[]",
            "digitalStreamingDate": "ZonedDateTime",
            "yearlyRevenue2021": "INTEGER",
            "headquartersLat": "FLOAT",
            "marketShare": "FLOAT",
            "yearlyRevenue2022": "INTEGER",
            "headquartersLong": "FLOAT",
            "isPublic": "BOOLEAN"
        },
        "Production": {
            "scheduleTimes": "String[]",
            "scheduleDurations": "double[]",
            "weatherPoor": "INTEGER",
            "startDate": "LocalDate",
            "isCompleted": "BOOLEAN",
            "scheduleActivities": "String[]",
            "budgetEquipment": "INTEGER",
            "weatherGood": "INTEGER",
            "startTime": "LocalTime",
            "budgetPersonnel": "INTEGER",
            "durationDays": "INTEGER",
            "budgetVFX": "INTEGER",
            "weatherAcceptable": "INTEGER",
            "durationMonths": "INTEGER",
            "budgetOther": "INTEGER",
            "endDate": "LocalDate",
            "budgetLocations": "INTEGER",
            "name": "STRING"
        },
        "Review": {
            "readerLocationsLong": "double[]",
            "readerLocationsLat": "double[]",
            "title": "STRING",
            "aspectDirection": "FLOAT",
            "commentTimestamps": "LIST",
            "keywords": "String[]",
            "stars": "FLOAT",
            "time": "OffsetTime",
            "aspectMusic": "FLOAT",
            "aspectPlot": "FLOAT",
            "aspectVisuals": "FLOAT",
            "isVerified": "BOOLEAN",
            "reviewText": "STRING",
            "date": "LocalDate",
            "aspectActing": "FLOAT",
            "upvotes": "INTEGER"
        },
        "GeneratedByClaudeAI": {
            "boxOfficeNA": "INTEGER",
            "boxOfficeEurope": "INTEGER",
            "boxOfficeAsia": "INTEGER",
            "boxOfficeOther": "INTEGER",
            "filmingLocationLong": "double[]",
            "filmingLocationLat": "double[]",
            "budget": "INTEGER",
            "ratings": "double[]",
            "genres": "String[]",
            "certifications": "String[]",
            "tagline": "STRING",
            "digitalRelease": "ZonedDateTime",
            "released": "INTEGER",
            "rating_avg": "FLOAT",
            "title": "STRING",
            "runtime_minutes": "INTEGER",
            "revenue": "INTEGER",
            "releaseDate": "LocalDate",
            "isOscarWinner": "BOOLEAN",
            "residenceLat": "FLOAT",
            "activeYears": "DurationValue",
            "typicalFilmLengthHrs": "FLOAT",
            "oscarNominations": "INTEGER",
            "nationality": "STRING",
            "isActive": "BOOLEAN",
            "lastDirected": "ZonedDateTime",
            "birthdate": "LocalDate",
            "born": "INTEGER",
            "name": "STRING",
            "residenceLong": "FLOAT",
            "preferredAspectRatios": "String[]",
            "collaborators": "String[]",
            "filmCountCrime": "INTEGER",
            "filmCountRomance": "INTEGER",
            "filmCountWestern": "INTEGER",
            "residenceLongs": "double[]",
            "filmCountThriller": "INTEGER",
            "residenceLats": "double[]",
            "filmCountDrama": "INTEGER",
            "oscarWins": "INTEGER",
            "netWorth": "INTEGER",
            "typicalShootScheduleMonths": "INTEGER",
            "languages": "String[]",
            "actingRangeScore": "FLOAT",
            "heightInMeters": "FLOAT",
            "firstOscarWin": "LocalDate",
            "filmography_roles": "String[]",
            "filmography_years": "long[]",
            "filmography_titles": "String[]",
            "typicalDay": "LocalTime",
            "oscarCeremony": "LocalDateTime",
            "firstFilm": "ZonedDateTime",
            "acceptedFilmStart": "OffsetTime",
            "height": "INTEGER",
            "activityDays": "String[]",
            "activityTypes": "String[]",
            "activityDurations": "long[]",
            "isCurrentlyFilming": "BOOLEAN",
            "weight": "INTEGER",
            "established": "LocalDate",
            "locationLat": "FLOAT",
            "viewership2022": "INTEGER",
            "viewership2023": "INTEGER",
            "typicalDurationHrs": "FLOAT",
            "viewership2020": "INTEGER",
            "viewership2021": "INTEGER",
            "nickname": "STRING",
            "locationHeight": "INTEGER",
            "categories": "String[]",
            "isPrestigious": "BOOLEAN",
            "nextCeremony": "ZonedDateTime",
            "locationLong": "FLOAT",
            "ceremonyTime": "LocalTime",
            "studioLotsLong": "double[]",
            "studioLotsLat": "double[]",
            "distributionMarkets": "String[]",
            "founded": "LocalDate",
            "yearlyRevenue2020": "INTEGER",
            "subsidiaries": "String[]",
            "digitalStreamingDate": "ZonedDateTime",
            "yearlyRevenue2021": "INTEGER",
            "headquartersLat": "FLOAT",
            "marketShare": "FLOAT",
            "yearlyRevenue2022": "INTEGER",
            "headquartersLong": "FLOAT",
            "isPublic": "BOOLEAN",
            "scheduleTimes": "String[]",
            "scheduleDurations": "double[]",
            "weatherPoor": "INTEGER",
            "startDate": "LocalDate",
            "isCompleted": "BOOLEAN",
            "scheduleActivities": "String[]",
            "budgetEquipment": "INTEGER",
            "weatherGood": "INTEGER",
            "startTime": "LocalTime",
            "budgetPersonnel": "INTEGER",
            "durationDays": "INTEGER",
            "budgetVFX": "INTEGER",
            "weatherAcceptable": "INTEGER",
            "durationMonths": "INTEGER",
            "budgetOther": "INTEGER",
            "endDate": "LocalDate",
            "budgetLocations": "INTEGER",
            "readerLocationsLong": "double[]",
            "readerLocationsLat": "double[]",
            "aspectDirection": "FLOAT",
            "commentTimestamps": "LIST",
            "keywords": "String[]",
            "stars": "FLOAT",
            "time": "OffsetTime",
            "aspectMusic": "FLOAT",
            "aspectPlot": "FLOAT",
            "aspectVisuals": "FLOAT",
            "isVerified": "BOOLEAN",
            "reviewText": "STRING",
            "date": "LocalDate",
            "aspectActing": "FLOAT",
            "upvotes": "INTEGER",
            "methodActingScore": "FLOAT",
            "marriageDate": "LocalDate",
            "oscarWinDate": "LocalDate",
            "filmCountComedy": "INTEGER",
            "filmCountSciFi": "INTEGER",
            "typicalRolePreparationMonths": "FLOAT",
            "spouseName": "STRING"
        },
        "Manual": {},
        "Part": {},
        "Chapter": {}
    },
    "edge_types": [
        "ACTED_IN",
        "DIRECTED",
        "PRODUCED",
        "WROTE",
        "FOLLOWS",
        "REVIEWED",
        "FINANCED",
        "FOR_MOVIE",
        "NOMINATED_FOR",
        "KNOWS"
    ],
    "edge_properties": {
        "ACTED_IN": {
            "roles": "String[]",
            "endDate": "LocalDate",
            "screenTimeMinutes": "INTEGER",
            "startDate": "LocalDate",
            "awardNominations": "INTEGER",
            "audienceScore": "INTEGER",
            "criticScore": "INTEGER",
            "scheduleConflicts": "BOOLEAN",
            "salary": "INTEGER",
            "performanceRating": "FLOAT",
            "stuntPerformed": "BOOLEAN",
            "trainingPeriodWeeks": "INTEGER"
        },
        "DIRECTED": {
            "completionDate": "LocalDate",
            "satisfaction": "FLOAT",
            "daysOnSet": "INTEGER",
            "premiereEvent": "ZonedDateTime",
            "isFirstCollaboration": "BOOLEAN",
            "durationMonths": "INTEGER",
            "year": "INTEGER",
            "awardNominations": "INTEGER"
        },
        "PRODUCED": {
            "producerShare": "FLOAT",
            "topCastShare": "FLOAT",
            "roi": "FLOAT",
            "marketingStart": "ZonedDateTime",
            "marketingBudget": "INTEGER",
            "investment": "INTEGER",
            "directorShare": "FLOAT",
            "return": "INTEGER",
            "contractSigned": "LocalDate",
            "studioShare": "FLOAT",
            "isProfitable": "BOOLEAN"
        },
        "WROTE": {
            "date": "LocalDate",
            "isVerified": "BOOLEAN",
            "wordCount": "INTEGER",
            "timeSpentMinutes": "INTEGER",
            "submissionTime": "OffsetTime"
        },
        "FOLLOWS": {},
        "REVIEWED": {
            "summary": "STRING",
            "rating": "INTEGER"
        },
        "FINANCED": {
            "paymentDate3": "LocalDate",
            "paymentAmount3": "INTEGER",
            "transferTime3": "ZonedDateTime",
            "paymentAmount2": "INTEGER",
            "transferTime2": "ZonedDateTime",
            "paymentDate2": "LocalDate",
            "transferTime1": "ZonedDateTime",
            "paymentAmount1": "INTEGER",
            "contractDate": "LocalDate",
            "amount": "INTEGER",
            "isFullyPaid": "BOOLEAN",
            "paymentDate1": "LocalDate"
        },
        "FOR_MOVIE": {
            "durationDays": "INTEGER",
            "durationMonths": "INTEGER",
            "locationCount": "INTEGER",
            "scheduleAdherence": "FLOAT",
            "isCompleted": "BOOLEAN",
            "weatherDelaysDays": "INTEGER",
            "dailyAverageCost": "INTEGER",
            "originalScheduledEnd": "LocalDate",
            "publicationDateTime": "ZonedDateTime",
            "isPublished": "BOOLEAN",
            "views": "INTEGER",
            "featuredDurationDays": "INTEGER",
            "shares": "INTEGER",
            "comments": "INTEGER"
        },
        "NOMINATED_FOR": {
            "presenter2": "STRING",
            "announcementTime": "LocalTime",
            "presenter1": "STRING",
            "ceremony": "INTEGER",
            "category": "STRING",
            "year": "INTEGER",
            "isWinner": "BOOLEAN",
            "votesAgainst": "INTEGER",
            "ceremonyDate": "LocalDate",
            "votesFor": "INTEGER"
        },
        "KNOWS": {
            "lastContact": "ZonedDateTime",
            "relationship": "STRING",
            "since": "LocalDate",
            "nextMeeting": "ZonedDateTime",
            "projects": "INTEGER",
            "project1": "STRING",
            "year1": "INTEGER",
            "year2": "INTEGER",
            "project2": "STRING",
            "durationYears": "INTEGER",
            "lastCollaboration": "LocalDate"
        }
    },
    "edge_endpoints": {
        "ACTED_IN": [
            [
                "GeneratedByClaudeAI",
                "Person"
            ],
            [
                "Movie",
                "GeneratedByClaudeAI"
            ]
        ],
        "DIRECTED": [
            [
                "GeneratedByClaudeAI",
                "Person"
            ],
            [
                "Movie",
                "GeneratedByClaudeAI"
            ]
        ],
        "PRODUCED": [
            [
                "GeneratedByClaudeAI",
                "Studio",
                "Person"
            ],
            [
                "Movie",
                "GeneratedByClaudeAI"
            ]
        ],
        "WROTE": [
            [
                "Person"
            ],
            [
                "Review",
                "Movie",
                "GeneratedByClaudeAI"
            ]
        ],
        "FOLLOWS": [
            [
                "Person"
            ],
            [
                "Person"
            ]
        ],
        "REVIEWED": [
            [
                "Person"
            ],
            [
                "Movie"
            ]
        ],
        "FINANCED": [
            [
                "GeneratedByClaudeAI",
                "Studio"
            ],
            [
                "Production",
                "GeneratedByClaudeAI"
            ]
        ],
        "FOR_MOVIE": [
            [
                "Review",
                "Production",
                "GeneratedByClaudeAI"
            ],
            [
                "Movie",
                "GeneratedByClaudeAI"
            ]
        ],
        "NOMINATED_FOR": [
            [
                "Person",
                "Movie",
                "GeneratedByClaudeAI"
            ],
            [
                "Ceremony",
                "GeneratedByClaudeAI"
            ]
        ],
        "KNOWS": [
            [
                "GeneratedByClaudeAI",
                "Person"
            ],
            [
                "Person"
            ]
        ]
    }
}


class Nodes:
    """
    Interface for working with nodes in the Neo4j graph.
    Each method corresponds to a node label in the graph.
    """

    def movie(uuid=None, **props):
        """
        Find nodes with label Movie matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check released (expected int)
        if "released" in props and props["released"] is not None:
            if not isinstance(props["released"], int):
                try:
                    # Attempt to convert
                    props["released"] = int(props["released"])
                except:
                    raise TypeError(f"Property released must be of type int, got {type(props['released']).__name__}")
    
        # Type check tagline (expected str)
        if "tagline" in props and props["tagline"] is not None:
            if not isinstance(props["tagline"], str):
                try:
                    # Attempt to convert
                    props["tagline"] = str(props["tagline"])
                except:
                    raise TypeError(f"Property tagline must be of type str, got {type(props['tagline']).__name__}")
    
        # Type check title (expected str)
        if "title" in props and props["title"] is not None:
            if not isinstance(props["title"], str):
                try:
                    # Attempt to convert
                    props["title"] = str(props["title"])
                except:
                    raise TypeError(f"Property title must be of type str, got {type(props['title']).__name__}")
    
        # Type check boxOfficeNA (expected int)
        if "boxOfficeNA" in props and props["boxOfficeNA"] is not None:
            if not isinstance(props["boxOfficeNA"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeNA"] = int(props["boxOfficeNA"])
                except:
                    raise TypeError(f"Property boxOfficeNA must be of type int, got {type(props['boxOfficeNA']).__name__}")
    
        # Type check boxOfficeEurope (expected int)
        if "boxOfficeEurope" in props and props["boxOfficeEurope"] is not None:
            if not isinstance(props["boxOfficeEurope"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeEurope"] = int(props["boxOfficeEurope"])
                except:
                    raise TypeError(f"Property boxOfficeEurope must be of type int, got {type(props['boxOfficeEurope']).__name__}")
    
        # Type check boxOfficeAsia (expected int)
        if "boxOfficeAsia" in props and props["boxOfficeAsia"] is not None:
            if not isinstance(props["boxOfficeAsia"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeAsia"] = int(props["boxOfficeAsia"])
                except:
                    raise TypeError(f"Property boxOfficeAsia must be of type int, got {type(props['boxOfficeAsia']).__name__}")
    
        # Type check boxOfficeOther (expected int)
        if "boxOfficeOther" in props and props["boxOfficeOther"] is not None:
            if not isinstance(props["boxOfficeOther"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeOther"] = int(props["boxOfficeOther"])
                except:
                    raise TypeError(f"Property boxOfficeOther must be of type int, got {type(props['boxOfficeOther']).__name__}")
    
        # Type check filmingLocationLong (expected object)
        if "filmingLocationLong" in props and props["filmingLocationLong"] is not None:
            if not isinstance(props["filmingLocationLong"], object):
                try:
                    # Attempt to convert
                    props["filmingLocationLong"] = object(props["filmingLocationLong"])
                except:
                    raise TypeError(f"Property filmingLocationLong must be of type object, got {type(props['filmingLocationLong']).__name__}")
    
        # Type check filmingLocationLat (expected object)
        if "filmingLocationLat" in props and props["filmingLocationLat"] is not None:
            if not isinstance(props["filmingLocationLat"], object):
                try:
                    # Attempt to convert
                    props["filmingLocationLat"] = object(props["filmingLocationLat"])
                except:
                    raise TypeError(f"Property filmingLocationLat must be of type object, got {type(props['filmingLocationLat']).__name__}")
    
        # Type check budget (expected int)
        if "budget" in props and props["budget"] is not None:
            if not isinstance(props["budget"], int):
                try:
                    # Attempt to convert
                    props["budget"] = int(props["budget"])
                except:
                    raise TypeError(f"Property budget must be of type int, got {type(props['budget']).__name__}")
    
        # Type check ratings (expected object)
        if "ratings" in props and props["ratings"] is not None:
            if not isinstance(props["ratings"], object):
                try:
                    # Attempt to convert
                    props["ratings"] = object(props["ratings"])
                except:
                    raise TypeError(f"Property ratings must be of type object, got {type(props['ratings']).__name__}")
    
        # Type check genres (expected object)
        if "genres" in props and props["genres"] is not None:
            if not isinstance(props["genres"], object):
                try:
                    # Attempt to convert
                    props["genres"] = object(props["genres"])
                except:
                    raise TypeError(f"Property genres must be of type object, got {type(props['genres']).__name__}")
    
        # Type check certifications (expected object)
        if "certifications" in props and props["certifications"] is not None:
            if not isinstance(props["certifications"], object):
                try:
                    # Attempt to convert
                    props["certifications"] = object(props["certifications"])
                except:
                    raise TypeError(f"Property certifications must be of type object, got {type(props['certifications']).__name__}")
    
        # Type check digitalRelease (expected object)
        if "digitalRelease" in props and props["digitalRelease"] is not None:
            if not isinstance(props["digitalRelease"], object):
                try:
                    # Attempt to convert
                    props["digitalRelease"] = object(props["digitalRelease"])
                except:
                    raise TypeError(f"Property digitalRelease must be of type object, got {type(props['digitalRelease']).__name__}")
    
        # Type check rating_avg (expected float)
        if "rating_avg" in props and props["rating_avg"] is not None:
            if not isinstance(props["rating_avg"], float):
                try:
                    # Attempt to convert
                    props["rating_avg"] = float(props["rating_avg"])
                except:
                    raise TypeError(f"Property rating_avg must be of type float, got {type(props['rating_avg']).__name__}")
    
        # Type check runtime_minutes (expected int)
        if "runtime_minutes" in props and props["runtime_minutes"] is not None:
            if not isinstance(props["runtime_minutes"], int):
                try:
                    # Attempt to convert
                    props["runtime_minutes"] = int(props["runtime_minutes"])
                except:
                    raise TypeError(f"Property runtime_minutes must be of type int, got {type(props['runtime_minutes']).__name__}")
    
        # Type check revenue (expected int)
        if "revenue" in props and props["revenue"] is not None:
            if not isinstance(props["revenue"], int):
                try:
                    # Attempt to convert
                    props["revenue"] = int(props["revenue"])
                except:
                    raise TypeError(f"Property revenue must be of type int, got {type(props['revenue']).__name__}")
    
        # Type check releaseDate (expected object)
        if "releaseDate" in props and props["releaseDate"] is not None:
            if not isinstance(props["releaseDate"], object):
                try:
                    # Attempt to convert
                    props["releaseDate"] = object(props["releaseDate"])
                except:
                    raise TypeError(f"Property releaseDate must be of type object, got {type(props['releaseDate']).__name__}")
    
        # Type check isOscarWinner (expected bool)
        if "isOscarWinner" in props and props["isOscarWinner"] is not None:
            if not isinstance(props["isOscarWinner"], bool):
                try:
                    # Attempt to convert
                    props["isOscarWinner"] = bool(props["isOscarWinner"])
                except:
                    raise TypeError(f"Property isOscarWinner must be of type bool, got {type(props['isOscarWinner']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.node(label="Movie", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def person(uuid=None, **props):
        """
        Find nodes with label Person matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check born (expected int)
        if "born" in props and props["born"] is not None:
            if not isinstance(props["born"], int):
                try:
                    # Attempt to convert
                    props["born"] = int(props["born"])
                except:
                    raise TypeError(f"Property born must be of type int, got {type(props['born']).__name__}")
    
        # Type check name (expected str)
        if "name" in props and props["name"] is not None:
            if not isinstance(props["name"], str):
                try:
                    # Attempt to convert
                    props["name"] = str(props["name"])
                except:
                    raise TypeError(f"Property name must be of type str, got {type(props['name']).__name__}")
    
        # Type check residenceLat (expected float)
        if "residenceLat" in props and props["residenceLat"] is not None:
            if not isinstance(props["residenceLat"], float):
                try:
                    # Attempt to convert
                    props["residenceLat"] = float(props["residenceLat"])
                except:
                    raise TypeError(f"Property residenceLat must be of type float, got {type(props['residenceLat']).__name__}")
    
        # Type check activeYears (expected object)
        if "activeYears" in props and props["activeYears"] is not None:
            if not isinstance(props["activeYears"], object):
                try:
                    # Attempt to convert
                    props["activeYears"] = object(props["activeYears"])
                except:
                    raise TypeError(f"Property activeYears must be of type object, got {type(props['activeYears']).__name__}")
    
        # Type check typicalFilmLengthHrs (expected float)
        if "typicalFilmLengthHrs" in props and props["typicalFilmLengthHrs"] is not None:
            if not isinstance(props["typicalFilmLengthHrs"], float):
                try:
                    # Attempt to convert
                    props["typicalFilmLengthHrs"] = float(props["typicalFilmLengthHrs"])
                except:
                    raise TypeError(f"Property typicalFilmLengthHrs must be of type float, got {type(props['typicalFilmLengthHrs']).__name__}")
    
        # Type check oscarNominations (expected int)
        if "oscarNominations" in props and props["oscarNominations"] is not None:
            if not isinstance(props["oscarNominations"], int):
                try:
                    # Attempt to convert
                    props["oscarNominations"] = int(props["oscarNominations"])
                except:
                    raise TypeError(f"Property oscarNominations must be of type int, got {type(props['oscarNominations']).__name__}")
    
        # Type check nationality (expected str)
        if "nationality" in props and props["nationality"] is not None:
            if not isinstance(props["nationality"], str):
                try:
                    # Attempt to convert
                    props["nationality"] = str(props["nationality"])
                except:
                    raise TypeError(f"Property nationality must be of type str, got {type(props['nationality']).__name__}")
    
        # Type check isActive (expected bool)
        if "isActive" in props and props["isActive"] is not None:
            if not isinstance(props["isActive"], bool):
                try:
                    # Attempt to convert
                    props["isActive"] = bool(props["isActive"])
                except:
                    raise TypeError(f"Property isActive must be of type bool, got {type(props['isActive']).__name__}")
    
        # Type check lastDirected (expected object)
        if "lastDirected" in props and props["lastDirected"] is not None:
            if not isinstance(props["lastDirected"], object):
                try:
                    # Attempt to convert
                    props["lastDirected"] = object(props["lastDirected"])
                except:
                    raise TypeError(f"Property lastDirected must be of type object, got {type(props['lastDirected']).__name__}")
    
        # Type check birthdate (expected object)
        if "birthdate" in props and props["birthdate"] is not None:
            if not isinstance(props["birthdate"], object):
                try:
                    # Attempt to convert
                    props["birthdate"] = object(props["birthdate"])
                except:
                    raise TypeError(f"Property birthdate must be of type object, got {type(props['birthdate']).__name__}")
    
        # Type check residenceLong (expected float)
        if "residenceLong" in props and props["residenceLong"] is not None:
            if not isinstance(props["residenceLong"], float):
                try:
                    # Attempt to convert
                    props["residenceLong"] = float(props["residenceLong"])
                except:
                    raise TypeError(f"Property residenceLong must be of type float, got {type(props['residenceLong']).__name__}")
    
        # Type check preferredAspectRatios (expected object)
        if "preferredAspectRatios" in props and props["preferredAspectRatios"] is not None:
            if not isinstance(props["preferredAspectRatios"], object):
                try:
                    # Attempt to convert
                    props["preferredAspectRatios"] = object(props["preferredAspectRatios"])
                except:
                    raise TypeError(f"Property preferredAspectRatios must be of type object, got {type(props['preferredAspectRatios']).__name__}")
    
        # Type check collaborators (expected object)
        if "collaborators" in props and props["collaborators"] is not None:
            if not isinstance(props["collaborators"], object):
                try:
                    # Attempt to convert
                    props["collaborators"] = object(props["collaborators"])
                except:
                    raise TypeError(f"Property collaborators must be of type object, got {type(props['collaborators']).__name__}")
    
        # Type check filmCountCrime (expected int)
        if "filmCountCrime" in props and props["filmCountCrime"] is not None:
            if not isinstance(props["filmCountCrime"], int):
                try:
                    # Attempt to convert
                    props["filmCountCrime"] = int(props["filmCountCrime"])
                except:
                    raise TypeError(f"Property filmCountCrime must be of type int, got {type(props['filmCountCrime']).__name__}")
    
        # Type check filmCountRomance (expected int)
        if "filmCountRomance" in props and props["filmCountRomance"] is not None:
            if not isinstance(props["filmCountRomance"], int):
                try:
                    # Attempt to convert
                    props["filmCountRomance"] = int(props["filmCountRomance"])
                except:
                    raise TypeError(f"Property filmCountRomance must be of type int, got {type(props['filmCountRomance']).__name__}")
    
        # Type check filmCountWestern (expected int)
        if "filmCountWestern" in props and props["filmCountWestern"] is not None:
            if not isinstance(props["filmCountWestern"], int):
                try:
                    # Attempt to convert
                    props["filmCountWestern"] = int(props["filmCountWestern"])
                except:
                    raise TypeError(f"Property filmCountWestern must be of type int, got {type(props['filmCountWestern']).__name__}")
    
        # Type check residenceLongs (expected object)
        if "residenceLongs" in props and props["residenceLongs"] is not None:
            if not isinstance(props["residenceLongs"], object):
                try:
                    # Attempt to convert
                    props["residenceLongs"] = object(props["residenceLongs"])
                except:
                    raise TypeError(f"Property residenceLongs must be of type object, got {type(props['residenceLongs']).__name__}")
    
        # Type check filmCountThriller (expected int)
        if "filmCountThriller" in props and props["filmCountThriller"] is not None:
            if not isinstance(props["filmCountThriller"], int):
                try:
                    # Attempt to convert
                    props["filmCountThriller"] = int(props["filmCountThriller"])
                except:
                    raise TypeError(f"Property filmCountThriller must be of type int, got {type(props['filmCountThriller']).__name__}")
    
        # Type check residenceLats (expected object)
        if "residenceLats" in props and props["residenceLats"] is not None:
            if not isinstance(props["residenceLats"], object):
                try:
                    # Attempt to convert
                    props["residenceLats"] = object(props["residenceLats"])
                except:
                    raise TypeError(f"Property residenceLats must be of type object, got {type(props['residenceLats']).__name__}")
    
        # Type check filmCountDrama (expected int)
        if "filmCountDrama" in props and props["filmCountDrama"] is not None:
            if not isinstance(props["filmCountDrama"], int):
                try:
                    # Attempt to convert
                    props["filmCountDrama"] = int(props["filmCountDrama"])
                except:
                    raise TypeError(f"Property filmCountDrama must be of type int, got {type(props['filmCountDrama']).__name__}")
    
        # Type check oscarWins (expected int)
        if "oscarWins" in props and props["oscarWins"] is not None:
            if not isinstance(props["oscarWins"], int):
                try:
                    # Attempt to convert
                    props["oscarWins"] = int(props["oscarWins"])
                except:
                    raise TypeError(f"Property oscarWins must be of type int, got {type(props['oscarWins']).__name__}")
    
        # Type check netWorth (expected int)
        if "netWorth" in props and props["netWorth"] is not None:
            if not isinstance(props["netWorth"], int):
                try:
                    # Attempt to convert
                    props["netWorth"] = int(props["netWorth"])
                except:
                    raise TypeError(f"Property netWorth must be of type int, got {type(props['netWorth']).__name__}")
    
        # Type check typicalShootScheduleMonths (expected int)
        if "typicalShootScheduleMonths" in props and props["typicalShootScheduleMonths"] is not None:
            if not isinstance(props["typicalShootScheduleMonths"], int):
                try:
                    # Attempt to convert
                    props["typicalShootScheduleMonths"] = int(props["typicalShootScheduleMonths"])
                except:
                    raise TypeError(f"Property typicalShootScheduleMonths must be of type int, got {type(props['typicalShootScheduleMonths']).__name__}")
    
        # Type check languages (expected object)
        if "languages" in props and props["languages"] is not None:
            if not isinstance(props["languages"], object):
                try:
                    # Attempt to convert
                    props["languages"] = object(props["languages"])
                except:
                    raise TypeError(f"Property languages must be of type object, got {type(props['languages']).__name__}")
    
        # Type check actingRangeScore (expected float)
        if "actingRangeScore" in props and props["actingRangeScore"] is not None:
            if not isinstance(props["actingRangeScore"], float):
                try:
                    # Attempt to convert
                    props["actingRangeScore"] = float(props["actingRangeScore"])
                except:
                    raise TypeError(f"Property actingRangeScore must be of type float, got {type(props['actingRangeScore']).__name__}")
    
        # Type check heightInMeters (expected float)
        if "heightInMeters" in props and props["heightInMeters"] is not None:
            if not isinstance(props["heightInMeters"], float):
                try:
                    # Attempt to convert
                    props["heightInMeters"] = float(props["heightInMeters"])
                except:
                    raise TypeError(f"Property heightInMeters must be of type float, got {type(props['heightInMeters']).__name__}")
    
        # Type check firstOscarWin (expected object)
        if "firstOscarWin" in props and props["firstOscarWin"] is not None:
            if not isinstance(props["firstOscarWin"], object):
                try:
                    # Attempt to convert
                    props["firstOscarWin"] = object(props["firstOscarWin"])
                except:
                    raise TypeError(f"Property firstOscarWin must be of type object, got {type(props['firstOscarWin']).__name__}")
    
        # Type check filmography_roles (expected object)
        if "filmography_roles" in props and props["filmography_roles"] is not None:
            if not isinstance(props["filmography_roles"], object):
                try:
                    # Attempt to convert
                    props["filmography_roles"] = object(props["filmography_roles"])
                except:
                    raise TypeError(f"Property filmography_roles must be of type object, got {type(props['filmography_roles']).__name__}")
    
        # Type check filmography_years (expected object)
        if "filmography_years" in props and props["filmography_years"] is not None:
            if not isinstance(props["filmography_years"], object):
                try:
                    # Attempt to convert
                    props["filmography_years"] = object(props["filmography_years"])
                except:
                    raise TypeError(f"Property filmography_years must be of type object, got {type(props['filmography_years']).__name__}")
    
        # Type check filmography_titles (expected object)
        if "filmography_titles" in props and props["filmography_titles"] is not None:
            if not isinstance(props["filmography_titles"], object):
                try:
                    # Attempt to convert
                    props["filmography_titles"] = object(props["filmography_titles"])
                except:
                    raise TypeError(f"Property filmography_titles must be of type object, got {type(props['filmography_titles']).__name__}")
    
        # Type check typicalDay (expected object)
        if "typicalDay" in props and props["typicalDay"] is not None:
            if not isinstance(props["typicalDay"], object):
                try:
                    # Attempt to convert
                    props["typicalDay"] = object(props["typicalDay"])
                except:
                    raise TypeError(f"Property typicalDay must be of type object, got {type(props['typicalDay']).__name__}")
    
        # Type check oscarCeremony (expected object)
        if "oscarCeremony" in props and props["oscarCeremony"] is not None:
            if not isinstance(props["oscarCeremony"], object):
                try:
                    # Attempt to convert
                    props["oscarCeremony"] = object(props["oscarCeremony"])
                except:
                    raise TypeError(f"Property oscarCeremony must be of type object, got {type(props['oscarCeremony']).__name__}")
    
        # Type check firstFilm (expected object)
        if "firstFilm" in props and props["firstFilm"] is not None:
            if not isinstance(props["firstFilm"], object):
                try:
                    # Attempt to convert
                    props["firstFilm"] = object(props["firstFilm"])
                except:
                    raise TypeError(f"Property firstFilm must be of type object, got {type(props['firstFilm']).__name__}")
    
        # Type check acceptedFilmStart (expected object)
        if "acceptedFilmStart" in props and props["acceptedFilmStart"] is not None:
            if not isinstance(props["acceptedFilmStart"], object):
                try:
                    # Attempt to convert
                    props["acceptedFilmStart"] = object(props["acceptedFilmStart"])
                except:
                    raise TypeError(f"Property acceptedFilmStart must be of type object, got {type(props['acceptedFilmStart']).__name__}")
    
        # Type check height (expected int)
        if "height" in props and props["height"] is not None:
            if not isinstance(props["height"], int):
                try:
                    # Attempt to convert
                    props["height"] = int(props["height"])
                except:
                    raise TypeError(f"Property height must be of type int, got {type(props['height']).__name__}")
    
        # Type check activityDays (expected object)
        if "activityDays" in props and props["activityDays"] is not None:
            if not isinstance(props["activityDays"], object):
                try:
                    # Attempt to convert
                    props["activityDays"] = object(props["activityDays"])
                except:
                    raise TypeError(f"Property activityDays must be of type object, got {type(props['activityDays']).__name__}")
    
        # Type check activityTypes (expected object)
        if "activityTypes" in props and props["activityTypes"] is not None:
            if not isinstance(props["activityTypes"], object):
                try:
                    # Attempt to convert
                    props["activityTypes"] = object(props["activityTypes"])
                except:
                    raise TypeError(f"Property activityTypes must be of type object, got {type(props['activityTypes']).__name__}")
    
        # Type check activityDurations (expected object)
        if "activityDurations" in props and props["activityDurations"] is not None:
            if not isinstance(props["activityDurations"], object):
                try:
                    # Attempt to convert
                    props["activityDurations"] = object(props["activityDurations"])
                except:
                    raise TypeError(f"Property activityDurations must be of type object, got {type(props['activityDurations']).__name__}")
    
        # Type check isCurrentlyFilming (expected bool)
        if "isCurrentlyFilming" in props and props["isCurrentlyFilming"] is not None:
            if not isinstance(props["isCurrentlyFilming"], bool):
                try:
                    # Attempt to convert
                    props["isCurrentlyFilming"] = bool(props["isCurrentlyFilming"])
                except:
                    raise TypeError(f"Property isCurrentlyFilming must be of type bool, got {type(props['isCurrentlyFilming']).__name__}")
    
        # Type check weight (expected int)
        if "weight" in props and props["weight"] is not None:
            if not isinstance(props["weight"], int):
                try:
                    # Attempt to convert
                    props["weight"] = int(props["weight"])
                except:
                    raise TypeError(f"Property weight must be of type int, got {type(props['weight']).__name__}")
    
        # Type check methodActingScore (expected float)
        if "methodActingScore" in props and props["methodActingScore"] is not None:
            if not isinstance(props["methodActingScore"], float):
                try:
                    # Attempt to convert
                    props["methodActingScore"] = float(props["methodActingScore"])
                except:
                    raise TypeError(f"Property methodActingScore must be of type float, got {type(props['methodActingScore']).__name__}")
    
        # Type check marriageDate (expected object)
        if "marriageDate" in props and props["marriageDate"] is not None:
            if not isinstance(props["marriageDate"], object):
                try:
                    # Attempt to convert
                    props["marriageDate"] = object(props["marriageDate"])
                except:
                    raise TypeError(f"Property marriageDate must be of type object, got {type(props['marriageDate']).__name__}")
    
        # Type check oscarWinDate (expected object)
        if "oscarWinDate" in props and props["oscarWinDate"] is not None:
            if not isinstance(props["oscarWinDate"], object):
                try:
                    # Attempt to convert
                    props["oscarWinDate"] = object(props["oscarWinDate"])
                except:
                    raise TypeError(f"Property oscarWinDate must be of type object, got {type(props['oscarWinDate']).__name__}")
    
        # Type check filmCountComedy (expected int)
        if "filmCountComedy" in props and props["filmCountComedy"] is not None:
            if not isinstance(props["filmCountComedy"], int):
                try:
                    # Attempt to convert
                    props["filmCountComedy"] = int(props["filmCountComedy"])
                except:
                    raise TypeError(f"Property filmCountComedy must be of type int, got {type(props['filmCountComedy']).__name__}")
    
        # Type check filmCountSciFi (expected int)
        if "filmCountSciFi" in props and props["filmCountSciFi"] is not None:
            if not isinstance(props["filmCountSciFi"], int):
                try:
                    # Attempt to convert
                    props["filmCountSciFi"] = int(props["filmCountSciFi"])
                except:
                    raise TypeError(f"Property filmCountSciFi must be of type int, got {type(props['filmCountSciFi']).__name__}")
    
        # Type check typicalRolePreparationMonths (expected float)
        if "typicalRolePreparationMonths" in props and props["typicalRolePreparationMonths"] is not None:
            if not isinstance(props["typicalRolePreparationMonths"], float):
                try:
                    # Attempt to convert
                    props["typicalRolePreparationMonths"] = float(props["typicalRolePreparationMonths"])
                except:
                    raise TypeError(f"Property typicalRolePreparationMonths must be of type float, got {type(props['typicalRolePreparationMonths']).__name__}")
    
        # Type check spouseName (expected str)
        if "spouseName" in props and props["spouseName"] is not None:
            if not isinstance(props["spouseName"], str):
                try:
                    # Attempt to convert
                    props["spouseName"] = str(props["spouseName"])
                except:
                    raise TypeError(f"Property spouseName must be of type str, got {type(props['spouseName']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.node(label="Person", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def category(uuid=None, **props):
        """
        Find nodes with label Category matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Category", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def product(uuid=None, **props):
        """
        Find nodes with label Product matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Product", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def supplier(uuid=None, **props):
        """
        Find nodes with label Supplier matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Supplier", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def customer(uuid=None, **props):
        """
        Find nodes with label Customer matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Customer", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def order(uuid=None, **props):
        """
        Find nodes with label Order matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Order", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def ceremony(uuid=None, **props):
        """
        Find nodes with label Ceremony matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check established (expected object)
        if "established" in props and props["established"] is not None:
            if not isinstance(props["established"], object):
                try:
                    # Attempt to convert
                    props["established"] = object(props["established"])
                except:
                    raise TypeError(f"Property established must be of type object, got {type(props['established']).__name__}")
    
        # Type check locationLat (expected float)
        if "locationLat" in props and props["locationLat"] is not None:
            if not isinstance(props["locationLat"], float):
                try:
                    # Attempt to convert
                    props["locationLat"] = float(props["locationLat"])
                except:
                    raise TypeError(f"Property locationLat must be of type float, got {type(props['locationLat']).__name__}")
    
        # Type check viewership2022 (expected int)
        if "viewership2022" in props and props["viewership2022"] is not None:
            if not isinstance(props["viewership2022"], int):
                try:
                    # Attempt to convert
                    props["viewership2022"] = int(props["viewership2022"])
                except:
                    raise TypeError(f"Property viewership2022 must be of type int, got {type(props['viewership2022']).__name__}")
    
        # Type check viewership2023 (expected int)
        if "viewership2023" in props and props["viewership2023"] is not None:
            if not isinstance(props["viewership2023"], int):
                try:
                    # Attempt to convert
                    props["viewership2023"] = int(props["viewership2023"])
                except:
                    raise TypeError(f"Property viewership2023 must be of type int, got {type(props['viewership2023']).__name__}")
    
        # Type check name (expected str)
        if "name" in props and props["name"] is not None:
            if not isinstance(props["name"], str):
                try:
                    # Attempt to convert
                    props["name"] = str(props["name"])
                except:
                    raise TypeError(f"Property name must be of type str, got {type(props['name']).__name__}")
    
        # Type check typicalDurationHrs (expected float)
        if "typicalDurationHrs" in props and props["typicalDurationHrs"] is not None:
            if not isinstance(props["typicalDurationHrs"], float):
                try:
                    # Attempt to convert
                    props["typicalDurationHrs"] = float(props["typicalDurationHrs"])
                except:
                    raise TypeError(f"Property typicalDurationHrs must be of type float, got {type(props['typicalDurationHrs']).__name__}")
    
        # Type check viewership2020 (expected int)
        if "viewership2020" in props and props["viewership2020"] is not None:
            if not isinstance(props["viewership2020"], int):
                try:
                    # Attempt to convert
                    props["viewership2020"] = int(props["viewership2020"])
                except:
                    raise TypeError(f"Property viewership2020 must be of type int, got {type(props['viewership2020']).__name__}")
    
        # Type check viewership2021 (expected int)
        if "viewership2021" in props and props["viewership2021"] is not None:
            if not isinstance(props["viewership2021"], int):
                try:
                    # Attempt to convert
                    props["viewership2021"] = int(props["viewership2021"])
                except:
                    raise TypeError(f"Property viewership2021 must be of type int, got {type(props['viewership2021']).__name__}")
    
        # Type check nickname (expected str)
        if "nickname" in props and props["nickname"] is not None:
            if not isinstance(props["nickname"], str):
                try:
                    # Attempt to convert
                    props["nickname"] = str(props["nickname"])
                except:
                    raise TypeError(f"Property nickname must be of type str, got {type(props['nickname']).__name__}")
    
        # Type check locationHeight (expected int)
        if "locationHeight" in props and props["locationHeight"] is not None:
            if not isinstance(props["locationHeight"], int):
                try:
                    # Attempt to convert
                    props["locationHeight"] = int(props["locationHeight"])
                except:
                    raise TypeError(f"Property locationHeight must be of type int, got {type(props['locationHeight']).__name__}")
    
        # Type check categories (expected object)
        if "categories" in props and props["categories"] is not None:
            if not isinstance(props["categories"], object):
                try:
                    # Attempt to convert
                    props["categories"] = object(props["categories"])
                except:
                    raise TypeError(f"Property categories must be of type object, got {type(props['categories']).__name__}")
    
        # Type check isPrestigious (expected bool)
        if "isPrestigious" in props and props["isPrestigious"] is not None:
            if not isinstance(props["isPrestigious"], bool):
                try:
                    # Attempt to convert
                    props["isPrestigious"] = bool(props["isPrestigious"])
                except:
                    raise TypeError(f"Property isPrestigious must be of type bool, got {type(props['isPrestigious']).__name__}")
    
        # Type check nextCeremony (expected object)
        if "nextCeremony" in props and props["nextCeremony"] is not None:
            if not isinstance(props["nextCeremony"], object):
                try:
                    # Attempt to convert
                    props["nextCeremony"] = object(props["nextCeremony"])
                except:
                    raise TypeError(f"Property nextCeremony must be of type object, got {type(props['nextCeremony']).__name__}")
    
        # Type check locationLong (expected float)
        if "locationLong" in props and props["locationLong"] is not None:
            if not isinstance(props["locationLong"], float):
                try:
                    # Attempt to convert
                    props["locationLong"] = float(props["locationLong"])
                except:
                    raise TypeError(f"Property locationLong must be of type float, got {type(props['locationLong']).__name__}")
    
        # Type check ceremonyTime (expected object)
        if "ceremonyTime" in props and props["ceremonyTime"] is not None:
            if not isinstance(props["ceremonyTime"], object):
                try:
                    # Attempt to convert
                    props["ceremonyTime"] = object(props["ceremonyTime"])
                except:
                    raise TypeError(f"Property ceremonyTime must be of type object, got {type(props['ceremonyTime']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.node(label="Ceremony", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def studio(uuid=None, **props):
        """
        Find nodes with label Studio matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check studioLotsLong (expected object)
        if "studioLotsLong" in props and props["studioLotsLong"] is not None:
            if not isinstance(props["studioLotsLong"], object):
                try:
                    # Attempt to convert
                    props["studioLotsLong"] = object(props["studioLotsLong"])
                except:
                    raise TypeError(f"Property studioLotsLong must be of type object, got {type(props['studioLotsLong']).__name__}")
    
        # Type check studioLotsLat (expected object)
        if "studioLotsLat" in props and props["studioLotsLat"] is not None:
            if not isinstance(props["studioLotsLat"], object):
                try:
                    # Attempt to convert
                    props["studioLotsLat"] = object(props["studioLotsLat"])
                except:
                    raise TypeError(f"Property studioLotsLat must be of type object, got {type(props['studioLotsLat']).__name__}")
    
        # Type check name (expected str)
        if "name" in props and props["name"] is not None:
            if not isinstance(props["name"], str):
                try:
                    # Attempt to convert
                    props["name"] = str(props["name"])
                except:
                    raise TypeError(f"Property name must be of type str, got {type(props['name']).__name__}")
    
        # Type check distributionMarkets (expected object)
        if "distributionMarkets" in props and props["distributionMarkets"] is not None:
            if not isinstance(props["distributionMarkets"], object):
                try:
                    # Attempt to convert
                    props["distributionMarkets"] = object(props["distributionMarkets"])
                except:
                    raise TypeError(f"Property distributionMarkets must be of type object, got {type(props['distributionMarkets']).__name__}")
    
        # Type check founded (expected object)
        if "founded" in props and props["founded"] is not None:
            if not isinstance(props["founded"], object):
                try:
                    # Attempt to convert
                    props["founded"] = object(props["founded"])
                except:
                    raise TypeError(f"Property founded must be of type object, got {type(props['founded']).__name__}")
    
        # Type check yearlyRevenue2020 (expected int)
        if "yearlyRevenue2020" in props and props["yearlyRevenue2020"] is not None:
            if not isinstance(props["yearlyRevenue2020"], int):
                try:
                    # Attempt to convert
                    props["yearlyRevenue2020"] = int(props["yearlyRevenue2020"])
                except:
                    raise TypeError(f"Property yearlyRevenue2020 must be of type int, got {type(props['yearlyRevenue2020']).__name__}")
    
        # Type check subsidiaries (expected object)
        if "subsidiaries" in props and props["subsidiaries"] is not None:
            if not isinstance(props["subsidiaries"], object):
                try:
                    # Attempt to convert
                    props["subsidiaries"] = object(props["subsidiaries"])
                except:
                    raise TypeError(f"Property subsidiaries must be of type object, got {type(props['subsidiaries']).__name__}")
    
        # Type check digitalStreamingDate (expected object)
        if "digitalStreamingDate" in props and props["digitalStreamingDate"] is not None:
            if not isinstance(props["digitalStreamingDate"], object):
                try:
                    # Attempt to convert
                    props["digitalStreamingDate"] = object(props["digitalStreamingDate"])
                except:
                    raise TypeError(f"Property digitalStreamingDate must be of type object, got {type(props['digitalStreamingDate']).__name__}")
    
        # Type check yearlyRevenue2021 (expected int)
        if "yearlyRevenue2021" in props and props["yearlyRevenue2021"] is not None:
            if not isinstance(props["yearlyRevenue2021"], int):
                try:
                    # Attempt to convert
                    props["yearlyRevenue2021"] = int(props["yearlyRevenue2021"])
                except:
                    raise TypeError(f"Property yearlyRevenue2021 must be of type int, got {type(props['yearlyRevenue2021']).__name__}")
    
        # Type check headquartersLat (expected float)
        if "headquartersLat" in props and props["headquartersLat"] is not None:
            if not isinstance(props["headquartersLat"], float):
                try:
                    # Attempt to convert
                    props["headquartersLat"] = float(props["headquartersLat"])
                except:
                    raise TypeError(f"Property headquartersLat must be of type float, got {type(props['headquartersLat']).__name__}")
    
        # Type check marketShare (expected float)
        if "marketShare" in props and props["marketShare"] is not None:
            if not isinstance(props["marketShare"], float):
                try:
                    # Attempt to convert
                    props["marketShare"] = float(props["marketShare"])
                except:
                    raise TypeError(f"Property marketShare must be of type float, got {type(props['marketShare']).__name__}")
    
        # Type check yearlyRevenue2022 (expected int)
        if "yearlyRevenue2022" in props and props["yearlyRevenue2022"] is not None:
            if not isinstance(props["yearlyRevenue2022"], int):
                try:
                    # Attempt to convert
                    props["yearlyRevenue2022"] = int(props["yearlyRevenue2022"])
                except:
                    raise TypeError(f"Property yearlyRevenue2022 must be of type int, got {type(props['yearlyRevenue2022']).__name__}")
    
        # Type check headquartersLong (expected float)
        if "headquartersLong" in props and props["headquartersLong"] is not None:
            if not isinstance(props["headquartersLong"], float):
                try:
                    # Attempt to convert
                    props["headquartersLong"] = float(props["headquartersLong"])
                except:
                    raise TypeError(f"Property headquartersLong must be of type float, got {type(props['headquartersLong']).__name__}")
    
        # Type check isPublic (expected bool)
        if "isPublic" in props and props["isPublic"] is not None:
            if not isinstance(props["isPublic"], bool):
                try:
                    # Attempt to convert
                    props["isPublic"] = bool(props["isPublic"])
                except:
                    raise TypeError(f"Property isPublic must be of type bool, got {type(props['isPublic']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.node(label="Studio", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def production(uuid=None, **props):
        """
        Find nodes with label Production matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check scheduleTimes (expected object)
        if "scheduleTimes" in props and props["scheduleTimes"] is not None:
            if not isinstance(props["scheduleTimes"], object):
                try:
                    # Attempt to convert
                    props["scheduleTimes"] = object(props["scheduleTimes"])
                except:
                    raise TypeError(f"Property scheduleTimes must be of type object, got {type(props['scheduleTimes']).__name__}")
    
        # Type check scheduleDurations (expected object)
        if "scheduleDurations" in props and props["scheduleDurations"] is not None:
            if not isinstance(props["scheduleDurations"], object):
                try:
                    # Attempt to convert
                    props["scheduleDurations"] = object(props["scheduleDurations"])
                except:
                    raise TypeError(f"Property scheduleDurations must be of type object, got {type(props['scheduleDurations']).__name__}")
    
        # Type check weatherPoor (expected int)
        if "weatherPoor" in props and props["weatherPoor"] is not None:
            if not isinstance(props["weatherPoor"], int):
                try:
                    # Attempt to convert
                    props["weatherPoor"] = int(props["weatherPoor"])
                except:
                    raise TypeError(f"Property weatherPoor must be of type int, got {type(props['weatherPoor']).__name__}")
    
        # Type check startDate (expected object)
        if "startDate" in props and props["startDate"] is not None:
            if not isinstance(props["startDate"], object):
                try:
                    # Attempt to convert
                    props["startDate"] = object(props["startDate"])
                except:
                    raise TypeError(f"Property startDate must be of type object, got {type(props['startDate']).__name__}")
    
        # Type check isCompleted (expected bool)
        if "isCompleted" in props and props["isCompleted"] is not None:
            if not isinstance(props["isCompleted"], bool):
                try:
                    # Attempt to convert
                    props["isCompleted"] = bool(props["isCompleted"])
                except:
                    raise TypeError(f"Property isCompleted must be of type bool, got {type(props['isCompleted']).__name__}")
    
        # Type check scheduleActivities (expected object)
        if "scheduleActivities" in props and props["scheduleActivities"] is not None:
            if not isinstance(props["scheduleActivities"], object):
                try:
                    # Attempt to convert
                    props["scheduleActivities"] = object(props["scheduleActivities"])
                except:
                    raise TypeError(f"Property scheduleActivities must be of type object, got {type(props['scheduleActivities']).__name__}")
    
        # Type check budgetEquipment (expected int)
        if "budgetEquipment" in props and props["budgetEquipment"] is not None:
            if not isinstance(props["budgetEquipment"], int):
                try:
                    # Attempt to convert
                    props["budgetEquipment"] = int(props["budgetEquipment"])
                except:
                    raise TypeError(f"Property budgetEquipment must be of type int, got {type(props['budgetEquipment']).__name__}")
    
        # Type check weatherGood (expected int)
        if "weatherGood" in props and props["weatherGood"] is not None:
            if not isinstance(props["weatherGood"], int):
                try:
                    # Attempt to convert
                    props["weatherGood"] = int(props["weatherGood"])
                except:
                    raise TypeError(f"Property weatherGood must be of type int, got {type(props['weatherGood']).__name__}")
    
        # Type check startTime (expected object)
        if "startTime" in props and props["startTime"] is not None:
            if not isinstance(props["startTime"], object):
                try:
                    # Attempt to convert
                    props["startTime"] = object(props["startTime"])
                except:
                    raise TypeError(f"Property startTime must be of type object, got {type(props['startTime']).__name__}")
    
        # Type check budgetPersonnel (expected int)
        if "budgetPersonnel" in props and props["budgetPersonnel"] is not None:
            if not isinstance(props["budgetPersonnel"], int):
                try:
                    # Attempt to convert
                    props["budgetPersonnel"] = int(props["budgetPersonnel"])
                except:
                    raise TypeError(f"Property budgetPersonnel must be of type int, got {type(props['budgetPersonnel']).__name__}")
    
        # Type check durationDays (expected int)
        if "durationDays" in props and props["durationDays"] is not None:
            if not isinstance(props["durationDays"], int):
                try:
                    # Attempt to convert
                    props["durationDays"] = int(props["durationDays"])
                except:
                    raise TypeError(f"Property durationDays must be of type int, got {type(props['durationDays']).__name__}")
    
        # Type check budgetVFX (expected int)
        if "budgetVFX" in props and props["budgetVFX"] is not None:
            if not isinstance(props["budgetVFX"], int):
                try:
                    # Attempt to convert
                    props["budgetVFX"] = int(props["budgetVFX"])
                except:
                    raise TypeError(f"Property budgetVFX must be of type int, got {type(props['budgetVFX']).__name__}")
    
        # Type check weatherAcceptable (expected int)
        if "weatherAcceptable" in props and props["weatherAcceptable"] is not None:
            if not isinstance(props["weatherAcceptable"], int):
                try:
                    # Attempt to convert
                    props["weatherAcceptable"] = int(props["weatherAcceptable"])
                except:
                    raise TypeError(f"Property weatherAcceptable must be of type int, got {type(props['weatherAcceptable']).__name__}")
    
        # Type check durationMonths (expected int)
        if "durationMonths" in props and props["durationMonths"] is not None:
            if not isinstance(props["durationMonths"], int):
                try:
                    # Attempt to convert
                    props["durationMonths"] = int(props["durationMonths"])
                except:
                    raise TypeError(f"Property durationMonths must be of type int, got {type(props['durationMonths']).__name__}")
    
        # Type check budgetOther (expected int)
        if "budgetOther" in props and props["budgetOther"] is not None:
            if not isinstance(props["budgetOther"], int):
                try:
                    # Attempt to convert
                    props["budgetOther"] = int(props["budgetOther"])
                except:
                    raise TypeError(f"Property budgetOther must be of type int, got {type(props['budgetOther']).__name__}")
    
        # Type check endDate (expected object)
        if "endDate" in props and props["endDate"] is not None:
            if not isinstance(props["endDate"], object):
                try:
                    # Attempt to convert
                    props["endDate"] = object(props["endDate"])
                except:
                    raise TypeError(f"Property endDate must be of type object, got {type(props['endDate']).__name__}")
    
        # Type check budgetLocations (expected int)
        if "budgetLocations" in props and props["budgetLocations"] is not None:
            if not isinstance(props["budgetLocations"], int):
                try:
                    # Attempt to convert
                    props["budgetLocations"] = int(props["budgetLocations"])
                except:
                    raise TypeError(f"Property budgetLocations must be of type int, got {type(props['budgetLocations']).__name__}")
    
        # Type check name (expected str)
        if "name" in props and props["name"] is not None:
            if not isinstance(props["name"], str):
                try:
                    # Attempt to convert
                    props["name"] = str(props["name"])
                except:
                    raise TypeError(f"Property name must be of type str, got {type(props['name']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.node(label="Production", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def review(uuid=None, **props):
        """
        Find nodes with label Review matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check readerLocationsLong (expected object)
        if "readerLocationsLong" in props and props["readerLocationsLong"] is not None:
            if not isinstance(props["readerLocationsLong"], object):
                try:
                    # Attempt to convert
                    props["readerLocationsLong"] = object(props["readerLocationsLong"])
                except:
                    raise TypeError(f"Property readerLocationsLong must be of type object, got {type(props['readerLocationsLong']).__name__}")
    
        # Type check readerLocationsLat (expected object)
        if "readerLocationsLat" in props and props["readerLocationsLat"] is not None:
            if not isinstance(props["readerLocationsLat"], object):
                try:
                    # Attempt to convert
                    props["readerLocationsLat"] = object(props["readerLocationsLat"])
                except:
                    raise TypeError(f"Property readerLocationsLat must be of type object, got {type(props['readerLocationsLat']).__name__}")
    
        # Type check title (expected str)
        if "title" in props and props["title"] is not None:
            if not isinstance(props["title"], str):
                try:
                    # Attempt to convert
                    props["title"] = str(props["title"])
                except:
                    raise TypeError(f"Property title must be of type str, got {type(props['title']).__name__}")
    
        # Type check aspectDirection (expected float)
        if "aspectDirection" in props and props["aspectDirection"] is not None:
            if not isinstance(props["aspectDirection"], float):
                try:
                    # Attempt to convert
                    props["aspectDirection"] = float(props["aspectDirection"])
                except:
                    raise TypeError(f"Property aspectDirection must be of type float, got {type(props['aspectDirection']).__name__}")
    
        # Type check commentTimestamps (expected list)
        if "commentTimestamps" in props and props["commentTimestamps"] is not None:
            if not isinstance(props["commentTimestamps"], list):
                try:
                    # Attempt to convert
                    props["commentTimestamps"] = list(props["commentTimestamps"])
                except:
                    raise TypeError(f"Property commentTimestamps must be of type list, got {type(props['commentTimestamps']).__name__}")
    
        # Type check keywords (expected object)
        if "keywords" in props and props["keywords"] is not None:
            if not isinstance(props["keywords"], object):
                try:
                    # Attempt to convert
                    props["keywords"] = object(props["keywords"])
                except:
                    raise TypeError(f"Property keywords must be of type object, got {type(props['keywords']).__name__}")
    
        # Type check stars (expected float)
        if "stars" in props and props["stars"] is not None:
            if not isinstance(props["stars"], float):
                try:
                    # Attempt to convert
                    props["stars"] = float(props["stars"])
                except:
                    raise TypeError(f"Property stars must be of type float, got {type(props['stars']).__name__}")
    
        # Type check time (expected object)
        if "time" in props and props["time"] is not None:
            if not isinstance(props["time"], object):
                try:
                    # Attempt to convert
                    props["time"] = object(props["time"])
                except:
                    raise TypeError(f"Property time must be of type object, got {type(props['time']).__name__}")
    
        # Type check aspectMusic (expected float)
        if "aspectMusic" in props and props["aspectMusic"] is not None:
            if not isinstance(props["aspectMusic"], float):
                try:
                    # Attempt to convert
                    props["aspectMusic"] = float(props["aspectMusic"])
                except:
                    raise TypeError(f"Property aspectMusic must be of type float, got {type(props['aspectMusic']).__name__}")
    
        # Type check aspectPlot (expected float)
        if "aspectPlot" in props and props["aspectPlot"] is not None:
            if not isinstance(props["aspectPlot"], float):
                try:
                    # Attempt to convert
                    props["aspectPlot"] = float(props["aspectPlot"])
                except:
                    raise TypeError(f"Property aspectPlot must be of type float, got {type(props['aspectPlot']).__name__}")
    
        # Type check aspectVisuals (expected float)
        if "aspectVisuals" in props and props["aspectVisuals"] is not None:
            if not isinstance(props["aspectVisuals"], float):
                try:
                    # Attempt to convert
                    props["aspectVisuals"] = float(props["aspectVisuals"])
                except:
                    raise TypeError(f"Property aspectVisuals must be of type float, got {type(props['aspectVisuals']).__name__}")
    
        # Type check isVerified (expected bool)
        if "isVerified" in props and props["isVerified"] is not None:
            if not isinstance(props["isVerified"], bool):
                try:
                    # Attempt to convert
                    props["isVerified"] = bool(props["isVerified"])
                except:
                    raise TypeError(f"Property isVerified must be of type bool, got {type(props['isVerified']).__name__}")
    
        # Type check reviewText (expected str)
        if "reviewText" in props and props["reviewText"] is not None:
            if not isinstance(props["reviewText"], str):
                try:
                    # Attempt to convert
                    props["reviewText"] = str(props["reviewText"])
                except:
                    raise TypeError(f"Property reviewText must be of type str, got {type(props['reviewText']).__name__}")
    
        # Type check date (expected object)
        if "date" in props and props["date"] is not None:
            if not isinstance(props["date"], object):
                try:
                    # Attempt to convert
                    props["date"] = object(props["date"])
                except:
                    raise TypeError(f"Property date must be of type object, got {type(props['date']).__name__}")
    
        # Type check aspectActing (expected float)
        if "aspectActing" in props and props["aspectActing"] is not None:
            if not isinstance(props["aspectActing"], float):
                try:
                    # Attempt to convert
                    props["aspectActing"] = float(props["aspectActing"])
                except:
                    raise TypeError(f"Property aspectActing must be of type float, got {type(props['aspectActing']).__name__}")
    
        # Type check upvotes (expected int)
        if "upvotes" in props and props["upvotes"] is not None:
            if not isinstance(props["upvotes"], int):
                try:
                    # Attempt to convert
                    props["upvotes"] = int(props["upvotes"])
                except:
                    raise TypeError(f"Property upvotes must be of type int, got {type(props['upvotes']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.node(label="Review", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def generatedbyclaudeai(uuid=None, **props):
        """
        Find nodes with label GeneratedByClaudeAI matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check boxOfficeNA (expected int)
        if "boxOfficeNA" in props and props["boxOfficeNA"] is not None:
            if not isinstance(props["boxOfficeNA"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeNA"] = int(props["boxOfficeNA"])
                except:
                    raise TypeError(f"Property boxOfficeNA must be of type int, got {type(props['boxOfficeNA']).__name__}")
    
        # Type check boxOfficeEurope (expected int)
        if "boxOfficeEurope" in props and props["boxOfficeEurope"] is not None:
            if not isinstance(props["boxOfficeEurope"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeEurope"] = int(props["boxOfficeEurope"])
                except:
                    raise TypeError(f"Property boxOfficeEurope must be of type int, got {type(props['boxOfficeEurope']).__name__}")
    
        # Type check boxOfficeAsia (expected int)
        if "boxOfficeAsia" in props and props["boxOfficeAsia"] is not None:
            if not isinstance(props["boxOfficeAsia"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeAsia"] = int(props["boxOfficeAsia"])
                except:
                    raise TypeError(f"Property boxOfficeAsia must be of type int, got {type(props['boxOfficeAsia']).__name__}")
    
        # Type check boxOfficeOther (expected int)
        if "boxOfficeOther" in props and props["boxOfficeOther"] is not None:
            if not isinstance(props["boxOfficeOther"], int):
                try:
                    # Attempt to convert
                    props["boxOfficeOther"] = int(props["boxOfficeOther"])
                except:
                    raise TypeError(f"Property boxOfficeOther must be of type int, got {type(props['boxOfficeOther']).__name__}")
    
        # Type check filmingLocationLong (expected object)
        if "filmingLocationLong" in props and props["filmingLocationLong"] is not None:
            if not isinstance(props["filmingLocationLong"], object):
                try:
                    # Attempt to convert
                    props["filmingLocationLong"] = object(props["filmingLocationLong"])
                except:
                    raise TypeError(f"Property filmingLocationLong must be of type object, got {type(props['filmingLocationLong']).__name__}")
    
        # Type check filmingLocationLat (expected object)
        if "filmingLocationLat" in props and props["filmingLocationLat"] is not None:
            if not isinstance(props["filmingLocationLat"], object):
                try:
                    # Attempt to convert
                    props["filmingLocationLat"] = object(props["filmingLocationLat"])
                except:
                    raise TypeError(f"Property filmingLocationLat must be of type object, got {type(props['filmingLocationLat']).__name__}")
    
        # Type check budget (expected int)
        if "budget" in props and props["budget"] is not None:
            if not isinstance(props["budget"], int):
                try:
                    # Attempt to convert
                    props["budget"] = int(props["budget"])
                except:
                    raise TypeError(f"Property budget must be of type int, got {type(props['budget']).__name__}")
    
        # Type check ratings (expected object)
        if "ratings" in props and props["ratings"] is not None:
            if not isinstance(props["ratings"], object):
                try:
                    # Attempt to convert
                    props["ratings"] = object(props["ratings"])
                except:
                    raise TypeError(f"Property ratings must be of type object, got {type(props['ratings']).__name__}")
    
        # Type check genres (expected object)
        if "genres" in props and props["genres"] is not None:
            if not isinstance(props["genres"], object):
                try:
                    # Attempt to convert
                    props["genres"] = object(props["genres"])
                except:
                    raise TypeError(f"Property genres must be of type object, got {type(props['genres']).__name__}")
    
        # Type check certifications (expected object)
        if "certifications" in props and props["certifications"] is not None:
            if not isinstance(props["certifications"], object):
                try:
                    # Attempt to convert
                    props["certifications"] = object(props["certifications"])
                except:
                    raise TypeError(f"Property certifications must be of type object, got {type(props['certifications']).__name__}")
    
        # Type check tagline (expected str)
        if "tagline" in props and props["tagline"] is not None:
            if not isinstance(props["tagline"], str):
                try:
                    # Attempt to convert
                    props["tagline"] = str(props["tagline"])
                except:
                    raise TypeError(f"Property tagline must be of type str, got {type(props['tagline']).__name__}")
    
        # Type check digitalRelease (expected object)
        if "digitalRelease" in props and props["digitalRelease"] is not None:
            if not isinstance(props["digitalRelease"], object):
                try:
                    # Attempt to convert
                    props["digitalRelease"] = object(props["digitalRelease"])
                except:
                    raise TypeError(f"Property digitalRelease must be of type object, got {type(props['digitalRelease']).__name__}")
    
        # Type check released (expected int)
        if "released" in props and props["released"] is not None:
            if not isinstance(props["released"], int):
                try:
                    # Attempt to convert
                    props["released"] = int(props["released"])
                except:
                    raise TypeError(f"Property released must be of type int, got {type(props['released']).__name__}")
    
        # Type check rating_avg (expected float)
        if "rating_avg" in props and props["rating_avg"] is not None:
            if not isinstance(props["rating_avg"], float):
                try:
                    # Attempt to convert
                    props["rating_avg"] = float(props["rating_avg"])
                except:
                    raise TypeError(f"Property rating_avg must be of type float, got {type(props['rating_avg']).__name__}")
    
        # Type check title (expected str)
        if "title" in props and props["title"] is not None:
            if not isinstance(props["title"], str):
                try:
                    # Attempt to convert
                    props["title"] = str(props["title"])
                except:
                    raise TypeError(f"Property title must be of type str, got {type(props['title']).__name__}")
    
        # Type check runtime_minutes (expected int)
        if "runtime_minutes" in props and props["runtime_minutes"] is not None:
            if not isinstance(props["runtime_minutes"], int):
                try:
                    # Attempt to convert
                    props["runtime_minutes"] = int(props["runtime_minutes"])
                except:
                    raise TypeError(f"Property runtime_minutes must be of type int, got {type(props['runtime_minutes']).__name__}")
    
        # Type check revenue (expected int)
        if "revenue" in props and props["revenue"] is not None:
            if not isinstance(props["revenue"], int):
                try:
                    # Attempt to convert
                    props["revenue"] = int(props["revenue"])
                except:
                    raise TypeError(f"Property revenue must be of type int, got {type(props['revenue']).__name__}")
    
        # Type check releaseDate (expected object)
        if "releaseDate" in props and props["releaseDate"] is not None:
            if not isinstance(props["releaseDate"], object):
                try:
                    # Attempt to convert
                    props["releaseDate"] = object(props["releaseDate"])
                except:
                    raise TypeError(f"Property releaseDate must be of type object, got {type(props['releaseDate']).__name__}")
    
        # Type check isOscarWinner (expected bool)
        if "isOscarWinner" in props and props["isOscarWinner"] is not None:
            if not isinstance(props["isOscarWinner"], bool):
                try:
                    # Attempt to convert
                    props["isOscarWinner"] = bool(props["isOscarWinner"])
                except:
                    raise TypeError(f"Property isOscarWinner must be of type bool, got {type(props['isOscarWinner']).__name__}")
    
        # Type check residenceLat (expected float)
        if "residenceLat" in props and props["residenceLat"] is not None:
            if not isinstance(props["residenceLat"], float):
                try:
                    # Attempt to convert
                    props["residenceLat"] = float(props["residenceLat"])
                except:
                    raise TypeError(f"Property residenceLat must be of type float, got {type(props['residenceLat']).__name__}")
    
        # Type check activeYears (expected object)
        if "activeYears" in props and props["activeYears"] is not None:
            if not isinstance(props["activeYears"], object):
                try:
                    # Attempt to convert
                    props["activeYears"] = object(props["activeYears"])
                except:
                    raise TypeError(f"Property activeYears must be of type object, got {type(props['activeYears']).__name__}")
    
        # Type check typicalFilmLengthHrs (expected float)
        if "typicalFilmLengthHrs" in props and props["typicalFilmLengthHrs"] is not None:
            if not isinstance(props["typicalFilmLengthHrs"], float):
                try:
                    # Attempt to convert
                    props["typicalFilmLengthHrs"] = float(props["typicalFilmLengthHrs"])
                except:
                    raise TypeError(f"Property typicalFilmLengthHrs must be of type float, got {type(props['typicalFilmLengthHrs']).__name__}")
    
        # Type check oscarNominations (expected int)
        if "oscarNominations" in props and props["oscarNominations"] is not None:
            if not isinstance(props["oscarNominations"], int):
                try:
                    # Attempt to convert
                    props["oscarNominations"] = int(props["oscarNominations"])
                except:
                    raise TypeError(f"Property oscarNominations must be of type int, got {type(props['oscarNominations']).__name__}")
    
        # Type check nationality (expected str)
        if "nationality" in props and props["nationality"] is not None:
            if not isinstance(props["nationality"], str):
                try:
                    # Attempt to convert
                    props["nationality"] = str(props["nationality"])
                except:
                    raise TypeError(f"Property nationality must be of type str, got {type(props['nationality']).__name__}")
    
        # Type check isActive (expected bool)
        if "isActive" in props and props["isActive"] is not None:
            if not isinstance(props["isActive"], bool):
                try:
                    # Attempt to convert
                    props["isActive"] = bool(props["isActive"])
                except:
                    raise TypeError(f"Property isActive must be of type bool, got {type(props['isActive']).__name__}")
    
        # Type check lastDirected (expected object)
        if "lastDirected" in props and props["lastDirected"] is not None:
            if not isinstance(props["lastDirected"], object):
                try:
                    # Attempt to convert
                    props["lastDirected"] = object(props["lastDirected"])
                except:
                    raise TypeError(f"Property lastDirected must be of type object, got {type(props['lastDirected']).__name__}")
    
        # Type check birthdate (expected object)
        if "birthdate" in props and props["birthdate"] is not None:
            if not isinstance(props["birthdate"], object):
                try:
                    # Attempt to convert
                    props["birthdate"] = object(props["birthdate"])
                except:
                    raise TypeError(f"Property birthdate must be of type object, got {type(props['birthdate']).__name__}")
    
        # Type check born (expected int)
        if "born" in props and props["born"] is not None:
            if not isinstance(props["born"], int):
                try:
                    # Attempt to convert
                    props["born"] = int(props["born"])
                except:
                    raise TypeError(f"Property born must be of type int, got {type(props['born']).__name__}")
    
        # Type check name (expected str)
        if "name" in props and props["name"] is not None:
            if not isinstance(props["name"], str):
                try:
                    # Attempt to convert
                    props["name"] = str(props["name"])
                except:
                    raise TypeError(f"Property name must be of type str, got {type(props['name']).__name__}")
    
        # Type check residenceLong (expected float)
        if "residenceLong" in props and props["residenceLong"] is not None:
            if not isinstance(props["residenceLong"], float):
                try:
                    # Attempt to convert
                    props["residenceLong"] = float(props["residenceLong"])
                except:
                    raise TypeError(f"Property residenceLong must be of type float, got {type(props['residenceLong']).__name__}")
    
        # Type check preferredAspectRatios (expected object)
        if "preferredAspectRatios" in props and props["preferredAspectRatios"] is not None:
            if not isinstance(props["preferredAspectRatios"], object):
                try:
                    # Attempt to convert
                    props["preferredAspectRatios"] = object(props["preferredAspectRatios"])
                except:
                    raise TypeError(f"Property preferredAspectRatios must be of type object, got {type(props['preferredAspectRatios']).__name__}")
    
        # Type check collaborators (expected object)
        if "collaborators" in props and props["collaborators"] is not None:
            if not isinstance(props["collaborators"], object):
                try:
                    # Attempt to convert
                    props["collaborators"] = object(props["collaborators"])
                except:
                    raise TypeError(f"Property collaborators must be of type object, got {type(props['collaborators']).__name__}")
    
        # Type check filmCountCrime (expected int)
        if "filmCountCrime" in props and props["filmCountCrime"] is not None:
            if not isinstance(props["filmCountCrime"], int):
                try:
                    # Attempt to convert
                    props["filmCountCrime"] = int(props["filmCountCrime"])
                except:
                    raise TypeError(f"Property filmCountCrime must be of type int, got {type(props['filmCountCrime']).__name__}")
    
        # Type check filmCountRomance (expected int)
        if "filmCountRomance" in props and props["filmCountRomance"] is not None:
            if not isinstance(props["filmCountRomance"], int):
                try:
                    # Attempt to convert
                    props["filmCountRomance"] = int(props["filmCountRomance"])
                except:
                    raise TypeError(f"Property filmCountRomance must be of type int, got {type(props['filmCountRomance']).__name__}")
    
        # Type check filmCountWestern (expected int)
        if "filmCountWestern" in props and props["filmCountWestern"] is not None:
            if not isinstance(props["filmCountWestern"], int):
                try:
                    # Attempt to convert
                    props["filmCountWestern"] = int(props["filmCountWestern"])
                except:
                    raise TypeError(f"Property filmCountWestern must be of type int, got {type(props['filmCountWestern']).__name__}")
    
        # Type check residenceLongs (expected object)
        if "residenceLongs" in props and props["residenceLongs"] is not None:
            if not isinstance(props["residenceLongs"], object):
                try:
                    # Attempt to convert
                    props["residenceLongs"] = object(props["residenceLongs"])
                except:
                    raise TypeError(f"Property residenceLongs must be of type object, got {type(props['residenceLongs']).__name__}")
    
        # Type check filmCountThriller (expected int)
        if "filmCountThriller" in props and props["filmCountThriller"] is not None:
            if not isinstance(props["filmCountThriller"], int):
                try:
                    # Attempt to convert
                    props["filmCountThriller"] = int(props["filmCountThriller"])
                except:
                    raise TypeError(f"Property filmCountThriller must be of type int, got {type(props['filmCountThriller']).__name__}")
    
        # Type check residenceLats (expected object)
        if "residenceLats" in props and props["residenceLats"] is not None:
            if not isinstance(props["residenceLats"], object):
                try:
                    # Attempt to convert
                    props["residenceLats"] = object(props["residenceLats"])
                except:
                    raise TypeError(f"Property residenceLats must be of type object, got {type(props['residenceLats']).__name__}")
    
        # Type check filmCountDrama (expected int)
        if "filmCountDrama" in props and props["filmCountDrama"] is not None:
            if not isinstance(props["filmCountDrama"], int):
                try:
                    # Attempt to convert
                    props["filmCountDrama"] = int(props["filmCountDrama"])
                except:
                    raise TypeError(f"Property filmCountDrama must be of type int, got {type(props['filmCountDrama']).__name__}")
    
        # Type check oscarWins (expected int)
        if "oscarWins" in props and props["oscarWins"] is not None:
            if not isinstance(props["oscarWins"], int):
                try:
                    # Attempt to convert
                    props["oscarWins"] = int(props["oscarWins"])
                except:
                    raise TypeError(f"Property oscarWins must be of type int, got {type(props['oscarWins']).__name__}")
    
        # Type check netWorth (expected int)
        if "netWorth" in props and props["netWorth"] is not None:
            if not isinstance(props["netWorth"], int):
                try:
                    # Attempt to convert
                    props["netWorth"] = int(props["netWorth"])
                except:
                    raise TypeError(f"Property netWorth must be of type int, got {type(props['netWorth']).__name__}")
    
        # Type check typicalShootScheduleMonths (expected int)
        if "typicalShootScheduleMonths" in props and props["typicalShootScheduleMonths"] is not None:
            if not isinstance(props["typicalShootScheduleMonths"], int):
                try:
                    # Attempt to convert
                    props["typicalShootScheduleMonths"] = int(props["typicalShootScheduleMonths"])
                except:
                    raise TypeError(f"Property typicalShootScheduleMonths must be of type int, got {type(props['typicalShootScheduleMonths']).__name__}")
    
        # Type check languages (expected object)
        if "languages" in props and props["languages"] is not None:
            if not isinstance(props["languages"], object):
                try:
                    # Attempt to convert
                    props["languages"] = object(props["languages"])
                except:
                    raise TypeError(f"Property languages must be of type object, got {type(props['languages']).__name__}")
    
        # Type check actingRangeScore (expected float)
        if "actingRangeScore" in props and props["actingRangeScore"] is not None:
            if not isinstance(props["actingRangeScore"], float):
                try:
                    # Attempt to convert
                    props["actingRangeScore"] = float(props["actingRangeScore"])
                except:
                    raise TypeError(f"Property actingRangeScore must be of type float, got {type(props['actingRangeScore']).__name__}")
    
        # Type check heightInMeters (expected float)
        if "heightInMeters" in props and props["heightInMeters"] is not None:
            if not isinstance(props["heightInMeters"], float):
                try:
                    # Attempt to convert
                    props["heightInMeters"] = float(props["heightInMeters"])
                except:
                    raise TypeError(f"Property heightInMeters must be of type float, got {type(props['heightInMeters']).__name__}")
    
        # Type check firstOscarWin (expected object)
        if "firstOscarWin" in props and props["firstOscarWin"] is not None:
            if not isinstance(props["firstOscarWin"], object):
                try:
                    # Attempt to convert
                    props["firstOscarWin"] = object(props["firstOscarWin"])
                except:
                    raise TypeError(f"Property firstOscarWin must be of type object, got {type(props['firstOscarWin']).__name__}")
    
        # Type check filmography_roles (expected object)
        if "filmography_roles" in props and props["filmography_roles"] is not None:
            if not isinstance(props["filmography_roles"], object):
                try:
                    # Attempt to convert
                    props["filmography_roles"] = object(props["filmography_roles"])
                except:
                    raise TypeError(f"Property filmography_roles must be of type object, got {type(props['filmography_roles']).__name__}")
    
        # Type check filmography_years (expected object)
        if "filmography_years" in props and props["filmography_years"] is not None:
            if not isinstance(props["filmography_years"], object):
                try:
                    # Attempt to convert
                    props["filmography_years"] = object(props["filmography_years"])
                except:
                    raise TypeError(f"Property filmography_years must be of type object, got {type(props['filmography_years']).__name__}")
    
        # Type check filmography_titles (expected object)
        if "filmography_titles" in props and props["filmography_titles"] is not None:
            if not isinstance(props["filmography_titles"], object):
                try:
                    # Attempt to convert
                    props["filmography_titles"] = object(props["filmography_titles"])
                except:
                    raise TypeError(f"Property filmography_titles must be of type object, got {type(props['filmography_titles']).__name__}")
    
        # Type check typicalDay (expected object)
        if "typicalDay" in props and props["typicalDay"] is not None:
            if not isinstance(props["typicalDay"], object):
                try:
                    # Attempt to convert
                    props["typicalDay"] = object(props["typicalDay"])
                except:
                    raise TypeError(f"Property typicalDay must be of type object, got {type(props['typicalDay']).__name__}")
    
        # Type check oscarCeremony (expected object)
        if "oscarCeremony" in props and props["oscarCeremony"] is not None:
            if not isinstance(props["oscarCeremony"], object):
                try:
                    # Attempt to convert
                    props["oscarCeremony"] = object(props["oscarCeremony"])
                except:
                    raise TypeError(f"Property oscarCeremony must be of type object, got {type(props['oscarCeremony']).__name__}")
    
        # Type check firstFilm (expected object)
        if "firstFilm" in props and props["firstFilm"] is not None:
            if not isinstance(props["firstFilm"], object):
                try:
                    # Attempt to convert
                    props["firstFilm"] = object(props["firstFilm"])
                except:
                    raise TypeError(f"Property firstFilm must be of type object, got {type(props['firstFilm']).__name__}")
    
        # Type check acceptedFilmStart (expected object)
        if "acceptedFilmStart" in props and props["acceptedFilmStart"] is not None:
            if not isinstance(props["acceptedFilmStart"], object):
                try:
                    # Attempt to convert
                    props["acceptedFilmStart"] = object(props["acceptedFilmStart"])
                except:
                    raise TypeError(f"Property acceptedFilmStart must be of type object, got {type(props['acceptedFilmStart']).__name__}")
    
        # Type check height (expected int)
        if "height" in props and props["height"] is not None:
            if not isinstance(props["height"], int):
                try:
                    # Attempt to convert
                    props["height"] = int(props["height"])
                except:
                    raise TypeError(f"Property height must be of type int, got {type(props['height']).__name__}")
    
        # Type check activityDays (expected object)
        if "activityDays" in props and props["activityDays"] is not None:
            if not isinstance(props["activityDays"], object):
                try:
                    # Attempt to convert
                    props["activityDays"] = object(props["activityDays"])
                except:
                    raise TypeError(f"Property activityDays must be of type object, got {type(props['activityDays']).__name__}")
    
        # Type check activityTypes (expected object)
        if "activityTypes" in props and props["activityTypes"] is not None:
            if not isinstance(props["activityTypes"], object):
                try:
                    # Attempt to convert
                    props["activityTypes"] = object(props["activityTypes"])
                except:
                    raise TypeError(f"Property activityTypes must be of type object, got {type(props['activityTypes']).__name__}")
    
        # Type check activityDurations (expected object)
        if "activityDurations" in props and props["activityDurations"] is not None:
            if not isinstance(props["activityDurations"], object):
                try:
                    # Attempt to convert
                    props["activityDurations"] = object(props["activityDurations"])
                except:
                    raise TypeError(f"Property activityDurations must be of type object, got {type(props['activityDurations']).__name__}")
    
        # Type check isCurrentlyFilming (expected bool)
        if "isCurrentlyFilming" in props and props["isCurrentlyFilming"] is not None:
            if not isinstance(props["isCurrentlyFilming"], bool):
                try:
                    # Attempt to convert
                    props["isCurrentlyFilming"] = bool(props["isCurrentlyFilming"])
                except:
                    raise TypeError(f"Property isCurrentlyFilming must be of type bool, got {type(props['isCurrentlyFilming']).__name__}")
    
        # Type check weight (expected int)
        if "weight" in props and props["weight"] is not None:
            if not isinstance(props["weight"], int):
                try:
                    # Attempt to convert
                    props["weight"] = int(props["weight"])
                except:
                    raise TypeError(f"Property weight must be of type int, got {type(props['weight']).__name__}")
    
        # Type check established (expected object)
        if "established" in props and props["established"] is not None:
            if not isinstance(props["established"], object):
                try:
                    # Attempt to convert
                    props["established"] = object(props["established"])
                except:
                    raise TypeError(f"Property established must be of type object, got {type(props['established']).__name__}")
    
        # Type check locationLat (expected float)
        if "locationLat" in props and props["locationLat"] is not None:
            if not isinstance(props["locationLat"], float):
                try:
                    # Attempt to convert
                    props["locationLat"] = float(props["locationLat"])
                except:
                    raise TypeError(f"Property locationLat must be of type float, got {type(props['locationLat']).__name__}")
    
        # Type check viewership2022 (expected int)
        if "viewership2022" in props and props["viewership2022"] is not None:
            if not isinstance(props["viewership2022"], int):
                try:
                    # Attempt to convert
                    props["viewership2022"] = int(props["viewership2022"])
                except:
                    raise TypeError(f"Property viewership2022 must be of type int, got {type(props['viewership2022']).__name__}")
    
        # Type check viewership2023 (expected int)
        if "viewership2023" in props and props["viewership2023"] is not None:
            if not isinstance(props["viewership2023"], int):
                try:
                    # Attempt to convert
                    props["viewership2023"] = int(props["viewership2023"])
                except:
                    raise TypeError(f"Property viewership2023 must be of type int, got {type(props['viewership2023']).__name__}")
    
        # Type check typicalDurationHrs (expected float)
        if "typicalDurationHrs" in props and props["typicalDurationHrs"] is not None:
            if not isinstance(props["typicalDurationHrs"], float):
                try:
                    # Attempt to convert
                    props["typicalDurationHrs"] = float(props["typicalDurationHrs"])
                except:
                    raise TypeError(f"Property typicalDurationHrs must be of type float, got {type(props['typicalDurationHrs']).__name__}")
    
        # Type check viewership2020 (expected int)
        if "viewership2020" in props and props["viewership2020"] is not None:
            if not isinstance(props["viewership2020"], int):
                try:
                    # Attempt to convert
                    props["viewership2020"] = int(props["viewership2020"])
                except:
                    raise TypeError(f"Property viewership2020 must be of type int, got {type(props['viewership2020']).__name__}")
    
        # Type check viewership2021 (expected int)
        if "viewership2021" in props and props["viewership2021"] is not None:
            if not isinstance(props["viewership2021"], int):
                try:
                    # Attempt to convert
                    props["viewership2021"] = int(props["viewership2021"])
                except:
                    raise TypeError(f"Property viewership2021 must be of type int, got {type(props['viewership2021']).__name__}")
    
        # Type check nickname (expected str)
        if "nickname" in props and props["nickname"] is not None:
            if not isinstance(props["nickname"], str):
                try:
                    # Attempt to convert
                    props["nickname"] = str(props["nickname"])
                except:
                    raise TypeError(f"Property nickname must be of type str, got {type(props['nickname']).__name__}")
    
        # Type check locationHeight (expected int)
        if "locationHeight" in props and props["locationHeight"] is not None:
            if not isinstance(props["locationHeight"], int):
                try:
                    # Attempt to convert
                    props["locationHeight"] = int(props["locationHeight"])
                except:
                    raise TypeError(f"Property locationHeight must be of type int, got {type(props['locationHeight']).__name__}")
    
        # Type check categories (expected object)
        if "categories" in props and props["categories"] is not None:
            if not isinstance(props["categories"], object):
                try:
                    # Attempt to convert
                    props["categories"] = object(props["categories"])
                except:
                    raise TypeError(f"Property categories must be of type object, got {type(props['categories']).__name__}")
    
        # Type check isPrestigious (expected bool)
        if "isPrestigious" in props and props["isPrestigious"] is not None:
            if not isinstance(props["isPrestigious"], bool):
                try:
                    # Attempt to convert
                    props["isPrestigious"] = bool(props["isPrestigious"])
                except:
                    raise TypeError(f"Property isPrestigious must be of type bool, got {type(props['isPrestigious']).__name__}")
    
        # Type check nextCeremony (expected object)
        if "nextCeremony" in props and props["nextCeremony"] is not None:
            if not isinstance(props["nextCeremony"], object):
                try:
                    # Attempt to convert
                    props["nextCeremony"] = object(props["nextCeremony"])
                except:
                    raise TypeError(f"Property nextCeremony must be of type object, got {type(props['nextCeremony']).__name__}")
    
        # Type check locationLong (expected float)
        if "locationLong" in props and props["locationLong"] is not None:
            if not isinstance(props["locationLong"], float):
                try:
                    # Attempt to convert
                    props["locationLong"] = float(props["locationLong"])
                except:
                    raise TypeError(f"Property locationLong must be of type float, got {type(props['locationLong']).__name__}")
    
        # Type check ceremonyTime (expected object)
        if "ceremonyTime" in props and props["ceremonyTime"] is not None:
            if not isinstance(props["ceremonyTime"], object):
                try:
                    # Attempt to convert
                    props["ceremonyTime"] = object(props["ceremonyTime"])
                except:
                    raise TypeError(f"Property ceremonyTime must be of type object, got {type(props['ceremonyTime']).__name__}")
    
        # Type check studioLotsLong (expected object)
        if "studioLotsLong" in props and props["studioLotsLong"] is not None:
            if not isinstance(props["studioLotsLong"], object):
                try:
                    # Attempt to convert
                    props["studioLotsLong"] = object(props["studioLotsLong"])
                except:
                    raise TypeError(f"Property studioLotsLong must be of type object, got {type(props['studioLotsLong']).__name__}")
    
        # Type check studioLotsLat (expected object)
        if "studioLotsLat" in props and props["studioLotsLat"] is not None:
            if not isinstance(props["studioLotsLat"], object):
                try:
                    # Attempt to convert
                    props["studioLotsLat"] = object(props["studioLotsLat"])
                except:
                    raise TypeError(f"Property studioLotsLat must be of type object, got {type(props['studioLotsLat']).__name__}")
    
        # Type check distributionMarkets (expected object)
        if "distributionMarkets" in props and props["distributionMarkets"] is not None:
            if not isinstance(props["distributionMarkets"], object):
                try:
                    # Attempt to convert
                    props["distributionMarkets"] = object(props["distributionMarkets"])
                except:
                    raise TypeError(f"Property distributionMarkets must be of type object, got {type(props['distributionMarkets']).__name__}")
    
        # Type check founded (expected object)
        if "founded" in props and props["founded"] is not None:
            if not isinstance(props["founded"], object):
                try:
                    # Attempt to convert
                    props["founded"] = object(props["founded"])
                except:
                    raise TypeError(f"Property founded must be of type object, got {type(props['founded']).__name__}")
    
        # Type check yearlyRevenue2020 (expected int)
        if "yearlyRevenue2020" in props and props["yearlyRevenue2020"] is not None:
            if not isinstance(props["yearlyRevenue2020"], int):
                try:
                    # Attempt to convert
                    props["yearlyRevenue2020"] = int(props["yearlyRevenue2020"])
                except:
                    raise TypeError(f"Property yearlyRevenue2020 must be of type int, got {type(props['yearlyRevenue2020']).__name__}")
    
        # Type check subsidiaries (expected object)
        if "subsidiaries" in props and props["subsidiaries"] is not None:
            if not isinstance(props["subsidiaries"], object):
                try:
                    # Attempt to convert
                    props["subsidiaries"] = object(props["subsidiaries"])
                except:
                    raise TypeError(f"Property subsidiaries must be of type object, got {type(props['subsidiaries']).__name__}")
    
        # Type check digitalStreamingDate (expected object)
        if "digitalStreamingDate" in props and props["digitalStreamingDate"] is not None:
            if not isinstance(props["digitalStreamingDate"], object):
                try:
                    # Attempt to convert
                    props["digitalStreamingDate"] = object(props["digitalStreamingDate"])
                except:
                    raise TypeError(f"Property digitalStreamingDate must be of type object, got {type(props['digitalStreamingDate']).__name__}")
    
        # Type check yearlyRevenue2021 (expected int)
        if "yearlyRevenue2021" in props and props["yearlyRevenue2021"] is not None:
            if not isinstance(props["yearlyRevenue2021"], int):
                try:
                    # Attempt to convert
                    props["yearlyRevenue2021"] = int(props["yearlyRevenue2021"])
                except:
                    raise TypeError(f"Property yearlyRevenue2021 must be of type int, got {type(props['yearlyRevenue2021']).__name__}")
    
        # Type check headquartersLat (expected float)
        if "headquartersLat" in props and props["headquartersLat"] is not None:
            if not isinstance(props["headquartersLat"], float):
                try:
                    # Attempt to convert
                    props["headquartersLat"] = float(props["headquartersLat"])
                except:
                    raise TypeError(f"Property headquartersLat must be of type float, got {type(props['headquartersLat']).__name__}")
    
        # Type check marketShare (expected float)
        if "marketShare" in props and props["marketShare"] is not None:
            if not isinstance(props["marketShare"], float):
                try:
                    # Attempt to convert
                    props["marketShare"] = float(props["marketShare"])
                except:
                    raise TypeError(f"Property marketShare must be of type float, got {type(props['marketShare']).__name__}")
    
        # Type check yearlyRevenue2022 (expected int)
        if "yearlyRevenue2022" in props and props["yearlyRevenue2022"] is not None:
            if not isinstance(props["yearlyRevenue2022"], int):
                try:
                    # Attempt to convert
                    props["yearlyRevenue2022"] = int(props["yearlyRevenue2022"])
                except:
                    raise TypeError(f"Property yearlyRevenue2022 must be of type int, got {type(props['yearlyRevenue2022']).__name__}")
    
        # Type check headquartersLong (expected float)
        if "headquartersLong" in props and props["headquartersLong"] is not None:
            if not isinstance(props["headquartersLong"], float):
                try:
                    # Attempt to convert
                    props["headquartersLong"] = float(props["headquartersLong"])
                except:
                    raise TypeError(f"Property headquartersLong must be of type float, got {type(props['headquartersLong']).__name__}")
    
        # Type check isPublic (expected bool)
        if "isPublic" in props and props["isPublic"] is not None:
            if not isinstance(props["isPublic"], bool):
                try:
                    # Attempt to convert
                    props["isPublic"] = bool(props["isPublic"])
                except:
                    raise TypeError(f"Property isPublic must be of type bool, got {type(props['isPublic']).__name__}")
    
        # Type check scheduleTimes (expected object)
        if "scheduleTimes" in props and props["scheduleTimes"] is not None:
            if not isinstance(props["scheduleTimes"], object):
                try:
                    # Attempt to convert
                    props["scheduleTimes"] = object(props["scheduleTimes"])
                except:
                    raise TypeError(f"Property scheduleTimes must be of type object, got {type(props['scheduleTimes']).__name__}")
    
        # Type check scheduleDurations (expected object)
        if "scheduleDurations" in props and props["scheduleDurations"] is not None:
            if not isinstance(props["scheduleDurations"], object):
                try:
                    # Attempt to convert
                    props["scheduleDurations"] = object(props["scheduleDurations"])
                except:
                    raise TypeError(f"Property scheduleDurations must be of type object, got {type(props['scheduleDurations']).__name__}")
    
        # Type check weatherPoor (expected int)
        if "weatherPoor" in props and props["weatherPoor"] is not None:
            if not isinstance(props["weatherPoor"], int):
                try:
                    # Attempt to convert
                    props["weatherPoor"] = int(props["weatherPoor"])
                except:
                    raise TypeError(f"Property weatherPoor must be of type int, got {type(props['weatherPoor']).__name__}")
    
        # Type check startDate (expected object)
        if "startDate" in props and props["startDate"] is not None:
            if not isinstance(props["startDate"], object):
                try:
                    # Attempt to convert
                    props["startDate"] = object(props["startDate"])
                except:
                    raise TypeError(f"Property startDate must be of type object, got {type(props['startDate']).__name__}")
    
        # Type check isCompleted (expected bool)
        if "isCompleted" in props and props["isCompleted"] is not None:
            if not isinstance(props["isCompleted"], bool):
                try:
                    # Attempt to convert
                    props["isCompleted"] = bool(props["isCompleted"])
                except:
                    raise TypeError(f"Property isCompleted must be of type bool, got {type(props['isCompleted']).__name__}")
    
        # Type check scheduleActivities (expected object)
        if "scheduleActivities" in props and props["scheduleActivities"] is not None:
            if not isinstance(props["scheduleActivities"], object):
                try:
                    # Attempt to convert
                    props["scheduleActivities"] = object(props["scheduleActivities"])
                except:
                    raise TypeError(f"Property scheduleActivities must be of type object, got {type(props['scheduleActivities']).__name__}")
    
        # Type check budgetEquipment (expected int)
        if "budgetEquipment" in props and props["budgetEquipment"] is not None:
            if not isinstance(props["budgetEquipment"], int):
                try:
                    # Attempt to convert
                    props["budgetEquipment"] = int(props["budgetEquipment"])
                except:
                    raise TypeError(f"Property budgetEquipment must be of type int, got {type(props['budgetEquipment']).__name__}")
    
        # Type check weatherGood (expected int)
        if "weatherGood" in props and props["weatherGood"] is not None:
            if not isinstance(props["weatherGood"], int):
                try:
                    # Attempt to convert
                    props["weatherGood"] = int(props["weatherGood"])
                except:
                    raise TypeError(f"Property weatherGood must be of type int, got {type(props['weatherGood']).__name__}")
    
        # Type check startTime (expected object)
        if "startTime" in props and props["startTime"] is not None:
            if not isinstance(props["startTime"], object):
                try:
                    # Attempt to convert
                    props["startTime"] = object(props["startTime"])
                except:
                    raise TypeError(f"Property startTime must be of type object, got {type(props['startTime']).__name__}")
    
        # Type check budgetPersonnel (expected int)
        if "budgetPersonnel" in props and props["budgetPersonnel"] is not None:
            if not isinstance(props["budgetPersonnel"], int):
                try:
                    # Attempt to convert
                    props["budgetPersonnel"] = int(props["budgetPersonnel"])
                except:
                    raise TypeError(f"Property budgetPersonnel must be of type int, got {type(props['budgetPersonnel']).__name__}")
    
        # Type check durationDays (expected int)
        if "durationDays" in props and props["durationDays"] is not None:
            if not isinstance(props["durationDays"], int):
                try:
                    # Attempt to convert
                    props["durationDays"] = int(props["durationDays"])
                except:
                    raise TypeError(f"Property durationDays must be of type int, got {type(props['durationDays']).__name__}")
    
        # Type check budgetVFX (expected int)
        if "budgetVFX" in props and props["budgetVFX"] is not None:
            if not isinstance(props["budgetVFX"], int):
                try:
                    # Attempt to convert
                    props["budgetVFX"] = int(props["budgetVFX"])
                except:
                    raise TypeError(f"Property budgetVFX must be of type int, got {type(props['budgetVFX']).__name__}")
    
        # Type check weatherAcceptable (expected int)
        if "weatherAcceptable" in props and props["weatherAcceptable"] is not None:
            if not isinstance(props["weatherAcceptable"], int):
                try:
                    # Attempt to convert
                    props["weatherAcceptable"] = int(props["weatherAcceptable"])
                except:
                    raise TypeError(f"Property weatherAcceptable must be of type int, got {type(props['weatherAcceptable']).__name__}")
    
        # Type check durationMonths (expected int)
        if "durationMonths" in props and props["durationMonths"] is not None:
            if not isinstance(props["durationMonths"], int):
                try:
                    # Attempt to convert
                    props["durationMonths"] = int(props["durationMonths"])
                except:
                    raise TypeError(f"Property durationMonths must be of type int, got {type(props['durationMonths']).__name__}")
    
        # Type check budgetOther (expected int)
        if "budgetOther" in props and props["budgetOther"] is not None:
            if not isinstance(props["budgetOther"], int):
                try:
                    # Attempt to convert
                    props["budgetOther"] = int(props["budgetOther"])
                except:
                    raise TypeError(f"Property budgetOther must be of type int, got {type(props['budgetOther']).__name__}")
    
        # Type check endDate (expected object)
        if "endDate" in props and props["endDate"] is not None:
            if not isinstance(props["endDate"], object):
                try:
                    # Attempt to convert
                    props["endDate"] = object(props["endDate"])
                except:
                    raise TypeError(f"Property endDate must be of type object, got {type(props['endDate']).__name__}")
    
        # Type check budgetLocations (expected int)
        if "budgetLocations" in props and props["budgetLocations"] is not None:
            if not isinstance(props["budgetLocations"], int):
                try:
                    # Attempt to convert
                    props["budgetLocations"] = int(props["budgetLocations"])
                except:
                    raise TypeError(f"Property budgetLocations must be of type int, got {type(props['budgetLocations']).__name__}")
    
        # Type check readerLocationsLong (expected object)
        if "readerLocationsLong" in props and props["readerLocationsLong"] is not None:
            if not isinstance(props["readerLocationsLong"], object):
                try:
                    # Attempt to convert
                    props["readerLocationsLong"] = object(props["readerLocationsLong"])
                except:
                    raise TypeError(f"Property readerLocationsLong must be of type object, got {type(props['readerLocationsLong']).__name__}")
    
        # Type check readerLocationsLat (expected object)
        if "readerLocationsLat" in props and props["readerLocationsLat"] is not None:
            if not isinstance(props["readerLocationsLat"], object):
                try:
                    # Attempt to convert
                    props["readerLocationsLat"] = object(props["readerLocationsLat"])
                except:
                    raise TypeError(f"Property readerLocationsLat must be of type object, got {type(props['readerLocationsLat']).__name__}")
    
        # Type check aspectDirection (expected float)
        if "aspectDirection" in props and props["aspectDirection"] is not None:
            if not isinstance(props["aspectDirection"], float):
                try:
                    # Attempt to convert
                    props["aspectDirection"] = float(props["aspectDirection"])
                except:
                    raise TypeError(f"Property aspectDirection must be of type float, got {type(props['aspectDirection']).__name__}")
    
        # Type check commentTimestamps (expected list)
        if "commentTimestamps" in props and props["commentTimestamps"] is not None:
            if not isinstance(props["commentTimestamps"], list):
                try:
                    # Attempt to convert
                    props["commentTimestamps"] = list(props["commentTimestamps"])
                except:
                    raise TypeError(f"Property commentTimestamps must be of type list, got {type(props['commentTimestamps']).__name__}")
    
        # Type check keywords (expected object)
        if "keywords" in props and props["keywords"] is not None:
            if not isinstance(props["keywords"], object):
                try:
                    # Attempt to convert
                    props["keywords"] = object(props["keywords"])
                except:
                    raise TypeError(f"Property keywords must be of type object, got {type(props['keywords']).__name__}")
    
        # Type check stars (expected float)
        if "stars" in props and props["stars"] is not None:
            if not isinstance(props["stars"], float):
                try:
                    # Attempt to convert
                    props["stars"] = float(props["stars"])
                except:
                    raise TypeError(f"Property stars must be of type float, got {type(props['stars']).__name__}")
    
        # Type check time (expected object)
        if "time" in props and props["time"] is not None:
            if not isinstance(props["time"], object):
                try:
                    # Attempt to convert
                    props["time"] = object(props["time"])
                except:
                    raise TypeError(f"Property time must be of type object, got {type(props['time']).__name__}")
    
        # Type check aspectMusic (expected float)
        if "aspectMusic" in props and props["aspectMusic"] is not None:
            if not isinstance(props["aspectMusic"], float):
                try:
                    # Attempt to convert
                    props["aspectMusic"] = float(props["aspectMusic"])
                except:
                    raise TypeError(f"Property aspectMusic must be of type float, got {type(props['aspectMusic']).__name__}")
    
        # Type check aspectPlot (expected float)
        if "aspectPlot" in props and props["aspectPlot"] is not None:
            if not isinstance(props["aspectPlot"], float):
                try:
                    # Attempt to convert
                    props["aspectPlot"] = float(props["aspectPlot"])
                except:
                    raise TypeError(f"Property aspectPlot must be of type float, got {type(props['aspectPlot']).__name__}")
    
        # Type check aspectVisuals (expected float)
        if "aspectVisuals" in props and props["aspectVisuals"] is not None:
            if not isinstance(props["aspectVisuals"], float):
                try:
                    # Attempt to convert
                    props["aspectVisuals"] = float(props["aspectVisuals"])
                except:
                    raise TypeError(f"Property aspectVisuals must be of type float, got {type(props['aspectVisuals']).__name__}")
    
        # Type check isVerified (expected bool)
        if "isVerified" in props and props["isVerified"] is not None:
            if not isinstance(props["isVerified"], bool):
                try:
                    # Attempt to convert
                    props["isVerified"] = bool(props["isVerified"])
                except:
                    raise TypeError(f"Property isVerified must be of type bool, got {type(props['isVerified']).__name__}")
    
        # Type check reviewText (expected str)
        if "reviewText" in props and props["reviewText"] is not None:
            if not isinstance(props["reviewText"], str):
                try:
                    # Attempt to convert
                    props["reviewText"] = str(props["reviewText"])
                except:
                    raise TypeError(f"Property reviewText must be of type str, got {type(props['reviewText']).__name__}")
    
        # Type check date (expected object)
        if "date" in props and props["date"] is not None:
            if not isinstance(props["date"], object):
                try:
                    # Attempt to convert
                    props["date"] = object(props["date"])
                except:
                    raise TypeError(f"Property date must be of type object, got {type(props['date']).__name__}")
    
        # Type check aspectActing (expected float)
        if "aspectActing" in props and props["aspectActing"] is not None:
            if not isinstance(props["aspectActing"], float):
                try:
                    # Attempt to convert
                    props["aspectActing"] = float(props["aspectActing"])
                except:
                    raise TypeError(f"Property aspectActing must be of type float, got {type(props['aspectActing']).__name__}")
    
        # Type check upvotes (expected int)
        if "upvotes" in props and props["upvotes"] is not None:
            if not isinstance(props["upvotes"], int):
                try:
                    # Attempt to convert
                    props["upvotes"] = int(props["upvotes"])
                except:
                    raise TypeError(f"Property upvotes must be of type int, got {type(props['upvotes']).__name__}")
    
        # Type check methodActingScore (expected float)
        if "methodActingScore" in props and props["methodActingScore"] is not None:
            if not isinstance(props["methodActingScore"], float):
                try:
                    # Attempt to convert
                    props["methodActingScore"] = float(props["methodActingScore"])
                except:
                    raise TypeError(f"Property methodActingScore must be of type float, got {type(props['methodActingScore']).__name__}")
    
        # Type check marriageDate (expected object)
        if "marriageDate" in props and props["marriageDate"] is not None:
            if not isinstance(props["marriageDate"], object):
                try:
                    # Attempt to convert
                    props["marriageDate"] = object(props["marriageDate"])
                except:
                    raise TypeError(f"Property marriageDate must be of type object, got {type(props['marriageDate']).__name__}")
    
        # Type check oscarWinDate (expected object)
        if "oscarWinDate" in props and props["oscarWinDate"] is not None:
            if not isinstance(props["oscarWinDate"], object):
                try:
                    # Attempt to convert
                    props["oscarWinDate"] = object(props["oscarWinDate"])
                except:
                    raise TypeError(f"Property oscarWinDate must be of type object, got {type(props['oscarWinDate']).__name__}")
    
        # Type check filmCountComedy (expected int)
        if "filmCountComedy" in props and props["filmCountComedy"] is not None:
            if not isinstance(props["filmCountComedy"], int):
                try:
                    # Attempt to convert
                    props["filmCountComedy"] = int(props["filmCountComedy"])
                except:
                    raise TypeError(f"Property filmCountComedy must be of type int, got {type(props['filmCountComedy']).__name__}")
    
        # Type check filmCountSciFi (expected int)
        if "filmCountSciFi" in props and props["filmCountSciFi"] is not None:
            if not isinstance(props["filmCountSciFi"], int):
                try:
                    # Attempt to convert
                    props["filmCountSciFi"] = int(props["filmCountSciFi"])
                except:
                    raise TypeError(f"Property filmCountSciFi must be of type int, got {type(props['filmCountSciFi']).__name__}")
    
        # Type check typicalRolePreparationMonths (expected float)
        if "typicalRolePreparationMonths" in props and props["typicalRolePreparationMonths"] is not None:
            if not isinstance(props["typicalRolePreparationMonths"], float):
                try:
                    # Attempt to convert
                    props["typicalRolePreparationMonths"] = float(props["typicalRolePreparationMonths"])
                except:
                    raise TypeError(f"Property typicalRolePreparationMonths must be of type float, got {type(props['typicalRolePreparationMonths']).__name__}")
    
        # Type check spouseName (expected str)
        if "spouseName" in props and props["spouseName"] is not None:
            if not isinstance(props["spouseName"], str):
                try:
                    # Attempt to convert
                    props["spouseName"] = str(props["spouseName"])
                except:
                    raise TypeError(f"Property spouseName must be of type str, got {type(props['spouseName']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.node(label="GeneratedByClaudeAI", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def manual(uuid=None, **props):
        """
        Find nodes with label Manual matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Manual", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def part(uuid=None, **props):
        """
        Find nodes with label Part matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Part", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]


    def chapter(uuid=None, **props):
        """
        Find nodes with label Chapter matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the node to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Dict]:
            A list of matching nodes as dictionaries with keys 'uuid', 'labels', and 'props'
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.node(label="Chapter", **search_props)
        results = _query(query, params)
        return [_neo4j_node_to_dict(result['n']) for result in results]



class Edges:
    """
    Interface for working with relationships in the Neo4j graph.
    Each method corresponds to a relationship type in the graph.
    """

    def acted_in(uuid=None, **props):
        """
        Find relationships of type ACTED_IN matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check roles (expected object)
        if "roles" in props and props["roles"] is not None:
            if not isinstance(props["roles"], object):
                try:
                    # Attempt to convert
                    props["roles"] = object(props["roles"])
                except:
                    raise TypeError(f"Property roles must be of type object, got {type(props['roles']).__name__}")
    
        # Type check endDate (expected object)
        if "endDate" in props and props["endDate"] is not None:
            if not isinstance(props["endDate"], object):
                try:
                    # Attempt to convert
                    props["endDate"] = object(props["endDate"])
                except:
                    raise TypeError(f"Property endDate must be of type object, got {type(props['endDate']).__name__}")
    
        # Type check screenTimeMinutes (expected int)
        if "screenTimeMinutes" in props and props["screenTimeMinutes"] is not None:
            if not isinstance(props["screenTimeMinutes"], int):
                try:
                    # Attempt to convert
                    props["screenTimeMinutes"] = int(props["screenTimeMinutes"])
                except:
                    raise TypeError(f"Property screenTimeMinutes must be of type int, got {type(props['screenTimeMinutes']).__name__}")
    
        # Type check startDate (expected object)
        if "startDate" in props and props["startDate"] is not None:
            if not isinstance(props["startDate"], object):
                try:
                    # Attempt to convert
                    props["startDate"] = object(props["startDate"])
                except:
                    raise TypeError(f"Property startDate must be of type object, got {type(props['startDate']).__name__}")
    
        # Type check awardNominations (expected int)
        if "awardNominations" in props and props["awardNominations"] is not None:
            if not isinstance(props["awardNominations"], int):
                try:
                    # Attempt to convert
                    props["awardNominations"] = int(props["awardNominations"])
                except:
                    raise TypeError(f"Property awardNominations must be of type int, got {type(props['awardNominations']).__name__}")
    
        # Type check audienceScore (expected int)
        if "audienceScore" in props and props["audienceScore"] is not None:
            if not isinstance(props["audienceScore"], int):
                try:
                    # Attempt to convert
                    props["audienceScore"] = int(props["audienceScore"])
                except:
                    raise TypeError(f"Property audienceScore must be of type int, got {type(props['audienceScore']).__name__}")
    
        # Type check criticScore (expected int)
        if "criticScore" in props and props["criticScore"] is not None:
            if not isinstance(props["criticScore"], int):
                try:
                    # Attempt to convert
                    props["criticScore"] = int(props["criticScore"])
                except:
                    raise TypeError(f"Property criticScore must be of type int, got {type(props['criticScore']).__name__}")
    
        # Type check scheduleConflicts (expected bool)
        if "scheduleConflicts" in props and props["scheduleConflicts"] is not None:
            if not isinstance(props["scheduleConflicts"], bool):
                try:
                    # Attempt to convert
                    props["scheduleConflicts"] = bool(props["scheduleConflicts"])
                except:
                    raise TypeError(f"Property scheduleConflicts must be of type bool, got {type(props['scheduleConflicts']).__name__}")
    
        # Type check salary (expected int)
        if "salary" in props and props["salary"] is not None:
            if not isinstance(props["salary"], int):
                try:
                    # Attempt to convert
                    props["salary"] = int(props["salary"])
                except:
                    raise TypeError(f"Property salary must be of type int, got {type(props['salary']).__name__}")
    
        # Type check performanceRating (expected float)
        if "performanceRating" in props and props["performanceRating"] is not None:
            if not isinstance(props["performanceRating"], float):
                try:
                    # Attempt to convert
                    props["performanceRating"] = float(props["performanceRating"])
                except:
                    raise TypeError(f"Property performanceRating must be of type float, got {type(props['performanceRating']).__name__}")
    
        # Type check stuntPerformed (expected bool)
        if "stuntPerformed" in props and props["stuntPerformed"] is not None:
            if not isinstance(props["stuntPerformed"], bool):
                try:
                    # Attempt to convert
                    props["stuntPerformed"] = bool(props["stuntPerformed"])
                except:
                    raise TypeError(f"Property stuntPerformed must be of type bool, got {type(props['stuntPerformed']).__name__}")
    
        # Type check trainingPeriodWeeks (expected int)
        if "trainingPeriodWeeks" in props and props["trainingPeriodWeeks"] is not None:
            if not isinstance(props["trainingPeriodWeeks"], int):
                try:
                    # Attempt to convert
                    props["trainingPeriodWeeks"] = int(props["trainingPeriodWeeks"])
                except:
                    raise TypeError(f"Property trainingPeriodWeeks must be of type int, got {type(props['trainingPeriodWeeks']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="ACTED_IN", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def directed(uuid=None, **props):
        """
        Find relationships of type DIRECTED matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check completionDate (expected object)
        if "completionDate" in props and props["completionDate"] is not None:
            if not isinstance(props["completionDate"], object):
                try:
                    # Attempt to convert
                    props["completionDate"] = object(props["completionDate"])
                except:
                    raise TypeError(f"Property completionDate must be of type object, got {type(props['completionDate']).__name__}")
    
        # Type check satisfaction (expected float)
        if "satisfaction" in props and props["satisfaction"] is not None:
            if not isinstance(props["satisfaction"], float):
                try:
                    # Attempt to convert
                    props["satisfaction"] = float(props["satisfaction"])
                except:
                    raise TypeError(f"Property satisfaction must be of type float, got {type(props['satisfaction']).__name__}")
    
        # Type check daysOnSet (expected int)
        if "daysOnSet" in props and props["daysOnSet"] is not None:
            if not isinstance(props["daysOnSet"], int):
                try:
                    # Attempt to convert
                    props["daysOnSet"] = int(props["daysOnSet"])
                except:
                    raise TypeError(f"Property daysOnSet must be of type int, got {type(props['daysOnSet']).__name__}")
    
        # Type check premiereEvent (expected object)
        if "premiereEvent" in props and props["premiereEvent"] is not None:
            if not isinstance(props["premiereEvent"], object):
                try:
                    # Attempt to convert
                    props["premiereEvent"] = object(props["premiereEvent"])
                except:
                    raise TypeError(f"Property premiereEvent must be of type object, got {type(props['premiereEvent']).__name__}")
    
        # Type check isFirstCollaboration (expected bool)
        if "isFirstCollaboration" in props and props["isFirstCollaboration"] is not None:
            if not isinstance(props["isFirstCollaboration"], bool):
                try:
                    # Attempt to convert
                    props["isFirstCollaboration"] = bool(props["isFirstCollaboration"])
                except:
                    raise TypeError(f"Property isFirstCollaboration must be of type bool, got {type(props['isFirstCollaboration']).__name__}")
    
        # Type check durationMonths (expected int)
        if "durationMonths" in props and props["durationMonths"] is not None:
            if not isinstance(props["durationMonths"], int):
                try:
                    # Attempt to convert
                    props["durationMonths"] = int(props["durationMonths"])
                except:
                    raise TypeError(f"Property durationMonths must be of type int, got {type(props['durationMonths']).__name__}")
    
        # Type check year (expected int)
        if "year" in props and props["year"] is not None:
            if not isinstance(props["year"], int):
                try:
                    # Attempt to convert
                    props["year"] = int(props["year"])
                except:
                    raise TypeError(f"Property year must be of type int, got {type(props['year']).__name__}")
    
        # Type check awardNominations (expected int)
        if "awardNominations" in props and props["awardNominations"] is not None:
            if not isinstance(props["awardNominations"], int):
                try:
                    # Attempt to convert
                    props["awardNominations"] = int(props["awardNominations"])
                except:
                    raise TypeError(f"Property awardNominations must be of type int, got {type(props['awardNominations']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="DIRECTED", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def produced(uuid=None, **props):
        """
        Find relationships of type PRODUCED matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check producerShare (expected float)
        if "producerShare" in props and props["producerShare"] is not None:
            if not isinstance(props["producerShare"], float):
                try:
                    # Attempt to convert
                    props["producerShare"] = float(props["producerShare"])
                except:
                    raise TypeError(f"Property producerShare must be of type float, got {type(props['producerShare']).__name__}")
    
        # Type check topCastShare (expected float)
        if "topCastShare" in props and props["topCastShare"] is not None:
            if not isinstance(props["topCastShare"], float):
                try:
                    # Attempt to convert
                    props["topCastShare"] = float(props["topCastShare"])
                except:
                    raise TypeError(f"Property topCastShare must be of type float, got {type(props['topCastShare']).__name__}")
    
        # Type check roi (expected float)
        if "roi" in props and props["roi"] is not None:
            if not isinstance(props["roi"], float):
                try:
                    # Attempt to convert
                    props["roi"] = float(props["roi"])
                except:
                    raise TypeError(f"Property roi must be of type float, got {type(props['roi']).__name__}")
    
        # Type check marketingStart (expected object)
        if "marketingStart" in props and props["marketingStart"] is not None:
            if not isinstance(props["marketingStart"], object):
                try:
                    # Attempt to convert
                    props["marketingStart"] = object(props["marketingStart"])
                except:
                    raise TypeError(f"Property marketingStart must be of type object, got {type(props['marketingStart']).__name__}")
    
        # Type check marketingBudget (expected int)
        if "marketingBudget" in props and props["marketingBudget"] is not None:
            if not isinstance(props["marketingBudget"], int):
                try:
                    # Attempt to convert
                    props["marketingBudget"] = int(props["marketingBudget"])
                except:
                    raise TypeError(f"Property marketingBudget must be of type int, got {type(props['marketingBudget']).__name__}")
    
        # Type check investment (expected int)
        if "investment" in props and props["investment"] is not None:
            if not isinstance(props["investment"], int):
                try:
                    # Attempt to convert
                    props["investment"] = int(props["investment"])
                except:
                    raise TypeError(f"Property investment must be of type int, got {type(props['investment']).__name__}")
    
        # Type check directorShare (expected float)
        if "directorShare" in props and props["directorShare"] is not None:
            if not isinstance(props["directorShare"], float):
                try:
                    # Attempt to convert
                    props["directorShare"] = float(props["directorShare"])
                except:
                    raise TypeError(f"Property directorShare must be of type float, got {type(props['directorShare']).__name__}")
    
        # Type check return (expected int)
        if "return" in props and props["return"] is not None:
            if not isinstance(props["return"], int):
                try:
                    # Attempt to convert
                    props["return"] = int(props["return"])
                except:
                    raise TypeError(f"Property return must be of type int, got {type(props['return']).__name__}")
    
        # Type check contractSigned (expected object)
        if "contractSigned" in props and props["contractSigned"] is not None:
            if not isinstance(props["contractSigned"], object):
                try:
                    # Attempt to convert
                    props["contractSigned"] = object(props["contractSigned"])
                except:
                    raise TypeError(f"Property contractSigned must be of type object, got {type(props['contractSigned']).__name__}")
    
        # Type check studioShare (expected float)
        if "studioShare" in props and props["studioShare"] is not None:
            if not isinstance(props["studioShare"], float):
                try:
                    # Attempt to convert
                    props["studioShare"] = float(props["studioShare"])
                except:
                    raise TypeError(f"Property studioShare must be of type float, got {type(props['studioShare']).__name__}")
    
        # Type check isProfitable (expected bool)
        if "isProfitable" in props and props["isProfitable"] is not None:
            if not isinstance(props["isProfitable"], bool):
                try:
                    # Attempt to convert
                    props["isProfitable"] = bool(props["isProfitable"])
                except:
                    raise TypeError(f"Property isProfitable must be of type bool, got {type(props['isProfitable']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="PRODUCED", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def wrote(uuid=None, **props):
        """
        Find relationships of type WROTE matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check date (expected object)
        if "date" in props and props["date"] is not None:
            if not isinstance(props["date"], object):
                try:
                    # Attempt to convert
                    props["date"] = object(props["date"])
                except:
                    raise TypeError(f"Property date must be of type object, got {type(props['date']).__name__}")
    
        # Type check isVerified (expected bool)
        if "isVerified" in props and props["isVerified"] is not None:
            if not isinstance(props["isVerified"], bool):
                try:
                    # Attempt to convert
                    props["isVerified"] = bool(props["isVerified"])
                except:
                    raise TypeError(f"Property isVerified must be of type bool, got {type(props['isVerified']).__name__}")
    
        # Type check wordCount (expected int)
        if "wordCount" in props and props["wordCount"] is not None:
            if not isinstance(props["wordCount"], int):
                try:
                    # Attempt to convert
                    props["wordCount"] = int(props["wordCount"])
                except:
                    raise TypeError(f"Property wordCount must be of type int, got {type(props['wordCount']).__name__}")
    
        # Type check timeSpentMinutes (expected int)
        if "timeSpentMinutes" in props and props["timeSpentMinutes"] is not None:
            if not isinstance(props["timeSpentMinutes"], int):
                try:
                    # Attempt to convert
                    props["timeSpentMinutes"] = int(props["timeSpentMinutes"])
                except:
                    raise TypeError(f"Property timeSpentMinutes must be of type int, got {type(props['timeSpentMinutes']).__name__}")
    
        # Type check submissionTime (expected object)
        if "submissionTime" in props and props["submissionTime"] is not None:
            if not isinstance(props["submissionTime"], object):
                try:
                    # Attempt to convert
                    props["submissionTime"] = object(props["submissionTime"])
                except:
                    raise TypeError(f"Property submissionTime must be of type object, got {type(props['submissionTime']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="WROTE", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def follows(uuid=None, **props):
        """
        Find relationships of type FOLLOWS matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Construct and execute the query
        query, params = Queries.edge(type="FOLLOWS", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def reviewed(uuid=None, **props):
        """
        Find relationships of type REVIEWED matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check summary (expected str)
        if "summary" in props and props["summary"] is not None:
            if not isinstance(props["summary"], str):
                try:
                    # Attempt to convert
                    props["summary"] = str(props["summary"])
                except:
                    raise TypeError(f"Property summary must be of type str, got {type(props['summary']).__name__}")
    
        # Type check rating (expected int)
        if "rating" in props and props["rating"] is not None:
            if not isinstance(props["rating"], int):
                try:
                    # Attempt to convert
                    props["rating"] = int(props["rating"])
                except:
                    raise TypeError(f"Property rating must be of type int, got {type(props['rating']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="REVIEWED", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def financed(uuid=None, **props):
        """
        Find relationships of type FINANCED matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check paymentDate3 (expected object)
        if "paymentDate3" in props and props["paymentDate3"] is not None:
            if not isinstance(props["paymentDate3"], object):
                try:
                    # Attempt to convert
                    props["paymentDate3"] = object(props["paymentDate3"])
                except:
                    raise TypeError(f"Property paymentDate3 must be of type object, got {type(props['paymentDate3']).__name__}")
    
        # Type check paymentAmount3 (expected int)
        if "paymentAmount3" in props and props["paymentAmount3"] is not None:
            if not isinstance(props["paymentAmount3"], int):
                try:
                    # Attempt to convert
                    props["paymentAmount3"] = int(props["paymentAmount3"])
                except:
                    raise TypeError(f"Property paymentAmount3 must be of type int, got {type(props['paymentAmount3']).__name__}")
    
        # Type check transferTime3 (expected object)
        if "transferTime3" in props and props["transferTime3"] is not None:
            if not isinstance(props["transferTime3"], object):
                try:
                    # Attempt to convert
                    props["transferTime3"] = object(props["transferTime3"])
                except:
                    raise TypeError(f"Property transferTime3 must be of type object, got {type(props['transferTime3']).__name__}")
    
        # Type check paymentAmount2 (expected int)
        if "paymentAmount2" in props and props["paymentAmount2"] is not None:
            if not isinstance(props["paymentAmount2"], int):
                try:
                    # Attempt to convert
                    props["paymentAmount2"] = int(props["paymentAmount2"])
                except:
                    raise TypeError(f"Property paymentAmount2 must be of type int, got {type(props['paymentAmount2']).__name__}")
    
        # Type check transferTime2 (expected object)
        if "transferTime2" in props and props["transferTime2"] is not None:
            if not isinstance(props["transferTime2"], object):
                try:
                    # Attempt to convert
                    props["transferTime2"] = object(props["transferTime2"])
                except:
                    raise TypeError(f"Property transferTime2 must be of type object, got {type(props['transferTime2']).__name__}")
    
        # Type check paymentDate2 (expected object)
        if "paymentDate2" in props and props["paymentDate2"] is not None:
            if not isinstance(props["paymentDate2"], object):
                try:
                    # Attempt to convert
                    props["paymentDate2"] = object(props["paymentDate2"])
                except:
                    raise TypeError(f"Property paymentDate2 must be of type object, got {type(props['paymentDate2']).__name__}")
    
        # Type check transferTime1 (expected object)
        if "transferTime1" in props and props["transferTime1"] is not None:
            if not isinstance(props["transferTime1"], object):
                try:
                    # Attempt to convert
                    props["transferTime1"] = object(props["transferTime1"])
                except:
                    raise TypeError(f"Property transferTime1 must be of type object, got {type(props['transferTime1']).__name__}")
    
        # Type check paymentAmount1 (expected int)
        if "paymentAmount1" in props and props["paymentAmount1"] is not None:
            if not isinstance(props["paymentAmount1"], int):
                try:
                    # Attempt to convert
                    props["paymentAmount1"] = int(props["paymentAmount1"])
                except:
                    raise TypeError(f"Property paymentAmount1 must be of type int, got {type(props['paymentAmount1']).__name__}")
    
        # Type check contractDate (expected object)
        if "contractDate" in props and props["contractDate"] is not None:
            if not isinstance(props["contractDate"], object):
                try:
                    # Attempt to convert
                    props["contractDate"] = object(props["contractDate"])
                except:
                    raise TypeError(f"Property contractDate must be of type object, got {type(props['contractDate']).__name__}")
    
        # Type check amount (expected int)
        if "amount" in props and props["amount"] is not None:
            if not isinstance(props["amount"], int):
                try:
                    # Attempt to convert
                    props["amount"] = int(props["amount"])
                except:
                    raise TypeError(f"Property amount must be of type int, got {type(props['amount']).__name__}")
    
        # Type check isFullyPaid (expected bool)
        if "isFullyPaid" in props and props["isFullyPaid"] is not None:
            if not isinstance(props["isFullyPaid"], bool):
                try:
                    # Attempt to convert
                    props["isFullyPaid"] = bool(props["isFullyPaid"])
                except:
                    raise TypeError(f"Property isFullyPaid must be of type bool, got {type(props['isFullyPaid']).__name__}")
    
        # Type check paymentDate1 (expected object)
        if "paymentDate1" in props and props["paymentDate1"] is not None:
            if not isinstance(props["paymentDate1"], object):
                try:
                    # Attempt to convert
                    props["paymentDate1"] = object(props["paymentDate1"])
                except:
                    raise TypeError(f"Property paymentDate1 must be of type object, got {type(props['paymentDate1']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="FINANCED", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def for_movie(uuid=None, **props):
        """
        Find relationships of type FOR_MOVIE matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check durationDays (expected int)
        if "durationDays" in props and props["durationDays"] is not None:
            if not isinstance(props["durationDays"], int):
                try:
                    # Attempt to convert
                    props["durationDays"] = int(props["durationDays"])
                except:
                    raise TypeError(f"Property durationDays must be of type int, got {type(props['durationDays']).__name__}")
    
        # Type check durationMonths (expected int)
        if "durationMonths" in props and props["durationMonths"] is not None:
            if not isinstance(props["durationMonths"], int):
                try:
                    # Attempt to convert
                    props["durationMonths"] = int(props["durationMonths"])
                except:
                    raise TypeError(f"Property durationMonths must be of type int, got {type(props['durationMonths']).__name__}")
    
        # Type check locationCount (expected int)
        if "locationCount" in props and props["locationCount"] is not None:
            if not isinstance(props["locationCount"], int):
                try:
                    # Attempt to convert
                    props["locationCount"] = int(props["locationCount"])
                except:
                    raise TypeError(f"Property locationCount must be of type int, got {type(props['locationCount']).__name__}")
    
        # Type check scheduleAdherence (expected float)
        if "scheduleAdherence" in props and props["scheduleAdherence"] is not None:
            if not isinstance(props["scheduleAdherence"], float):
                try:
                    # Attempt to convert
                    props["scheduleAdherence"] = float(props["scheduleAdherence"])
                except:
                    raise TypeError(f"Property scheduleAdherence must be of type float, got {type(props['scheduleAdherence']).__name__}")
    
        # Type check isCompleted (expected bool)
        if "isCompleted" in props and props["isCompleted"] is not None:
            if not isinstance(props["isCompleted"], bool):
                try:
                    # Attempt to convert
                    props["isCompleted"] = bool(props["isCompleted"])
                except:
                    raise TypeError(f"Property isCompleted must be of type bool, got {type(props['isCompleted']).__name__}")
    
        # Type check weatherDelaysDays (expected int)
        if "weatherDelaysDays" in props and props["weatherDelaysDays"] is not None:
            if not isinstance(props["weatherDelaysDays"], int):
                try:
                    # Attempt to convert
                    props["weatherDelaysDays"] = int(props["weatherDelaysDays"])
                except:
                    raise TypeError(f"Property weatherDelaysDays must be of type int, got {type(props['weatherDelaysDays']).__name__}")
    
        # Type check dailyAverageCost (expected int)
        if "dailyAverageCost" in props and props["dailyAverageCost"] is not None:
            if not isinstance(props["dailyAverageCost"], int):
                try:
                    # Attempt to convert
                    props["dailyAverageCost"] = int(props["dailyAverageCost"])
                except:
                    raise TypeError(f"Property dailyAverageCost must be of type int, got {type(props['dailyAverageCost']).__name__}")
    
        # Type check originalScheduledEnd (expected object)
        if "originalScheduledEnd" in props and props["originalScheduledEnd"] is not None:
            if not isinstance(props["originalScheduledEnd"], object):
                try:
                    # Attempt to convert
                    props["originalScheduledEnd"] = object(props["originalScheduledEnd"])
                except:
                    raise TypeError(f"Property originalScheduledEnd must be of type object, got {type(props['originalScheduledEnd']).__name__}")
    
        # Type check publicationDateTime (expected object)
        if "publicationDateTime" in props and props["publicationDateTime"] is not None:
            if not isinstance(props["publicationDateTime"], object):
                try:
                    # Attempt to convert
                    props["publicationDateTime"] = object(props["publicationDateTime"])
                except:
                    raise TypeError(f"Property publicationDateTime must be of type object, got {type(props['publicationDateTime']).__name__}")
    
        # Type check isPublished (expected bool)
        if "isPublished" in props and props["isPublished"] is not None:
            if not isinstance(props["isPublished"], bool):
                try:
                    # Attempt to convert
                    props["isPublished"] = bool(props["isPublished"])
                except:
                    raise TypeError(f"Property isPublished must be of type bool, got {type(props['isPublished']).__name__}")
    
        # Type check views (expected int)
        if "views" in props and props["views"] is not None:
            if not isinstance(props["views"], int):
                try:
                    # Attempt to convert
                    props["views"] = int(props["views"])
                except:
                    raise TypeError(f"Property views must be of type int, got {type(props['views']).__name__}")
    
        # Type check featuredDurationDays (expected int)
        if "featuredDurationDays" in props and props["featuredDurationDays"] is not None:
            if not isinstance(props["featuredDurationDays"], int):
                try:
                    # Attempt to convert
                    props["featuredDurationDays"] = int(props["featuredDurationDays"])
                except:
                    raise TypeError(f"Property featuredDurationDays must be of type int, got {type(props['featuredDurationDays']).__name__}")
    
        # Type check shares (expected int)
        if "shares" in props and props["shares"] is not None:
            if not isinstance(props["shares"], int):
                try:
                    # Attempt to convert
                    props["shares"] = int(props["shares"])
                except:
                    raise TypeError(f"Property shares must be of type int, got {type(props['shares']).__name__}")
    
        # Type check comments (expected int)
        if "comments" in props and props["comments"] is not None:
            if not isinstance(props["comments"], int):
                try:
                    # Attempt to convert
                    props["comments"] = int(props["comments"])
                except:
                    raise TypeError(f"Property comments must be of type int, got {type(props['comments']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="FOR_MOVIE", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def nominated_for(uuid=None, **props):
        """
        Find relationships of type NOMINATED_FOR matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check presenter2 (expected str)
        if "presenter2" in props and props["presenter2"] is not None:
            if not isinstance(props["presenter2"], str):
                try:
                    # Attempt to convert
                    props["presenter2"] = str(props["presenter2"])
                except:
                    raise TypeError(f"Property presenter2 must be of type str, got {type(props['presenter2']).__name__}")
    
        # Type check announcementTime (expected object)
        if "announcementTime" in props and props["announcementTime"] is not None:
            if not isinstance(props["announcementTime"], object):
                try:
                    # Attempt to convert
                    props["announcementTime"] = object(props["announcementTime"])
                except:
                    raise TypeError(f"Property announcementTime must be of type object, got {type(props['announcementTime']).__name__}")
    
        # Type check presenter1 (expected str)
        if "presenter1" in props and props["presenter1"] is not None:
            if not isinstance(props["presenter1"], str):
                try:
                    # Attempt to convert
                    props["presenter1"] = str(props["presenter1"])
                except:
                    raise TypeError(f"Property presenter1 must be of type str, got {type(props['presenter1']).__name__}")
    
        # Type check ceremony (expected int)
        if "ceremony" in props and props["ceremony"] is not None:
            if not isinstance(props["ceremony"], int):
                try:
                    # Attempt to convert
                    props["ceremony"] = int(props["ceremony"])
                except:
                    raise TypeError(f"Property ceremony must be of type int, got {type(props['ceremony']).__name__}")
    
        # Type check category (expected str)
        if "category" in props and props["category"] is not None:
            if not isinstance(props["category"], str):
                try:
                    # Attempt to convert
                    props["category"] = str(props["category"])
                except:
                    raise TypeError(f"Property category must be of type str, got {type(props['category']).__name__}")
    
        # Type check year (expected int)
        if "year" in props and props["year"] is not None:
            if not isinstance(props["year"], int):
                try:
                    # Attempt to convert
                    props["year"] = int(props["year"])
                except:
                    raise TypeError(f"Property year must be of type int, got {type(props['year']).__name__}")
    
        # Type check isWinner (expected bool)
        if "isWinner" in props and props["isWinner"] is not None:
            if not isinstance(props["isWinner"], bool):
                try:
                    # Attempt to convert
                    props["isWinner"] = bool(props["isWinner"])
                except:
                    raise TypeError(f"Property isWinner must be of type bool, got {type(props['isWinner']).__name__}")
    
        # Type check votesAgainst (expected int)
        if "votesAgainst" in props and props["votesAgainst"] is not None:
            if not isinstance(props["votesAgainst"], int):
                try:
                    # Attempt to convert
                    props["votesAgainst"] = int(props["votesAgainst"])
                except:
                    raise TypeError(f"Property votesAgainst must be of type int, got {type(props['votesAgainst']).__name__}")
    
        # Type check ceremonyDate (expected object)
        if "ceremonyDate" in props and props["ceremonyDate"] is not None:
            if not isinstance(props["ceremonyDate"], object):
                try:
                    # Attempt to convert
                    props["ceremonyDate"] = object(props["ceremonyDate"])
                except:
                    raise TypeError(f"Property ceremonyDate must be of type object, got {type(props['ceremonyDate']).__name__}")
    
        # Type check votesFor (expected int)
        if "votesFor" in props and props["votesFor"] is not None:
            if not isinstance(props["votesFor"], int):
                try:
                    # Attempt to convert
                    props["votesFor"] = int(props["votesFor"])
                except:
                    raise TypeError(f"Property votesFor must be of type int, got {type(props['votesFor']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="NOMINATED_FOR", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]


    def knows(uuid=None, **props):
        """
        Find relationships of type KNOWS matching the given properties.
        
        Parameters
        ----------
        uuid: str, optional
            The UUID of the relationship to find
        **props: Dict
            Additional properties to search for
            
        Returns
        -------
        List[Tuple[Dict, Dict, Dict]]:
            A list of tuples containing (source_node, relationship, target_node)
        """
        search_props = props.copy()
        if uuid is not None:
            search_props['uuid'] = uuid
            
        # Type checking for known properties

        # Type check lastContact (expected object)
        if "lastContact" in props and props["lastContact"] is not None:
            if not isinstance(props["lastContact"], object):
                try:
                    # Attempt to convert
                    props["lastContact"] = object(props["lastContact"])
                except:
                    raise TypeError(f"Property lastContact must be of type object, got {type(props['lastContact']).__name__}")
    
        # Type check relationship (expected str)
        if "relationship" in props and props["relationship"] is not None:
            if not isinstance(props["relationship"], str):
                try:
                    # Attempt to convert
                    props["relationship"] = str(props["relationship"])
                except:
                    raise TypeError(f"Property relationship must be of type str, got {type(props['relationship']).__name__}")
    
        # Type check since (expected object)
        if "since" in props and props["since"] is not None:
            if not isinstance(props["since"], object):
                try:
                    # Attempt to convert
                    props["since"] = object(props["since"])
                except:
                    raise TypeError(f"Property since must be of type object, got {type(props['since']).__name__}")
    
        # Type check nextMeeting (expected object)
        if "nextMeeting" in props and props["nextMeeting"] is not None:
            if not isinstance(props["nextMeeting"], object):
                try:
                    # Attempt to convert
                    props["nextMeeting"] = object(props["nextMeeting"])
                except:
                    raise TypeError(f"Property nextMeeting must be of type object, got {type(props['nextMeeting']).__name__}")
    
        # Type check projects (expected int)
        if "projects" in props and props["projects"] is not None:
            if not isinstance(props["projects"], int):
                try:
                    # Attempt to convert
                    props["projects"] = int(props["projects"])
                except:
                    raise TypeError(f"Property projects must be of type int, got {type(props['projects']).__name__}")
    
        # Type check project1 (expected str)
        if "project1" in props and props["project1"] is not None:
            if not isinstance(props["project1"], str):
                try:
                    # Attempt to convert
                    props["project1"] = str(props["project1"])
                except:
                    raise TypeError(f"Property project1 must be of type str, got {type(props['project1']).__name__}")
    
        # Type check year1 (expected int)
        if "year1" in props and props["year1"] is not None:
            if not isinstance(props["year1"], int):
                try:
                    # Attempt to convert
                    props["year1"] = int(props["year1"])
                except:
                    raise TypeError(f"Property year1 must be of type int, got {type(props['year1']).__name__}")
    
        # Type check year2 (expected int)
        if "year2" in props and props["year2"] is not None:
            if not isinstance(props["year2"], int):
                try:
                    # Attempt to convert
                    props["year2"] = int(props["year2"])
                except:
                    raise TypeError(f"Property year2 must be of type int, got {type(props['year2']).__name__}")
    
        # Type check project2 (expected str)
        if "project2" in props and props["project2"] is not None:
            if not isinstance(props["project2"], str):
                try:
                    # Attempt to convert
                    props["project2"] = str(props["project2"])
                except:
                    raise TypeError(f"Property project2 must be of type str, got {type(props['project2']).__name__}")
    
        # Type check durationYears (expected int)
        if "durationYears" in props and props["durationYears"] is not None:
            if not isinstance(props["durationYears"], int):
                try:
                    # Attempt to convert
                    props["durationYears"] = int(props["durationYears"])
                except:
                    raise TypeError(f"Property durationYears must be of type int, got {type(props['durationYears']).__name__}")
    
        # Type check lastCollaboration (expected object)
        if "lastCollaboration" in props and props["lastCollaboration"] is not None:
            if not isinstance(props["lastCollaboration"], object):
                try:
                    # Attempt to convert
                    props["lastCollaboration"] = object(props["lastCollaboration"])
                except:
                    raise TypeError(f"Property lastCollaboration must be of type object, got {type(props['lastCollaboration']).__name__}")
    
        # Construct and execute the query
        query, params = Queries.edge(type="KNOWS", **search_props)
        results = _query(query, params)
        return [(_neo4j_node_to_dict(r['source']), 
                 _neo4j_relationship_to_dict(r['r']), 
                 _neo4j_node_to_dict(r['target'])) for r in results]



# Create the interface instances
nodes = Nodes()
edges = Edges()

def connect():
    """
    Create a new authenticated driver connection to the Neo4j database.
    
    Returns
    -------
    neo4j.Driver:
        A connected Neo4j driver instance
    """
    return _authenticated_driver(NEO4J_URI, NEO4J_USERNAME, NEO4J_PASSWORD)

def execute_query(query, params=None):
    """
    Execute a raw Cypher query against the Neo4j database.
    
    Parameters
    ----------
    query: str
        The Cypher query to execute
    params: Dict, optional
        Parameters for the query
        
    Returns
    -------
    List[Dict]:
        Results from the query
    """
    return _query(query, params)

def server_timestamp():
    """
    Get the current timestamp from the Neo4j server.
    
    Returns
    -------
    str:
        ISO-formatted timestamp
    """
    return _server_timestamp()

