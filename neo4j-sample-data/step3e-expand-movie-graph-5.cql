// Create classic film nodes
CREATE (TheSoundOfMusic:Movie:GeneratedByClaudeAI {
    title: 'The Sound of Music',
    released: 1965,
    tagline: 'The happiest sound in all the world!',
    budget: 8200000,
    revenue: 286214286,
    runtime_minutes: 172,
    rating_avg: 8.0,
    releaseDate: date('1965-03-02'),
    digitalRestoration: datetime('2000-11-14T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
SET m.ratings = [8.1, 7.9, 8.0, 8.0]
SET m.genres = ['musical', 'drama', 'romance', 'family']
SET m.certifications = ['G', 'U']
SET m.filmingLocationLat = [47.8095, 47.7984, 48.2084]
SET m.filmingLocationLong = [13.0550, 13.0442, 16.3731]
SET m.boxOfficeNA = 163214286
SET m.boxOfficeInternational = 123000000
SET m.musicalNumbers = 15
SET m.digitalRemastering = 2;

CREATE (Psycho:Movie:GeneratedByClaudeAI {
    title: 'Psycho',
    released: 1960,
    tagline: 'A new—and altogether different—screen excitement!!!',
    budget: 806947,
    revenue: 50000000,
    runtime_minutes: 109,
    rating_avg: 8.5,
    releaseDate: date('1960-06-16'),
    digitalRestoration: datetime('1997-10-05T00:00:00Z'),
    isOscarWinner: false,
    isPreservationRegistry: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Psycho'})
SET m.ratings = [8.5, 8.5, 8.4, 8.6]
SET m.genres = ['horror', 'thriller', 'mystery']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [34.1381, 37.7937]
SET m.filmingLocationLong = [-118.3534, -122.4048]
SET m.boxOfficeNA = 32000000
SET m.boxOfficeInternational = 18000000
SET m.preservationRegistry = 'National Film Registry'
SET m.iconicScenes = ['Shower scene', 'House on the hill', 'Parlor scene'];

// Create contemporary blockbuster film nodes
CREATE (Avatar:Movie:GeneratedByClaudeAI {
    title: 'Avatar',
    released: 2009,
    tagline: 'Enter the world of Pandora',
    budget: 237000000,
    revenue: 2923706026,
    runtime_minutes: 162,
    rating_avg: 7.9,
    releaseDate: date('2009-12-18'),
    digitalRelease: datetime('2010-04-22T00:00:00Z'),
    isOscarWinner: true,
    is3D: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Avatar'})
SET m.ratings = [7.9, 7.8, 8.0, 7.9]
SET m.genres = ['sci-fi', 'action', 'adventure', 'fantasy']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [38.9072, 45.0678, -36.8509]
SET m.filmingLocationLong = [-77.0369, 7.6695, 174.7645]
SET m.boxOfficeNA = 785221649
SET m.boxOfficeInternational = 2138484377
SET m.motionCapturePercentage = 70
SET m.renderingHours = 150000000;

CREATE (BlackPanther:Movie:GeneratedByClaudeAI {
    title: 'Black Panther',
    released: 2018,
    tagline: 'Long live the king',
    budget: 200000000,
    revenue: 1347280838,
    runtime_minutes: 134,
    rating_avg: 7.3,
    releaseDate: date('2018-02-16'),
    digitalRelease: datetime('2018-05-08T00:00:00Z'),
    isOscarWinner: true,
    culturalImpact: 'Groundbreaking'
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Black Panther'})
SET m.ratings = [7.4, 7.3, 7.2, 7.3]
SET m.genres = ['action', 'adventure', 'sci-fi']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [33.7490, 36.0726, -29.8579]
SET m.filmingLocationLong = [-84.3880, -79.7920, 31.0292]
SET m.boxOfficeNA = 700059566
SET m.boxOfficeInternational = 647171272
SET m.culturalMilestones = ['First predominantly Black superhero film', 'First superhero film nominated for Best Picture']
SET m.merchandisingSales = 350000000;

// Create animated film node
CREATE (SpiderVerse2:Movie:GeneratedByClaudeAI {
    title: 'Spider-Man: Across the Spider-Verse',
    released: 2023,
    tagline: 'It\'s how you wear the mask that matters',
    budget: 100000000,
    revenue: 690516493,
    runtime_minutes: 140,
    rating_avg: 8.7,
    releaseDate: date('2023-06-02'),
    digitalRelease: datetime('2023-08-08T00:00:00Z'),
    isOscarWinner: true,
    isAnimated: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Spider-Man: Across the Spider-Verse'})
SET m.ratings = [8.8, 8.7, 8.6, 8.7]
SET m.genres = ['animation', 'action', 'adventure', 'sci-fi']
SET m.certifications = ['PG', 'U']
SET m.animationStudioLat = [34.1593, 34.0901, 37.7749]
SET m.animationStudioLong = [-118.3263, -118.3676, -122.4194]
SET m.boxOfficeNA = 381311036
SET m.boxOfficeInternational = 309205457
SET m.animationStyles = ['Comic Book', '2D', '3D', 'Watercolor', 'Anime', 'Digital Painting']
SET m.renderedFrames = 280000;

// Create notable early 2000s indie film
CREATE (LostInTranslation:Movie:GeneratedByClaudeAI {
    title: 'Lost in Translation',
    released: 2003,
    tagline: 'Everyone wants to be found',
    budget: 4000000,
    revenue: 119723856,
    runtime_minutes: 102,
    rating_avg: 7.7,
    releaseDate: date('2003-09-12'),
    digitalRelease: datetime('2004-02-03T00:00:00Z'),
    isOscarWinner: true,
    isIndie: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Lost in Translation'})
SET m.ratings = [7.8, 7.7, 7.6, 7.7]
SET m.genres = ['drama', 'comedy', 'romance']
SET m.certifications = ['R', '15']
SET m.filmingLocationLat = [35.6762, 35.6895, 35.7147]
SET m.filmingLocationLong = [139.6503, 139.6917, 139.7967]
SET m.boxOfficeNA = 44585453
SET m.boxOfficeInternational = 75138403
SET m.festivalWins = 77
SET m.filmingDays = 27;

// Create actors, directors, and other film professionals
CREATE (JulieAndrews:Person:GeneratedByClaudeAI {
    name: 'Julie Andrews',
    born: 1935,
    birthdate: date('1935-10-01'),
    nationality: 'British',
    oscarWins: 1,
    oscarNominations: 3,
    isActive: true,
    firstFilm: datetime('1964-08-27T00:00:00Z'),
    heightInMeters: 1.73,
    netWorth: 45000000,
    voiceRange: '4 octaves'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Julie Andrews'})
SET p.languages = ['English', 'French', 'Italian']
SET p.filmography_titles = ['The Sound of Music', 'Mary Poppins', 'The Princess Diaries']
SET p.filmography_years = [1965, 1964, 2001]
SET p.filmography_roles = ['Maria von Trapp', 'Mary Poppins', 'Queen Clarisse Renaldi']
SET p.musicalSkills = ['Singing', 'Dancing', 'Piano'];

CREATE (AlfredHitchcock:Person:GeneratedByClaudeAI {
    name: 'Alfred Hitchcock',
    born: 1899,
    died: 1980,
    birthdate: date('1899-08-13'),
    deathdate: date('1980-04-29'),
    nationality: 'British-American',
    oscarWins: 0,
    oscarNominations: 5,
    isActive: false,
    firstFilm: datetime('1925-08-03T00:00:00Z'),
    lastFilm: datetime('1976-08-14T00:00:00Z'),
    careerLength: duration({years: 51}),
    heightInMeters: 1.70,
    significantContribution: 'Suspense techniques'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Alfred Hitchcock'})
SET p.languages = ['English', 'French']
SET p.skillSets = ['Directing', 'Writing', 'Producing']
SET p.filmography_titles = ['Psycho', 'Vertigo', 'Rear Window', 'North by Northwest']
SET p.filmography_years = [1960, 1958, 1954, 1959]
SET p.cameramanship = 'Innovative';

CREATE (AnthonyPerkins:Person:GeneratedByClaudeAI {
    name: 'Anthony Perkins',
    born: 1932,
    died: 1992,
    birthdate: date('1932-04-04'),
    deathdate: date('1992-09-12'),
    nationality: 'American',
    oscarNominations: 1,
    isActive: false,
    firstFilm: datetime('1953-03-23T00:00:00Z'),
    lastFilm: datetime('1992-06-18T00:00:00Z'),
    careerLength: duration({years: 39}),
    heightInMeters: 1.85,
    typecastEffect: 'Significant'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Anthony Perkins'})
SET p.languages = ['English', 'French']
SET p.filmography_titles = ['Psycho', 'Friendly Persuasion', 'Fear Strikes Out']
SET p.filmography_years = [1960, 1956, 1957]
SET p.filmography_roles = ['Norman Bates', 'Josh Birdwell', 'Jim Piersall'];

CREATE (JamesCameron:Person:GeneratedByClaudeAI {
    name: 'James Cameron',
    born: 1954,
    birthdate: date('1954-08-16'),
    nationality: 'Canadian-American',
    oscarWins: 3,
    oscarNominations: 11,
    isActive: true,
    firstFilm: datetime('1982-03-03T00:00:00Z'),
    heightInMeters: 1.87,
    netWorth: 700000000,
    directorRanking: 'Pioneering',
    deepSeaExperience: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'James Cameron'})
SET p.languages = ['English', 'Spanish']
SET p.skillSets = ['Directing', 'Writing', 'Editing', 'Producing', 'Deep Sea Exploration']
SET p.filmography_titles = ['Avatar', 'Titanic', 'Terminator 2', 'Aliens']
SET p.filmography_years = [2009, 1997, 1991, 1986]
SET p.technicalInnovations = ['3D filming techniques', 'Motion capture advancements', 'Deep sea camera systems'];

CREATE (SamWorthington:Person:GeneratedByClaudeAI {
    name: 'Sam Worthington',
    born: 1976,
    birthdate: date('1976-08-02'),
    nationality: 'Australian',
    oscarNominations: 0,
    isActive: true,
    firstFilm: datetime('2000-10-19T00:00:00Z'),
    heightInMeters: 1.78,
    netWorth: 30000000,
    motionCaptureExperience: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Sam Worthington'})
SET p.languages = ['English']
SET p.filmography_titles = ['Avatar', 'Terminator Salvation', 'Clash of the Titans']
SET p.filmography_years = [2009, 2009, 2010]
SET p.filmography_roles = ['Jake Sully', 'Marcus Wright', 'Perseus'];

CREATE (ChadwickBoseman:Person:GeneratedByClaudeAI {
    name: 'Chadwick Boseman',
    born: 1976,
    died: 2020,
    birthdate: date('1976-11-29'),
    deathdate: date('2020-08-28'),
    nationality: 'American',
    oscarNominations: 1,
    isActive: false,
    firstFilm: datetime('2008-03-06T00:00:00Z'),
    lastFilm: datetime('2020-12-18T00:00:00Z'),
    careerLength: duration({years: 12}),
    heightInMeters: 1.83,
    culturalImpact: 'Transformative'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Chadwick Boseman'})
SET p.languages = ['English']
SET p.filmography_titles = ['Black Panther', '42', 'Get on Up', 'Marshall']
SET p.filmography_years = [2018, 2013, 2014, 2017]
SET p.filmography_roles = ['T\'Challa/Black Panther', 'Jackie Robinson', 'James Brown', 'Thurgood Marshall'];

CREATE (RyanCoogler:Person:GeneratedByClaudeAI {
    name: 'Ryan Coogler',
    born: 1986,
    birthdate: date('1986-05-23'),
    nationality: 'American',
    oscarNominations: 0,
    isActive: true,
    firstFilm: datetime('2013-01-19T00:00:00Z'),
    heightInMeters: 1.73,
    netWorth: 25000000,
    directorStyle: 'Character-driven'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Ryan Coogler'})
SET p.languages = ['English']
SET p.filmography_titles = ['Black Panther', 'Creed', 'Fruitvale Station']
SET p.filmography_years = [2018, 2015, 2013]
SET p.genreSpecialty = ['Drama', 'Action'];

CREATE (ScarlettJohansson:Person:GeneratedByClaudeAI {
    name: 'Scarlett Johansson',
    born: 1984,
    birthdate: date('1984-11-22'),
    nationality: 'American',
    oscarNominations: 2,
    isActive: true,
    firstFilm: datetime('1994-12-21T00:00:00Z'),
    heightInMeters: 1.60,
    netWorth: 165000000,
    voiceActingExperience: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Scarlett Johansson'})
SET p.languages = ['English', 'Danish']
SET p.filmography_titles = ['Lost in Translation', 'Marriage Story', 'Black Widow', 'Her']
SET p.filmography_years = [2003, 2019, 2021, 2013]
SET p.filmography_roles = ['Charlotte', 'Nicole Barber', 'Natasha Romanoff', 'Samantha (voice)'];

CREATE (SofiaCoppola:Person:GeneratedByClaudeAI {
    name: 'Sofia Coppola',
    born: 1971,
    birthdate: date('1971-05-14'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 4,
    isActive: true,
    firstFilm: datetime('1999-04-25T00:00:00Z'),
    heightInMeters: 1.63,
    netWorth: 40000000,
    directorStyle: 'Atmospheric'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Sofia Coppola'})
SET p.languages = ['English', 'Italian', 'French']
SET p.filmography_titles = ['Lost in Translation', 'The Virgin Suicides', 'Marie Antoinette']
SET p.filmography_years = [2003, 1999, 2006]
SET p.visualAesthetics = 'Dreamlike';

CREATE (ShameikMoore:Person:GeneratedByClaudeAI {
    name: 'Shameik Moore',
    born: 1995,
    birthdate: date('1995-05-04'),
    nationality: 'American',
    oscarNominations: 0,
    isActive: true,
    firstFilm: datetime('2012-08-26T00:00:00Z'),
    voiceType: 'Tenor',
    heightInMeters: 1.73,
    netWorth: 5000000,
    musicalBackground: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Shameik Moore'})
SET p.languages = ['English']
SET p.filmography_titles = ['Spider-Man: Into the Spider-Verse', 'Spider-Man: Across the Spider-Verse', 'Dope']
SET p.filmography_years = [2018, 2023, 2015]
SET p.filmography_roles = ['Miles Morales (voice)', 'Miles Morales (voice)', 'Malcolm']
SET p.musicalSkills = ['Singing', 'Rapping', 'Dancing'];

// Create more studios
CREATE (TwentiethCenturyFox:Studio:GeneratedByClaudeAI {
    name: '20th Century Fox',
    founded: date('1935-05-31'),
    acquired: date('2019-03-20'),
    headquartersLat: 34.0746,
    headquartersLong: -118.3798,
    yearlyRevenue2018: 7800000000,
    yearlyRevenue2019: 6500000000,
    digitalArchiveCreation: datetime('2010-06-15T00:00:00Z'),
    isActive: false,
    marketShare: 0.12,
    acquisitionAmount: 71300000000
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: '20th Century Fox'})
SET s.subsidiaries = ['Fox Searchlight Pictures', 'Blue Sky Studios', 'Fox 2000 Pictures']
SET s.distributionMarkets = ['Global']
SET s.studioLotsLat = [34.0746, 40.7580]
SET s.studioLotsLong = [-118.3798, -73.9855]
SET s.acquiredBy = 'The Walt Disney Company';

CREATE (ParamountPictures:Studio:GeneratedByClaudeAI {
    name: 'Paramount Pictures',
    founded: date('1912-05-08'),
    headquartersLat: 34.0841,
    headquartersLong: -118.3213,
    yearlyRevenue2020: 4500000000,
    yearlyRevenue2021: 6800000000,
    yearlyRevenue2022: 7200000000,
    digitalStreamingDate: datetime('2021-03-04T00:00:00Z'),
    isPublic: true,
    marketShare: 0.08,
    studioAge: 111
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'})
SET s.subsidiaries = ['Paramount Animation', 'Paramount Players', 'Paramount Television Studios']
SET s.distributionMarkets = ['Global']
SET s.studioLotsLat = [34.0841, 40.7590, 51.5112]
SET s.studioLotsLong = [-118.3213, -73.9845, -0.1198]
SET s.mountainLogo = true;

CREATE (FocusFeatures:Studio:GeneratedByClaudeAI {
    name: 'Focus Features',
    founded: date('2002-05-26'),
    headquartersLat: 34.1381,
    headquartersLong: -118.3534,
    yearlyRevenue2020: 320000000,
    yearlyRevenue2021: 450000000,
    yearlyRevenue2022: 380000000,
    digitalStreamingDate: datetime('2018-06-22T00:00:00Z'),
    isPublic: false,
    marketShare: 0.02,
    indieFilmFocus: true
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Focus Features'})
SET s.subsidiaries = ['Focus World']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia', 'Australia']
SET s.studioLotsLat = [34.1381]
SET s.studioLotsLong = [-118.3534]
SET s.parentCompany = 'Universal Pictures'
SET s.awardWinningFilms = 78;

// Create production events
CREATE (SoundOfMusicProduction:Production:GeneratedByClaudeAI {
    name: 'The Sound of Music Production',
    startDate: date('1964-03-26'),
    endDate: date('1964-09-01'),
    durationMonths: 5,
    durationDays: 6,
    startTime: localtime('07:00:00'),
    isCompleted: true,
    budgetPersonnel: 3200000,
    budgetEquipment: 1500000,
    budgetLocations: 2000000,
    budgetMusic: 1000000,
    budgetOther: 500000,
    weatherGood: 65,
    weatherAcceptable: 30,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'The Sound of Music Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Musical Recording', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '06:30:00', '07:00:00', '19:00:00', '20:00:00']
SET p.scheduleDurations = [1.5, 0.5, 12, 3, 1]
SET p.locationCountries = ['Austria', 'United States'];

CREATE (PsychoProduction:Production:GeneratedByClaudeAI {
    name: 'Psycho Production',
    startDate: date('1959-11-11'),
    endDate: date('1960-02-01'),
    durationMonths: 2,
    durationDays: 21,
    startTime: localtime('08:00:00'),
    isCompleted: true,
    budgetPersonnel: 400000,
    budgetEquipment: 150000,
    budgetLocations: 50000,
    budgetSets: 180000,
    budgetOther: 26947,
    weatherGood: 90,
    weatherAcceptable: 8,
    weatherPoor: 2
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Psycho Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['06:00:00', '07:30:00', '08:00:00', '18:00:00']
SET p.scheduleDurations = [1.5, 0.5, 10, 1]
SET p.studioRestrictions = ['Limited budget', 'Black and white film', 'Small crew'];

CREATE (AvatarProduction:Production:GeneratedByClaudeAI {
    name: 'Avatar Production',
    startDate: date('2007-04-16'),
    endDate: date('2007-12-15'),
    durationMonths: 8,
    durationDays: 0,
    startTime: localtime('06:00:00'),
    isCompleted: true,
    budgetPersonnel: 80000000,
    budgetEquipment: 45000000,
    budgetMotionCapture: 65000000,
    budgetVFX: 90000000,
    budgetOther: 22000000,
    technicalChallenges: 85,
    technicalSuccesses: 92
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Avatar Production'})
SET p.scheduleActivities = ['Performance Capture', 'Virtual Camera', 'Live Action', 'Post-Production']
SET p.scheduleTimes = ['06:00:00', '10:00:00', '14:00:00', '18:00:00']
SET p.scheduleDurations = [4, 4, 4, 8]
SET p.motionCaptureStages = 6;

CREATE (BlackPantherProduction:Production:GeneratedByClaudeAI {
    name: 'Black Panther Production',
    startDate: date('2017-01-15'),
    endDate: date('2017-04-19'),
    durationMonths: 3,
    durationDays: 4,
    startTime: localtime('06:30:00'),
    isCompleted: true,
    budgetPersonnel: 65000000,
    budgetEquipment: 25000000,
    budgetLocations: 35000000,
    budgetVFX: 60000000,
    budgetOther: 15000000,
    weatherGood: 80,
    weatherAcceptable: 15,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Black Panther Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['04:00:00', '06:00:00', '06:30:00', '18:30:00']
SET p.scheduleDurations = [2, 0.5, 12, 1.5]
SET p.filmingCountries = ['United States', 'South Korea', 'Argentina'];

CREATE (LostInTranslationProduction:Production:GeneratedByClaudeAI {
    name: 'Lost in Translation Production',
    startDate: date('2002-09-29'),
    endDate: date('2002-10-25'),
    durationMonths: 0,
    durationDays: 27,
    startTime: localtime('06:00:00'),
    isCompleted: true,
    budgetPersonnel: 1500000,
    budgetEquipment: 800000,
    budgetLocations: 1200000,
    budgetOther: 500000,
    weatherGood: 85,
    weatherAcceptable: 12,
    weatherPoor: 3
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Lost in Translation Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['04:00:00', '05:30:00', '06:00:00', '18:00:00']
SET p.scheduleDurations = [1.5, 0.5, 12, 1]
SET p.guerrillaFilming = true;

// Add more reviews
CREATE (SoundOfMusicReview:Review:GeneratedByClaudeAI {
    title: 'A Timeless Musical Masterpiece',
    stars: 4.7,
    date: date('1965-03-10'),
    time: time('14:30:00-05:00'),
    isVerified: true,
    aspectDirection: 4.8,
    aspectActing: 4.6,
    aspectMusic: 5.0,
    aspectCinematography: 4.9,
    aspectPlot: 4.5,
    reviewText: 'The Sound of Music is a glorious celebration of music, stunning Alpine scenery, and heartwarming family values. Julie Andrews delivers a career-defining performance as Maria, and the musical numbers have rightfully become cultural touchstones.',
    historicalRelevance: 'Definitive family musical'
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Timeless Musical Masterpiece'})
SET r.culturalImpactAssessments = [date('1975-03-10'), date('1995-03-10'), date('2015-03-10')]
SET r.historicalSignificanceRatings = [4.5, 4.7, 4.8]
SET r.assessmentYears = [1975, 1995, 2015]
SET r.keywords = ['musical', 'family', 'Austrian', 'historical']
SET r.academicCitations = 458;

CREATE (PsychoReview:Review:GeneratedByClaudeAI {
    title: 'Revolutionary Horror That Changed Cinema',
    stars: 5.0,
    date: date('1960-06-22'),
    time: time('15:15:00-05:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 4.9,
    aspectCinematography: 5.0,
    aspectMusic: 4.9,
    aspectTension: 5.0,
    reviewText: 'Alfred Hitchcock\'s Psycho shattered conventions with its shocking shower scene and narrative twists. The film\'s psychological depth, Bernard Herrmann\'s screeching score, and Anthony Perkins\' unforgettable performance as Norman Bates created a template for modern horror.',
    culturalImpact: 'Genre-defining'
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Revolutionary Horror That Changed Cinema'})
SET r.historicalReassessments = [date('1970-06-22'), date('1990-06-22'), date('2010-06-22')]
SET r.influenceRatings = [9.2, 9.6, 9.8]
SET r.assessmentYears = [1970, 1990, 2010]
SET r.keywords = ['horror', 'psychological', 'innovative', 'shocking']
SET r.filmSchoolReferences = 8942;

CREATE (AvatarReview:Review:GeneratedByClaudeAI {
    title: 'Groundbreaking Visual Achievement',
    stars: 4.5,
    date: date('2009-12-21'),
    time: time('17:42:15-05:00'),
    isVerified: true,
    aspectDirection: 4.6,
    aspectVisuals: 5.0,
    aspectCinematography: 4.9,
    aspectWorldBuilding: 4.8,
    aspectPlot: 3.9,
    reviewText: 'James Cameron\'s Avatar revolutionized filmmaking technology with its unprecedented 3D visuals and motion capture performances. While the environmental message and colonial critique follow familiar paths, the immersive world of Pandora represents cinema\'s most fully realized alien ecosystem.',
    upvotes: 18654
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Groundbreaking Visual Achievement'})
SET r.commentTimestamps = [datetime('2009-12-21T19:12:33-05:00'), datetime('2009-12-22T08:45:22-05:00'), datetime('2009-12-23T14:36:51-05:00')]
SET r.keywords = ['3D', 'groundbreaking', 'sci-fi', 'visual-effects']
SET r.readerLocationsLat = [40.7128, 51.5074, 34.0522]
SET r.readerLocationsLong = [-74.0060, -0.1278, -118.2437];

CREATE (BlackPantherReview:Review:GeneratedByClaudeAI {
    title: 'Cultural Milestone and Superhero Excellence',
    stars: 4.8,
    date: date('2018-02-18'),
    time: time('15:30:45-05:00'),
    isVerified: true,
    aspectDirection: 4.8,
    aspectActing: 4.7,
    aspectVisuals: 4.9,
    aspectCulturalImpact: 5.0,
    aspectPlot: 4.6,
    reviewText: 'Black Panther transcends the superhero genre with its celebration of African culture, complex characters, and thoughtful exploration of identity and responsibility. Chadwick Boseman\'s regal performance as T\'Challa anchors a film that skillfully balances blockbuster thrills with social commentary.',
    upvotes: 25483
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Cultural Milestone and Superhero Excellence'})
SET r.commentTimestamps = [datetime('2018-02-18T17:22:43-05:00'), datetime('2018-02-19T09:15:12-05:00'), datetime('2018-02-20T14:32:01-05:00')]
SET r.keywords = ['superhero', 'afrofuturism', 'cultural-impact', 'representation']
SET r.readerLocationsLat = [33.7490, 40.7128, 37.7749]
SET r.readerLocationsLong = [-84.3880, -74.0060, -122.4194];

CREATE (LostInTranslationReview:Review:GeneratedByClaudeAI {
    title: 'A Poetic Meditation on Connection',
    stars: 4.9,
    date: date('2003-09-15'),
    time: time('22:15:30-04:00'),
    isVerified: true,
    aspectDirection: 4.9,
    aspectActing: 5.0,
    aspectAtmosphere: 5.0,
    aspectCinematography: 4.8,
    aspectSubtlety: 4.9,
    reviewText: 'Sofia Coppola\'s Lost in Translation is a delicate, evocative portrait of two lost souls finding brief connection in Tokyo. Bill Murray and Scarlett Johansson deliver nuanced performances that communicate volumes with glances and silences. The film captures the disorientation of cultural displacement and the bittersweet nature of fleeting relationships.',
    upvotes: 12485
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Poetic Meditation on Connection'})
SET r.commentTimestamps = [datetime('2003-09-15T23:42:18-04:00'), datetime('2003-09-16T08:15:27-04:00'), datetime('2003-09-17T15:32:41-04:00')]
SET r.keywords = ['tokyo', 'alienation', 'connection', 'melancholy', 'indie']
SET r.readerLocationsLat = [40.7128, 34.0522, 35.6762]
SET r.readerLocationsLong = [-74.0060, -118.2437, 139.6503];

// Create Golden Globe Award ceremony
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

// Create relationships between nodes
MATCH 
  (r:Person {name: 'Robert Wise'}), // Assuming Robert Wise exists from original data
  (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (r)-[:DIRECTED {
    year: 1965,
    daysOnSet: 145,
    satisfaction: 4.9,
    awardNominations: 10,
    completionDate: date('1964-11-15'),
    premiereEvent: datetime('1965-03-02T19:30:00-05:00'),
    durationMonths: 5,
    isFirstMusical: false,
    onLocationPercentage: 60
}]->(s);

MATCH 
  (a:Person:GeneratedByClaudeAI {name: 'Alfred Hitchcock'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Psycho'})
CREATE (a)-[:DIRECTED {
    year: 1960,
    daysOnSet: 45,
    satisfaction: 4.8,
    studioInterference: 'Low',
    completionDate: date('1960-02-01'),
    premiereEvent: datetime('1960-06-16T20:00:00-05:00'),
    durationMonths: 2,
    isLowBudget: true,
    blackAndWhiteDecision: 'Artistic and practical'
}]->(p);

MATCH 
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'}),
  (a:Movie:GeneratedByClaudeAI {title: 'Avatar'})
CREATE (j)-[:DIRECTED {
    year: 2009,
    daysOnSet: 198,
    satisfaction: 4.9,
    awardNominations: 9,
    completionDate: date('2009-11-01'),
    premiereEvent: datetime('2009-12-10T19:00:00-05:00'),
    durationMonths: 8,
    isTechnicalInnovation: true,
    developmentYears: 15
}]->(a);

MATCH 
  (r:Person:GeneratedByClaudeAI {name: 'Ryan Coogler'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Black Panther'})
CREATE (r)-[:DIRECTED {
    year: 2018,
    daysOnSet: 132,
    satisfaction: 4.9,
    awardNominations: 7,
    completionDate: date('2017-11-10'),
    premiereEvent: datetime('2018-01-29T20:00:00-05:00'),
    durationMonths: 3,
    marvelInvolvement: 'Supportive',
    culturalConsultants: 12
}]->(b);

MATCH 
  (s:Person:GeneratedByClaudeAI {name: 'Sofia Coppola'}),
  (l:Movie:GeneratedByClaudeAI {title: 'Lost in Translation'})
CREATE (s)-[:DIRECTED {
    year: 2003,
    daysOnSet: 27,
    satisfaction: 4.9,
    awardNominations: 4,
    awardWins: 1,
    completionDate: date('2002-12-15'),
    premiereEvent: datetime('2003-08-29T19:30:00+02:00'),
    durationMonths: 1,
    isPersonalStory: true,
    improvisation: 'Significant'
}]->(l);

// Actor to Movie relationships
MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Julie Andrews'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (j)-[:ACTED_IN {
    roles: ['Maria von Trapp'],
    salary: 150000,
    screenTimeMinutes: 145,
    startDate: date('1964-03-26'),
    endDate: date('1964-09-01'),
    scheduleConflicts: false,
    criticScore: 95,
    audienceScore: 98,
    awardNominations: 5,
    awardWins: 1,
    songsPerformed: 10
}]->(s);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Anthony Perkins'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Psycho'})
CREATE (a)-[:ACTED_IN {
    roles: ['Norman Bates'],
    salary: 40000,
    screenTimeMinutes: 60,
    startDate: date('1959-11-11'),
    endDate: date('1960-02-01'),
    scheduleConflicts: false,
    criticScore: 96,
    audienceScore: 93,
    awardNominations: 1,
    careerDefiningRole: true
}]->(p);

MATCH
  (s:Person:GeneratedByClaudeAI {name: 'Sam Worthington'}),
  (a:Movie:GeneratedByClaudeAI {title: 'Avatar'})
CREATE (s)-[:ACTED_IN {
    roles: ['Jake Sully'],
    salary: 5000000,
    screenTimeMinutes: 138,
    startDate: date('2007-04-16'),
    endDate: date('2007-12-15'),
    scheduleConflicts: false,
    criticScore: 90,
    audienceScore: 92,
    motionCaptureHours: 1250,
    physicalTrainingMonths: 6
}]->(a);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Chadwick Boseman'}),
  (b:Movie:GeneratedByClaudeAI {title: 'Black Panther'})
CREATE (c)-[:ACTED_IN {
    roles: ['T\'Challa/Black Panther'],
    salary: 2000000,
    screenTimeMinutes: 105,
    startDate: date('2017-01-15'),
    endDate: date('2017-04-19'),
    scheduleConflicts: false,
    criticScore: 97,
    audienceScore: 96,
    awardNominations: 2,
    stuntTrainingHours: 375,
    dialectCoaching: true
}]->(b);

MATCH
  (s:Person:GeneratedByClaudeAI {name: 'Scarlett Johansson'}),
  (l:Movie:GeneratedByClaudeAI {title: 'Lost in Translation'})
CREATE (s)-[:ACTED_IN {
    roles: ['Charlotte'],
    salary: 750000,
    screenTimeMinutes: 85,
    startDate: date('2002-09-29'),
    endDate: date('2002-10-25'),
    scheduleConflicts: false,
    criticScore: 95,
    audienceScore: 90,
    awardNominations: 5,
    awardWins: 1,
    ageAtFilming: 17
}]->(l);

// Studio relationships
MATCH
  (t:Studio:GeneratedByClaudeAI {name: 'TwentiethCenturyFox'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (t)-[:PRODUCED {
    investment: 8200000,
    return: 286214286,
    roi: 34.9,
    contractSigned: date('1963-08-15'),
    studioShare: 0.7,
    directorShare: 0.1,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 2000000,
    isProfitable: true,
    marketingStart: datetime('1964-12-15T00:00:00Z'),
    recordBreakingSuccess: true
}]->(s);

MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'}),
  (ps:Movie:GeneratedByClaudeAI {title: 'Psycho'})
CREATE (p)-[:PRODUCED {
    investment: 806947,
    return: 50000000,
    roi: 61.96,
    contractSigned: date('1959-08-23'),
    studioShare: 0.6,
    directorShare: 0.3,
    producerShare: 0.05,
    topCastShare: 0.05,
    marketingBudget: 500000,
    isProfitable: true,
    marketingStart: datetime('1960-04-15T00:00:00Z'),
    hitchcockDeal: 'Backend percentage'
}]->(ps);

MATCH
  (t:Studio:GeneratedByClaudeAI {name: 'TwentiethCenturyFox'}),
  (a:Movie:GeneratedByClaudeAI {title: 'Avatar'})
CREATE (t)-[:PRODUCED {
    investment: 237000000,
    return: 2923706026,
    roi: 12.34,
    contractSigned: date('2005-10-15'),
    studioShare: 0.5,
    directorShare: 0.3,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 150000000,
    isProfitable: true,
    marketingStart: datetime('2009-05-15T00:00:00Z'),
    highestGrossingMilestone: date('2010-01-25')
}]->(a);

MATCH
  (d:Studio {name: 'The Walt Disney Company'}), // Assuming Disney exists in original data
  (b:Movie:GeneratedByClaudeAI {title: 'Black Panther'})
CREATE (d)-[:PRODUCED {
    investment: 200000000,
    return: 1347280838,
    roi: 6.74,
    contractSigned: date('2016-04-10'),
    studioShare: 0.7,
    directorShare: 0.1,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 150000000,
    isProfitable: true,
    marketingStart: datetime('2017-07-22T00:00:00Z'),
    marvelCinematicUniverseEntry: 18
}]->(b);

MATCH
  (f:Studio:GeneratedByClaudeAI {name: 'Focus Features'}),
  (l:Movie:GeneratedByClaudeAI {title: 'Lost in Translation'})
CREATE (f)-[:PRODUCED {
    investment: 4000000,
    return: 119723856,
    roi: 29.93,
    contractSigned: date('2002-06-15'),
    studioShare: 0.5,
    directorShare: 0.25,
    producerShare: 0.15,
    topCastShare: 0.1,
    marketingBudget: 10000000,
    isProfitable: true,
    marketingStart: datetime('2003-07-15T00:00:00Z'),
    indieBreakoutStatus: true
}]->(l);

// Studio to filming relationship
MATCH
  (t:Studio:GeneratedByClaudeAI {name: 'TwentiethCenturyFox'}),
  (p:Production:GeneratedByClaudeAI {name: 'The Sound of Music Production'})
CREATE (t)-[:FINANCED {
    contractDate: date('1963-08-15'),
    amount: 8200000,
    isFullyPaid: true,
    transferTime1: datetime('1963-10-15T00:00:00Z'),
    transferTime2: datetime('1964-01-15T00:00:00Z'),
    transferTime3: datetime('1964-04-15T00:00:00Z'),
    paymentDate1: date('1963-10-15'),
    paymentAmount1: 2500000,
    paymentDate2: date('1964-01-15'),
    paymentAmount2: 3000000,
    paymentDate3: date('1964-04-15'),
    paymentAmount3: 2700000,
    locationPermitHandling: 'Studio managed'
}]->(p);

MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'}),
  (pr:Production:GeneratedByClaudeAI {name: 'Psycho Production'})
CREATE (p)-[:FINANCED {
    contractDate: date('1959-08-23'),
    amount: 806947,
    isFullyPaid: true,
    transferTime1: datetime('1959-10-01T00:00:00Z'),
    transferTime2: datetime('1959-12-15T00:00:00Z'),
    paymentDate1: date('1959-10-01'),
    paymentAmount1: 400000,
    paymentDate2: date('1959-12-15'),
    paymentAmount2: 406947,
    hitchcockOwnPercentage: 60,
    unusualDeal: true
}]->(pr);

MATCH
  (t:Studio:GeneratedByClaudeAI {name: 'TwentiethCenturyFox'}),
  (p:Production:GeneratedByClaudeAI {name: 'Avatar Production'})
CREATE (t)-[:FINANCED {
    contractDate: date('2005-10-15'),
    amount: 237000000,
    isFullyPaid: true,
    transferTime1: datetime('2006-01-15T00:00:00Z'),
    transferTime2: datetime('2006-07-15T00:00:00Z'),
    transferTime3: datetime('2007-01-15T00:00:00Z'),
    transferTime4: datetime('2007-07-15T00:00:00Z'),
    paymentDate1: date('2006-01-15'),
    paymentAmount1: 50000000,
    paymentDate2: date('2006-07-15'),
    paymentAmount2: 60000000,
    paymentDate3: date('2007-01-15'),
    paymentAmount3: 70000000,
    paymentDate4: date('2007-07-15'),
    paymentAmount4: 57000000,
    technologyDevelopmentFunding: true
}]->(p);

// Filming to movie relationship
MATCH
  (p:Production:GeneratedByClaudeAI {name: 'The Sound of Music Production'}),
  (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 5,
    durationDays: 6,
    locationCount: 15,
    soundstageCount: 8,
    dailyAverageCost: 56000,
    scheduleAdherence: 0.92,
    weatherDelaysDays: 10,
    originalScheduledEnd: date('1964-08-20'),
    locationFilmingPercentage: 60,
    musicalNumbersFilmed: 15
}]->(s);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Psycho Production'}),
  (ps:Movie:GeneratedByClaudeAI {title: 'Psycho'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 2,
    durationDays: 21,
    setCount: 12,
    studioFilmingPercentage: 90,
    dailyAverageCost: 12000,
    scheduleAdherence: 0.95,
    originalScheduledEnd: date('1960-01-25'),
    blackAndWhiteFormat: true,
    crewSize: 85,
    secrecyLevel: 'Extreme'
}]->(ps);

// Award relationships
MATCH
  (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (s)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 1966,
    ceremony: 38,
    isWinner: true,
    ceremonyDate: date('1966-04-18'),
    announcementTime: localtime('21:45:00'),
    votesFor: 2451,
    votesAgainst: 1254,
    producerAccepting: 'Robert Wise',
    culturalImpact: 'Mainstream musical legitimacy'
}]->(a);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Julie Andrews'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (j)-[:NOMINATED_FOR {
    category: 'Best Actress',
    year: 1966,
    ceremony: 38,
    isWinner: false,
    ceremonyDate: date('1966-04-18'),
    announcementTime: localtime('20:30:00'),
    votesFor: 1854,
    votesAgainst: 1978,
    previousWin: true,
    previousWinYear: 1965
}]->(a);

MATCH
  (a:Movie:GeneratedByClaudeAI {title: 'Avatar'}),
  (a2:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (a)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 2010,
    ceremony: 82,
    isWinner: false,
    ceremonyDate: date('2010-03-07'),
    announcementTime: localtime('21:45:00'),
    votesFor: 2350,
    votesAgainst: 2650,
    techAwards: 3,
    competitionWinner: 'The Hurt Locker'
}]->(a2);

MATCH
  (b:Movie:GeneratedByClaudeAI {title: 'Black Panther'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (b)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 2019,
    ceremony: 91,
    isWinner: false,
    ceremonyDate: date('2019-02-24'),
    announcementTime: localtime('21:45:00'),
    votesFor: 1850,
    votesAgainst: 2050,
    historicalSignificance: 'First superhero film nominated',
    culturalMilestone: true
}]->(a);

MATCH
  (s:Person:GeneratedByClaudeAI {name: 'Sofia Coppola'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (s)-[:NOMINATED_FOR {
    category: 'Best Original Screenplay',
    year: 2004,
    ceremony: 76,
    isWinner: true,
    ceremonyDate: date('2004-02-29'),
    announcementTime: localtime('20:15:00'),
    votesFor: 2456,
    votesAgainst: 1850,
    speechDuration: duration({minutes: 1, seconds: 45}),
    secondGenerationWinner: true
}]->(a);

// Professional relationships between people
MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Julie Andrews'}),
  (r:Person {name: 'Rob Reiner'}) // Original person from graph
CREATE (j)-[:KNOWS {
    since: date('1972-05-15'),
    relationship: 'Professional Colleagues',
    lastMeeting: date('2019-12-10'),
    durationYears: 47,
    commonProjects: 0,
    industryEvents: 23
}]->(r);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Alfred Hitchcock'}),
  (t:Person {name: 'Tom Hanks'}) // Original person from graph
CREATE (a)-[:INFLUENCED {
    startYear: 1960,
    directInfluence: false,
    mentionedInInterviews: 15,
    cinematicTechniques: ['Camera movement', 'Suspense building', 'Audience manipulation'],
    influenceStrength: [8.5, 9.2, 8.8],
    culturalConnection: 'Directorial craft'
}]->(t);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'}),
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'})
CREATE (j)-[:KNOWS {
    since: date('2000-07-22'),
    relationship: 'Professional Peers',
    lastMeeting: date('2023-11-15'),
    durationYears: 23,
    mutualRespectLevel: 'Very High',
    technicalExchanges: 8
}]->(c);

MATCH
  (s:Person:GeneratedByClaudeAI {name: 'Sofia Coppola'}),
  (s2:Person:GeneratedByClaudeAI {name: 'Scarlett Johansson'})
CREATE (s)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'Lost in Translation',
    firstYear: 2003,
    chemistry: 4.9,
    interviews: 42,
    relationship: 'Director-Actor',
    awardsCelebrated: 5,
    reunionDiscussions: 3
}]->(s2);

// Create soundtracks
CREATE (SoundOfMusicSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'The Sound of Music (Original Motion Picture Soundtrack)',
    composer: 'Richard Rodgers',
    lyricist: 'Oscar Hammerstein II',
    released: date('1965-03-02'),
    duration: duration({minutes: 87, seconds: 12}),
    trackCount: 20,
    recordingStudio: 'Todd-AO Scoring Stage',
    recordingStudioLat: 34.1381,
    recordingStudioLong: -118.3534,
    peakChartPosition: 1,
    weeksAtNumberOne: 70,
    salesUnits: 20000000,
    streamingCount: 120000000
})
WITH 1 as dummy
MATCH (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'}),
      (st:Soundtrack:GeneratedByClaudeAI {title: 'The Sound of Music (Original Motion Picture Soundtrack)'})
CREATE (st)-[:COMPOSED_FOR {
    contractDate: date('1964-01-15'),
    completion: date('1964-11-22'),
    nominatedAwards: ['Academy Award', 'Grammy Award'],
    wonAwards: ['Academy Award', 'Grammy Award'],
    goldRecords: 1,
    platinumRecords: 2,
    iconicSongs: ['Do-Re-Mi', 'My Favorite Things', 'Edelweiss', 'Climb Ev\'ry Mountain']
}]->(s);

CREATE (PsychoSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'Psycho (Original Motion Picture Soundtrack)',
    composer: 'Bernard Herrmann',
    released: date('1960-09-16'),
    duration: duration({minutes: 45, seconds: 38}),
    trackCount: 14,
    recordingStudio: 'Paramount Scoring Stage',
    recordingStudioLat: 34.0841,
    recordingStudioLong: -118.3213,
    peakChartPosition: 32,
    salesUnits: 250000,
    streamingCount: 85000000,
    stringsOnly: true
})
WITH 1 as dummy
MATCH (p:Movie:GeneratedByClaudeAI {title: 'Psycho'}),
      (st:Soundtrack:GeneratedByClaudeAI {title: 'Psycho (Original Motion Picture Soundtrack)'})
CREATE (st)-[:COMPOSED_FOR {
    contractDate: date('1959-12-01'),
    completion: date('1960-01-15'),
    nominatedAwards: ['Grammy Award'],
    wonAwards: [],
    iconicTracks: ['The Murder', 'Prelude', 'The Cellar'],
    culturalInfluence: 'Revolutionized horror scoring',
    stringInstrumentCount: 18,
    recordingDays: 7
}]->(p);

// Create filming locations
CREATE (SalzburgLocation:FilmingLocation:GeneratedByClaudeAI {
    name: 'Salzburg',
    country: 'Austria',
    region: 'Salzburg State',
    latitude: 47.8095,
    longitude: 13.0550,
    elevation: 424,
    elevationUnit: 'm',
    climate: 'Temperate',
    permitCost: 150000,
    permitCurrency: 'USD',
    firstUsed: date('1964-04-15'),
    lastUsed: date('1964-06-28'),
    tourismIncrease: 250
})
WITH 1 as dummy
MATCH (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Salzburg'})
CREATE (s)-[:FILMED_AT {
    startDate: date('1964-04-15'),
    endDate: date('1964-06-28'),
    sceneCount: 45,
    totalDays: 75,
    weatherDelayDays: 10,
    crewSize: 150,
    logisticsCost: 850000,
    accommodationCost: 450000,
    characterPresent: ['Maria', 'Von Trapp Family', 'Captain von Trapp'],
    touristSiteToday: true
}]->(l);

CREATE (UniversalLot:FilmingLocation:GeneratedByClaudeAI {
    name: 'Universal Studios Backlot',
    country: 'USA',
    region: 'California',
    latitude: 34.1381,
    longitude: -118.3534,
    elevation: 210,
    elevationUnit: 'm',
    climate: 'Mediterranean',
    studioOwned: true,
    firstUsed: date('1915-03-15'),
    lastUsed: date('2024-01-15'),
    filmCount: 8452
})
WITH 1 as dummy
MATCH (p:Movie:GeneratedByClaudeAI {title: 'Psycho'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Universal Studios Backlot'})
CREATE (p)-[:FILMED_AT {
    startDate: date('1959-11-11'),
    endDate: date('1960-02-01'),
    sceneCount: 85,
    totalDays: 40,
    weatherDelayDays: 2,
    crewSize: 85,
    setsBulit: 12,
    iconicSet: 'Bates Motel',
    setPreservationStatus: 'Tourist attraction',
    touristVisitsAnnually: 5000000
}]->(l);

// Create costume designers
CREATE (DorotyJeakins:Person:GeneratedByClaudeAI {
    name: 'Dorothy Jeakins',
    born: 1914,
    died: 1995,
    birthdate: date('1914-01-11'),
    deathdate: date('1995-11-27'),
    nationality: 'American',
    oscarWins: 3,
    oscarNominations: 12,
    isActive: false,
    firstFilm: datetime('1946-08-15T00:00:00Z'),
    lastFilm: datetime('1987-06-25T00:00:00Z'),
    careerLength: duration({years: 41}),
    specialization: 'Period Costume Design'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Dorothy Jeakins'}),
      (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (p)-[:DESIGNED_COSTUMES_FOR {
    year: 1965,
    costumesCreated: 850,
    budget: 400000,
    awardNominations: 1,
    awardWins: 0,
    startDate: date('1963-12-15'),
    completionDate: date('1964-03-10'),
    specialCostumes: ['Maria\'s wedding dress', 'Children\'s play clothes', 'Baroness evening gowns'],
    researchHours: 350,
    historicalAccuracy: 'High with artistic license',
    fabricsUsed: 85
}]->(s);

CREATE (HelenColvig:Person:GeneratedByClaudeAI {
    name: 'Helen Colvig',
    born: 1918,
    died: 1991,
    birthdate: date('1918-05-22'),
    deathdate: date('1991-08-15'),
    nationality: 'American',
    oscarNominations: 1,
    isActive: false,
    firstFilm: datetime('1952-06-15T00:00:00Z'),
    lastFilm: datetime('1980-11-22T00:00:00Z'),
    careerLength: duration({years: 28}),
    specialization: 'Contemporary Costume Design'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Helen Colvig'}),
      (ps:Movie:GeneratedByClaudeAI {title: 'Psycho'})
CREATE (p)-[:DESIGNED_COSTUMES_FOR {
    year: 1960,
    costumesCreated: 120,
    budget: 35000,
    awardNominations: 0,
    awardWins: 0,
    startDate: date('1959-10-01'),
    completionDate: date('1959-11-05'),
    specialCostumes: ['Norman\'s sweaters', 'Marion\'s suits', 'Mother\'s dress'],
    researchHours: 125,
    psychologicalSignificance: 'High',
    blackAndWhiteConsiderations: true
}]->(ps);

// Create cinematographer relationships
CREATE (TedMcCord:Person:GeneratedByClaudeAI {
    name: 'Ted McCord',
    born: 1900,
    died: 1976,
    birthdate: date('1900-08-02'),
    deathdate: date('1976-01-19'),
    nationality: 'American',
    oscarNominations: 3,
    isActive: false,
    firstFilm: datetime('1930-05-15T00:00:00Z'),
    lastFilm: datetime('1968-11-22T00:00:00Z'),
    careerLength: duration({years: 38}),
    visualStyle: 'Vivid color compositions'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Ted McCord'}),
      (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (p)-[:CINEMATOGRAPHY_FOR {
    year: 1965,
    cameras: ['Mitchell BNC', 'Todd-AO Cameras'],
    lenses: ['Todd-AO Lenses', 'Panavision Anamorphic'],
    awardNominations: 1,
    awardWins: 0,
    startDate: date('1964-03-26'),
    completionDate: date('1964-09-01'),
    signature_shots: ['Mountain opening', 'Gazebo scenes', 'Wedding procession'],
    lighting_setups: 215,
    colorProcess: 'DeLuxe Color',
    aspectRatio: '2.20:1'
}]->(s);

CREATE (JohnLRussell:Person:GeneratedByClaudeAI {
    name: 'John L. Russell',
    born: 1905,
    died: 1967,
    birthdate: date('1905-01-03'),
    deathdate: date('1967-02-01'),
    nationality: 'American',
    oscarNominations: 0,
    isActive: false,
    firstFilm: datetime('1940-05-15T00:00:00Z'),
    lastFilm: datetime('1966-11-22T00:00:00Z'),
    careerLength: duration({years: 26}),
    visualStyle: 'High contrast black and white'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'John L. Russell'}),
      (ps:Movie:GeneratedByClaudeAI {title: 'Psycho'})
CREATE (p)-[:CINEMATOGRAPHY_FOR {
    year: 1960,
    cameras: ['Mitchell NC', 'Arriflex 35'],
    lenses: ['Cooke Speed Panchro', 'Bausch & Lomb Baltar'],
    awardNominations: 0,
    awardWins: 0,
    startDate: date('1959-11-11'),
    completionDate: date('1960-02-01'),
    signature_shots: ['Shower scene', 'House on hill', 'Car sinking in swamp'],
    lighting_setups: 145,
    blackAndWhiteFilmStock: 'Eastman Double-X Negative',
    televisionExperience: true
}]->(ps);

// Create more connections between original and new graph
MATCH
  (o:Person:GeneratedByClaudeAI {name: 'Orson Welles'}),
  (a:Person:GeneratedByClaudeAI {name: 'Alfred Hitchcock'})
CREATE (o)-[:ADMIRED {
    since: date('1940-06-15'),
    publicStatements: 8,
    mutualRespect: true,
    commonTechniques: ['Deep focus', 'Innovative camera angles', 'Psychological suspense'],
    techniqueOverlap: [9.2, 8.5, 9.7],
    cinematicInfluence: 'Bidirectional'
}]->(a);

MATCH
  (s:Person:GeneratedByClaudeAI {name: 'Sofia Coppola'}),
  (b:Person:GeneratedByClaudeAI {name: 'Bong Joon-ho'})
CREATE (s)-[:KNOWS {
    since: date('2012-05-22'),
    relationship: 'Festival circuit colleagues',
    lastMeeting: date('2023-05-17'),
    durationYears: 11,
    festivalEncounters: 8,
    mutualAdmiration: true
}]->(b);

// Create fan community for classic film
CREATE (SoundOfMusicFandom:FanCommunity:GeneratedByClaudeAI {
    name: 'The Sound of Music Fan Community',
    established: date('1965-06-15'),
    revival: date('2005-03-02'),
    memberCount: 850000,
    onlinePlatforms: 12,
    annualTours: 850,
    largestEventAttendance: 25000,
    singAlongEvents: 450,
    tourismRevenue: 35000000,
    tourismRevenueCurrency: 'USD',
    academicStudies: 85
})
WITH 1 as dummy
MATCH (f:FanCommunity:GeneratedByClaudeAI {name: 'The Sound of Music Fan Community'}),
      (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (f)-[:CELEBRATES {
    yearsActive: 59,
    tourLocations: ['Salzburg', 'Vienna', 'Vermont'],
    annualFestivals: 5,
    merchandiseSales: 12000000,
    generationalAppeal: 'Multi-generational',
    songbooksPublished: 45,
    academicConferences: 12,
    recreationsPerformed: 'Global',
    culturalPreservation: 'Significant',
    archivalCollections: 15
}]->(s);

// Create educational program for classic film studies
CREATE (HitchcockStudyProgram:EducationalProgram:GeneratedByClaudeAI {
    name: 'Hitchcock Film Analysis Curriculum',
    developed: date('1980-05-15'),
    institutionsAdopting: 2450,
    targetEducationLevels: ['University', 'Film School', 'High School Advanced'],
    materialFormats: ['Digital', 'Print', 'Video supplements', 'Interactive'],
    languagesAvailable: 28,
    courseDuration: duration({weeks: 12}),
    totalLessonHours: 85,
    scholarlyEndorsements: 125,
    educatorRating: 9.6
})
WITH 1 as dummy
MATCH (e:EducationalProgram:GeneratedByClaudeAI {name: 'Hitchcock Film Analysis Curriculum'}),
      (p:Movie:GeneratedByClaudeAI {title: 'Psycho'})
CREATE (e)-[:ANALYZES {
    focusAreas: ['Suspense techniques', 'Visual symbolism', 'Psychological themes', 'Cultural context', 'Narrative structure'],
    focusDistribution: [0.25, 0.20, 0.25, 0.15, 0.15],
    analyticalApproaches: ['Auteur theory', 'Psychoanalytic', 'Feminist', 'Cultural'],
    studentFeedbackScore: 9.3,
    criticalThinkingDevelopment: 'Very High',
    filmTechniqueRecognition: 'Expert',
    shotByShot: true,
    filmStudiesImpact: 'Foundational',
    globalAdoption: 'Standard curriculum',
    academicPaperGeneration: 850
}]->(p);

// Create theme park attraction
CREATE (SoundOfMusicTour:Attraction:GeneratedByClaudeAI {
    name: 'The Original Sound of Music Tour',
    opened: date('1967-05-15'),
    locationLat: 47.8095,
    locationLong: 13.0550,
    visitorCapacity: 250,
    visitorDuration: duration({hours: 4, minutes: 0}),
    annualVisitors: 350000,
    routeLength: 25,
    lengthUnit: 'kilometers',
    developmentCost: 25000,
    interactiveElements: 8,
    historicalSites: 15
})
WITH 1 as dummy
MATCH (a:Attraction:GeneratedByClaudeAI {name: 'The Original Sound of Music Tour'}),
      (s:Movie:GeneratedByClaudeAI {title: 'The Sound of Music'})
CREATE (a)-[:BASED_ON {
    filmElementsFeatured: ['Gazebo', 'Nonnberg Abbey', 'Mirabell Gardens', 'Von Trapp villa exterior'],
    educationalFocus: 0.6,
    entertainmentFocus: 0.4,
    audienceRating: 9.5,
    historicalContextualization: 'Both film and true story',
    originalSitesCurated: 12,
    songPerformanceLocations: 8,
    filmingLocationAccuracy: 'Very high',
    culturalImpactMetrics: ['Tourism boost', 'City identity', 'Film pilgrimage'],
    economicContribution: 37500000
}]->(s);

// Create merchandising relationship
CREATE (AvatarMerchandise:Merchandise:GeneratedByClaudeAI {
    name: 'Avatar Collector\'s Edition Box Set',
    released: date('2010-11-16'),
    manufacturer: '20th Century Fox Home Entertainment',
    manufacturerLocationLat: 34.0746,
    manufacturerLocationLong: -118.3798,
    retailPrice: 99.99,
    priceCurrency: 'USD',
    productionRun: 250000,
    specialFeatures: 15,
    limitedEdition: true,
    packagingInnovation: 'Interactive AR features',
    collectorValue: 'Appreciating'
})
WITH 1 as dummy
MATCH (m:Merchandise:GeneratedByClaudeAI {name: 'Avatar Collector\'s Edition Box Set'}),
      (a:Movie:GeneratedByClaudeAI {title: 'Avatar'})
CREATE (m)-[:DERIVED_FROM {
    licensingDeal: date('2010-02-15'),
    unitsSold: 185000,
    geographicalDistribution: ['North America', 'Europe', 'Asia', 'Australia'],
    salesDistribution: [0.60, 0.25, 0.10, 0.05],
    retailersCarrying: 12500,
    digitalCodeInclusion: true,
    specialContentHours: 8.5,
    brandRecognition: 0.92,
    merchandisingLongevity: 'Still in demand, secondary market',
    collectibleResaleValue: 350
}]->(a);