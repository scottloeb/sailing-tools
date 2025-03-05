// Create a new modern movie with various data types
CREATE (BladeRunner2049:Movie:GeneratedByClaudeAI {
    title: 'Blade Runner 2049',
    released: 2017,
    tagline: 'The key to the future is finally unearthed.',
    budget: 185000000,
    revenue: 259300000,
    runtime_minutes: 164,
    rating_avg: 8.0,
    releaseDate: date('2017-10-06'),
    digitalRelease: datetime('2018-01-16T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
SET m.ratings = [8.1, 7.9, 8.2, 7.8]
SET m.genres = ['sci-fi', 'thriller', 'mystery']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [31.7683, 36.7783, 34.0522]
SET m.filmingLocationLong = [-106.4460, -119.4179, -118.2437]
SET m.boxOfficeNA = 92054159
SET m.boxOfficeEurope = 106780000
SET m.boxOfficeAsia = 49560000
SET m.boxOfficeOther = 10905841;

// Create a classic film
CREATE (TheSilenceOfTheLambs:Movie:GeneratedByClaudeAI {
    title: 'The Silence of the Lambs',
    released: 1991,
    tagline: 'To enter the mind of a killer she must challenge the mind of a madman.',
    budget: 19000000,
    revenue: 272700000,
    runtime_minutes: 118,
    rating_avg: 8.6,
    releaseDate: date('1991-02-14'),
    digitalRelease: datetime('1997-10-25T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
SET m.ratings = [8.7, 8.5, 8.6, 8.6]
SET m.genres = ['crime', 'drama', 'thriller', 'horror']
SET m.certifications = ['R', '18']
SET m.filmingLocationLat = [40.4406, 40.7128, 38.9072]
SET m.filmingLocationLong = [-79.9959, -74.0060, -77.0369]
SET m.boxOfficeNA = 130726716
SET m.boxOfficeEurope = 75800000
SET m.boxOfficeAsia = 42500000
SET m.boxOfficeOther = 23673284;

// Create a recent animated film
CREATE (SpiderVerse:Movie:GeneratedByClaudeAI {
    title: 'Spider-Man: Into the Spider-Verse',
    released: 2018,
    tagline: 'More Than One Wears the Mask',
    budget: 90000000,
    revenue: 375500000,
    runtime_minutes: 117,
    rating_avg: 8.4,
    releaseDate: date('2018-12-14'),
    digitalRelease: datetime('2019-03-19T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
SET m.ratings = [8.4, 8.5, 8.3, 8.4]
SET m.genres = ['animation', 'action', 'adventure']
SET m.certifications = ['PG', 'U']
SET m.animationStudioLat = [34.1593, 34.0901]
SET m.animationStudioLong = [-118.3263, -118.3676]
SET m.boxOfficeNA = 190241310
SET m.boxOfficeEurope = 85400000
SET m.boxOfficeAsia = 77900000
SET m.boxOfficeOther = 21958690;

// Create additional actors and directors
CREATE (JoannaL:Person:GeneratedByClaudeAI {
    name: 'Jodie Foster',
    born: 1962,
    birthdate: date('1962-11-19'),
    nationality: 'American',
    oscarWins: 2,
    oscarNominations: 4,
    isActive: true,
    firstFilm: datetime('1972-06-09T00:00:00Z'),
    directorDebut: date('1991-10-20'),
    heightInMeters: 1.60,
    netWorth: 100000000,
    methodActingScore: 9.3
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Jodie Foster'})
SET p.languages = ['English', 'French', 'Italian', 'Spanish']
SET p.filmography_titles = ['The Silence of the Lambs', 'Taxi Driver', 'Contact']
SET p.filmography_years = [1991, 1976, 1997]
SET p.filmography_roles = ['Clarice Starling', 'Iris Steensma', 'Dr. Eleanor Arroway'];

CREATE (AnthonyH:Person:GeneratedByClaudeAI {
    name: 'Anthony Hopkins',
    born: 1937,
    birthdate: date('1937-12-31'),
    nationality: 'British',
    oscarWins: 2,
    oscarNominations: 6,
    isActive: true,
    firstFilm: datetime('1968-11-15T00:00:00Z'),
    knighted: date('1993-02-23'),
    heightInMeters: 1.74,
    netWorth: 160000000,
    classicalTraining: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Anthony Hopkins'})
SET p.languages = ['English', 'Welsh']
SET p.filmography_titles = ['The Silence of the Lambs', 'The Remains of the Day', 'The Father']
SET p.filmography_years = [1991, 1993, 2020]
SET p.filmography_roles = ['Hannibal Lecter', 'James Stevens', 'Anthony'];

CREATE (JonathanD:Person:GeneratedByClaudeAI {
    name: 'Jonathan Demme',
    born: 1944,
    birthdate: date('1944-02-22'),
    deathdate: date('2017-04-26'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 1,
    isActive: false,
    firstFilm: datetime('1974-07-31T00:00:00Z'),
    lastFilm: datetime('2015-10-10T00:00:00Z'),
    careerLength: duration({years: 41, months: 2}),
    documentaryCount: 8
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Jonathan Demme'})
SET p.genres = ['Drama', 'Thriller', 'Documentary', 'Comedy']
SET p.collaborators = ['Tak Fujimoto', 'Jodie Foster', 'Tom Hanks']
SET p.filmography_titles = ['The Silence of the Lambs', 'Philadelphia', 'Stop Making Sense']
SET p.filmography_years = [1991, 1993, 1984];

CREATE (RyanG:Person:GeneratedByClaudeAI {
    name: 'Ryan Gosling',
    born: 1980,
    birthdate: date('1980-11-12'),
    nationality: 'Canadian',
    oscarNominations: 2,
    isActive: true,
    firstFilm: datetime('1997-01-12T00:00:00Z'),
    musicianSince: date('2009-09-02'),
    heightInMeters: 1.84,
    netWorth: 70000000,
    methodActingScore: 8.8
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Ryan Gosling'})
SET p.languages = ['English', 'French']
SET p.filmography_titles = ['Blade Runner 2049', 'La La Land', 'Drive']
SET p.filmography_years = [2017, 2016, 2011]
SET p.filmography_roles = ['Officer K', 'Sebastian Wilder', 'Driver']
SET p.musicalInstruments = ['Piano', 'Guitar', 'Vocals'];

CREATE (HaileeS:Person:GeneratedByClaudeAI {
    name: 'Hailee Steinfeld',
    born: 1996,
    birthdate: date('1996-12-11'),
    nationality: 'American',
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('2010-12-22T00:00:00Z'),
    musicCareerStart: date('2015-08-07'),
    heightInMeters: 1.73,
    netWorth: 22000000,
    voiceActingScore: 9.2
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Hailee Steinfeld'})
SET p.languages = ['English', 'Spanish']
SET p.filmography_titles = ['Spider-Man: Into the Spider-Verse', 'True Grit', 'Bumblebee']
SET p.filmography_years = [2018, 2010, 2018]
SET p.filmography_roles = ['Gwen Stacy (Voice)', 'Mattie Ross', 'Charlie Watson']
SET p.musicGenres = ['Pop', 'Dance', 'Electronic'];

// Create new production companies
CREATE (SonyPictures:Studio:GeneratedByClaudeAI {
    name: 'Sony Pictures',
    founded: date('1987-12-21'),
    headquartersLat: 34.0211,
    headquartersLong: -118.3787,
    yearlyRevenue2020: 7870000000,
    yearlyRevenue2021: 9240000000,
    yearlyRevenue2022: 8450000000,
    digitalStreamingDate: datetime('2021-04-08T00:00:00Z'),
    isPublic: true,
    marketShare: 0.095
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Sony Pictures'})
SET s.subsidiaries = ['Columbia Pictures', 'TriStar Pictures', 'Sony Pictures Animation']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia', 'Latin America', 'Africa', 'Oceania']
SET s.studioLotsLat = [34.0211, 35.6762]
SET s.studioLotsLong = [-118.3787, 139.6503];

CREATE (OrionPictures:Studio:GeneratedByClaudeAI {
    name: 'Orion Pictures',
    founded: date('1978-01-12'),
    relaunch: date('2020-08-08'),
    headquartersLat: 34.0522,
    headquartersLong: -118.2437,
    yearlyRevenue1991: 480000000,
    yearlyRevenue1992: 510000000,
    bankruptcyDate: date('1991-12-11'),
    acquisitionDate: date('1998-07-10'),
    isActive: true,
    peakMarketShare: 0.065
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Orion Pictures'})
SET s.subsidiaries = ['Orion Classics']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia']
SET s.notableFilms = ['The Silence of the Lambs', 'Dances with Wolves', 'RoboCop']
SET s.notableYears = [1991, 1990, 1987];

// Create filming events
CREATE (BladeRunnerFilming:Production:GeneratedByClaudeAI {
    name: 'Blade Runner 2049 Principal Photography',
    startDate: date('2016-07-12'),
    endDate: date('2016-11-25'),
    durationMonths: 4,
    durationDays: 13,
    startTime: localtime('05:30:00'),
    isCompleted: true,
    budgetPersonnel: 55000000,
    budgetEquipment: 22000000,
    budgetLocations: 28000000,
    budgetVFX: 65000000,
    budgetOther: 15000000,
    weatherGood: 80,
    weatherAcceptable: 15,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Blade Runner 2049 Principal Photography'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['03:30:00', '05:30:00', '06:00:00', '19:00:00']
SET p.scheduleDurations = [2, 0.5, 13, 1.5];

CREATE (SilenceFilming:Production:GeneratedByClaudeAI {
    name: 'The Silence of the Lambs Principal Photography',
    startDate: date('1989-11-15'),
    endDate: date('1990-03-01'),
    durationMonths: 3,
    durationDays: 16,
    startTime: localtime('07:00:00'),
    isCompleted: true,
    budgetPersonnel: 6500000,
    budgetEquipment: 3500000,
    budgetLocations: 5000000,
    budgetVFX: 1000000,
    budgetOther: 3000000,
    weatherGood: 65,
    weatherAcceptable: 25,
    weatherPoor: 10
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'The Silence of the Lambs Principal Photography'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '07:00:00', '07:30:00', '18:30:00']
SET p.scheduleDurations = [2, 0.5, 11, 1];

CREATE (SpiderVerseProduction:Production:GeneratedByClaudeAI {
    name: 'Spider-Verse Animation Production',
    startDate: date('2016-06-15'),
    endDate: date('2018-10-01'),
    durationMonths: 28,
    durationDays: 16,
    isCompleted: true,
    budgetPersonnel: 40000000,
    budgetTechnology: 15000000,
    budgetVoiceActing: 8000000,
    budgetRendering: 20000000,
    budgetOther: 7000000,
    animatorsCount: 177,
    renderFarmServers: 35000,
    renderingHours: 55800
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Spider-Verse Animation Production'})
SET p.productionPhases = ['Story', 'Design', 'Animation', 'Lighting', 'Rendering', 'Compositing']
SET p.phaseStartDates = ['2016-06-15', '2016-09-22', '2017-03-15', '2018-01-10', '2018-06-12', '2018-08-05']
SET p.phaseDurationsMonths = [3.25, 5.75, 10, 5, 2, 2];

// Add reviews
CREATE (BladeRunnerReview:Review:GeneratedByClaudeAI {
    title: 'A Worthy Successor to a Classic',
    stars: 4.5,
    date: date('2017-10-10'),
    time: time('18:23:45+01:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 4.7,
    aspectVisuals: 5.0,
    aspectMusic: 4.8,
    aspectPlot: 4.3,
    reviewText: 'Denis Villeneuve\'s Blade Runner 2049 is a mesmerizing sequel that honors Ridley Scott\'s original masterpiece while expanding its universe in breathtaking ways. The cinematography by Roger Deakins is nothing short of revolutionary.',
    upvotes: 5291
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Worthy Successor to a Classic'})
SET r.commentTimestamps = [datetime('2017-10-10T20:12:33Z'), datetime('2017-10-11T08:45:22Z'), datetime('2017-10-12T14:36:51Z')]
SET r.keywords = ['sequel', 'dystopian', 'visually-stunning', 'philosophical']
SET r.readerLocationsLat = [40.7128, 51.5074, 48.8566]
SET r.readerLocationsLong = [-74.0060, -0.1278, 2.3522];

CREATE (SilenceReview:Review:GeneratedByClaudeAI {
    title: 'Masterful Psychological Horror',
    stars: 5.0,
    date: date('1991-02-20'),
    time: time('14:15:30-05:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 5.0,
    aspectVisuals: 4.7,
    aspectMusic: 4.6,
    aspectPlot: 4.9,
    reviewText: 'The Silence of the Lambs is a perfect thriller that features career-defining performances from both Jodie Foster and Anthony Hopkins. Jonathan Demme\'s direction creates an atmosphere of dread and intensity that never lets up.',
    upvotes: 12853
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Masterful Psychological Horror'})
SET r.commentTimestamps = [datetime('1991-02-20T16:22:13-05:00'), datetime('1991-02-21T09:45:32-05:00'), datetime('1991-02-22T20:12:41-05:00')]
SET r.keywords = ['thriller', 'psychological', 'oscar-winning', 'iconic']
SET r.readerLocationsLat = [40.7128, 34.0522, 41.8781]
SET r.readerLocationsLong = [-74.0060, -118.2437, -87.6298];

CREATE (SpiderVerseReview:Review:GeneratedByClaudeAI {
    title: 'Animation Revolution',
    stars: 4.9,
    date: date('2018-12-18'),
    time: time('21:34:18-08:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectAnimation: 5.0,
    aspectVoiceActing: 4.8,
    aspectMusic: 4.7,
    aspectPlot: 4.8,
    reviewText: 'Spider-Man: Into the Spider-Verse is a groundbreaking achievement in animation that pushes the medium to new heights. The film combines various animation styles to create a comic book come to life, with heart and humor to match its visual splendor.',
    upvotes: 9426
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Animation Revolution'})
SET r.commentTimestamps = [datetime('2018-12-18T22:15:43-08:00'), datetime('2018-12-19T08:22:51-08:00'), datetime('2018-12-20T15:37:22-08:00')]
SET r.keywords = ['animation', 'comic-book', 'multiverse', 'innovative']
SET r.readerLocationsLat = [37.7749, 40.7128, 35.6762]
SET r.readerLocationsLong = [-122.4194, -74.0060, 139.6503];

// Add Golden Globes Award ceremony
CREATE (GoldenGlobes:Ceremony:GeneratedByClaudeAI {
    name: 'Golden Globe Awards',
    nickname: 'Golden Globes',
    established: date('1944-01-20'),
    ceremonyTime: localtime('20:00:00'),
    typicalDurationHrs: 3.0,
    isPrestigious: true,
    locationLat: 34.0736,
    locationLong: -118.4004,
    locationHeight: 82,
    nextCeremony: datetime('2026-01-11T20:00:00-08:00')
})
WITH 1 as dummy
MATCH (c:Ceremony:GeneratedByClaudeAI {name: 'Golden Globe Awards'})
SET c.categories = ['Best Motion Picture - Drama', 'Best Motion Picture - Musical or Comedy', 'Best Director', 'Best Actor - Drama', 'Best Actress - Drama']
SET c.viewership2020 = 18300000
SET c.viewership2021 = 6900000
SET c.viewership2022 = 6300000
SET c.viewership2023 = 9250000;

// Create Annie Awards for animation
CREATE (AnnieAwards:Ceremony:GeneratedByClaudeAI {
    name: 'Annie Awards',
    nickname: 'Annies',
    established: date('1972-11-15'),
    ceremonyTime: localtime('19:00:00'),
    typicalDurationHrs: 2.5,
    isPrestigious: true,
    locationLat: 34.0194,
    locationLong: -118.4912,
    locationHeight: 30,
    nextCeremony: datetime('2026-01-31T19:00:00-08:00')
})
WITH 1 as dummy
MATCH (c:Ceremony:GeneratedByClaudeAI {name: 'Annie Awards'})
SET c.categories = ['Best Animated Feature', 'Best Animated TV/Broadcast Production', 'Best Character Animation', 'Best Direction']
SET c.attendance2019 = 900
SET c.attendance2020 = 950
SET c.attendance2021 = 0
SET c.attendance2022 = 800
SET c.attendance2023 = 950;

// Create relationships between nodes with various data types
MATCH 
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (d)-[:DIRECTED {
    year: 2017,
    daysOnSet: 136,
    satisfaction: 4.9,
    awardNominations: 7,
    completionDate: date('2017-07-15'),
    premiereEvent: datetime('2017-10-03T19:30:00+01:00'),
    durationMonths: 4,
    isFirstCollaboration: false
}]->(b);

MATCH 
  (j:Person:GeneratedByClaudeAI {name: 'Jonathan Demme'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
CREATE (j)-[:DIRECTED {
    year: 1991,
    daysOnSet: 105,
    satisfaction: 4.9,
    awardNominations: 10,
    completionDate: date('1990-11-15'),
    premiereEvent: datetime('1991-01-30T19:00:00-05:00'),
    durationMonths: 5,
    isFirstCollaboration: true
}]->(s);

// Actor to Movie relationships
MATCH
  (r:Person:GeneratedByClaudeAI {name: 'Ryan Gosling'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (r)-[:ACTED_IN {
    roles: ['Officer K'],
    salary: 10000000,
    screenTimeMinutes: 143,
    startDate: date('2016-07-12'),
    endDate: date('2016-11-25'),
    scheduleConflicts: false,
    criticScore: 94,
    audienceScore: 90,
    awardNominations: 3
}]->(b);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Jodie Foster'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
CREATE (j)-[:ACTED_IN {
    roles: ['Clarice Starling'],
    salary: 1200000,
    screenTimeMinutes: 102,
    startDate: date('1989-11-15'),
    endDate: date('1990-03-01'),
    scheduleConflicts: false,
    criticScore: 97,
    audienceScore: 95,
    awardNominations: 8,
    awardWins: 5
}]->(s);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Anthony Hopkins'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
CREATE (a)-[:ACTED_IN {
    roles: ['Dr. Hannibal Lecter'],
    salary: 1000000,
    screenTimeMinutes: 16,
    startDate: date('1989-12-10'),
    endDate: date('1990-01-15'),
    scheduleConflicts: false,
    criticScore: 99,
    audienceScore: 97,
    awardNominations: 8,
    awardWins: 6
}]->(s);

MATCH
  (h:Person:GeneratedByClaudeAI {name: 'Hailee Steinfeld'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (h)-[:VOICED_IN {
    roles: ['Gwen Stacy / Spider-Gwen'],
    salary: 750000,
    recordingDays: 14,
    startDate: date('2017-04-15'),
    endDate: date('2018-06-22'),
    recordingSessions: 8,
    linesCount: 425,
    performanceRating: 4.8
}]->(s);

// Studio relationships
MATCH
  (a:Studio:GeneratedByClaudeAI {name: 'A24'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (a)-[:CO_PRODUCED {
    investment: 45000000,
    return: 63000000,
    roi: 1.4,
    contractSigned: date('2015-06-22'),
    studioShare: 0.15,
    marketingContribution: 12000000,
    isProfitable: true,
    marketingStart: datetime('2017-03-15T00:00:00Z'),
    profitDate: date('2018-02-28')
}]->(b);

MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (w)-[:PRODUCED {
    investment: 140000000,
    return: 196300000,
    roi: 1.4,
    contractSigned: date('2015-02-10'),
    studioShare: 0.6,
    directorShare: 0.1,
    producerShare: 0.1,
    topCastShare: 0.05,
    marketingBudget: 150000000,
    isProfitable: false,
    marketingStart: datetime('2017-01-15T00:00:00Z')
}]->(b);

MATCH
  (o:Studio:GeneratedByClaudeAI {name: 'Orion Pictures'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
CREATE (o)-[:PRODUCED {
    investment: 19000000,
    return: 272700000,
    roi: 14.35,
    contractSigned: date('1989-06-15'),
    studioShare: 0.65,
    directorShare: 0.08,
    producerShare: 0.07,
    topCastShare: 0.2,
    marketingBudget: 9000000,
    isProfitable: true,
    marketingStart: datetime('1990-11-15T00:00:00Z'),
    breakEvenDate: date('1991-03-22')
}]->(s);

MATCH
  (s:Studio:GeneratedByClaudeAI {name: 'Sony Pictures'}),
  (sv:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (s)-[:PRODUCED {
    investment: 90000000,
    return: 375500000,
    roi: 4.17,
    contractSigned: date('2015-09-30'),
    studioShare: 0.7,
    directorShare: 0.08,
    producerShare: 0.12,
    topCastShare: 0.1,
    marketingBudget: 110000000,
    isProfitable: true,
    marketingStart: datetime('2018-05-15T00:00:00Z'),
    breakEvenDate: date('2019-01-18')
}]->(sv);

// Studio to filming relationship
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'Blade Runner 2049 Principal Photography'})
CREATE (w)-[:FINANCED {
    contractDate: date('2015-02-10'),
    amount: 140000000,
    isFullyPaid: true,
    transferTime1: datetime('2016-02-15T00:00:00Z'),
    transferTime2: datetime('2016-05-12T00:00:00Z'),
    transferTime3: datetime('2016-06-30T00:00:00Z'),
    paymentDate1: date('2016-02-15'),
    paymentAmount1: 40000000,
    paymentDate2: date('2016-05-12'),
    paymentAmount2: 50000000,
    paymentDate3: date('2016-06-30'),
    paymentAmount3: 50000000
}]->(p);

MATCH
  (o:Studio:GeneratedByClaudeAI {name: 'Orion Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'The Silence of the Lambs Principal Photography'})
CREATE (o)-[:FINANCED {
    contractDate: date('1989-06-15'),
    amount: 19000000,
    isFullyPaid: true,
    transferTime1: datetime('1989-08-22T00:00:00Z'),
    transferTime2: datetime('1989-10-30T00:00:00Z'),
    paymentDate1: date('1989-08-22'),
    paymentAmount1: 9000000,
    paymentDate2: date('1989-10-30'),
    paymentAmount2: 10000000
}]->(p);

MATCH
  (s:Studio:GeneratedByClaudeAI {name: 'Sony Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'Spider-Verse Animation Production'})
CREATE (s)-[:FINANCED {
    contractDate: date('2015-09-30'),
    amount: 90000000,
    isFullyPaid: true,
    transferTime1: datetime('2016-01-15T00:00:00Z'),
    transferTime2: datetime('2016-12-15T00:00:00Z'),
    transferTime3: datetime('2017-06-30T00:00:00Z'),
    transferTime4: datetime('2018-01-15T00:00:00Z'),
    paymentDate1: date('2016-01-15'),
    paymentAmount1: 20000000,
    paymentDate2: date('2016-12-15'),
    paymentAmount2: 25000000,
    paymentDate3: date('2017-06-30'),
    paymentAmount3: 30000000,
    paymentDate4: date('2018-01-15'),
    paymentAmount4: 15000000
}]->(p);

// Filming to movie relationship
MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Blade Runner 2049 Principal Photography'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 4,
    durationDays: 13,
    locationCount: 7,
    dailyAverageCost: 580000,
    scheduleAdherence: 0.94,
    weatherDelaysDays: 6,
    originalScheduledEnd: date('2016-11-15')
}]->(b);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'The Silence of the Lambs Principal Photography'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 3,
    durationDays: 16,
    locationCount: 12,
    dailyAverageCost: 150000,
    scheduleAdherence: 0.96,
    weatherDelaysDays: 4,
    originalScheduledEnd: date('1990-02-20')
}]->(s);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Spider-Verse Animation Production'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 28,
    durationDays: 16,
    animationStudios: 3,
    dailyAverageCost: 110000,
    scheduleAdherence: 0.92,
    technologyDelaysDays: 45,
    originalScheduledEnd: date('2018-08-15'),
    animationFrames: 168452,
    renderingHours: 55800
}]->(s);

// Review relationships
MATCH
  (a:Person {name: 'Angela Scope'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'A Worthy Successor to a Classic'})
CREATE (a)-[:WROTE {
    date: date('2017-10-10'),
    timeSpentMinutes: 55,
    wordCount: 645,
    isVerified: true,
    submissionTime: time('18:23:45+01:00')
}]->(r);

MATCH
  (j:Person {name: 'Jessica Thompson'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'Masterful Psychological Horror'})
CREATE (j)-[:WROTE {
    date: date('1991-02-20'),
    timeSpentMinutes: 60,
    wordCount: 712,
    isVerified: true,
    submissionTime: time('14:15:30-05:00'),
    publicationName: 'Film Journal',
    isRetroReview: false
}]->(r);

MATCH
  (p:Person {name: 'Paul Blythe'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'Animation Revolution'})
CREATE (p)-[:WROTE {
    date: date('2018-12-18'),
    timeSpentMinutes: 50,
    wordCount: 685,
    isVerified: true,
    submissionTime: time('21:34:18-08:00')
}]->(r);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'A Worthy Successor to a Classic'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 183452,
    shares: 7562,
    comments: 2875,
    featuredDurationDays: 28,
    publicationDateTime: datetime('2017-10-10T19:30:00+01:00')
}]->(b);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'Masterful Psychological Horror'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 345782,
    shares: 2845,
    comments: 1923,
    featuredDurationDays: 45,
    publicationDateTime: datetime('1991-02-20T15:30:00-05:00'),
    reprintCount: 8,
    digitalArchiveDate: date('1998-05-12')
}]->(s);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'Animation Revolution'}),
  (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 256893,
    shares: 15478,
    comments: 3562,
    featuredDurationDays: 30,
    publicationDateTime: datetime('2018-12-18T22:15:00-08:00')
}]->(s);

// Award relationships
MATCH
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (b)-[:NOMINATED_FOR {
    category: 'Best Cinematography',
    year: 2018,
    ceremony: 90,
    isWinner: true,
    ceremonyDate: date('2018-03-04'),
    announcementTime: localtime('20:15:00'),
    votesFor: 4567,
    votesAgainst: 2123
}]->(a);

MATCH
  (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'}),
  (g:Ceremony:GeneratedByClaudeAI {name: 'Golden Globe Awards'})
CREATE (b)-[:NOMINATED_FOR {
    category: 'Best Original Score',
    year: 2018,
    ceremony: 75,
    isWinner: false,
    ceremonyDate: date('2018-01-07'),
    announcementTime: localtime('21:30:00'),
    votesFor: 32,
    votesAgainst: 58
}]->(g);

MATCH
  (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (s)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 1992,
    ceremony: 64,
    isWinner: true,
    ceremonyDate: date('1992-03-30'),
    announcementTime: localtime('21:45:00'),
    votesFor: 4786,
    votesAgainst: 1234
}]->(a);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Jodie Foster'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (j)-[:NOMINATED_FOR {
    category: 'Best Actress',
    year: 1992,
    ceremony: 64,
    isWinner: true,
    ceremonyDate: date('1992-03-30'),
    announcementTime: localtime('20:25:00'),
    votesFor: 4562,
    votesAgainst: 1458,
    speechDuration: duration({minutes: 2, seconds: 47})
}]->(a);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Anthony Hopkins'}),
  (c:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (a)-[:NOMINATED_FOR {
    category: 'Best Actor',
    year: 1992,
    ceremony: 64,
    isWinner: true,
    ceremonyDate: date('1992-03-30'),
    announcementTime: localtime('20:55:00'),
    votesFor: 4876,
    votesAgainst: 1144,
    speechDuration: null
}]->(c);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Jonathan Demme'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (j)-[:NOMINATED_FOR {
    category: 'Best Director',
    year: 1992,
    ceremony: 64,
    isWinner: true,
    ceremonyDate: date('1992-03-30'),
    announcementTime: localtime('21:15:00'),
    votesFor: 4352,
    votesAgainst: 1668,
    speechDuration: duration({minutes: 3, seconds: 12})
}]->(a);

MATCH
  (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (s)-[:NOMINATED_FOR {
    category: 'Best Animated Feature Film',
    year: 2019,
    ceremony: 91,
    isWinner: true,
    ceremonyDate: date('2019-02-24'),
    announcementTime: localtime('19:35:00'),
    votesFor: 4879,
    votesAgainst: 1121
}]->(a);

MATCH
  (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Annie Awards'})
CREATE (s)-[:NOMINATED_FOR {
    category: 'Best Animated Feature',
    year: 2019,
    ceremony: 46,
    isWinner: true,
    ceremonyDate: date('2019-02-02'),
    announcementTime: localtime('20:45:00'),
    categories: 7,
    wins: 7
}]->(a);

// Professional relationships between people
MATCH
  (r:Person:GeneratedByClaudeAI {name: 'Ryan Gosling'}),
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'})
CREATE (r)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'Blade Runner 2049',
    firstYear: 2017,
    chemistry: 4.9,
    interviews: 28,
    relationship: 'Actor-Director',
    nextProjectPlanned: date('2026-06-15')
}]->(d);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Jodie Foster'}),
  (a:Person:GeneratedByClaudeAI {name: 'Anthony Hopkins'})
CREATE (j)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'The Silence of the Lambs',
    firstYear: 1991,
    chemistry: 5.0,
    interviews: 45,
    jointSceneMinutes: 22,
    relationship: 'Co-stars',
    reunionAttempts: 3
}]->(a);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Jodie Foster'}),
  (jd:Person:GeneratedByClaudeAI {name: 'Jonathan Demme'})
CREATE (j)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'The Silence of the Lambs',
    firstYear: 1991,
    chemistry: 4.9,
    interviews: 32,
    relationship: 'Actor-Director',
    awards: ['Academy Award', 'Golden Globe', 'BAFTA']
}]->(jd);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Anthony Hopkins'}),
  (jd:Person:GeneratedByClaudeAI {name: 'Jonathan Demme'})
CREATE (a)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'The Silence of the Lambs',
    firstYear: 1991,
    chemistry: 4.8,
    interviews: 28,
    relationship: 'Actor-Director',
    filmedDays: 14
}]->(jd);

MATCH
  (h:Person:GeneratedByClaudeAI {name: 'Hailee Steinfeld'}),
  (r:Person:GeneratedByClaudeAI {name: 'Ryan Gosling'})
CREATE (h)-[:KNOWS {
    since: date('2016-08-12'),
    relationship: 'Professional Acquaintances',
    lastMeeting: date('2023-05-18'),
    durationYears: 7,
    commonFriends: 5,
    commonProjects: 0
}]->(r);

// Connection with original graph
MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Anthony Hopkins'}),
  (j:Person {name: 'Jack Nicholson'}) // Original person from the graph
CREATE (a)-[:ADMIRES {
    since: date('1975-11-08'),
    projects: 0,
    relationship: 'Professional Admiration',
    lastContact: date('2019-06-22'),
    inspirationLevel: 4.9,
    influencedWorks: ['The Silence of the Lambs', 'The Father']
}]->(j);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Jodie Foster'}),
  (r:Person {name: 'Renee Zellweger'}) // Original person from the graph
CREATE (j)-[:KNOWS {
    since: date('1995-03-15'),
    relationship: 'Friends',
    lastMeeting: date('2022-11-28'),
    durationYears: 28,
    commonEvents: 15,
    commonFriends: 8
}]->(r);

// Create additional property types on existing relationships
MATCH (j:Person:GeneratedByClaudeAI {name: 'Jonathan Demme'})-[r:DIRECTED]->(s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
SET r.technicalChallenges = ['Clarice-Lecter scenes', 'Buffalo Bill characterization', 'Suspense building']
SET r.techChallengeRatings = [5.0, 4.8, 4.9]
SET r.consultants = ['FBI Behavioral Science Unit', 'John Douglas']
SET r.consultationHours = [120, 85]
SET r.scriptChanges = 23
SET r.finalRuntime = duration({hours: 1, minutes: 58})
SET r.originalRuntime = duration({hours: 2, minutes: 25});

// Create custom prop node for The Silence of the Lambs
CREATE (MothCocoon:Prop:GeneratedByClaudeAI {
    name: 'Death\'s-head Hawkmoth Cocoon',
    movie: 'The Silence of the Lambs',
    material: 'Resin and mixed media',
    weight: 0.05,
    weightUnit: 'kg',
    createdDate: date('1989-10-15'),
    screenTime: duration({minutes: 0, seconds: 45}),
    isIconic: true,
    auctionValue: 8500,
    copiesMade: 15
})
WITH 1 as dummy
MATCH (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'}),
      (p:Prop:GeneratedByClaudeAI {name: 'Death\'s-head Hawkmoth Cocoon'})
CREATE (p)-[:USED_IN {
    scenes: ['Autopsy', 'Evidence'],
    sceneCount: 2,
    firstAppearance: time('00:35:22'),
    lastAppearance: time('00:36:07'),
    isCloseup: true,
    significance: 'Critical clue'
}]->(s);

// Create soundtrack node for Silence of the Lambs
CREATE (SilenceSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'The Silence of the Lambs: Original Motion Picture Soundtrack',
    composer: 'Howard Shore',
    released: date('1991-02-12'),
    duration: duration({minutes: 53, seconds: 20}),
    trackCount: 15,
    recordingStudio: 'CTS Studios, London',
    recordingStudioLat: 51.5074,
    recordingStudioLong: -0.1278,
    peakChartPosition: 120,
    salesUnits: 75000,
    streamingCount: 12000000
})
WITH 1 as dummy
MATCH (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'}),
      (st:Soundtrack:GeneratedByClaudeAI {title: 'The Silence of the Lambs: Original Motion Picture Soundtrack'})
CREATE (st)-[:COMPOSED_FOR {
    contractDate: date('1989-08-15'),
    completion: date('1990-12-10'),
    nominatedAwards: ['Saturn Award'],
    wonAwards: [],
    spotifyStreams: 8500000,
    youtubeViews: 6200000
}]->(s);

// Create location node for Silence of the Lambs
CREATE (PittsburghLocation:FilmingLocation:GeneratedByClaudeAI {
    name: 'Western Pennsylvania',
    country: 'USA',
    region: 'Pittsburgh area',
    latitude: 40.4406,
    longitude: -79.9959,
    elevation: 232,
    elevationUnit: 'm',
    climate: 'Temperate',
    permitCost: 45000,
    permitCurrency: 'USD',
    firstUsed: date('1989-11-15'),
    lastUsed: date('1990-02-10')
})
WITH 1 as dummy
MATCH (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Western Pennsylvania'})
CREATE (s)-[:FILMED_AT {
    startDate: date('1989-11-15'),
    endDate: date('1990-02-10'),
    sceneCount: 32,
    totalDays: 87,
    weatherDelayDays: 8,
    crewSize: 85,
    logisticsCost: 180000,
    accommodationCost: 145000,
    characterPresent: ['Clarice Starling', 'Jack Crawford', 'Buffalo Bill']
}]->(l);

// Create animation studio node
CREATE (SonyAnimation:AnimationStudio:GeneratedByClaudeAI {
    name: 'Sony Pictures Animation',
    founded: date('2002-05-09'),
    headquartersLat: 34.0211,
    headquartersLong: -118.3787,
    employeeCount: 800,
    animationStyle: 'Mixed/Various',
    specialization: 'Feature Animation',
    yearlyProductions: 2.5,
    technologyBudget: 45000000,
    awardWins: 15
})
WITH 1 as dummy
MATCH (s:AnimationStudio:GeneratedByClaudeAI {name: 'Sony Pictures Animation'}),
      (sv:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (s)-[:ANIMATED {
    startDate: date('2016-06-15'),
    endDate: date('2018-09-15'),
    teamSize: 142,
    leadAnimators: 28,
    technicalInnovations: ['Comic book visual style', 'Mixed frame rates', 'Hand-drawn elements'],
    softwareUsed: ['Maya', 'Houdini', 'Proprietary tools'],
    renderingHours: 55800,
    totalFrames: 168452
}]->(sv);

// Create director relationships for Spider-Verse
CREATE (BobP:Person:GeneratedByClaudeAI {
    name: 'Bob Persichetti',
    born: 1973,
    birthdate: date('1973-01-17'),
    nationality: 'American',
    oscarWins: 1,
    isActive: true,
    firstFilm: datetime('2018-12-14T00:00:00Z'),
    animationBackground: true,
    specialization: 'Animation Direction',
    yearsInIndustry: 25
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Bob Persichetti'}),
      (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (p)-[:CO_DIRECTED {
    year: 2018,
    daysOnProject: 912,
    satisfaction: 4.9,
    awardNominations: 12,
    awardWins: 8,
    completionDate: date('2018-10-01'),
    premiereEvent: datetime('2018-12-01T19:00:00-08:00'),
    durationMonths: 30,
    responsibility: 'Animation Direction',
    isFirstDirectingRole: true
}]->(s);

// Create costume designer for Silence of the Lambs
CREATE (ColetteA:Person:GeneratedByClaudeAI {
    name: 'Colleen Atwood',
    born: 1948,
    birthdate: date('1948-09-25'),
    nationality: 'American',
    oscarWins: 4,
    oscarNominations: 12,
    isActive: true,
    firstFilm: datetime('1984-11-09T00:00:00Z'),
    designStyle: 'Period-accurate with subtle character elements',
    heightInMeters: 1.65,
    specialization: 'Costume Design'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Colleen Atwood'}),
      (s:Movie:GeneratedByClaudeAI {title: 'The Silence of the Lambs'})
CREATE (p)-[:DESIGNED_COSTUMES_FOR {
    year: 1991,
    costumesCreated: 248,
    budget: 380000,
    awardNominations: 3,
    awardWins: 1,
    startDate: date('1989-09-15'),
    completionDate: date('1989-11-10'),
    specialCostumes: ['Buffalo Bill', 'Hannibal Lecter restraints', 'FBI uniforms'],
    researchHours: 120
}]->(s);

// Create cinematographer for Blade Runner 2049
CREATE (RogerD:Person:GeneratedByClaudeAI {
    name: 'Roger Deakins',
    born: 1949,
    birthdate: date('1949-05-24'),
    nationality: 'British',
    oscarWins: 2,
    oscarNominations: 15,
    isActive: true,
    firstFilm: datetime('1984-01-20T00:00:00Z'),
    knighted: date('2021-02-12'),
    cameraPreference: 'ARRI Alexa',
    visualStyle: 'Naturalistic lighting with striking composition'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Roger Deakins'}),
      (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (p)-[:CINEMATOGRAPHY_FOR {
    year: 2017,
    cameras: ['ARRI Alexa XT', 'ARRI Alexa Mini'],
    lenses: ['Zeiss Master Primes', 'Cooke S4'],
    awardNominations: 15,
    awardWins: 12,
    startDate: date('2016-07-12'),
    completionDate: date('2016-11-25'),
    signature_shots: ['Las Vegas ruins', 'Snow fight', 'Ocean wall'],
    lighting_setups: 137
}]->(b);

// Create fan community node for Blade Runner
CREATE (BladeRunnerFandom:FanCommunity:GeneratedByClaudeAI {
    name: 'Blade Runner Fan Community',
    established: date('1982-06-25'),
    expansion2049: date('2017-10-06'),
    memberCount: 356000,
    onlinePlatforms: 5,
    annualConventions: 3,
    largestEventAttendance: 8500,
    contentCreators: 15800,
    fanfictionCount: 12500,
    fanArtCount: 35600,
    academicPapers: 248
})
WITH 1 as dummy
MATCH (f:FanCommunity:GeneratedByClaudeAI {name: 'Blade Runner Fan Community'}),
      (b:Movie:GeneratedByClaudeAI {title: 'Blade Runner 2049'})
CREATE (f)-[:ENGAGED_WITH {
    anticipationScore: 9.5,
    reviewsSubmitted: 45800,
    averageRating: 8.7,
    onlineDiscussions: 12500,
    theoriesGenerated: 3400,
    preReleaseEvents: 28,
    postReleaseEvents: 112,
    merchandiseSales: 3800000,
    reissuesCampaigns: 5
}]->(b);

// Create technical innovation node for Spider-Verse
CREATE (SpiderVerseInnovation:TechnicalInnovation:GeneratedByClaudeAI {
    name: 'Spider-Verse Animation Style',
    developedDate: date('2016-09-25'),
    patented: date('2019-03-15'),
    teamSize: 38,
    developmentCost: 15000000,
    mainApplication: 'Animated Feature Films',
    secondaryApplications: 3,
    technicalPapersPublished: 8,
    industryAwards: 12,
    adoptionRate: 0.65
})
WITH 1 as dummy
MATCH (t:TechnicalInnovation:GeneratedByClaudeAI {name: 'Spider-Verse Animation Style'}),
      (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (t)-[:USED_IN {
    implementationDate: date('2016-09-25'),
    fullIntegrationDate: date('2018-05-15'),
    developmentPhases: 4,
    testingIterations: 15,
    successMetric: 'Visual distinction and audience response',
    successScore: 9.8,
    industryInfluence: 'Major',
    subsequentAdopters: 12
}]->(s);

// Create music composer for Spider-Verse
CREATE (DanielP:Person:GeneratedByClaudeAI {
    name: 'Daniel Pemberton',
    born: 1977,
    birthdate: date('1977-11-03'),
    nationality: 'British',
    awardWins: 5,
    awardNominations: 15,
    isActive: true,
    firstFilm: datetime('2011-05-25T00:00:00Z'),
    musicStyle: 'Eclectic with electronic elements',
    instrumentsPlayed: 6,
    studioLocation: 'London'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Daniel Pemberton'}),
      (s:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Into the Spider-Verse'})
CREATE (p)-[:COMPOSED_MUSIC_FOR {
    year: 2018,
    tracksComposed: 25,
    recordingDays: 42,
    instrumentsUsed: 28,
    electronicallyProduced: true,
    collaboratingArtists: 8,
    startDate: date('2017-05-15'),
    completionDate: date('2018-09-10'),
    signature_themes: ['Miles\' Theme', 'Spider-Heroes', 'Leap of Faith'],
    recording_studios: 3
}]->(s);