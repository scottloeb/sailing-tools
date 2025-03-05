// Create a new movie with various data types
CREATE (Inception:Movie:GeneratedByClaudeAI {
    title: 'Inception',
    released: 2010,
    tagline: 'Your mind is the scene of the crime',
    budget: 160000000,
    revenue: 836800000,
    runtime_minutes: 148,
    rating_avg: 8.9,
    releaseDate: date('2010-07-16'),
    digitalRelease: datetime('2010-12-03T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Inception'})
SET m.ratings = [8.8, 9.2, 8.7, 8.9]
SET m.genres = ['sci-fi', 'action', 'thriller']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [37.7749, 48.8566, -33.8688]
SET m.filmingLocationLong = [-122.4194, 2.3522, 151.2093]
SET m.boxOfficeNA = 292576195
SET m.boxOfficeEurope = 273417430
SET m.boxOfficeAsia = 159265823
SET m.boxOfficeOther = 111540552;

// Create a director with temporal, boolean, spatial data types
CREATE (ChristopherN:Person:GeneratedByClaudeAI {
    name: 'Christopher Nolan',
    born: 1970,
    birthdate: date('1970-07-30'),
    nationality: 'British-American',
    oscarNominations: 5,
    activeYears: duration({years: 25}),
    isActive: true,
    residenceLat: 34.0522,
    residenceLong: -118.2437,
    lastDirected: datetime('2023-07-21T00:00:00Z'),
    typicalFilmLengthHrs: 2.5
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'})
SET p.preferredAspectRatios = ['2.20:1', '2.35:1', '1.43:1']
SET p.collaborators = ['Hans Zimmer', 'Hoyte van Hoytema', 'Lee Smith'];

// Create an actor with mixed data types
CREATE (LeonardoD:Person:GeneratedByClaudeAI {
    name: 'Leonardo DiCaprio',
    born: 1974, 
    birthdate: date('1974-11-11'),
    oscarWins: 1,
    oscarNominations: 7,
    netWorth: 260000000,
    isActive: true,
    heightInMeters: 1.83,
    firstOscarWin: date('2016-02-28'),
    actingRangeScore: 9.5,
    typicalShootScheduleMonths: 4
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Leonardo DiCaprio'})
SET p.languages = ['English', 'Italian']
SET p.residenceLats = [34.0522, 40.7128]
SET p.residenceLongs = [-118.2437, -74.0060]
SET p.filmCountDrama = 12
SET p.filmCountThriller = 8
SET p.filmCountCrime = 5
SET p.filmCountRomance = 3
SET p.filmCountWestern = 1;

// Create another actress with additional temporal data
CREATE (MarionC:Person:GeneratedByClaudeAI {
    name: 'Marion Cotillard',
    born: 1975,
    birthdate: date('1975-09-30'),
    nationality: 'French',
    oscarWins: 1,
    isActive: true,
    firstFilm: datetime('1994-01-15T00:00:00Z'),
    oscarCeremony: localdatetime('2008-02-24T18:30:00'),
    typicalDay: localtime('08:00:00'),
    acceptedFilmStart: time('09:00:00+01:00')
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Marion Cotillard'})
SET p.languages = ['French', 'English', 'Italian']
SET p.filmography_titles = ['La Vie en Rose', 'Inception', 'The Dark Knight Rises']
SET p.filmography_years = [2007, 2010, 2012]
SET p.filmography_roles = ['Édith Piaf', 'Mal Cobb', 'Miranda Tate'];

// Create an actor with null values
CREATE (JosephG:Person:GeneratedByClaudeAI {
    name: 'Joseph Gordon-Levitt',
    born: 1981,
    birthdate: date('1981-02-17'),
    spouseName: null,
    oscarWins: 0,
    height: 178,
    weight: 70,
    upcomingProjects: null,
    isCurrentlyFilming: false
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Joseph Gordon-Levitt'})
SET p.activityDays = ['Monday', 'Wednesday', 'Friday']
SET p.activityTypes = ['Rehearsal', 'Filming', 'Voice work']
SET p.activityDurations = [6, 12, 4];

// Create an award ceremony with date, time, and duration
CREATE (AcademyAwards:Ceremony:GeneratedByClaudeAI {
    name: 'Academy Awards',
    nickname: 'Oscars',
    established: date('1929-05-16'),
    ceremonyTime: localtime('17:00:00'),
    typicalDurationHrs: 3.5,
    isPrestigious: true,
    locationLat: 34.1022,
    locationLong: -118.3437,
    locationHeight: 10,
    nextCeremony: datetime('2026-02-28T17:00:00-08:00')
})
WITH 1 as dummy
MATCH (c:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
SET c.categories = ['Best Picture', 'Best Director', 'Best Actor', 'Best Actress']
SET c.viewership2020 = 23600000
SET c.viewership2021 = 10400000
SET c.viewership2022 = 16600000
SET c.viewership2023 = 18700000;

// Create a Studio with array properties
CREATE (WarnerBros:Studio:GeneratedByClaudeAI {
    name: 'Warner Bros. Pictures',
    founded: date('1923-04-04'),
    headquartersLat: 34.1516,
    headquartersLong: -118.3376,
    yearlyRevenue2020: 12500000000,
    yearlyRevenue2021: 15800000000,
    yearlyRevenue2022: 17200000000,
    digitalStreamingDate: datetime('2021-05-15T00:00:00Z'),
    isPublic: true,
    marketShare: 0.184
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'})
SET s.subsidiaries = ['New Line Cinema', 'DC Films', 'Warner Animation Group']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia', 'Oceania', 'Africa']
SET s.studioLotsLat = [34.1516, 51.5400]
SET s.studioLotsLong = [-118.3376, -0.4178];

// Create a filming event with date, time, and duration
CREATE (InceptionFilming:Production:GeneratedByClaudeAI {
    name: 'Inception Principal Photography',
    startDate: date('2009-07-13'),
    endDate: date('2009-11-22'),
    durationMonths: 4,
    durationDays: 9, 
    startTime: localtime('07:30:00'),
    isCompleted: true,
    budgetPersonnel: 40000000,
    budgetEquipment: 15000000,
    budgetLocations: 25000000,
    budgetVFX: 50000000,
    budgetOther: 30000000,
    weatherGood: 75,
    weatherAcceptable: 20,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Inception Principal Photography'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '07:00:00', '07:30:00', '19:30:00']
SET p.scheduleDurations = [2, 0.5, 12, 1];

// Add review with mixed types
CREATE (InceptionReview:Review:GeneratedByClaudeAI {
    title: 'A Mind-Bending Masterpiece',
    stars: 4.8,
    date: date('2010-07-18'),
    time: time('14:23:45+01:00'),
    isVerified: true,
    aspectDirection: 5.0, 
    aspectActing: 4.9,
    aspectVisuals: 5.0,
    aspectMusic: 4.8,
    aspectPlot: 4.5,
    reviewText: 'Christopher Nolan delivers a mind-bending masterpiece with Inception. The intricate plot about dream thieves attempting the impossible task of inception is executed brilliantly.',
    upvotes: 3452
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Mind-Bending Masterpiece'})
SET r.commentTimestamps = [datetime('2010-07-18T17:22:43Z'), datetime('2010-07-19T08:15:12Z'), datetime('2010-07-20T21:32:01Z')]
SET r.keywords = ['mind-bending', 'dreams', 'sci-fi', 'heist']
SET r.readerLocationsLat = [40.7128, 51.5074, 48.8566]
SET r.readerLocationsLong = [-74.0060, -0.1278, 2.3522];

// Create relationships between nodes with various data types
MATCH 
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (c)-[:DIRECTED {
    year: 2010,
    daysOnSet: 133,
    satisfaction: 4.9,
    awardNominations: 8,
    completionDate: date('2009-12-15'),
    premiereEvent: datetime('2010-07-08T19:00:00+01:00'),
    durationMonths: 5,
    isFirstCollaboration: false
}]->(i);

// Actor to Movie relationships
MATCH
  (l:Person:GeneratedByClaudeAI {name: 'Leonardo DiCaprio'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (l)-[:ACTED_IN {
    roles: ['Dom Cobb'],
    salary: 20000000,
    screenTimeMinutes: 148,
    startDate: date('2009-07-13'),
    endDate: date('2009-11-22'),
    scheduleConflicts: false,
    criticScore: 95,
    audienceScore: 91,
    awardNominations: 3
}]->(i);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Marion Cotillard'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (m)-[:ACTED_IN {
    roles: ['Mal Cobb'],
    salary: 2000000,
    screenTimeMinutes: 45,
    startDate: date('2009-08-10'),
    endDate: date('2009-09-30'),
    scheduleConflicts: false,
    performanceRating: 4.8
}]->(i);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Joseph Gordon-Levitt'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (j)-[:ACTED_IN {
    roles: ['Arthur'],
    salary: 1500000,
    screenTimeMinutes: 73,
    startDate: date('2009-07-13'),
    endDate: date('2009-10-15'),
    stuntPerformed: true,
    trainingPeriodWeeks: 3
}]->(i);

// Production relationships
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (w)-[:PRODUCED {
    investment: 160000000,
    return: 836800000,
    roi: 5.23,
    contractSigned: date('2008-12-01'),
    studioShare: 0.6,
    directorShare: 0.15,
    producerShare: 0.15,
    topCastShare: 0.1,
    marketingBudget: 100000000,
    isProfitable: true,
    marketingStart: datetime('2010-01-15T00:00:00Z')
}]->(i);

// Studio to filming relationship
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'Inception Principal Photography'})
CREATE (w)-[:FINANCED {
    contractDate: date('2008-12-01'),
    amount: 160000000,
    isFullyPaid: true
}]->(p);

// Filming to movie relationship
MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Inception Principal Photography'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 4,
    durationDays: 9,
    locationCount: 6,
    dailyAverageCost: 480000,
    scheduleAdherence: 0.95,
    weatherDelaysDays: 5,
    originalScheduledEnd: date('2009-11-15')
}]->(i);

// Review relationships
MATCH
  (j:Person {name: 'Jessica Thompson'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'A Mind-Bending Masterpiece'})
CREATE (j)-[:WROTE {
    date: date('2010-07-18'),
    timeSpentMinutes: 45,
    wordCount: 523,
    isVerified: true,
    submissionTime: time('14:23:45+01:00')
}]->(r);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'A Mind-Bending Masterpiece'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 128634,
    shares: 4327,
    comments: 1252,
    featuredDurationDays: 14,
    publicationDateTime: datetime('2010-07-18T14:30:00+01:00')
}]->(i);

// Award relationship
MATCH
  (i:Movie:GeneratedByClaudeAI {title: 'Inception'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (i)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 2011,
    ceremony: 83,
    isWinner: false,
    ceremonyDate: date('2011-02-27'),
    announcementTime: localtime('21:45:00'),
    votesFor: 2345,
    votesAgainst: 2567
}]->(a);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (c)-[:NOMINATED_FOR {
    category: 'Best Director',
    year: 2011,
    ceremony: 83,
    isWinner: false,
    ceremonyDate: date('2011-02-27'),
    announcementTime: localtime('20:30:00'),
    votesFor: 2132,
    votesAgainst: 2780
}]->(a);

// Additional connections to existing graph
MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (t:Person {name: 'Tom Hanks'}) // Original person from the graph
CREATE (c)-[:KNOWS {
    since: date('2002-01-15'),
    projects: 3,
    relationship: 'Professional',
    lastContact: datetime('2023-05-15T14:30:00Z'),
    nextMeeting: datetime('2025-04-10T09:00:00Z')
}]->(t);

MATCH
  (l:Person:GeneratedByClaudeAI {name: 'Leonardo DiCaprio'}),
  (t:Person {name: 'Tom Hanks'}) // Original person from the graph
CREATE (l)-[:KNOWS {
    since: date('1997-10-12'),
    relationship: 'Friends',
    lastCollaboration: date('2015-12-25'),
    durationYears: 26,
    project1: 'The Revenant',
    year1: 2015,
    project2: 'Django Unchained',
    year2: 2012
}]->(t);

// Set transfer times for the FINANCED relationship
MATCH (:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'})-[r:FINANCED]-(:Production:GeneratedByClaudeAI {name: 'Inception Principal Photography'})
SET r.transferTime1 = datetime('2009-01-15T00:00:00Z')
SET r.transferTime2 = datetime('2009-04-15T00:00:00Z')
SET r.transferTime3 = datetime('2009-07-15T00:00:00Z')
SET r.paymentDate1 = date('2009-01-15')
SET r.paymentAmount1 = 40000000
SET r.paymentDate2 = date('2009-04-15')
SET r.paymentAmount2 = 60000000
SET r.paymentDate3 = date('2009-07-15')
SET r.paymentAmount3 = 60000000;

// Set presenters for NOMINATED_FOR relationship
MATCH (:Movie:GeneratedByClaudeAI {title: 'Inception'})-[r:NOMINATED_FOR]-(:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
SET r.presenter1 = 'Tom Hanks'
SET r.presenter2 = 'Natalie Portman';