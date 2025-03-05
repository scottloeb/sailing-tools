// Create more movies connected to existing people, studios, and other entities

// Add sequel to The Godfather that connects to existing actors and director
CREATE (TheGodfather2:Movie:GeneratedByClaudeAI {
    title: 'The Godfather: Part II',
    released: 1974,
    tagline: 'I don\'t feel I have to wipe everybody out, Tom. Just my enemies.',
    budget: 13000000,
    revenue: 93000000,
    runtime_minutes: 202,
    rating_avg: 9.0,
    releaseDate: date('1974-12-20'),
    digitalRestoration: datetime('2008-09-23T00:00:00Z'),
    isOscarWinner: true,
    isPreservationRegistry: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'The Godfather: Part II'})
SET m.ratings = [9.1, 9.0, 9.0, 8.9]
SET m.genres = ['crime', 'drama']
SET m.certifications = ['R', '18']
SET m.filmingLocationLat = [40.7128, 37.7749, 23.1136]
SET m.filmingLocationLong = [-74.0060, -122.4194, -82.3666]
SET m.boxOfficeNA = 57300000
SET m.boxOfficeInternational = 35700000
SET m.preservationRegistry = 'National Film Registry'
SET m.culturalImpact = 'Sequel surpassing original';

// Connect Godfather 2 to existing people and studio
MATCH 
  (f:Person:GeneratedByClaudeAI {name: 'Francis Ford Coppola'}),
  (g2:Movie:GeneratedByClaudeAI {title: 'The Godfather: Part II'})
CREATE (f)-[:DIRECTED {
    year: 1974,
    daysOnSet: 125,
    satisfaction: 4.9,
    awardNominations: 11,
    awardWins: 6,
    completionDate: date('1974-10-15'),
    premiereEvent: datetime('1974-12-12T20:00:00-05:00'),
    durationMonths: 5,
    sequelPressure: 'Extreme',
    creativeControl: 'Complete'
}]->(g2);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Al Pacino'}),
  (g2:Movie:GeneratedByClaudeAI {title: 'The Godfather: Part II'})
CREATE (a)-[:ACTED_IN {
    roles: ['Michael Corleone'],
    salary: 500000,
    screenTimeMinutes: 140,
    startDate: date('1973-10-01'),
    endDate: date('1974-03-15'),
    scheduleConflicts: false,
    criticScore: 99,
    audienceScore: 96,
    awardNominations: 4,
    awardWins: 0,
    characterEvolution: 'Significant darkness'
}]->(g2);

MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'}),
  (g2:Movie:GeneratedByClaudeAI {title: 'The Godfather: Part II'})
