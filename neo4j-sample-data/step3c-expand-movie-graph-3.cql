// Create a classic film
CREATE (CitizenKane:Movie:GeneratedByClaudeAI {
    title: 'Citizen Kane',
    released: 1941,
    tagline: 'It\'s Terrific!',
    budget: 839727,
    revenue: 1585634,
    runtime_minutes: 119,
    rating_avg: 8.3,
    releaseDate: date('1941-09-05'),
    digitalRestoration: datetime('1998-11-25T00:00:00Z'),
    isOscarWinner: true,
    preservationDate: date('1989-12-14'),
    isPreservationRegistry: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
SET m.ratings = [8.4, 8.3, 8.2, 8.3]
SET m.genres = ['drama', 'mystery']
SET m.certifications = ['PG', 'U']
SET m.filmingLocationLat = [34.0522, 40.7128]
SET m.filmingLocationLong = [-118.2437, -74.0060]
SET m.boxOfficeNA = 1585634
SET m.initialReviews = ['mixed', 'controversial', 'revolutionary']
SET m.preservationRegistry = 'National Film Registry'
SET m.technicalInnovations = ['Deep focus', 'Low-angle shots', 'Flashback structure'];

// Create an acclaimed foreign film
CREATE (Parasite:Movie:GeneratedByClaudeAI {
    title: 'Parasite',
    released: 2019,
    tagline: 'Act like you own the place',
    budget: 11400000,
    revenue: 263100000,
    runtime_minutes: 132,
    rating_avg: 8.5,
    releaseDate: date('2019-05-30'),
    digitalRelease: datetime('2020-01-14T00:00:00Z'),
    isOscarWinner: true,
    isInternational: true,
    originalLanguage: 'Korean'
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Parasite'})
SET m.ratings = [8.6, 8.5, 8.4, 8.5]
SET m.genres = ['thriller', 'drama', 'comedy', 'social commentary']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [37.5665, 37.5519]
SET m.filmingLocationLong = [126.9780, 126.9918]
SET m.boxOfficeNA = 53369749
SET m.boxOfficeInternational = 209751049
SET m.subtitleLanguages = ['English', 'Spanish', 'French', 'Japanese', 'German']
SET m.festivalsWon = ['Cannes Film Festival', 'Academy Awards', 'BAFTA', 'Golden Globe'];

// Create an acclaimed documentary
CREATE (MarchOfThePenguins:Movie:GeneratedByClaudeAI {
    title: 'March of the Penguins',
    released: 2005,
    tagline: 'In the harshest place on Earth, love finds a way',
    budget: 8000000,
    revenue: 127400000,
    runtime_minutes: 80,
    rating_avg: 7.5,
    releaseDate: date('2005-01-26'),
    digitalRelease: datetime('2005-11-29T00:00:00Z'),
    isOscarWinner: true,
    isDocumentary: true,
    filmingConditions: 'Extreme Antarctic'
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
SET m.ratings = [7.6, 7.5, 7.4, 7.5]
SET m.genres = ['documentary', 'nature']
SET m.certifications = ['G', 'U']
SET m.filmingLocationLat = [-75.2500]
SET m.filmingLocationLong = [0.0000]
SET m.boxOfficeNA = 77437223
SET m.boxOfficeInternational = 49962777
SET m.narrators = ['Morgan Freeman', 'Charles Berling']
SET m.filmingDuration = duration({months: 13})
SET m.extremeTemperatures = [-40, -70]
SET m.temperatureUnit = 'Celsius';

// Create notable historical film personalities
CREATE (OrsonW:Person:GeneratedByClaudeAI {
    name: 'Orson Welles',
    born: 1915,
    died: 1985,
    birthdate: date('1915-05-06'),
    deathdate: date('1985-10-10'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 3,
    isActive: false,
    firstFilm: datetime('1941-09-05T00:00:00Z'),
    lastFilm: datetime('1985-10-10T00:00:00Z'),
    careerLength: duration({years: 44, months: 5}),
    heightInMeters: 1.87,
    significance: 'Pioneer in filmmaking techniques'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Orson Welles'})
SET p.languages = ['English', 'French', 'Spanish', 'Italian']
SET p.skillSets = ['Directing', 'Acting', 'Writing', 'Producing', 'Radio']
SET p.filmography_titles = ['Citizen Kane', 'The Magnificent Ambersons', 'Touch of Evil']
SET p.filmography_years = [1941, 1942, 1958]
SET p.filmography_roles = ['Charles Foster Kane', 'Narrator', 'Hank Quinlan'];

CREATE (BongJH:Person:GeneratedByClaudeAI {
    name: 'Bong Joon-ho',
    born: 1969,
    birthdate: date('1969-09-14'),
    nationality: 'South Korean',
    oscarWins: 4,
    oscarNominations: 4,
    isActive: true,
    firstFilm: datetime('2000-02-05T00:00:00Z'),
    careerLength: duration({years: 23}),
    heightInMeters: 1.74,
    filmingStyle: 'Genre-mixing with social commentary'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Bong Joon-ho'})
SET p.languages = ['Korean', 'English']
SET p.skillSets = ['Directing', 'Writing', 'Producing']
SET p.filmography_titles = ['Parasite', 'Snowpiercer', 'Okja', 'The Host']
SET p.filmography_years = [2019, 2013, 2017, 2006]
SET p.internationalRecognition = ['Cannes', 'Academy Awards', 'BAFTA'];

CREATE (LucJacquet:Person:GeneratedByClaudeAI {
    name: 'Luc Jacquet',
    born: 1967,
    birthdate: date('1967-12-05'),
    nationality: 'French',
    oscarWins: 1,
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('2005-01-26T00:00:00Z'),
    background: 'Biologist',
    specialization: 'Nature Documentaries',
    heightInMeters: 1.78
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Luc Jacquet'})
SET p.languages = ['French', 'English']
SET p.academicDegrees = ['Biology', 'Ecology']
SET p.filmography_titles = ['March of the Penguins', 'The Fox and the Child', 'Ice and the Sky']
SET p.filmography_years = [2005, 2007, 2015]
SET p.fieldworkLocations = ['Antarctica', 'Arctic', 'Alps'];

CREATE (SongKS:Person:GeneratedByClaudeAI {
    name: 'Song Kang-ho',
    born: 1967,
    birthdate: date('1967-01-17'),
    nationality: 'South Korean',
    oscarNominations: 0,
    isActive: true,
    firstFilm: datetime('1996-10-15T00:00:00Z'),
    heightInMeters: 1.80,
    netWorth: 20000000,
    actingRangeScore: 9.5,
    collaborationsWithBong: 4
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Song Kang-ho'})
SET p.languages = ['Korean', 'English']
SET p.filmography_titles = ['Parasite', 'The Host', 'Snowpiercer', 'Memories of Murder']
SET p.filmography_years = [2019, 2006, 2013, 2003]
SET p.filmography_roles = ['Kim Ki-taek', 'Park Gang-du', 'Namgoong Minsu', 'Detective Park'];

// Create editor/cinematographer
CREATE (GreggT:Person:GeneratedByClaudeAI {
    name: 'Gregg Toland',
    born: 1904,
    died: 1948,
    birthdate: date('1904-05-29'),
    deathdate: date('1948-09-28'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 6,
    isActive: false,
    firstFilm: datetime('1930-01-01T00:00:00Z'),
    lastFilm: datetime('1948-01-15T00:00:00Z'),
    careerLength: duration({years: 18}),
    specialization: 'Cinematography',
    technicalInnovations: 5
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Gregg Toland'})
SET p.innovations = ['Deep focus', 'Low-angle shots', 'Chiaroscuro lighting']
SET p.filmography_titles = ['Citizen Kane', 'The Grapes of Wrath', 'The Best Years of Our Lives']
SET p.filmography_years = [1941, 1940, 1946]
SET p.technicalPreferences = ['Deep focus lenses', 'Low-key lighting', 'Wide-angle lenses'];

// Create more studios
CREATE (CJEntertainment:Studio:GeneratedByClaudeAI {
    name: 'CJ Entertainment',
    founded: date('1995-09-01'),
    headquartersLat: 37.5665,
    headquartersLong: 126.9780,
    yearlyRevenue2019: 850000000,
    yearlyRevenue2020: 720000000,
    yearlyRevenue2021: 890000000,
    digitalStreamingDate: datetime('2018-05-15T00:00:00Z'),
    isPublic: true,
    marketShare: 0.032,
    internationalPresence: 12
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'CJ Entertainment'})
SET s.subsidiaries = ['CJ CGV', 'CJ E&M']
SET s.distributionMarkets = ['South Korea', 'North America', 'Asia', 'Europe']
SET s.studioLotsLat = [37.5665, 34.0522]
SET s.studioLotsLong = [126.9780, -118.2437]
SET s.internationalOffices = ['Los Angeles', 'Tokyo', 'Beijing', 'London'];

CREATE (DisneyNature:Studio:GeneratedByClaudeAI {
    name: 'Disneynature',
    founded: date('2008-04-21'),
    headquartersLat: 34.1551,
    headquartersLong: -118.3213,
    yearlyRevenue2019: 120000000,
    yearlyRevenue2020: 85000000,
    yearlyRevenue2021: 110000000,
    digitalStreamingDate: datetime('2020-03-28T00:00:00Z'),
    isPublic: false,
    parentCompany: 'Walt Disney Studios',
    conservationContributions: 35000000
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Disneynature'})
SET s.documentaryFocus = ['Wildlife', 'Conservation', 'Environmental']
SET s.distributionMarkets = ['Global']
SET s.releasedTitles = ['Earth', 'Oceans', 'African Cats', 'Bears', 'Penguins']
SET s.releasedYears = [2009, 2010, 2011, 2014, 2019]
SET s.conservationPartners = ['Conservation International', 'WWF', 'Wildlife Conservation Network'];

CREATE (RKOPictures:Studio:GeneratedByClaudeAI {
    name: 'RKO Pictures',
    founded: date('1928-01-25'),
    dissolved: date('1959-12-31'),
    reestablished: date('1989-01-15'),
    headquartersLat: 34.0522,
    headquartersLong: -118.2437,
    peakYearlyRevenue: 120000000,
    peakYear: 1946,
    digitalArchiveCreation: datetime('2001-06-15T00:00:00Z'),
    isActive: false,
    historicalSignificance: 'Major Golden Age Studio'
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'RKO Pictures'})
SET s.notableFilms = ['Citizen Kane', 'King Kong', 'It\'s a Wonderful Life']
SET s.notableYears = [1941, 1933, 1946]
SET s.studioLotsHistorical = ['Hollywood', 'Culver City', 'New York']
SET s.keyFigures = ['Howard Hughes', 'Floyd Odlum', 'Peter Rathvon']
SET s.archivalFootageHours = 5200;

// Create filming events
CREATE (CitizenKaneProduction:Production:GeneratedByClaudeAI {
    name: 'Citizen Kane Production',
    startDate: date('1940-07-22'),
    endDate: date('1940-10-23'),
    durationMonths: 3,
    durationDays: 1,
    startTime: localtime('08:00:00'),
    isCompleted: true,
    budgetPersonnel: 350000,
    budgetEquipment: 150000,
    budgetLocations: 100000,
    budgetSets: 200000,
    budgetOther: 39727,
    weatherGood: 85,
    weatherAcceptable: 12,
    weatherPoor: 3
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Citizen Kane Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['06:00:00', '07:30:00', '08:00:00', '19:00:00']
SET p.scheduleDurations = [1.5, 0.5, 11, 1]
SET p.technicalInnovations = ['Deep focus cinematography', 'Low-angle shots', 'Ceiling shots']
SET p.innovationImpact = [9.5, 9.0, 8.8];

CREATE (ParasiteProduction:Production:GeneratedByClaudeAI {
    name: 'Parasite Production',
    startDate: date('2018-05-18'),
    endDate: date('2018-09-19'),
    durationMonths: 4,
    durationDays: 1,
    startTime: localtime('07:00:00'),
    isCompleted: true,
    budgetPersonnel: 4500000,
    budgetEquipment: 1500000,
    budgetLocations: 1000000,
    budgetSets: 3500000,
    budgetOther: 900000,
    weatherGood: 75,
    weatherAcceptable: 20,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Parasite Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '06:30:00', '07:00:00', '19:00:00']
SET p.scheduleDurations = [1.5, 0.5, 12, 1]
SET p.customSets = ['Park Family House', 'Kim Family Semi-basement', 'Underground Bunker']
SET p.setConstructionDays = [45, 30, 25];

CREATE (PenguinsFilming:Production:GeneratedByClaudeAI {
    name: 'March of the Penguins Filming',
    startDate: date('2003-01-15'),
    endDate: date('2004-02-20'),
    durationMonths: 13,
    durationDays: 5,
    isCompleted: true,
    budgetPersonnel: 2000000,
    budgetEquipment: 3000000,
    budgetTransport: 2000000,
    budgetSurvival: 800000,
    budgetOther: 200000,
    weatherGood: 15,
    weatherAcceptable: 30,
    weatherPoor: 55,
    extremeConditionDays: 280
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'March of the Penguins Filming'})
SET p.environmentalChallenges = ['Extreme cold', 'Isolation', 'Limited light', 'Storms']
SET p.challengeSeverity = [9.5, 8.5, 7.0, 9.0]
SET p.specialEquipment = ['Cold-resistant cameras', 'Thermal protection', 'Custom lighting']
SET p.equipmentSuccessRate = [0.85, 0.92, 0.78]
SET p.crewRotations = 6;

// Add reviews
CREATE (CitizenKaneReview:Review:GeneratedByClaudeAI {
    title: 'The Greatest Film Ever Made',
    stars: 5.0,
    date: date('1941-09-12'),
    historicalReassessmentDate: date('1962-01-15'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 5.0,
    aspectVisuals: 5.0,
    aspectWriting: 5.0,
    aspectInnovation: 5.0,
    reviewText: 'Citizen Kane represents the pinnacle of filmmaking craft and storytelling innovation. Orson Welles\' debut feature revolutionized cinema with its non-linear narrative structure, deep focus photography, and complex character study.',
    historicalRelevance: 'Transformative'
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'The Greatest Film Ever Made'})
SET r.modernReassessmentDates = [date('1962-01-15'), date('1972-01-15'), date('2002-01-15')]
SET r.sightAndSoundRankings = [1, 1, 2]
SET r.rankingYears = [1962, 1972, 2002]
SET r.keywords = ['masterpiece', 'innovative', 'influential', 'groundbreaking']
SET r.academicCitations = 1458;

CREATE (ParasiteReview:Review:GeneratedByClaudeAI {
    title: 'A Perfect Social Satire',
    stars: 5.0,
    date: date('2019-05-30'),
    time: time('14:23:45+09:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 5.0,
    aspectVisuals: 4.9,
    aspectWriting: 5.0,
    aspectSocialCommentary: 5.0,
    reviewText: 'Bong Joon-ho\'s Parasite is a masterful blend of dark comedy, social commentary, and suspense. The film dissects class inequality with surgical precision while never losing its entertainment value or emotional impact.',
    upvotes: 12583
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Perfect Social Satire'})
SET r.commentTimestamps = [datetime('2019-05-30T16:22:43+09:00'), datetime('2019-05-31T08:15:12+09:00'), datetime('2019-06-01T12:32:01+09:00')]
SET r.keywords = ['class-struggle', 'social-satire', 'genre-bending', 'masterpiece']
SET r.readerLocationsLat = [37.5665, 34.0522, 40.7128]
SET r.readerLocationsLong = [126.9780, -118.2437, -74.0060]
SET r.translationLanguages = ['English', 'French', 'Japanese', 'Spanish', 'German'];

CREATE (PenguinsReview:Review:GeneratedByClaudeAI {
    title: 'Nature\'s Drama Captured Beautifully',
    stars: 4.5,
    date: date('2005-06-24'),
    time: time('16:45:30-04:00'),
    isVerified: true,
    aspectDirection: 4.7,
    aspectCinematography: 4.9,
    aspectNarration: 4.8,
    aspectEducationalValue: 4.6,
    aspectEmotionalImpact: 4.7,
    reviewText: 'March of the Penguins transforms the harsh reality of Emperor penguin survival into a compelling narrative of love, struggle, and perseverance. The breathtaking Antarctic cinematography and Morgan Freeman\'s narration elevate this documentary into something truly special.',
    upvotes: 7823
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Nature\'s Drama Captured Beautifully'})
SET r.commentTimestamps = [datetime('2005-06-24T18:22:15-04:00'), datetime('2005-06-25T09:45:33-04:00'), datetime('2005-06-26T14:18:42-04:00')]
SET r.keywords = ['nature', 'documentary', 'antarctica', 'survival', 'family-friendly']
SET r.readerLocationsLat = [40.7128, 48.8566, 34.0522]
SET r.readerLocationsLong = [-74.0060, 2.3522, -118.2437]
SET r.familyRecommendationScore = 9.2;

// Create Venice Film Festival
CREATE (VeniceFilmFestival:Ceremony:GeneratedByClaudeAI {
    name: 'Venice Film Festival',
    nickname: 'La Biennale di Venezia',
    established: date('1932-08-03'),
    ceremonyTime: localtime('19:00:00'),
    typicalDurationDays: 11,
    isPrestigious: true,
    locationLat: 45.4408,
    locationLong: 12.3155,
    locationHeight: 1,
    nextCeremony: datetime('2025-08-27T19:00:00+02:00'),
    historicalSignificance: 'Oldest Film Festival'
})
WITH 1 as dummy
MATCH (c:Ceremony:GeneratedByClaudeAI {name: 'Venice Film Festival'})
SET c.categories = ['Golden Lion', 'Silver Lion', 'Volpi Cup for Best Actor', 'Volpi Cup for Best Actress']
SET c.attendance2019 = 45000
SET c.attendance2020 = 12000
SET c.attendance2021 = 28000
SET c.attendance2022 = 35000
SET c.historicalWinners = ['Rome, Open City', 'Rashomon', 'Brokeback Mountain', 'Joker', 'Nomadland']
SET c.historicalYears = [1946, 1951, 2005, 2019, 2020];

// Add National Film Preservation Board
CREATE (FilmPreservationBoard:Organization:GeneratedByClaudeAI {
    name: 'National Film Preservation Board',
    established: date('1988-09-27'),
    headquartersLat: 38.8895,
    headquartersLong: -77.0353,
    annualBudget: 13500000,
    preservedFilmsCount: 850,
    digitalizedFilmsCount: 425,
    memberOrganizations: 22,
    nextPreservationAnnouncement: datetime('2025-12-14T10:00:00-05:00'),
    isGovernmentFunded: true
})
WITH 1 as dummy
MATCH (o:Organization:GeneratedByClaudeAI {name: 'National Film Preservation Board'})
SET o.preservationCriteria = ['Cultural significance', 'Historical importance', 'Aesthetic quality', 'Technical innovation']
SET o.criteriaWeights = [0.35, 0.25, 0.2, 0.2]
SET o.earliestPreservedFilm = 'The Great Train Robbery'
SET o.earliestPreservationYear = 1990
SET o.earliestFilmYear = 1903
SET o.digitalPreservationBudget = 5200000;

// Create relationships between nodes with various data types
MATCH 
  (o:Person:GeneratedByClaudeAI {name: 'Orson Welles'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (o)-[:DIRECTED {
    year: 1941,
    daysOnSet: 101,
    satisfaction: 4.8,
    studioPressure: 'High',
    completionDate: date('1940-10-23'),
    premiereEvent: datetime('1941-05-01T19:30:00-05:00'),
    durationMonths: 3,
    isFirstFeatureFilm: true,
    age: 25
}]->(c);

MATCH 
  (b:Person:GeneratedByClaudeAI {name: 'Bong Joon-ho'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (b)-[:DIRECTED {
    year: 2019,
    daysOnSet: 74,
    satisfaction: 4.9,
    awardWins: 213,
    completionDate: date('2018-11-25'),
    premiereEvent: datetime('2019-05-21T19:00:00+02:00'),
    durationMonths: 4,
    isFirstInternationalBreakout: false,
    personalThemes: ['Class inequality', 'Family dynamics', 'Dark humor']
}]->(p);

MATCH 
  (l:Person:GeneratedByClaudeAI {name: 'Luc Jacquet'}),
  (m:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
CREATE (l)-[:DIRECTED {
    year: 2005,
    daysInAntarctica: 314,
    fieldworkPhases: 3,
    satisfaction: 4.7,
    awardWins: 24,
    completionDate: date('2004-11-15'),
    premiereEvent: datetime('2005-01-26T20:00:00+01:00'),
    durationMonths: 13,
    isFirstMajorDocumentary: true,
    scientificConsultants: 8
}]->(m);

// Actor to Movie relationships
MATCH
  (o:Person:GeneratedByClaudeAI {name: 'Orson Welles'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (o)-[:ACTED_IN {
    roles: ['Charles Foster Kane'],
    salary: 100000,
    screenTimeMinutes: 95,
    startDate: date('1940-07-22'),
    endDate: date('1940-10-23'),
    scheduleConflicts: false,
    dualRoleComplexity: 'Very High',
    makeupHoursDaily: 3.5,
    ageTransformationYears: 44
}]->(c);

MATCH
  (s:Person:GeneratedByClaudeAI {name: 'Song Kang-ho'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (s)-[:ACTED_IN {
    roles: ['Kim Ki-taek'],
    salary: 750000,
    screenTimeMinutes: 85,
    startDate: date('2018-05-18'),
    endDate: date('2018-09-19'),
    scheduleConflicts: false,
    criticScore: 98,
    audienceScore: 95,
    awardNominations: 36,
    awardWins: 22,
    languagesSpoken: ['Korean']
}]->(p);

// Cinematographer relationship
MATCH
  (g:Person:GeneratedByClaudeAI {name: 'Gregg Toland'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (g)-[:CINEMATOGRAPHY_FOR {
    year: 1941,
    cameras: ['Mitchell BNC', 'Mitchell NC'],
    lenses: ['Bausch & Lomb Super Baltar', 'Cooke S1'],
    innovationsTested: ['Ultra-deep focus', 'Low-angle shots', 'Ceiling shots'],
    innovationsSuccessRate: [0.95, 0.98, 0.92],
    startDate: date('1940-07-22'),
    completionDate: date('1940-10-23'),
    signatureTechniques: ['Deep focus', 'Dramatic lighting', 'Low-angle shots'],
    technicalChallengesOvercome: 12
}]->(c);

// Narrator relationship
CREATE (MorganF:Person:GeneratedByClaudeAI {
    name: 'Morgan Freeman',
    born: 1937,
    birthdate: date('1937-06-01'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 5,
    isActive: true,
    voiceRecognition: 9.8,
    voiceType: 'Authoritative baritone',
    narratorRanking: 1
})
WITH 1 as dummy
MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Morgan Freeman'}),
  (p:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
CREATE (m)-[:NARRATED {
    year: 2005,
    language: 'English',
    recordingDays: 5,
    studioLocation: 'Los Angeles',
    recordingSessionHours: 25,
    scriptPages: 65,
    audienceImpactRating: 9.5,
    recordingCompletionDate: date('2004-12-05'),
    rerecordingRequired: false
}]->(p);

// Writer relationship
MATCH
  (o:Person:GeneratedByClaudeAI {name: 'Orson Welles'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (o)-[:WROTE {
    year: 1940,
    coWriter: 'Herman J. Mankiewicz',
    draftCount: 7,
    finalPageCount: 156,
    writingStartDate: date('1939-07-01'),
    writingCompletionDate: date('1940-05-15'),
    inspirationSources: ['William Randolph Hearst', 'Joseph Pulitzer', 'Samuel Insull'],
    controversyLevel: 'Very High',
    scriptNominations: 2,
    scriptWins: 1
}]->(c);

MATCH
  (b:Person:GeneratedByClaudeAI {name: 'Bong Joon-ho'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (b)-[:WROTE {
    year: 2018,
    coWriter: 'Han Jin-won',
    draftCount: 5,
    finalPageCount: 131,
    writingStartDate: date('2017-01-15'),
    writingCompletionDate: date('2018-02-20'),
    inspirationSources: ['Class inequality', 'Social architecture', 'Personal experiences'],
    thematicElements: ['Class struggle', 'Infiltration', 'Deception', 'Symbiosis'],
    scriptNominations: 23,
    scriptWins: 18
}]->(p);

// Studio relationships
MATCH
  (r:Studio:GeneratedByClaudeAI {name: 'RKO Pictures'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (r)-[:PRODUCED {
    investment: 839727,
    return: 1585634,
    roi: 1.89,
    contractSigned: date('1939-07-22'),
    studioRisk: 'Very High',
    executiveSupport: 'Mixed',
    marketingBudget: 150000,
    isProfitable: true,
    marketingStartDate: datetime('1941-01-15T00:00:00-05:00'),
    controversyHandling: 'Aggressive defense',
    heartNegativePressureLevel: 9.7
}]->(c);

MATCH
  (c:Studio:GeneratedByClaudeAI {name: 'CJ Entertainment'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (c)-[:PRODUCED {
    investment: 11400000,
    return: 263100000,
    roi: 23.08,
    contractSigned: date('2017-09-15'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 25000000,
    isProfitable: true,
    marketingStart: datetime('2019-02-15T00:00:00+09:00'),
    internationalMarketingBoost: datetime('2019-05-25T00:00:00+02:00'),
    breakEvenDate: date('2019-08-01')
}]->(p);

MATCH
  (d:Studio:GeneratedByClaudeAI {name: 'Disneynature'}),
  (p:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
CREATE (d)-[:DISTRIBUTED {
    territories: ['North America'],
    acquisitionDate: date('2005-01-30'),
    acquisitionCost: 1000000,
    marketingBudget: 15000000,
    marketingStart: datetime('2005-04-15T00:00:00-04:00'),
    isProfitable: true,
    returnOnInvestment: 38.4,
    educationalProgramCreated: true,
    conservationDonation: 1000000,
    familyMarketingFocus: 0.85
}]->(p);

// Studio to filming relationship
MATCH
  (r:Studio:GeneratedByClaudeAI {name: 'RKO Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'Citizen Kane Production'})
CREATE (r)-[:FINANCED {
    contractDate: date('1939-07-22'),
    amount: 839727,
    isFullyPaid: true,
    transferTime1: datetime('1939-08-15T00:00:00-05:00'),
    transferTime2: datetime('1939-11-30T00:00:00-05:00'),
    transferTime3: datetime('1940-06-15T00:00:00-05:00'),
    paymentDate1: date('1939-08-15'),
    paymentAmount1: 250000,
    paymentDate2: date('1939-11-30'),
    paymentAmount2: 250000,
    paymentDate3: date('1940-06-15'),
    paymentAmount3: 339727,
    executiveOversight: 'Minimal initially, Heavy later'
}]->(p);

MATCH
  (c:Studio:GeneratedByClaudeAI {name: 'CJ Entertainment'}),
  (p:Production:GeneratedByClaudeAI {name: 'Parasite Production'})
CREATE (c)-[:FINANCED {
    contractDate: date('2017-09-15'),
    amount: 11400000,
    isFullyPaid: true,
    transferTime1: datetime('2018-02-01T00:00:00+09:00'),
    transferTime2: datetime('2018-05-01T00:00:00+09:00'),
    transferTime3: datetime('2018-08-01T00:00:00+09:00'),
    paymentDate1: date('2018-02-01'),
    paymentAmount1: 3400000,
    paymentDate2: date('2018-05-01'),
    paymentAmount2: 4500000,
    paymentDate3: date('2018-08-01'),
    paymentAmount3: 3500000
}]->(p);

// Filming to movie relationship
MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Citizen Kane Production'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 3,
    durationDays: 1,
    setCount: 16,
    soundstageCount: 8,
    locationCount: 3,
    dailyAverageCost: 8312,
    scheduleAdherence: 0.88,
    originalScheduledEnd: date('1940-10-15'),
    technicalChallengesOvercome: 14,
    innovationSuccessRate: 0.92
}]->(c);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Parasite Production'}),
  (m:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 4,
    durationDays: 1,
    setCount: 12,
    customSetsBudget: 3500000,
    locationCount: 8,
    dailyAverageCost: 125000,
    scheduleAdherence: 0.95,
    originalScheduledEnd: date('2018-09-15'),
    perfectShotTakes: 247,
    totalTakes: 1845
}]->(m);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'March of the Penguins Filming'}),
  (m:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 13,
    durationDays: 5,
    totalFootage: 869,
    footageUnit: 'Hours',
    extremeConditionDays: 280,
    dailyAverageCost: 20000,
    equipmentMalfunctions: 42,
    scheduleExtensions: 3,
    originalScheduledEnd: date('2003-11-30'),
    scientificValueRating: 9.2
}]->(m);

// Award relationships
MATCH
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (c)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 1942,
    ceremony: 14,
    isWinner: false,
    ceremonyDate: date('1942-02-26'),
    announcementTime: localtime('21:45:00'),
    votesFor: 325,
    votesAgainst: 352,
    historicalReassessment: 'Should have won',
    controversyLevel: 'Very High'
}]->(a);

MATCH
  (o:Person:GeneratedByClaudeAI {name: 'Orson Welles'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (o)-[:NOMINATED_FOR {
    category: 'Best Original Screenplay',
    year: 1942,
    ceremony: 14,
    isWinner: true,
    ceremonyDate: date('1942-02-26'),
    announcementTime: localtime('20:15:00'),
    coRecipient: 'Herman J. Mankiewicz',
    attendance: false,
    reasonForAbsence: 'Political tensions',
    historicalSignificance: 'Only Oscar win for Welles'
}]->(a);

MATCH
  (p:Movie:GeneratedByClaudeAI {title: 'Parasite'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (p)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 2020,
    ceremony: 92,
    isWinner: true,
    ceremonyDate: date('2020-02-09'),
    announcementTime: localtime('21:55:00'),
    votesFor: 5823,
    votesAgainst: 3215,
    historicalSignificance: 'First non-English language Best Picture',
    audienceReaction: 'Standing ovation',
    ovationLength: duration({minutes: 3, seconds: 12})
}]->(a);

MATCH
  (b:Person:GeneratedByClaudeAI {name: 'Bong Joon-ho'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (b)-[:NOMINATED_FOR {
    category: 'Best Director',
    year: 2020,
    ceremony: 92,
    isWinner: true,
    ceremonyDate: date('2020-02-09'),
    announcementTime: localtime('21:35:00'),
    votesFor: 6123,
    votesAgainst: 2915,
    speechDuration: duration({minutes: 2, seconds: 43}),
    translatorUsed: true,
    memorableQuote: 'I will drink until next morning'
}]->(a);

MATCH
  (m:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (m)-[:NOMINATED_FOR {
    category: 'Best Documentary Feature',
    year: 2006,
    ceremony: 78,
    isWinner: true,
    ceremonyDate: date('2006-03-05'),
    announcementTime: localtime('20:25:00'),
    votesFor: 3521,
    votesAgainst: 1485,
    significanceRating: 'Major for nature documentaries',
    audienceShareDuringAnnouncement: 0.32
}]->(a);

MATCH
  (p:Movie:GeneratedByClaudeAI {title: 'Parasite'}),
  (v:Ceremony:GeneratedByClaudeAI {name: 'Venice Film Festival'})
CREATE (p)-[:NOMINATED_FOR {
    category: 'Golden Lion',
    year: 2019,
    ceremony: 76,
    isWinner: false,
    ceremonyDate: date('2019-09-07'),
    announcementTime: localtime('20:30:00'),
    screeningDate: date('2019-09-03'),
    screeningTime: localtime('19:00:00'),
    screeningVenue: 'Sala Grande',
    audienceReaction: 'Standing ovation',
    reactionDuration: duration({minutes: 8, seconds: 45})
}]->(v);

// Preservation relationship
MATCH
  (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'}),
  (f:Organization:GeneratedByClaudeAI {name: 'National Film Preservation Board'})
CREATE (c)-[:PRESERVED_BY {
    year: 1989,
    preservationRound: 1,
    selectionCriteria: ['Cultural significance', 'Technical innovation', 'Artistic merit'],
    criteriaScore: [10, 10, 10],
    preservationDate: date('1989-12-14'),
    restoration: true,
    restorationDate: date('1998-11-25'),
    restorationCost: 850000,
    digitalFormat: '4K',
    preservationMedium: ['Film negative', 'Digital master']
}]->(f);

// Create additional node types and relationships

// Create educational institution using film for teaching
CREATE (FilmStudiesInstitute:Institution:GeneratedByClaudeAI {
    name: 'National Film Studies Institute',
    founded: date('1967-09-15'),
    headquartersLat: 34.0922,
    headquartersLong: -118.3731,
    studentCount: 1250,
    facultyCount: 85,
    courseCount: 145,
    filmArchiveSize: 25000,
    digitalArchiveSize: 15000,
    digitalArchiveUnit: 'TB',
    annualBudget: 45000000
})
WITH 1 as dummy
MATCH (i:Institution:GeneratedByClaudeAI {name: 'National Film Studies Institute'}),
      (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (i)-[:TEACHES_WITH {
    yearAdded: 1968,
    coursesUsedIn: 28,
    primaryFocus: ['Cinematography technique', 'Narrative structure', 'Film history'],
    studentPapersCount: 12450,
    mostCommonAnalysisTopics: ['Deep focus', 'Rosebud symbolism', 'Narrative framework'],
    teachingHoursAnnually: 620,
    requiredForDegrees: ['BA Film Studies', 'MFA Directing', 'MFA Cinematography'],
    teachingValue: 9.8
}]->(c);

// Add camera technology for Citizen Kane
CREATE (MitchellBNCCamera:Equipment:GeneratedByClaudeAI {
    name: 'Mitchell BNC Camera',
    manufactured: date('1934-05-10'),
    manufacturerLat: 34.0922,
    manufacturerLong: -118.3731,
    weight: 52,
    weightUnit: 'kg',
    cost: 15000,
    purchaseYear: 1939,
    revolutionaryFeatures: ['Silent operation', 'Rack-over viewing', 'High-precision movement'],
    featureImpact: [9.2, 8.9, 9.5],
    technicalSpecifications: 'Silent operation with rack-over viewing system',
    historicalSignificance: 'Industry standard for Hollywood productions'
})
WITH 1 as dummy
MATCH (e:Equipment:GeneratedByClaudeAI {name: 'Mitchell BNC Camera'}),
      (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (e)-[:USED_IN {
    operator: 'Gregg Toland',
    setupTime: duration({minutes: 45}),
    unitCount: 2,
    technicalInnovations: ['Low-angle mounting', 'Floor embedding'],
    innovationSuccess: [10, 9.5],
    maintenanceEvents: 8,
    operationalDays: 98,
    signatureShots: ['Low angle with ceiling', 'Deep focus wide shots', 'Tracking sequences'],
    techniqueInfluence: 9.8
}]->(c);

// Create special costume for Parasite
CREATE (ParasiteCostumes:Costume:GeneratedByClaudeAI {
    name: 'Parasite Family Wardrobes',
    designed: date('2018-03-15'),
    designer: 'Choi Se-yeon',
    costumePieces: 245,
    materialTypes: 15,
    colorPalette: ['Gray', 'Black', 'Muted green', 'Rich blue'],
    paletteMeaning: ['Poverty', 'Deception', 'Hope', 'Wealth'],
    constructionHours: 1850,
    costumeBudget: 120000,
    symbolismRating: 9.5
})
WITH 1 as dummy
MATCH (c:Costume:GeneratedByClaudeAI {name: 'Parasite Family Wardrobes'}),
      (p:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (c)-[:FEATURED_IN {
    characterCount: 9,
    costumesPerCharacter: [12, 14, 16, 18, 8, 6, 5, 4, 3],
    characterClassIndication: ['Lower', 'Lower', 'Lower', 'Lower', 'Upper', 'Upper', 'Upper', 'Upper', 'Hidden'],
    symbolicElements: ['Stain-resistant fabric', 'Aspirational brands', 'Weathered textures', 'Color progression'],
    elementPurpose: ['Status marker', 'Desire indicator', 'History visual', 'Narrative arc'],
    designAwards: 3
}]->(p);

// Create extreme weather challenge for Penguins
CREATE (AntarcticConditions:EnvironmentalFactor:GeneratedByClaudeAI {
    name: 'Antarctic Winter Conditions',
    location: 'Dumont d\'Urville Station area',
    latitude: -66.6628,
    longitude: 140.0014,
    averageTemperature: -60,
    temperatureUnit: 'Celsius',
    windSpeedAverage: 80,
    windSpeedUnit: 'km/h',
    windSpeedMax: 200,
    daylight: 'Limited to none',
    precipitationAnnual: 250,
    precipitationUnit: 'mm',
    extremityIndex: 9.8
})
WITH 1 as dummy
MATCH (e:EnvironmentalFactor:GeneratedByClaudeAI {name: 'Antarctic Winter Conditions'}),
      (p:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
CREATE (e)-[:IMPACTED {
    daysExperienced: 280,
    equipmentFailureRate: 0.35,
    humanEnduranceLimit: duration({hours: 4}),
    rotationalSchedule: 'Two weeks on, one week shelter',
    equipmentAdaptations: ['Thermal insulation', 'Battery protection', 'Anti-fog systems'],
    adaptationSuccessRates: [0.82, 0.76, 0.65],
    footageLostToCold: '32 hours',
    crewmedicalIncidents: 8,
    documentaryValueAdded: 9.7
}]->(p);

// Create cultural impact relationship
CREATE (FilmHistory:AcademicField:GeneratedByClaudeAI {
    name: 'Film History Studies',
    established: date('1915-03-10'),
    institutionsCount: 2850,
    scholarCount: 15400,
    peerReviewedJournals: 124,
    annualPublications: 3250,
    mostCitedTheories: ['Auteur theory', 'Montage theory', 'Apparatus theory'],
    theoriesDevelopmentYears: [1954, 1925, 1970],
    digitalArchives: 278
})
WITH 1 as dummy
MATCH (f:AcademicField:GeneratedByClaudeAI {name: 'Film History Studies'}),
      (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (f)-[:INFLUENCED_BY {
    yearFirstStudied: 1942,
    academicPapersCount: 2850,
    textbookReferences: 98,
    percentageCoursesTeaching: 95,
    criticalTheoriesGenerated: ['Deep focus semiotics', 'Narrative fragmentation', 'Cinematic authorship'],
    theoryInfluence: [9.4, 9.6, 9.8],
    canonicalPosition: 1,
    canonicalSurveys: 12,
    surveyYears: [1952, 1962, 1972, 1982, 1992, 2002, 2012, 2022]
}]->(c);

// Create cultural movement relationship for Parasite
CREATE (NewKoreanCinema:CulturalMovement:GeneratedByClaudeAI {
    name: 'New Korean Cinema',
    established: date('1998-05-15'),
    influentialDirectors: 12,
    internationalFestivals: 35,
    majorAwards: 58,
    criticalReception: 'Revolutionary',
    geographicalSpread: 'Global',
    periodStart: date('1998-05-15'),
    periodPeak: date('2019-05-21'),
    academicStudies: 145
})
WITH 1 as dummy
MATCH (c:CulturalMovement:GeneratedByClaudeAI {name: 'New Korean Cinema'}),
      (p:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (c)-[:CULMINATED_WITH {
    significanceRating: 9.9,
    globalImpact: 'Transformative',
    boxOfficeMultiplierEffect: 3.2,
    koreanFilmExportsIncrease: 0.45,
    subsequentDistributionDeals: 28,
    academicAnalyses: 85,
    filmSchoolAdoption: 'Immediate and widespread',
    newFilmmakersInspired: 'Thousands globally',
    culturalBarrierReduction: 'Significant',
    subtitleAcceptanceIncrease: 0.65
}]->(p);

// Create special effects company
CREATE (WetaDigital:TechCompany:GeneratedByClaudeAI {
    name: 'Weta Digital',
    founded: date('1993-05-22'),
    headquartersLat: -41.3053,
    headquartersLong: 174.8239,
    employeeCount: 1550,
    annualRevenue: 245000000,
    technologyPatents: 58,
    oscarsWon: 6,
    technicalAwards: 127,
    proprietarySoftware: 12,
    computingPower: 72000,
    computingUnit: 'CPU cores'
})
WITH 1 as dummy
MATCH (t:TechCompany:GeneratedByClaudeAI {name: 'Weta Digital'}),
      (p:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
CREATE (t)-[:PROVIDED_SERVICES_FOR {
    year: 2004,
    serviceType: ['Digital restoration', 'Color correction', 'Digital stabilization'],
    teamSize: 12,
    workDuration: duration({months: 3}),
    contractValue: 850000,
    proprietaryTechniquesUsed: 3,
    footageProcessed: 85,
    footageUnit: 'Hours',
    transformationQuality: 9.5,
    temperatureExtremesVisualized: true,
    visualizationAccuracy: 'Scientific-grade'
}]->(p);

// Create theme park attraction
CREATE (CitizenKaneExhibit:Attraction:GeneratedByClaudeAI {
    name: 'The Art of Citizen Kane: Interactive Exhibit',
    opened: date('2008-05-15'),
    locationLat: 34.1381,
    locationLong: -118.3534,
    visitorCapacity: 500,
    visitorDuration: duration({minutes: 45}),
    annualVisitors: 250000,
    exhibitSize: 15000,
    sizeUnit: 'Square feet',
    developmentCost: 12000000,
    interactiveElements: 28,
    historicalArtifacts: 125
})
WITH 1 as dummy
MATCH (a:Attraction:GeneratedByClaudeAI {name: 'The Art of Citizen Kane: Interactive Exhibit'}),
      (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (a)-[:BASED_ON {
    filmElementsFeatured: ['Cinematography', 'Set design', 'Narrative structure', 'Sound design'],
    educationalFocus: 0.8,
    entertainmentFocus: 0.2,
    audienceRating: 9.2,
    filmHistoryContextualization: 'Comprehensive',
    originalPropsCurated: 15,
    reproductionProps: 85,
    filmingTechniqueDemonstrations: 12,
    rosebudSymbolismExhibits: 5,
    culturalImpactMetrics: ['Industry influence', 'Artistic recognition', 'Technical innovation']
}]->(c);

// Create merchandising relationship
CREATE (PenguinPlush:Merchandise:GeneratedByClaudeAI {
    name: 'Emperor Penguin Family Plush Collection',
    released: date('2005-06-15'),
    manufacturer: 'National Geographic Products',
    manufacturerLocationLat: 38.9053,
    manufacturerLocationLong: -77.0332,
    retailPrice: 29.99,
    priceCurrency: 'USD',
    productionRun: 500000,
    conservationContribution: 3.00,
    contributionPercentage: 0.10,
    educationalMaterials: true,
    ageRange: '3+'
})
WITH 1 as dummy
MATCH (m:Merchandise:GeneratedByClaudeAI {name: 'Emperor Penguin Family Plush Collection'}),
      (p:Movie:GeneratedByClaudeAI {title: 'March of the Penguins'})
CREATE (m)-[:DERIVED_FROM {
    licensingDeal: date('2005-03-12'),
    unitsSold: 435000,
    geographicalDistribution: ['North America', 'Europe', 'Asia', 'Australia'],
    salesDistribution: [0.65, 0.20, 0.10, 0.05],
    retailersCarrying: 7850,
    conservationFundsRaised: 1305000,
    educationalImpact: 'Significant - classroom adoption',
    brandRecognition: 0.85,
    merchandisingLongevity: 'Still in production - limited quantities',
    sequelMerchandisingEffect: 'Reissued for Penguin 2'
}]->(p);

// Create educational program
CREATE (ParasiteStudyProgram:EducationalProgram:GeneratedByClaudeAI {
    name: 'Parasite: Film & Society Curriculum',
    developed: date('2020-04-15'),
    institutionsAdopting: 1230,
    targetEducationLevels: ['University', 'High School Advanced'],
    materialFormats: ['Digital', 'Print', 'Video supplements'],
    languagesAvailable: 12,
    courseDuration: duration({weeks: 6}),
    totalLessonHours: 45,
    scholarlyEndorsements: 35,
    educatorRating: 9.4
})
WITH 1 as dummy
MATCH (e:EducationalProgram:GeneratedByClaudeAI {name: 'Parasite: Film & Society Curriculum'}),
      (p:Movie:GeneratedByClaudeAI {title: 'Parasite'})
CREATE (e)-[:ANALYZES {
    focusAreas: ['Class structure', 'Visual symbolism', 'Narrative techniques', 'Cultural context', 'Globalization'],
    focusDistribution: [0.25, 0.20, 0.20, 0.15, 0.20],
    analyticalApproaches: ['Sociological', 'Cinematic', 'Economic', 'Cultural'],
    studentFeedbackScore: 9.2,
    criticalThinkingDevelopment: 'Very High',
    culturalComprehensionExpansion: 'Significant',
    crossCulturalDialoguePromotion: 'Extensive',
    filmmakingTechniquesExamined: 45,
    globalAdoption: 'Growing rapidly',
    academicPaperGeneration: 185
}]->(p);

// Create 4K restoration project
CREATE (CitizenKaneRestoration:DigitalProject:GeneratedByClaudeAI {
    name: 'Citizen Kane 4K Restoration',
    started: date('2010-02-15'),
    completed: date('2011-09-22'),
    teamSize: 22,
    originalNegativeUsed: true,
    resolutionOutput: '4096x3112',
    colorDepth: '16-bit',
    storageSizeRaw: 175,
    storageSizeUnit: 'TB',
    finalMasterSize: 12,
    finalMasterUnit: 'TB',
    budget: 1250000
})
WITH 1 as dummy
MATCH (d:DigitalProject:GeneratedByClaudeAI {name: 'Citizen Kane 4K Restoration'}),
      (c:Movie:GeneratedByClaudeAI {title: 'Citizen Kane'})
CREATE (d)-[:PRESERVED {
    frameCorrectionCount: 486500,
    frameTotalCount: 172584,
    originalDamagePercentage: 0.12,
    restorationFidelity: 0.985,
    audioChannelsPreserved: 2,
    audioSamplingRate: 96,
    audioSamplingUnit: 'kHz',
    primaryRestorationChallenges: ['Nitrate decomposition', 'Scratches', 'Stabilization', 'Contrast preservation'],
    challengeComplexity: [9.2, 8.5, 7.8, 9.5],
    technologiesUsed: ['AI frame interpolation', 'Manual restoration', 'Wetgate scanning', 'HDR grading'],
    historicalConsultants: 5,
    academicValidation: 'Peer-reviewed & certified authentic',
    preservationStandard: 'Library of Congress Archival'
}]->(c);