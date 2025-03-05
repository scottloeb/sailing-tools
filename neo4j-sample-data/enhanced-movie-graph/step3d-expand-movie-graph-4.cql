// Create more contemporary movies
CREATE (Dune:Movie:GeneratedByClaudeAI {
    title: 'Dune',
    released: 2021,
    tagline: 'Beyond fear, destiny awaits',
    budget: 165000000,
    revenue: 401800000,
    runtime_minutes: 155,
    rating_avg: 8.1,
    releaseDate: date('2021-10-22'),
    digitalRelease: datetime('2021-12-03T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Dune'})
SET m.ratings = [8.2, 8.0, 8.1, 8.1]
SET m.genres = ['sci-fi', 'adventure', 'drama']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [31.1667, 52.4262, 40.7128]
SET m.filmingLocationLong = [-4.2333, 13.8536, -74.0060]
SET m.boxOfficeNA = 108327830
SET m.boxOfficeEurope = 142500000
SET m.boxOfficeAsia = 82400000
SET m.boxOfficeOther = 68572170;

CREATE (EverythingEverywhere:Movie:GeneratedByClaudeAI {
    title: 'Everything Everywhere All at Once',
    released: 2022,
    tagline: 'The universe is so much bigger than you realize',
    budget: 25000000,
    revenue: 140200000,
    runtime_minutes: 139,
    rating_avg: 8.0,
    releaseDate: date('2022-03-25'),
    digitalRelease: datetime('2022-06-07T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Everything Everywhere All at Once'})
SET m.ratings = [8.1, 7.9, 8.0, 8.0]
SET m.genres = ['comedy', 'action', 'sci-fi', 'drama']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [34.0522, 33.7490, 40.7128]
SET m.filmingLocationLong = [-118.2437, -84.3880, -74.0060]
SET m.boxOfficeNA = 77188084
SET m.boxOfficeEurope = 27600000
SET m.boxOfficeAsia = 25400000
SET m.boxOfficeOther = 10011916;

CREATE (Oppenheimer:Movie:GeneratedByClaudeAI {
    title: 'Oppenheimer',
    released: 2023,
    tagline: 'The world forever changes',
    budget: 100000000,
    revenue: 976156348,
    runtime_minutes: 180,
    rating_avg: 8.4,
    releaseDate: date('2023-07-21'),
    digitalRelease: datetime('2023-11-21T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'})
SET m.ratings = [8.5, 8.3, 8.4, 8.4]
SET m.genres = ['biography', 'drama', 'history']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [34.0522, 40.7128, 41.8781]
SET m.filmingLocationLong = [-118.2437, -74.0060, -87.6298]
SET m.boxOfficeNA = 326900000
SET m.boxOfficeEurope = 298700000
SET m.boxOfficeAsia = 223500000
SET m.boxOfficeOther = 127056348;

// Create more people (directors, actors)
CREATE (TimotheeC:Person:GeneratedByClaudeAI {
    name: 'Timothée Chalamet',
    born: 1995,
    birthdate: date('1995-12-27'),
    nationality: 'American-French',
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('2014-05-17T00:00:00Z'),
    heightInMeters: 1.78,
    netWorth: 30000000,
    methodActingScore: 8.5
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Timothée Chalamet'})
SET p.languages = ['English', 'French']
SET p.filmography_titles = ['Call Me by Your Name', 'Dune', 'Little Women']
SET p.filmography_years = [2017, 2021, 2019]
SET p.filmography_roles = ['Elio Perlman', 'Paul Atreides', 'Theodore Laurence'];

CREATE (MichelleY:Person:GeneratedByClaudeAI {
    name: 'Michelle Yeoh',
    born: 1962,
    birthdate: date('1962-08-06'),
    nationality: 'Malaysian',
    oscarWins: 1,
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('1984-11-16T00:00:00Z'),
    heightInMeters: 1.63,
    netWorth: 40000000,
    martialArtsTraining: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Michelle Yeoh'})
SET p.languages = ['English', 'Malay', 'Cantonese', 'Mandarin']
SET p.filmography_titles = ['Everything Everywhere All at Once', 'Crouching Tiger, Hidden Dragon', 'Crazy Rich Asians']
SET p.filmography_years = [2022, 2000, 2018]
SET p.filmography_roles = ['Evelyn Wang', 'Yu Shu Lien', 'Eleanor Young'];

CREATE (CillianM:Person:GeneratedByClaudeAI {
    name: 'Cillian Murphy',
    born: 1976,
    birthdate: date('1976-05-25'),
    nationality: 'Irish',
    oscarWins: 1,
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('1998-09-25T00:00:00Z'),
    heightInMeters: 1.75,
    netWorth: 20000000,
    methodActingScore: 9.2
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Cillian Murphy'})
SET p.languages = ['English', 'Irish']
SET p.filmography_titles = ['Oppenheimer', 'Inception', 'The Dark Knight']
SET p.filmography_years = [2023, 2010, 2008]
SET p.filmography_roles = ['J. Robert Oppenheimer', 'Robert Fischer', 'Dr. Jonathan Crane'];

CREATE (DanKwan:Person:GeneratedByClaudeAI {
    name: 'Daniel Kwan',
    born: 1988,
    birthdate: date('1988-02-10'),
    nationality: 'American',
    oscarWins: 3,
    oscarNominations: 3,
    isActive: true,
    firstFilm: datetime('2016-06-24T00:00:00Z'),
    heightInMeters: 1.75,
    netWorth: 5000000,
    visualStyle: 'Eclectic and vibrant'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Daniel Kwan'})
SET p.languages = ['English', 'Mandarin']
SET p.filmography_titles = ['Everything Everywhere All at Once', 'Swiss Army Man']
SET p.filmography_years = [2022, 2016]
SET p.collaborations = ['Daniel Scheinert'];

CREATE (A24Studios:Studio:GeneratedByClaudeAI {
    name: 'A24 Studios',
    founded: date('2012-08-20'),
    headquartersLat: 40.7405,
    headquartersLong: -74.0022,
    yearlyRevenue2020: 325000000,
    yearlyRevenue2021: 380000000,
    yearlyRevenue2022: 450000000,
    digitalStreamingDate: datetime('2019-07-10T00:00:00Z'),
    isPublic: false,
    marketShare: 0.05
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'A24 Studios'})
SET s.subsidiaries = ['A24 Films', 'A24 Television']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia', 'Australia']
SET s.studioLotsLat = [40.7405]
SET s.studioLotsLong = [-74.0022];

CREATE (UniversalPictures:Studio:GeneratedByClaudeAI {
    name: 'Universal Pictures',
    founded: date('1912-04-30'),
    headquartersLat: 34.1381,
    headquartersLong: -118.3534,
    yearlyRevenue2020: 3200000000,
    yearlyRevenue2021: 4100000000,
    yearlyRevenue2022: 4800000000,
    digitalStreamingDate: datetime('2018-01-15T00:00:00Z'),
    isPublic: true,
    marketShare: 0.12
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Universal Pictures'})
SET s.subsidiaries = ['Focus Features', 'DreamWorks Animation', 'Working Title Films']
SET s.distributionMarkets = ['Global']
SET s.studioLotsLat = [34.1381, 41.9028, 51.5074]
SET s.studioLotsLong = [-118.3534, 12.4964, -0.1278];

// Create production events
CREATE (DuneProduction:Production:GeneratedByClaudeAI {
    name: 'Dune Principal Photography',
    startDate: date('2019-03-18'),
    endDate: date('2019-07-26'),
    durationMonths: 4,
    durationDays: 8,
    startTime: localtime('06:30:00'),
    isCompleted: true,
    budgetPersonnel: 50000000,
    budgetEquipment: 20000000,
    budgetLocations: 25000000,
    budgetVFX: 55000000,
    budgetOther: 15000000,
    weatherGood: 75,
    weatherAcceptable: 20,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Dune Principal Photography'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['04:00:00', '06:00:00', '06:30:00', '18:30:00']
SET p.scheduleDurations = [2, 0.5, 12, 1.5];

CREATE (EEAAOProduction:Production:GeneratedByClaudeAI {
    name: 'Everything Everywhere All at Once Production',
    startDate: date('2020-01-15'),
    endDate: date('2020-03-25'),
    durationMonths: 2,
    durationDays: 10,
    startTime: localtime('07:00:00'),
    isCompleted: true,
    budgetPersonnel: 8000000,
    budgetEquipment: 3000000,
    budgetLocations: 2000000,
    budgetVFX: 9000000,
    budgetOther: 3000000,
    weatherGood: 85,
    weatherAcceptable: 10,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Everything Everywhere All at Once Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '06:30:00', '07:00:00', '19:00:00']
SET p.scheduleDurations = [1.5, 0.5, 12, 1];

CREATE (OppenheimerProduction:Production:GeneratedByClaudeAI {
    name: 'Oppenheimer Principal Photography',
    startDate: date('2022-02-22'),
    endDate: date('2022-05-18'),
    durationMonths: 3,
    durationDays: 24,
    startTime: localtime('06:00:00'),
    isCompleted: true,
    budgetPersonnel: 35000000,
    budgetEquipment: 15000000,
    budgetLocations: 20000000,
    budgetVFX: 20000000,
    budgetOther: 10000000,
    weatherGood: 80,
    weatherAcceptable: 15,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Oppenheimer Principal Photography'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['03:30:00', '05:30:00', '06:00:00', '18:30:00']
SET p.scheduleDurations = [2, 0.5, 12.5, 1];

// Add reviews
CREATE (DuneReview:Review:GeneratedByClaudeAI {
    title: 'A Masterful Sci-Fi Epic',
    stars: 4.8,
    date: date('2021-10-25'),
    time: time('15:30:42+01:00'),
    isVerified: true,
    aspectDirection: 4.9,
    aspectActing: 4.7,
    aspectVisuals: 5.0,
    aspectMusic: 5.0,
    aspectPlot: 4.7,
    reviewText: 'Denis Villeneuve\'s Dune is a breathtaking achievement that brings Frank Herbert\'s complex sci-fi novel to life with stunning visuals, a powerful score, and excellent performances. The film balances world-building with character development masterfully.',
    upvotes: 9582
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Masterful Sci-Fi Epic'})
SET r.commentTimestamps = [datetime('2021-10-25T16:45:22+01:00'), datetime('2021-10-26T09:15:34+01:00'), datetime('2021-10-27T18:22:51+01:00')]
SET r.keywords = ['sci-fi', 'adaptation', 'visual-spectacle', 'world-building']
SET r.readerLocationsLat = [40.7128, 51.5074, 48.8566]
SET r.readerLocationsLong = [-74.0060, -0.1278, 2.3522];

CREATE (EEAAOReview:Review:GeneratedByClaudeAI {
    title: 'A Mind-Bending Multiverse Masterpiece',
    stars: 4.9,
    date: date('2022-04-10'),
    time: time('19:22:15-04:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 5.0,
    aspectVisuals: 4.8,
    aspectMusic: 4.7,
    aspectPlot: 4.9,
    reviewText: 'Everything Everywhere All at Once is a genre-defying triumph that blends action, comedy, sci-fi, and heartfelt family drama. Michelle Yeoh delivers a career-defining performance in this multiverse exploration that somehow manages to be both wildly creative and emotionally grounded.',
    upvotes: 12854
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Mind-Bending Multiverse Masterpiece'})
SET r.commentTimestamps = [datetime('2022-04-10T20:35:42-04:00'), datetime('2022-04-11T08:22:19-04:00'), datetime('2022-04-12T14:15:37-04:00')]
SET r.keywords = ['multiverse', 'existential', 'action-comedy', 'immigrant-experience']
SET r.readerLocationsLat = [34.0522, 40.7128, 37.7749]
SET r.readerLocationsLong = [-118.2437, -74.0060, -122.4194];

CREATE (OppenheimerReview:Review:GeneratedByClaudeAI {
    title: 'Historical Filmmaking at its Finest',
    stars: 5.0,
    date: date('2023-07-25'),
    time: time('14:45:30-04:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 5.0,
    aspectVisuals: 4.9,
    aspectMusic: 4.8,
    aspectPlot: 4.9,
    reviewText: 'Christopher Nolan\'s Oppenheimer is a towering achievement in biographical filmmaking. Cillian Murphy delivers a haunting, complex performance as the father of the atomic bomb, while the film\'s narrative structure brilliantly juxtaposes his scientific triumphs with their moral consequences.',
    upvotes: 14382
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Historical Filmmaking at its Finest'})
SET r.commentTimestamps = [datetime('2023-07-25T16:22:18-04:00'), datetime('2023-07-26T09:43:55-04:00'), datetime('2023-07-27T20:15:42-04:00')]
SET r.keywords = ['biopic', 'atomic-age', 'historical-drama', 'moral-conflict']
SET r.readerLocationsLat = [40.7128, 34.0522, 51.5074]
SET r.readerLocationsLong = [-74.0060, -118.2437, -0.1278];

// Create relationships between nodes
MATCH 
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'}),
  (du:Movie:GeneratedByClaudeAI {title: 'Dune'})
CREATE (d)-[:DIRECTED {
    year: 2021,
    daysOnSet: 130,
    satisfaction: 4.9,
    awardNominations: 10,
    completionDate: date('2020-07-15'),
    premiereEvent: datetime('2021-09-03T19:30:00+02:00'),
    durationMonths: 4,
    isFirstCollaboration: false
}]->(du);

MATCH 
  (dk:Person:GeneratedByClaudeAI {name: 'Daniel Kwan'}),
  (e:Movie:GeneratedByClaudeAI {title: 'Everything Everywhere All at Once'})
CREATE (dk)-[:DIRECTED {
    year: 2022,
    daysOnSet: 70,
    coDirector: 'Daniel Scheinert',
    satisfaction: 4.9,
    awardNominations: 11,
    awardWins: 7,
    completionDate: date('2020-07-30'),
    premiereEvent: datetime('2022-03-11T18:30:00-06:00'),
    durationMonths: 2,
    isFirstCollaboration: false
}]->(e);

MATCH 
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'})
CREATE (c)-[:DIRECTED {
    year: 2023,
    daysOnSet: 114,
    satisfaction: 4.9,
    awardNominations: 13,
    awardWins: 7,
    completionDate: date('2023-03-15'),
    premiereEvent: datetime('2023-07-13T19:00:00+01:00'),
    durationMonths: 3,
    isFirstCollaboration: false
}]->(o);

// Actor to Movie relationships
MATCH
  (t:Person:GeneratedByClaudeAI {name: 'Timothée Chalamet'}),
  (d:Movie:GeneratedByClaudeAI {title: 'Dune'})
CREATE (t)-[:ACTED_IN {
    roles: ['Paul Atreides'],
    salary: 2000000,
    screenTimeMinutes: 125,
    startDate: date('2019-03-18'),
    endDate: date('2019-07-26'),
    scheduleConflicts: false,
    criticScore: 95,
    audienceScore: 92,
    awardNominations: 5
}]->(d);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Michelle Yeoh'}),
  (e:Movie:GeneratedByClaudeAI {title: 'Everything Everywhere All at Once'})
CREATE (m)-[:ACTED_IN {
    roles: ['Evelyn Wang'],
    salary: 1000000,
    screenTimeMinutes: 120,
    startDate: date('2020-01-15'),
    endDate: date('2020-03-25'),
    scheduleConflicts: false,
    criticScore: 97,
    audienceScore: 95,
    awardNominations: 8,
    awardWins: 6
}]->(e);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Cillian Murphy'}),
  (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'})
CREATE (c)-[:ACTED_IN {
    roles: ['J. Robert Oppenheimer'],
    salary: 5000000,
    screenTimeMinutes: 160,
    startDate: date('2022-02-22'),
    endDate: date('2022-05-18'),
    scheduleConflicts: false,
    criticScore: 98,
    audienceScore: 95,
    awardNominations: 7,
    awardWins: 5
}]->(o);

// Studio relationships
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (d:Movie:GeneratedByClaudeAI {title: 'Dune'})
CREATE (w)-[:PRODUCED {
    investment: 165000000,
    return: 401800000,
    roi: 2.43,
    contractSigned: date('2018-07-15'),
    studioShare: 0.65,
    directorShare: 0.15,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 140000000,
    isProfitable: true,
    marketingStart: datetime('2021-02-15T00:00:00Z')
}]->(d);

MATCH
  (a:Studio:GeneratedByClaudeAI {name: 'A24 Studios'}),
  (e:Movie:GeneratedByClaudeAI {title: 'Everything Everywhere All at Once'})
CREATE (a)-[:PRODUCED {
    investment: 25000000,
    return: 140200000,
    roi: 5.61,
    contractSigned: date('2019-03-22'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 15000000,
    isProfitable: true,
    marketingStart: datetime('2022-01-15T00:00:00Z')
}]->(e);

MATCH
  (u:Studio:GeneratedByClaudeAI {name: 'Universal Pictures'}),
  (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'})
CREATE (u)-[:PRODUCED {
    investment: 100000000,
    return: 976156348,
    roi: 9.76,
    contractSigned: date('2021-05-10'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 150000000,
    isProfitable: true,
    marketingStart: datetime('2023-01-15T00:00:00Z')
}]->(o);

// Studio to filming relationship
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'Dune Principal Photography'})
CREATE (w)-[:FINANCED {
    contractDate: date('2018-07-15'),
    amount: 165000000,
    isFullyPaid: true,
    transferTime1: datetime('2018-12-15T00:00:00Z'),
    transferTime2: datetime('2019-02-28T00:00:00Z'),
    transferTime3: datetime('2019-05-15T00:00:00Z'),
    paymentDate1: date('2018-12-15'),
    paymentAmount1: 50000000,
    paymentDate2: date('2019-02-28'),
    paymentAmount2: 65000000,
    paymentDate3: date('2019-05-15'),
    paymentAmount3: 50000000
}]->(p);

MATCH
  (a:Studio:GeneratedByClaudeAI {name: 'A24 Studios'}),
  (p:Production:GeneratedByClaudeAI {name: 'Everything Everywhere All at Once Production'})
CREATE (a)-[:FINANCED {
    contractDate: date('2019-03-22'),
    amount: 25000000,
    isFullyPaid: true,
    transferTime1: datetime('2019-09-15T00:00:00Z'),
    transferTime2: datetime('2019-12-15T00:00:00Z'),
    paymentDate1: date('2019-09-15'),
    paymentAmount1: 15000000,
    paymentDate2: date('2019-12-15'),
    paymentAmount2: 10000000
}]->(p);

MATCH
  (u:Studio:GeneratedByClaudeAI {name: 'Universal Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'Oppenheimer Principal Photography'})
CREATE (u)-[:FINANCED {
    contractDate: date('2021-05-10'),
    amount: 100000000,
    isFullyPaid: true,
    transferTime1: datetime('2021-09-15T00:00:00Z'),
    transferTime2: datetime('2021-12-20T00:00:00Z'),
    transferTime3: datetime('2022-02-10T00:00:00Z'),
    paymentDate1: date('2021-09-15'),
    paymentAmount1: 30000000,
    paymentDate2: date('2021-12-20'),
    paymentAmount2: 40000000,
    paymentDate3: date('2022-02-10'),
    paymentAmount3: 30000000
}]->(p);

// Filming to movie relationship
MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Dune Principal Photography'}),
  (d:Movie:GeneratedByClaudeAI {title: 'Dune'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 4,
    durationDays: 8,
    locationCount: 8,
    dailyAverageCost: 560000,
    scheduleAdherence: 0.95,
    weatherDelaysDays: 5,
    originalScheduledEnd: date('2019-07-20')
}]->(d);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Everything Everywhere All at Once Production'}),
  (e:Movie:GeneratedByClaudeAI {title: 'Everything Everywhere All at Once'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 2,
    durationDays: 10,
    locationCount: 12,
    dailyAverageCost: 150000,
    scheduleAdherence: 0.97,
    weatherDelaysDays: 2,
    originalScheduledEnd: date('2020-03-20')
}]->(e);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Oppenheimer Principal Photography'}),
  (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 3,
    durationDays: 24,
    locationCount: 9,
    dailyAverageCost: 350000,
    scheduleAdherence: 0.98,
    weatherDelaysDays: 3,
    originalScheduledEnd: date('2022-05-15')
}]->(o);

// Review relationships
MATCH
  (j:Person {name: 'Jessica Thompson'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'A Masterful Sci-Fi Epic'})
CREATE (j)-[:WROTE {
    date: date('2021-10-25'),
    timeSpentMinutes: 65,
    wordCount: 728,
    isVerified: true,
    submissionTime: time('15:30:42+01:00')
}]->(r);

MATCH
  (a:Person {name: 'Angela Scope'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'A Mind-Bending Multiverse Masterpiece'})
CREATE (a)-[:WROTE {
    date: date('2022-04-10'),
    timeSpentMinutes: 70,
    wordCount: 785,
    isVerified: true,
    submissionTime: time('19:22:15-04:00')
}]->(r);

MATCH
  (p:Person {name: 'Paul Blythe'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'Historical Filmmaking at its Finest'})
CREATE (p)-[:WROTE {
    date: date('2023-07-25'),
    timeSpentMinutes: 75,
    wordCount: 812,
    isVerified: true,
    submissionTime: time('14:45:30-04:00')
}]->(r);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'A Masterful Sci-Fi Epic'}),
  (d:Movie:GeneratedByClaudeAI {title: 'Dune'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 184532,
    shares: 8642,
    comments: 3156,
    featuredDurationDays: 21,
    publicationDateTime: datetime('2021-10-25T16:30:00+01:00')
}]->(d);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'A Mind-Bending Multiverse Masterpiece'}),
  (e:Movie:GeneratedByClaudeAI {title: 'Everything Everywhere All at Once'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 215689,
    shares: 12548,
    comments: 4852,
    featuredDurationDays: 28,
    publicationDateTime: datetime('2022-04-10T20:15:00-04:00')
}]->(e);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'Historical Filmmaking at its Finest'}),
  (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 245832,
    shares: 15462,
    comments: 5238,
    featuredDurationDays: 30,
    publicationDateTime: datetime('2023-07-25T16:00:00-04:00')
}]->(o);

// Award relationships
MATCH
  (d:Movie:GeneratedByClaudeAI {title: 'Dune'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (d)-[:NOMINATED_FOR {
    category: 'Best Cinematography',
    year: 2022,
    ceremony: 94,
    isWinner: true,
    ceremonyDate: date('2022-03-27'),
    announcementTime: localtime('20:15:00'),
    votesFor: 5821,
    votesAgainst: 2154
}]->(a);

MATCH
  (e:Movie:GeneratedByClaudeAI {title: 'Everything Everywhere All at Once'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (e)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 2023,
    ceremony: 95,
    isWinner: true,
    ceremonyDate: date('2023-03-12'),
    announcementTime: localtime('21:45:00'),
    votesFor: 6534,
    votesAgainst: 2154
}]->(a);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Michelle Yeoh'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (m)-[:NOMINATED_FOR {
    category: 'Best Actress',
    year: 2023,
    ceremony: 95,
    isWinner: true,
    ceremonyDate: date('2023-03-12'),
    announcementTime: localtime('21:15:00'),
    votesFor: 6254,
    votesAgainst: 2435,
    speechDuration: duration({minutes: 3, seconds: 12})
}]->(a);

MATCH
  (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (o)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 2024,
    ceremony: 96,
    isWinner: true,
    ceremonyDate: date('2024-03-10'),
    announcementTime: localtime('21:45:00'),
    votesFor: 6832,
    votesAgainst: 1985
}]->(a);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Cillian Murphy'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (c)-[:NOMINATED_FOR {
    category: 'Best Actor',
    year: 2024,
    ceremony: 96,
    isWinner: true,
    ceremonyDate: date('2024-03-10'),
    announcementTime: localtime('21:15:00'),
    votesFor: 6754,
    votesAgainst: 2105,
    speechDuration: duration({minutes: 2, seconds: 45})
}]->(a);

// Professional relationships between people
MATCH
  (t:Person:GeneratedByClaudeAI {name: 'Timothée Chalamet'}),
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'})
CREATE (t)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'Dune',
    firstYear: 2021,
    chemistry: 4.8,
    interviews: 25,
    relationship: 'Actor-Director',
    nextProjectPlanned: date('2024-11-15')
}]->(d);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Michelle Yeoh'}),
  (dk:Person:GeneratedByClaudeAI {name: 'Daniel Kwan'})
CREATE (m)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'Everything Everywhere All at Once',
    firstYear: 2022,
    chemistry: 4.9,
    interviews: 32,
    relationship: 'Actor-Director',
    awards: ['Academy Award', 'Golden Globe', 'SAG Award']
}]->(dk);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Cillian Murphy'}),
  (cn:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'})
CREATE (c)-[:WORKED_WITH {
    projects: 6,
    firstProject: 'Batman Begins',
    firstYear: 2005,
    chemistry: 4.9,
    interviews: 45,
    relationship: 'Actor-Director',
    awards: ['Academy Award']
}]->(cn);

// Create soundtracks
CREATE (DuneSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'Dune (Original Motion Picture Soundtrack)',
    composer: 'Hans Zimmer',
    released: date('2021-09-17'),
    duration: duration({minutes: 97, seconds: 38}),
    trackCount: 22,
    recordingStudio: 'Remote (COVID-19)',
    recordingStudioLat: 51.5074,
    recordingStudioLong: -0.1278,
    peakChartPosition: 24,
    salesUnits: 120000,
    streamingCount: 180000000
})
WITH 1 as dummy
MATCH (d:Movie:GeneratedByClaudeAI {title: 'Dune'}),
      (s:Soundtrack:GeneratedByClaudeAI {title: 'Dune (Original Motion Picture Soundtrack)'})
CREATE (s)-[:COMPOSED_FOR {
    contractDate: date('2019-12-15'),
    completion: date('2021-06-20'),
    nominatedAwards: ['Academy Award', 'BAFTA', 'Golden Globe'],
    wonAwards: ['Academy Award', 'Golden Globe'],
    spotifyStreams: 250000000,
    youtubeViews: 65000000
}]->(d);

CREATE (OppenheimerSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'Oppenheimer (Original Motion Picture Soundtrack)',
    composer: 'Ludwig Göransson',
    released: date('2023-07-21'),
    duration: duration({minutes: 72, seconds: 15}),
    trackCount: 19,
    recordingStudio: 'AIR Studios, London',
    recordingStudioLat: 51.5454,
    recordingStudioLong: -0.1755,
    peakChartPosition: 18,
    salesUnits: 85000,
    streamingCount: 145000000
})
WITH 1 as dummy
MATCH (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'}),
      (s:Soundtrack:GeneratedByClaudeAI {title: 'Oppenheimer (Original Motion Picture Soundtrack)'})
CREATE (s)-[:COMPOSED_FOR {
    contractDate: date('2022-01-15'),
    completion: date('2023-05-20'),
    nominatedAwards: ['Academy Award', 'BAFTA', 'Golden Globe'],
    wonAwards: ['Academy Award'],
    spotifyStreams: 175000000,
    youtubeViews: 42000000
}]->(o);

// Create filming location
CREATE (MoroccoLocation:FilmingLocation:GeneratedByClaudeAI {
    name: 'Wadi Rum Desert',
    country: 'Jordan',
    region: 'Southern Jordan',
    latitude: 29.5833,
    longitude: 35.4167,
    elevation: 1600,
    elevationUnit: 'm',
    climate: 'Desert',
    permitCost: 2500000,
    permitCurrency: 'USD',
    firstUsed: date('2019-05-15'),
    lastUsed: date('2019-06-28')
})
WITH 1 as dummy
MATCH (d:Movie:GeneratedByClaudeAI {title: 'Dune'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Wadi Rum Desert'})
CREATE (d)-[:FILMED_AT {
    startDate: date('2019-05-15'),
    endDate: date('2019-06-28'),
    sceneCount: 32,
    totalDays: 45,
    weatherDelayDays: 6,
    crewSize: 350,
    logisticsCost: 3500000,
    accommodationCost: 1800000,
    characterPresent: ['Paul Atreides', 'Lady Jessica', 'Fremen']
}]->(l);

// Create prop for Oppenheimer
CREATE (TrinityDevice:Prop:GeneratedByClaudeAI {
    name: 'Trinity Test Device Replica',
    movie: 'Oppenheimer',
    material: 'Mixed materials, electronics',
    weight: 350,
    weightUnit: 'kg',
    createdDate: date('2022-01-10'),
    screenTime: duration({minutes: 8, seconds: 45}),
    isIconic: true,
    constructionCost: 250000,
    copiesMade: 3
})
WITH 1 as dummy
MATCH (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'}),
      (p:Prop:GeneratedByClaudeAI {name: 'Trinity Test Device Replica'})
CREATE (p)-[:USED_IN {
    scenes: ['Trinity Test', 'Laboratory'],
    sceneCount: 5,
    firstAppearance: time('01:45:22'),
    lastAppearance: time('02:15:08'),
    isCloseup: true,
    significance: 'Central plot device',
    historicalAccuracy: 'Very high'
}]->(o);

// Create fan community
CREATE (DuneFandom:FanCommunity:GeneratedByClaudeAI {
    name: 'Dune Fan Community',
    established: date('1965-08-15'),
    reactivation: date('2021-10-22'),
    memberCount: 3250000,
    onlinePlatforms: 8,
    annualConventions: 5,
    largestEventAttendance: 15000,
    contentCreators: 28500,
    fanfictionCount: 45000,
    fanArtCount: 120000,
    academicPapers: 450
})
WITH 1 as dummy
MATCH (f:FanCommunity:GeneratedByClaudeAI {name: 'Dune Fan Community'}),
      (d:Movie:GeneratedByClaudeAI {title: 'Dune'})
CREATE (f)-[:ENGAGED_WITH {
    anticipationScore: 9.7,
    reviewsSubmitted: 185000,
    averageRating: 8.6,
    onlineDiscussions: 85000,
    theoriesGenerated: 15000,
    preReleaseEvents: 45,
    postReleaseEvents: 230,
    merchandiseSales: 75000000,
    sequelAnticipation: 9.8
}]->(d);

// Connect more actors
MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Amy Adams'}),
  (c:Person:GeneratedByClaudeAI {name: 'Cillian Murphy'})
CREATE (a)-[:KNOWS {
    since: date('2013-08-15'),
    relationship: 'Professional Colleagues',
    lastMeeting: date('2023-09-22'),
    durationYears: 10,
    commonFriends: 12,
    commonEvents: 8
}]->(c);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Michelle Yeoh'}),
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'})
CREATE (m)-[:ADMIRES {
    since: date('2010-07-16'),
    projects: 0,
    relationship: 'Professional Admiration',
    lastContact: date('2023-02-28'),
    inspirationLevel: 4.8,
    influencedWorks: ['Everything Everywhere All at Once']
}]->(c);

// Create costume design relationship
CREATE (JacquelineWest:Person:GeneratedByClaudeAI {
    name: 'Jacqueline West',
    born: 1950,
    birthdate: date('1950-10-15'),
    nationality: 'American',
    oscarNominations: 4,
    isActive: true,
    firstFilm: datetime('1998-11-20T00:00:00Z'),
    specialization: 'Costume Design',
    careerLength: duration({years: 25}),
    designStyle: 'Historical authenticity with symbolic elements'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Jacqueline West'}),
      (d:Movie:GeneratedByClaudeAI {title: 'Dune'})
CREATE (p)-[:DESIGNED_COSTUMES_FOR {
    year: 2021,
    costumesCreated: 1200,
    budget: 2500000,
    awardNominations: 5,
    awardWins: 2,
    startDate: date('2018-10-15'),
    completionDate: date('2019-02-28'),
    specialCostumes: ['Stillsuits', 'House Atreides uniforms', 'Bene Gesserit robes'],
    researchHours: 850,
    conceptualDesigns: 280
}]->(d);

// Create cinematographer relationship
CREATE (HoyteVanHoytema:Person:GeneratedByClaudeAI {
    name: 'Hoyte van Hoytema',
    born: 1971,
    birthdate: date('1971-10-04'),
    nationality: 'Dutch-Swedish',
    oscarNominations: 3,
    oscarWins: 1,
    isActive: true,
    firstFilm: datetime('2002-09-15T00:00:00Z'),
    visualStyle: 'Natural lighting with IMAX optimization',
    cameraPreference: 'IMAX 65mm',
    collaborations: 4
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Hoyte van Hoytema'}),
      (o:Movie:GeneratedByClaudeAI {title: 'Oppenheimer'})
CREATE (p)-[:CINEMATOGRAPHY_FOR {
    year: 2023,
    cameras: ['IMAX 65mm', 'Panavision 65mm'],
    lenses: ['IMAX', 'Panavision System 65'],
    awardNominations: 12,
    awardWins: 8,
    startDate: date('2022-02-22'),
    completionDate: date('2022-05-18'),
    signature_shots: ['Trinity explosion', 'Quantum discussions', 'Hearing sequences'],
    lighting_setups: 165,
    filmedOnLocation: true
}]->(o);