CREATE (p)-[:PRODUCED {
    investment: 13000000,
    return: 93000000,
    roi: 7.15,
    contractSigned: date('1972-12-15'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 4000000,
    isProfitable: true,
    marketingStart: datetime('1974-09-15T00:00:00Z'),
    sequelStrategy: 'Quality over commercialism'
}]->(g2);

// Connect Godfather 2 to awards
MATCH
  (g2:Movie:GeneratedByClaudeAI {title: 'The Godfather: Part II'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (g2)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 1975,
    ceremony: 47,
    isWinner: true,
    ceremonyDate: date('1975-04-08'),
    announcementTime: localtime('21:45:00'),
    votesFor: 4125,
    votesAgainst: 1450,
    historicalSignificance: 'First sequel to win Best Picture',
    totalOscars: 6
}]->(a);

// Add another Christopher Nolan film connecting to existing entities
CREATE (Inception:Movie:GeneratedByClaudeAI {
    title: 'Inception',
    released: 2010,
    tagline: 'Your mind is the scene of the crime',
    budget: 160000000,
    revenue: 836800000,
    runtime_minutes: 148,
    rating_avg: 8.8,
    releaseDate: date('2010-07-16'),
    digitalRelease: datetime('2010-12-03T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Inception'})
SET m.ratings = [8.8, 8.7, 8.9, 8.8]
SET m.genres = ['sci-fi', 'action', 'thriller']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [40.7128, 49.2827, 48.8566]
SET m.filmingLocationLong = [-74.0060, -123.1207, 2.3522]
SET m.boxOfficeNA = 292576195
SET m.boxOfficeEurope = 273417430
SET m.boxOfficeAsia = 159265823
SET m.boxOfficeOther = 111540552
SET m.dreamLevels = 4;

// Connect Inception to Nolan, DiCaprio and Warner Bros
MATCH 
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (c)-[:DIRECTED {
    year: 2010,
    daysOnSet: 140,
    satisfaction: 4.9,
    awardNominations: 8,
    awardWins: 4,
    completionDate: date('2010-04-15'),
    premiereEvent: datetime('2010-07-08T19:30:00+01:00'),
    durationMonths: 6,
    originalConcept: true,
    scriptDevelopmentYears: 10
}]->(i);

MATCH
  (l:Person {name: 'Leonardo DiCaprio'}), // From original graph
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (l)-[:ACTED_IN {
    roles: ['Dom Cobb'],
    salary: 20000000,
    screenTimeMinutes: 125,
    startDate: date('2009-07-15'),
    endDate: date('2009-12-22'),
    scheduleConflicts: false,
    criticScore: 95,
    audienceScore: 93,
    awardNominations: 6,
    awardWins: 2,
    psychologicalPreparation: 'Extensive'
}]->(i);

MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (w)-[:PRODUCED {
    investment: 160000000,
    return: 836800000,
    roi: 5.23,
    contractSigned: date('2008-12-01'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 100000000,
    isProfitable: true,
    marketingStart: datetime('2010-01-15T00:00:00Z'),
    marketingInnovation: 'Viral mystery campaign'
}]->(i);

// Also connect Marion Cotillard and Cillian Murphy to Inception
MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Marion Cotillard'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (m)-[:ACTED_IN {
    roles: ['Mal Cobb'],
    salary: 3500000,
    screenTimeMinutes: 35,
    startDate: date('2009-08-10'),
    endDate: date('2009-11-15'),
    scheduleConflicts: false,
    criticScore: 96,
    audienceScore: 94,
    characterDepth: 'Psychological antagonist',
    emotionalImpact: 'Haunting'
}]->(i);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Cillian Murphy'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (c)-[:ACTED_IN {
    roles: ['Robert Fischer'],
    salary: 2500000,
    screenTimeMinutes: 42,
    startDate: date('2009-08-05'),
    endDate: date('2009-11-10'),
    scheduleConflicts: false,
    criticScore: 93,
    audienceScore: 92,
    characterComplexity: 'Target and protagonist',
    reunionWithDirector: true
}]->(i);

// Add a James Cameron movie prior to Titanic
CREATE (Aliens:Movie:GeneratedByClaudeAI {
    title: 'Aliens',
    released: 1986,
    tagline: 'This time it\'s war',
    budget: 18500000,
    revenue: 183300000,
    runtime_minutes: 137,
    rating_avg: 8.4,
    releaseDate: date('1986-07-18'),
    digitalRestoration: datetime('2003-12-02T00:00:00Z'),
    isOscarWinner: true,
    sequelNumber: 2
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Aliens'})
SET m.ratings = [8.4, 8.5, 8.3, 8.4]
SET m.genres = ['sci-fi', 'action', 'thriller']
SET m.certifications = ['R', '18']
SET m.filmingLocationLat = [51.5072, 51.4964, 51.6032]
SET m.filmingLocationLong = [-0.1276, -0.1446, -0.0515]
SET m.boxOfficeNA = 85160248
SET m.boxOfficeInternational = 98139752
SET m.specialEffectsAwards = 1
SET m.practicalEffectsPercentage = 95;

// Connect Aliens to James Cameron and 20th Century Fox
MATCH 
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'}),
  (a:Movie:GeneratedByClaudeAI {title: 'Aliens'})
CREATE (j)-[:DIRECTED {
    year: 1986,
    daysOnSet: 96,
    satisfaction: 4.7,
    awardNominations: 7,
    awardWins: 2,
    completionDate: date('1986-04-30'),
    premiereEvent: datetime('1986-07-14T19:30:00+01:00'),
    durationMonths: 4,
    studioConflicts: true,
    directorStyleForming: 'Technical innovation with character depth'
}]->(a);

MATCH
  (t:Studio:GeneratedByClaudeAI {name: 'TwentiethCenturyFox'}),
  (a:Movie:GeneratedByClaudeAI {title: 'Aliens'})
CREATE (t)-[:PRODUCED {
    investment: 18500000,
    return: 183300000,
    roi: 9.91,
    contractSigned: date('1985-04-15'),
    studioShare: 0.7,
    directorShare: 0.15,
    producerShare: 0.1,
    topCastShare: 0.05,
    marketingBudget: 10000000,
    isProfitable: true,
    marketingStart: datetime('1986-03-15T00:00:00Z'),
    franchiseRevival: true
}]->(a);

// Add a Quentin Tarantino film connected to Uma Thurman
CREATE (KillBill:Movie:GeneratedByClaudeAI {
    title: 'Kill Bill: Vol. 1',
    released: 2003,
    tagline: 'Revenge is a dish best served cold',
    budget: 30000000,
    revenue: 180900000,
    runtime_minutes: 111,
    rating_avg: 8.2,
    releaseDate: date('2003-10-10'),
    digitalRelease: datetime('2004-04-13T00:00:00Z'),
    isOscarWinner: false,
    volumeNumber: 1
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Kill Bill: Vol. 1'})
SET m.ratings = [8.2, 8.1, 8.3, 8.2]
SET m.genres = ['action', 'crime', 'thriller']
SET m.certifications = ['R', '18']
SET m.filmingLocationLat = [34.0522, 35.0116, 35.6762]
SET m.filmingLocationLong = [-118.2437, 135.7681, 139.6503]
SET m.boxOfficeNA = 70099045
SET m.boxOfficeInternational = 110800955
SET m.martialArtsStyles = ['Kung Fu', 'Kenjutsu', 'Aikido']
SET m.homageFilms = ['Lady Snowblood', 'Game of Death', 'Samurai fiction'];

// Connect Kill Bill to Tarantino, Thurman and Miramax
MATCH 
  (q:Person:GeneratedByClaudeAI {name: 'Quentin Tarantino'}),
  (k:Movie:GeneratedByClaudeAI {title: 'Kill Bill: Vol. 1'})
CREATE (q)-[:DIRECTED {
    year: 2003,
    daysOnSet: 110,
    satisfaction: 4.9,
    awardNominations: 5,
    awardWins: 2,
    completionDate: date('2003-06-30'),
    premiereEvent: datetime('2003-09-29T19:00:00+02:00'),
    durationMonths: 5,
    genreBlending: 'Martial arts, spaghetti western, samurai',
    homageLevel: 'Extensive'
}]->(k);

MATCH
  (u:Person:GeneratedByClaudeAI {name: 'Uma Thurman'}),
  (k:Movie:GeneratedByClaudeAI {title: 'Kill Bill: Vol. 1'})
CREATE (u)-[:ACTED_IN {
    roles: ['The Bride/Beatrix Kiddo'],
    salary: 12000000,
    screenTimeMinutes: 95,
    startDate: date('2002-06-30'),
    endDate: date('2002-11-25'),
    scheduleConflicts: false,
    criticScore: 97,
    audienceScore: 94,
    awardNominations: 4,
    awardWins: 1,
    martialArtsTraining: 'Intensive 3-month program',
    characterIconicity: 'Instant classic'
}]->(k);

MATCH
  (m:Studio:GeneratedByClaudeAI {name: 'Miramax Films'}),
  (k:Movie:GeneratedByClaudeAI {title: 'Kill Bill: Vol. 1'})
CREATE (m)-[:PRODUCED {
    investment: 30000000,
    return: 180900000,
    roi: 6.03,
    contractSigned: date('2001-12-15'),
    studioShare: 0.55,
    directorShare: 0.25,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 25000000,
    isProfitable: true,
    marketingStart: datetime('2003-05-15T00:00:00Z'),
    twoPartRelease: true
}]->(k);

// Add a film starring Keanu Reeves that connects to the existing graph
CREATE (Matrix:Movie:GeneratedByClaudeAI {
    title: 'The Matrix',
    released: 1999,
    tagline: 'Welcome to the real world',
    budget: 63000000,
    revenue: 463517383,
    runtime_minutes: 136,
    rating_avg: 8.7,
    releaseDate: date('1999-03-31'),
    digitalRelease: datetime('1999-10-21T00:00:00Z'),
    isOscarWinner: true,
    visualEffectsBreakthrough: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'The Matrix'})
SET m.ratings = [8.7, 8.7, 8.8, 8.6]
SET m.genres = ['sci-fi', 'action']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [-33.8688, -33.9680, -33.8882]
SET m.filmingLocationLong = [151.2093, 151.1054, 151.1875]
SET m.boxOfficeNA = 171479930
SET m.boxOfficeInternational = 292037453
SET m.specialEffectsAwards = 4
SET m.culturalImpact = 'Revolutionary';

// Connect The Matrix to existing studios and new actors
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (m:Movie:GeneratedByClaudeAI {title: 'The Matrix'})
CREATE (w)-[:PRODUCED {
    investment: 63000000,
    return: 463517383,
    roi: 7.36,
    contractSigned: date('1997-08-15'),
    studioShare: 0.7,
    directorShare: 0.1,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 45000000,
    isProfitable: true,
    marketingStart: datetime('1999-01-15T00:00:00Z'),
    riskAssessment: 'High',
    gamblePayoff: 'Extraordinary'
}]->(m);

// Create a Keanu Reeves node and connect to The Matrix
CREATE (KeanuReeves:Person:GeneratedByClaudeAI {
    name: 'Keanu Reeves',
    born: 1964,
    birthdate: date('1964-09-02'),
    nationality: 'Canadian',
    oscarNominations: 0,
    isActive: true,
    firstFilm: datetime('1986-04-11T00:00:00Z'),
    heightInMeters: 1.86,
    netWorth: 380000000,
    martialArtsTraining: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Keanu Reeves'})
SET p.languages = ['English']
SET p.filmography_titles = ['The Matrix', 'Speed', 'John Wick']
SET p.filmography_years = [1999, 1994, 2014]
SET p.filmography_roles = ['Neo', 'Jack Traven', 'John Wick'];

MATCH
  (k:Person:GeneratedByClaudeAI {name: 'Keanu Reeves'}),
  (m:Movie:GeneratedByClaudeAI {title: 'The Matrix'})
CREATE (k)-[:ACTED_IN {
    roles: ['Neo'],
    salary: 10000000,
    screenTimeMinutes: 112,
    startDate: date('1998-03-31'),
    endDate: date('1998-08-25'),
    scheduleConflicts: false,
    criticScore: 96,
    audienceScore: 95,
    martialArtsTraining: '4 months intensive',
    stuntPercentage: 80,
    careerDefiningRole: true
}]->(m);

// Add a connection between Keanu and Hugo Weaving from the original graph
MATCH
  (k:Person:GeneratedByClaudeAI {name: 'Keanu Reeves'}),
  (h:Person {name: 'Hugo Weaving'}) // From original graph
CREATE (k)-[:WORKED_WITH {
    projects: 4,
    firstProject: 'The Matrix',
    firstYear: 1999,
    chemistry: 4.8,
    interviews: 35,
    relationship: 'Co-stars',
    iconic_confrontations: 'Multiple',
    screen_fights: 12
}]->(h);

// Add one of Ang Lee's earlier films
CREATE (SenseAndSensibility:Movie:GeneratedByClaudeAI {
    title: 'Sense and Sensibility',
    released: 1995,
    tagline: 'Lose your heart and come to your senses',
    budget: 16500000,
    revenue: 134993774,
    runtime_minutes: 136,
    rating_avg: 7.7,
    releaseDate: date('1995-12-13'),
    digitalRelease: datetime('1996-07-23T00:00:00Z'),
    isOscarWinner: true,
    isAdaptation: true,
    sourceAuthor: 'Jane Austen'
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Sense and Sensibility'})
SET m.ratings = [7.6, 7.8, 7.7, 7.7]
SET m.genres = ['drama', 'romance']
SET m.certifications = ['PG', 'U']
SET m.filmingLocationLat = [50.3465, 51.2798, 50.7184]
SET m.filmingLocationLong = [-4.1122, -0.5842, -3.5339]
SET m.boxOfficeNA = 43182776
SET m.boxOfficeInternational = 91810998
SET m.periodAccuracy = 'Highly authentic'
SET m.adaptationFidelity = 'High with creative license';

// Connect Sense and Sensibility to Ang Lee and Columbia Pictures
MATCH 
  (a:Person:GeneratedByClaudeAI {name: 'Ang Lee'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Sense and Sensibility'})
CREATE (a)-[:DIRECTED {
    year: 1995,
    daysOnSet: 85,
    satisfaction: 4.8,
    awardNominations: 7,
    awardWins: 1,
    completionDate: date('1995-08-10'),
    premiereEvent: datetime('1995-11-27T19:30:00Z'),
    durationMonths: 3,
    genreDeparture: true,
    crossCulturalInsight: 'Eastern perspective on Western classic'
}]->(s);

MATCH
  (s:Studio {name: 'Columbia Pictures'}), // From original graph
  (ss:Movie:GeneratedByClaudeAI {title: 'Sense and Sensibility'})
CREATE (s)-[:PRODUCED {
    investment: 16500000,
    return: 134993774,
    roi: 8.18,
    contractSigned: date('1994-04-15'),
    studioShare: 0.65,
    directorShare: 0.1,
    producerShare: 0.15,
    topCastShare: 0.1,
    marketingBudget: 12000000,
    isProfitable: true,
    marketingStart: datetime('1995-09-15T00:00:00Z'),
    periodDramaApproach: 'Fresh perspective'
}]->(ss);

// Add Emma Thompson as screenwriter and actor
CREATE (EmmaThompson:Person:GeneratedByClaudeAI {
    name: 'Emma Thompson',
    born: 1959,
    birthdate: date('1959-04-15'),
    nationality: 'British',
    oscarWins: 2,
    oscarNominations: 5,
    isActive: true,
    firstFilm: datetime('1989-11-17T00:00:00Z'),
    heightInMeters: 1.73,
    netWorth: 40000000,
    writerSkill: 9.6
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Emma Thompson'})
SET p.languages = ['English', 'French']
SET p.filmography_titles = ['Sense and Sensibility', 'Howards End', 'Love Actually']
SET p.filmography_years = [1995, 1992, 2003]
SET p.filmography_roles = ['Elinor Dashwood', 'Margaret Schlegel', 'Karen']
SET p.adaptationCredits = ['Sense and Sensibility', 'Bridget Jones\'s Diary', 'Nanny McPhee'];

MATCH
  (e:Person:GeneratedByClaudeAI {name: 'Emma Thompson'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Sense and Sensibility'})
CREATE (e)-[:ACTED_IN {
    roles: ['Elinor Dashwood'],
    salary: 1000000,
    screenTimeMinutes: 98,
    startDate: date('1994-04-15'),
    endDate: date('1994-07-22'),
    scheduleConflicts: false,
    criticScore: 97,
    audienceScore: 94,
    awardNominations: 2,
    awardWins: 0,
    period_costume_discomfort: 'Significant'
}]->(s);

MATCH
  (e:Person:GeneratedByClaudeAI {name: 'Emma Thompson'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Sense and Sensibility'})
CREATE (e)-[:WROTE {
    year: 1995,
    draftCount: 16,
    writingStartDate: date('1991-06-15'),
    writingCompletionDate: date('1994-02-20'),
    adaptationSource: 'Jane Austen novel',
    fidelityBalance: 'Faithful with accessibility',
    awardNominations: 5,
    awardWins: 1,
    adaptationYears: 3,
    diaryKept: true
}]->(s);

// Add a connection between Sofia Coppola and Francis Ford Coppola (father-daughter)
MATCH
  (f:Person:GeneratedByClaudeAI {name: 'Francis Ford Coppola'}),
  (s:Person:GeneratedByClaudeAI {name: 'Sofia Coppola'})
CREATE (f)-[:PARENT_OF {
    childBorn: date('1971-05-14'),
    firstCollaboration: 'The Godfather Part III',
    firstCollaborationYear: 1990,
    mentorRelationship: true,
    influenceLevel: 'Significant but distinct styles',
    publicDiscussions: 15,
    jointInterviews: 8,
    familyLegacy: 'Multigenerational filmmaking'
}]->(s);

// Add another Christopher Nolan film with recurring collaborator Cillian Murphy
CREATE (Dunkirk:Movie:GeneratedByClaudeAI {
    title: 'Dunkirk',
    released: 2017,
    tagline: 'Survival is victory',
    budget: 100000000,
    revenue: 526900000,
    runtime_minutes: 106,
    rating_avg: 7.8,
    releaseDate: date('2017-07-21'),
    digitalRelease: datetime('2017-12-12T00:00:00Z'),
    isOscarWinner: true,
    iMAXFilming: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Dunkirk'})
SET m.ratings = [7.9, 7.7, 7.8, 7.8]
SET m.genres = ['war', 'action', 'drama', 'history']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [51.0383, 51.2254, 50.9730]
SET m.filmingLocationLong = [2.3775, 1.4851, 1.8654]
SET m.boxOfficeNA = 188042171
SET m.boxOfficeInternational = 338857829
SET m.iMAXPercentage = 70
SET m.historicalAccuracy = 'High with dramatic license';

// Connect Dunkirk to Nolan, Murphy and Warner Bros
MATCH 
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (d:Movie:GeneratedByClaudeAI {title: 'Dunkirk'})
CREATE (c)-[:DIRECTED {
    year: 2017,
    daysOnSet: 110,
    satisfaction: 4.9,
    awardNominations: 8,
    awardWins: 3,
    completionDate: date('2017-04-10'),
    premiereEvent: datetime('2017-07-13T19:30:00+01:00'),
    durationMonths: 4,
    iMAXInnovation: 'Custom camera mounts',
    practicalEffectsPercentage: 80
}]->(d);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Cillian Murphy'}),
  (d:Movie:GeneratedByClaudeAI {title: 'Dunkirk'})
CREATE (c)-[:ACTED_IN {
    roles: ['Shivering Soldier'],
    salary: 4000000,
    screenTimeMinutes: 22,
    startDate: date('2016-05-25'),
    endDate: date('2016-07-15'),
    scheduleConflicts: false,
    criticScore: 94,
    audienceScore: 92,
    physicalDemands: 'Extreme exposure to elements',
    collaborationNumber: 5
}]->(d);

MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (d:Movie:GeneratedByClaudeAI {title: 'Dunkirk'})
CREATE (w)-[:PRODUCED {
    investment: 100000000,
    return: 526900000,
    roi: 5.27,
    contractSigned: date('2015-12-15'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 80000000,
    isProfitable: true,
    marketingStart: datetime('2016-12-14T00:00:00Z'),
    marketingApproach: 'Historical significance and visceral experience'
}]->(d);

// Add another James Cameron film - connecting to studios
CREATE (Terminator2:Movie:GeneratedByClaudeAI {
    title: 'Terminator 2: Judgment Day',
    released: 1991,
    tagline: 'Same Make. Same Model. New Mission.',
    budget: 102000000,
    revenue: 520000000,
    runtime_minutes: 137,
    rating_avg: 8.6,
    releaseDate: date('1991-07-03'),
    digitalRestoration: datetime('2017-08-29T00:00:00Z'),
    isOscarWinner: true,
    specialEffectsBreakthrough: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Terminator 2: Judgment Day'})
SET m.ratings = [8.6, 8.5, 8.7, 8.6]
SET m.genres = ['action', 'sci-fi']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [34.0522, 34.4858, 32.7157]
SET m.filmingLocationLong = [-118.2437, -118.1431, -117.1611]
SET m.boxOfficeNA = 204843350
SET m.boxOfficeInternational = 315156650
SET m.specialEffectsAwards = 2
SET m.cgiBreakthroughs = ['Liquid metal T-1000', 'Digital human motion'];

// Connect Terminator 2 to Cameron and appropriate studios
MATCH 
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'}),
  (t:Movie:GeneratedByClaudeAI {title: 'Terminator 2: Judgment Day'})
CREATE (j)-[:DIRECTED {
    year: 1991,
    daysOnSet: 120,
    satisfaction: 4.9,
    awardNominations: 6,
    awardWins: 4,
    completionDate: date('1991-05-08'),
    premiereEvent: datetime('1991-07-01T19:30:00-07:00'),
    durationMonths: 6,
    sequelVision: 'Technological and thematic expansion',
    technicalInnovations: 'Revolutionary CGI integration'
}]->(t);

// Connect with TriStar Pictures (exists in original graph)
MATCH
  (s:Studio {name: 'TriStar Pictures'}), // From original graph
  (t:Movie:GeneratedByClaudeAI {title: 'Terminator 2: Judgment Day'})
CREATE (s)-[:PRODUCED {
    investment: 102000000,
    return: 520000000,
    roi: 5.10,
    contractSigned: date('1990-02-15'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 60000000,
    isProfitable: true,
    marketingStart: datetime('1991-01-15T00:00:00Z'),
    riskAssessment: 'Very high budget for the time',
    payoff: 'Established new blockbuster template'
}]->(t);

// Add a connection from Arnold Schwarzenegger
CREATE (ArnoldSchwarzenegger:Person:GeneratedByClaudeAI {
    name: 'Arnold Schwarzenegger',
    born: 1947,
    birthdate: date('1947-07-30'),
    nationality: 'Austrian-American',
    oscarNominations: 0,
    isActive: true,
    firstFilm: datetime('1970-11-20T00:00:00Z'),
    heightInMeters: 1.88,
    netWorth: 450000000,
    politicalCareer: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Arnold Schwarzenegger'})
SET p.languages = ['English', 'German']
SET p.filmography_titles = ['Terminator 2: Judgment Day', 'Predator', 'Total Recall']
SET p.filmography_years = [1991, 1987, 1990]
SET p.filmography_roles = ['Terminator', 'Dutch', 'Douglas Quaid/Hauser']
SET p.governorYears = '2003-2011';

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Arnold Schwarzenegger'}),
  (t:Movie:GeneratedByClaudeAI {title: 'Terminator 2: Judgment Day'})
CREATE (a)-[:ACTED_IN {
    roles: ['Terminator/T-800/Model 101'],
    salary: 15000000,
    screenTimeMinutes: 94,
    startDate: date('1990-10-09'),
    endDate: date('1991-03-28'),
    scheduleConflicts: false,
    criticScore: 98,
    audienceScore: 96,
    catchphraseIconicity: 'Extremely high',
    stuntPercentage: 60,
    physicalTraining: 'Intensive',
    characterReversal: 'Villain to hero'
}]->(t);

// Create a connection from Terminator 2 to The Matrix (influence relationship)
MATCH
  (t:Movie:GeneratedByClaudeAI {title: 'Terminator 2: Judgment Day'}),
  (m:Movie:GeneratedByClaudeAI {title: 'The Matrix'})
CREATE (t)-[:INFLUENCED {
    aspectsInfluenced: ['Visual effects innovation', 'Action choreography', 'Man vs. machine themes'],
    influenceStrength: 'Significant',
    technicalInfluence: 'CGI revolution',
    directorsAcknowledged: true,
    academicRecognition: 'Extensively documented',
    styleContinuity: 'Genre-defining visual language',
    industryImpact: 'Established new blockbuster paradigm'
}]->(m);

// Create connections between actors across productions
MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Arnold Schwarzenegger'}),
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'})
CREATE (a)-[:COLLABORATED_WITH {
    projects: 3,
    firstProject: 'The Terminator',
    firstYear: 1984,
    lastProject: 'Terminator 2: Judgment Day',
    lastYear: 1991,
    publicPerception: 'Legendary partnership',
    financialSuccess: 'Extremely high',
    genreDefining: true,
    iconicCharacters: 1
}]->(j);

// Add a Japanese film to connect with international cinema
CREATE (SevenSamurai:Movie:GeneratedByClaudeAI {
    title: 'Seven Samurai',
    released: 1954,
    tagline: 'The Masterpiece of Japanese Cinema',
    budget: 500000,
    revenue: 2800000,
    runtime_minutes: 207,
    rating_avg: 8.6,
    releaseDate: date('1954-04-26'),
    digitalRestoration: datetime('2006-10-05T00:00:00Z'),
    isOscarWinner: false,
    isPreservationRegistry: true,
    isInternational: true,
    originalLanguage: 'Japanese'
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Seven Samurai'})
SET m.ratings = [8.6, 8.7, 8.5, 8.6]
SET m.genres = ['action', 'drama', 'adventure']
SET m.certifications = ['Not Rated', 'PG']
SET m.filmingLocationLat = [36.2048, 35.6762, 34.9768]
SET m.filmingLocationLong = [138.2529, 139.6503, 138.3831]
SET m.boxOfficeNA = 833533
SET m.boxOfficeInternational = 1966467
SET m.filmPreservation = 'Criterion Collection'
SET m.westernRemakes = 'The Magnificent Seven';

// Create Akira Kurosawa and connect to Seven Samurai
CREATE (AkiraKurosawa:Person:GeneratedByClaudeAI {
    name: 'Akira Kurosawa',
    born: 1910,
    died: 1998,
    birthdate: date('1910-03-23'),
    deathdate: date('1998-09-06'),
    nationality: 'Japanese',
    oscarWins: 1,
    oscarNominations: 4,
    isActive: false,
    firstFilm: datetime('1943-03-25T00:00:00Z'),
    lastFilm: datetime('1993-12-18T00:00:00Z'),
    careerLength: duration({years: 50}),
    paintingBackground: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Akira Kurosawa'})
SET p.languages = ['Japanese', 'English']
SET p.filmography_titles = ['Seven Samurai', 'Rashomon', 'Ran']
SET p.filmography_years = [1954, 1950, 1985]
SET p.westernInfluence = 'John Ford'
SET p.globalInfluence = 'Profound';

MATCH 
  (a:Person:GeneratedByClaudeAI {name: 'Akira Kurosawa'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Seven Samurai'})
CREATE (a)-[:DIRECTED {
    year: 1954,
    daysOnSet: 148,
    satisfaction: 4.9,
    awardNominations: 2,
    awardWins: 1,
    completionDate: date('1954-03-01'),
    premiereEvent: datetime('1954-04-26T18:30:00+09:00'),
    durationMonths: 14,
    weatherChallenges: true,
    militaryPrecision: 'Legendary',
    paintingStoryboards: true
}]->(s);

// Create Toshiro Mifune and connect to Seven Samurai
CREATE (ToshiroMifune:Person:GeneratedByClaudeAI {
    name: 'Toshiro Mifune',
    born: 1920,
    died: 1997,
    birthdate: date('1920-04-01'),
    deathdate: date('1997-12-24'),
    nationality: 'Japanese',
    oscarNominations: 0,
    isActive: false,
    firstFilm: datetime('1947-05-15T00:00:00Z'),
    lastFilm: datetime('1995-11-22T00:00:00Z'),
    careerLength: duration({years: 48}),
    collaborationsWithKurosawa: 16
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Toshiro Mifune'})
SET p.languages = ['Japanese', 'English']
SET p.filmography_titles = ['Seven Samurai', 'Rashomon', 'Throne of Blood']
SET p.filmography_years = [1954, 1950, 1957]
SET p.filmography_roles = ['Kikuchiyo', 'Tajomaru', 'Taketoki Washizu']
SET p.actingStyle = 'Intense physical expression';

MATCH
  (t:Person:GeneratedByClaudeAI {name: 'Toshiro Mifune'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Seven Samurai'})
CREATE (t)-[:ACTED_IN {
    roles: ['Kikuchiyo'],
    salary: 3500,
    screenTimeMinutes: 112,
    startDate: date('1952-12-15'),
    endDate: date('1953-12-01'),
    scheduleConflicts: false,
    criticScore: 99,
    audienceScore: 97,
    physicalDemands: 'Extreme',
    swordTraining: 'Extensive',
    improvisationLevel: 'Significant'
}]->(s);

// Create connections showing international influence
MATCH
  (s:Movie:GeneratedByClaudeAI {title: 'Seven Samurai'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Crouching Tiger, Hidden Dragon'})
CREATE (s)-[:INFLUENCED {
    aspectsInfluenced: ['Action choreography', 'Warrior code themes', 'Visual composition'],
    influenceStrength: 'Significant',
    technicalInfluence: 'Combat staging and cinematography',
    directorsAcknowledged: true,
    academicRecognition: 'Extensively documented',
    eastAsianCinemaLegacy: 'Foundational',
    crossCulturalImpact: 'Bridge between Japan and China film traditions'
}]->(c);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Akira Kurosawa'}),
  (g:Person:GeneratedByClaudeAI {name: 'Francis Ford Coppola'})
CREATE (a)-[:INFLUENCED {
    startYear: 1969,
    directInfluence: true,
    publicAcknowledgement: true,
    cinematic_techniques: ['Composition', 'Movement', 'Weather as metaphor'],
    narrativeApproaches: ['Character study', 'Power dynamics', 'Visual storytelling'],
    laterSupport: 'Financial backing for Kagemusha',
    mutualRespect: 'Profound'
}]->(g);