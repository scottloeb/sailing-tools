// Create Contemporary and Classic Film Nodes
CREATE (Titanic:Movie:GeneratedByClaudeAI {
    title: 'Titanic',
    released: 1997,
    tagline: 'Collide with destiny',
    budget: 200000000,
    revenue: 2195170479,
    runtime_minutes: 195,
    rating_avg: 7.9,
    releaseDate: date('1997-12-19'),
    digitalRestoration: datetime('2012-04-04T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Titanic'})
SET m.ratings = [8.0, 7.8, 7.9, 7.9]
SET m.genres = ['romance', 'drama', 'disaster', 'historical']
SET m.certifications = ['PG-13', '12']
SET m.filmingLocationLat = [46.8432, 51.5072, 37.7749]
SET m.filmingLocationLong = [-71.2895, -0.1276, -122.4194]
SET m.boxOfficeNA = 659363944
SET m.boxOfficeInternational = 1535806535
SET m.specialEffectsAwards = 4
SET m.rereleaseDates = [date('2012-04-04'), date('2017-12-01'), date('2023-02-10')];

CREATE (TheGodfather:Movie:GeneratedByClaudeAI {
    title: 'The Godfather',
    released: 1972,
    tagline: 'An offer you can\'t refuse',
    budget: 6000000,
    revenue: 245066411,
    runtime_minutes: 175,
    rating_avg: 9.2,
    releaseDate: date('1972-03-24'),
    digitalRestoration: datetime('2008-09-23T00:00:00Z'),
    isOscarWinner: true,
    isPreservationRegistry: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
SET m.ratings = [9.2, 9.1, 9.3, 9.2]
SET m.genres = ['crime', 'drama']
SET m.certifications = ['R', '18']
SET m.filmingLocationLat = [40.7128, 37.7749, 38.1157]
SET m.filmingLocationLong = [-74.0060, -122.4194, 13.3665]
SET m.boxOfficeNA = 134966411
SET m.boxOfficeInternational = 110100000
SET m.preservationRegistry = 'National Film Registry'
SET m.culturalImpact = 'Transformative';

CREATE (TheDarkKnight:Movie:GeneratedByClaudeAI {
    title: 'The Dark Knight',
    released: 2008,
    tagline: 'Why so serious?',
    budget: 185000000,
    revenue: 1003045358,
    runtime_minutes: 152,
    rating_avg: 9.0,
    releaseDate: date('2008-07-18'),
    digitalRelease: datetime('2008-12-09T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'The Dark Knight'})
SET m.ratings = [9.0, 9.0, 8.9, 9.1]
SET m.genres = ['action', 'crime', 'drama', 'thriller']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [41.8781, 22.3193, 51.5072]
SET m.filmingLocationLong = [-87.6298, 114.1694, -0.1276]
SET m.boxOfficeNA = 533345358
SET m.boxOfficeInternational = 469700000
SET m.iMAXSequences = 6
SET m.posthumousAwards = 1;

CREATE (Pulp_Fiction:Movie:GeneratedByClaudeAI {
    title: 'Pulp Fiction',
    released: 1994,
    tagline: 'You won\'t know the facts until you\'ve seen the fiction',
    budget: 8000000,
    revenue: 213928762,
    runtime_minutes: 154,
    rating_avg: 8.9,
    releaseDate: date('1994-10-14'),
    digitalRestoration: datetime('2011-10-04T00:00:00Z'),
    isOscarWinner: true,
    isPreservationRegistry: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Pulp Fiction'})
SET m.ratings = [8.9, 8.8, 9.0, 8.9]
SET m.genres = ['crime', 'drama']
SET m.certifications = ['R', '18']
SET m.filmingLocationLat = [34.0522, 34.0211, 34.1184]
SET m.filmingLocationLong = [-118.2437, -118.3965, -118.3004]
SET m.boxOfficeNA = 107928762
SET m.boxOfficeInternational = 106000000
SET m.preservationRegistry = 'National Film Registry'
SET m.nonLinearStructure = true;

CREATE (Everything_Everywhere:Movie:GeneratedByClaudeAI {
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

// Create Foreign and Art House Film
CREATE (CrouchingTiger:Movie:GeneratedByClaudeAI {
    title: 'Crouching Tiger, Hidden Dragon',
    released: 2000,
    tagline: 'A timeless story of strength, secrets and two warriors who would never surrender',
    budget: 17000000,
    revenue: 213525736,
    runtime_minutes: 120,
    rating_avg: 7.9,
    releaseDate: date('2000-12-08'),
    digitalRelease: datetime('2001-05-22T00:00:00Z'),
    isOscarWinner: true,
    isInternational: true,
    originalLanguage: 'Mandarin'
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Crouching Tiger, Hidden Dragon'})
SET m.ratings = [7.9, 7.8, 8.0, 7.9]
SET m.genres = ['action', 'adventure', 'drama', 'romance']
SET m.certifications = ['PG-13', '12']
SET m.filmingLocationLat = [39.9042, 25.0330, 29.7604]
SET m.filmingLocationLong = [116.4074, 121.5654, 95.3698]
SET m.boxOfficeNA = 128078872
SET m.boxOfficeInternational = 85446864
SET m.subtitleLanguages = ['English', 'French', 'Spanish', 'German', 'Japanese']
SET m.martialArtsStyles = ['Wudang', 'Baguazhang', 'Tai Chi'];

// Create Directors and Actors
CREATE (KateWinslet:Person:GeneratedByClaudeAI {
    name: 'Kate Winslet',
    born: 1975,
    birthdate: date('1975-10-05'),
    nationality: 'British',
    oscarWins: 1,
    oscarNominations: 7,
    isActive: true,
    firstFilm: datetime('1994-10-28T00:00:00Z'),
    heightInMeters: 1.69,
    netWorth: 65000000,
    methodActingScore: 9.4
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Kate Winslet'})
SET p.languages = ['English', 'French']
SET p.filmography_titles = ['Titanic', 'Eternal Sunshine of the Spotless Mind', 'The Reader']
SET p.filmography_years = [1997, 2004, 2008]
SET p.filmography_roles = ['Rose DeWitt Bukater', 'Clementine Kruczynski', 'Hanna Schmitz'];

CREATE (FrancisFordCoppola:Person:GeneratedByClaudeAI {
    name: 'Francis Ford Coppola',
    born: 1939,
    birthdate: date('1939-04-07'),
    nationality: 'American',
    oscarWins: 5,
    oscarNominations: 14,
    isActive: true,
    firstFilm: datetime('1962-09-28T00:00:00Z'),
    heightInMeters: 1.82,
    netWorth: 400000000,
    wineBusinessOwner: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Francis Ford Coppola'})
SET p.languages = ['English', 'Italian']
SET p.filmography_titles = ['The Godfather', 'The Godfather: Part II', 'Apocalypse Now']
SET p.filmography_years = [1972, 1974, 1979]
SET p.directorStyle = 'Character-driven with technical innovation';

CREATE (HeathLedger:Person:GeneratedByClaudeAI {
    name: 'Heath Ledger',
    born: 1979,
    died: 2008,
    birthdate: date('1979-04-04'),
    deathdate: date('2008-01-22'),
    nationality: 'Australian',
    oscarWins: 1,
    oscarNominations: 1,
    isActive: false,
    firstFilm: datetime('1997-02-15T00:00:00Z'),
    lastFilm: datetime('2009-10-16T00:00:00Z'),
    heightInMeters: 1.85,
    characterImmersion: 'Total'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Heath Ledger'})
SET p.languages = ['English']
SET p.filmography_titles = ['The Dark Knight', 'Brokeback Mountain', '10 Things I Hate About You']
SET p.filmography_years = [2008, 2005, 1999]
SET p.filmography_roles = ['Joker', 'Ennis Del Mar', 'Patrick Verona']
SET p.posthumousAwards = 1;

CREATE (MarionCotillard:Person:GeneratedByClaudeAI {
    name: 'Marion Cotillard',
    born: 1975,
    birthdate: date('1975-09-30'),
    nationality: 'French',
    oscarWins: 1,
    oscarNominations: 2,
    isActive: true,
    firstFilm: datetime('1994-01-15T00:00:00Z'),
    heightInMeters: 1.69,
    netWorth: 40000000,
    musicianExperience: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Marion Cotillard'})
SET p.languages = ['French', 'English', 'Italian']
SET p.filmography_titles = ['La Vie en Rose', 'The Dark Knight Rises', 'Inception']
SET p.filmography_years = [2007, 2012, 2010]
SET p.filmography_roles = ['Édith Piaf', 'Miranda Tate', 'Mal Cobb'];

CREATE (AngLee:Person:GeneratedByClaudeAI {
    name: 'Ang Lee',
    born: 1954,
    birthdate: date('1954-10-23'),
    nationality: 'Taiwanese',
    oscarWins: 2,
    oscarNominations: 4,
    isActive: true,
    firstFilm: datetime('1992-05-04T00:00:00Z'),
    heightInMeters: 1.75,
    netWorth: 32000000,
    genreVersatility: 9.5
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Ang Lee'})
SET p.languages = ['Mandarin', 'English']
SET p.filmography_titles = ['Crouching Tiger, Hidden Dragon', 'Brokeback Mountain', 'Life of Pi']
SET p.filmography_years = [2000, 2005, 2012]
SET p.directorStyle = 'Visually poetic with cross-cultural themes';

CREATE (AlPacino:Person:GeneratedByClaudeAI {
    name: 'Al Pacino',
    born: 1940,
    birthdate: date('1940-04-25'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 9,
    isActive: true,
    firstFilm: datetime('1969-02-25T00:00:00Z'),
    heightInMeters: 1.70,
    netWorth: 120000000,
    methodActingScore: 9.8
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Al Pacino'})
SET p.languages = ['English', 'Italian']
SET p.filmography_titles = ['The Godfather', 'Scarface', 'Heat']
SET p.filmography_years = [1972, 1983, 1995]
SET p.filmography_roles = ['Michael Corleone', 'Tony Montana', 'Lt. Vincent Hanna'];

CREATE (QuentinTarantino:Person:GeneratedByClaudeAI {
    name: 'Quentin Tarantino',
    born: 1963,
    birthdate: date('1963-03-27'),
    nationality: 'American',
    oscarWins: 2,
    oscarNominations: 7,
    isActive: true,
    firstFilm: datetime('1992-01-21T00:00:00Z'),
    heightInMeters: 1.85,
    netWorth: 120000000,
    directorStyle: 'Non-linear narratives with homages'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Quentin Tarantino'})
SET p.languages = ['English']
SET p.filmography_titles = ['Pulp Fiction', 'Reservoir Dogs', 'Django Unchained']
SET p.filmography_years = [1994, 1992, 2012]
SET p.writerDirectorDuality = true;

CREATE (UmaThurman:Person:GeneratedByClaudeAI {
    name: 'Uma Thurman',
    born: 1970,
    birthdate: date('1970-04-29'),
    nationality: 'American',
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('1988-06-23T00:00:00Z'),
    heightInMeters: 1.80,
    netWorth: 45000000,
    martialArtsTraining: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Uma Thurman'})
SET p.languages = ['English', 'French', 'German']
SET p.filmography_titles = ['Pulp Fiction', 'Kill Bill: Vol. 1', 'Kill Bill: Vol. 2']
SET p.filmography_years = [1994, 2003, 2004]
SET p.filmography_roles = ['Mia Wallace', 'The Bride', 'The Bride'];

CREATE (KeYinShih:Person:GeneratedByClaudeAI {
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
SET p.filmography_titles = ['Crouching Tiger, Hidden Dragon', 'Everything Everywhere All at Once', 'Tomorrow Never Dies']
SET p.filmography_years = [2000, 2022, 1997]
SET p.filmography_roles = ['Yu Shu Lien', 'Evelyn Wang', 'Wai Lin'];

// Create Studios
CREATE (MiramaxFilms:Studio:GeneratedByClaudeAI {
    name: 'Miramax Films',
    founded: date('1979-10-01'),
    acquired: date('1993-05-21'),
    divested: date('2010-07-30'),
    headquartersLat: 34.0522,
    headquartersLong: -118.2437,
    yearlyRevenue1994: 250000000,
    yearlyRevenue1995: 320000000,
    yearlyRevenue1996: 375000000,
    digitalArchiveCreation: datetime('2005-06-15T00:00:00Z'),
    isActive: true,
    peakMarketShare: 0.08
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Miramax Films'})
SET s.subsidiaries = ['Dimension Films']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia', 'Australia']
SET s.studioLotsLat = [34.0522, 40.7128]
SET s.studioLotsLong = [-118.2437, -74.0060]
SET s.foundedBy = ['Bob Weinstein', 'Harvey Weinstein']
SET s.acquiredBy = 'The Walt Disney Company'
SET s.independentFocus = true;

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

CREATE (SonyPictures:Studio:GeneratedByClaudeAI {
    name: 'Sony Pictures Entertainment',
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
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Sony Pictures Entertainment'})
SET s.subsidiaries = ['Columbia Pictures', 'TriStar Pictures', 'Sony Pictures Animation']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia', 'Latin America', 'Africa', 'Oceania']
SET s.studioLotsLat = [34.0211, 35.6762]
SET s.studioLotsLong = [-118.3787, 139.6503];

// Create Production Events
CREATE (TitanicProduction:Production:GeneratedByClaudeAI {
    name: 'Titanic Production',
    startDate: date('1996-07-31'),
    endDate: date('1997-03-23'),
    durationMonths: 7,
    durationDays: 23,
    startTime: localtime('06:00:00'),
    isCompleted: true,
    budgetPersonnel: 70000000,
    budgetEquipment: 40000000,
    budgetSets: 50000000,
    budgetVFX: 30000000,
    budgetOther: 10000000,
    weatherGood: 65,
    weatherAcceptable: 25,
    weatherPoor: 10
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Titanic Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Underwater Filming', 'Wrap']
SET p.scheduleTimes = ['04:00:00', '05:30:00', '06:00:00', '14:00:00', '19:00:00']
SET p.scheduleDurations = [1.5, 0.5, 8, 5, 1]
SET p.setLocation = 'Rosarito, Mexico'
SET p.replicas = ['90% scale Titanic model', 'Full interior sets'];

CREATE (TheGodfatherProduction:Production:GeneratedByClaudeAI {
    name: 'The Godfather Production',
    startDate: date('1971-03-29'),
    endDate: date('1971-08-07'),
    durationMonths: 4,
    durationDays: 9,
    startTime: localtime('07:00:00'),
    isCompleted: true,
    budgetPersonnel: 2500000,
    budgetEquipment: 1000000,
    budgetLocations: 1500000,
    budgetSets: 800000,
    budgetOther: 200000,
    weatherGood: 80,
    weatherAcceptable: 15,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'The Godfather Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '06:30:00', '07:00:00', '18:00:00']
SET p.scheduleDurations = [1.5, 0.5, 11, 1]
SET p.studioInterference = 'High'
SET p.castingDisputes = 'Multiple';

CREATE (TheDarkKnightProduction:Production:GeneratedByClaudeAI {
    name: 'The Dark Knight Production',
    startDate: date('2007-04-18'),
    endDate: date('2007-11-11'),
    durationMonths: 6,
    durationDays: 24,
    startTime: localtime('06:30:00'),
    isCompleted: true,
    budgetPersonnel: 60000000,
    budgetEquipment: 35000000,
    budgetLocations: 40000000,
    budgetVFX: 40000000,
    budgetOther: 10000000,
    weatherGood: 70,
    weatherAcceptable: 25,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'The Dark Knight Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'IMAX Setup', 'Wrap']
SET p.scheduleTimes = ['04:30:00', '06:00:00', '06:30:00', '12:30:00', '19:00:00']
SET p.scheduleDurations = [1.5, 0.5, 6, 6.5, 1]
SET p.citiesFilmed = ['Chicago', 'London', 'Hong Kong']
SET p.iMAXCameras = 6;

CREATE (PulpFictionProduction:Production:GeneratedByClaudeAI {
    name: 'Pulp Fiction Production',
    startDate: date('1993-09-20'),
    endDate: date('1993-11-30'),
    durationMonths: 2,
    durationDays: 10,
    startTime: localtime('07:00:00'),
    isCompleted: true,
    budgetPersonnel: 3000000,
    budgetEquipment: 1500000,
    budgetLocations: 1000000,
    budgetSets: 2000000,
    budgetOther: 500000,
    weatherGood: 90,
    weatherAcceptable: 8,
    weatherPoor: 2
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Pulp Fiction Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '06:30:00', '07:00:00', '19:00:00']
SET p.scheduleDurations = [1.5, 0.5, 12, 1]
SET p.independentFilming = true
SET p.filmingDays = 51;

CREATE (CrouchingTigerProduction:Production:GeneratedByClaudeAI {
    name: 'Crouching Tiger, Hidden Dragon Production',
    startDate: date('1999-04-15'),
    endDate: date('1999-09-17'),
    durationMonths: 5,
    durationDays: 2,
    startTime: localtime('05:30:00'),
    isCompleted: true,
    budgetPersonnel: 6000000,
    budgetEquipment: 3000000,
    budgetLocations: 3500000,
    budgetVFX: 3000000,
    budgetOther: 1500000,
    weatherGood: 60,
    weatherAcceptable: 30,
    weatherPoor: 10
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Crouching Tiger, Hidden Dragon Production'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Martial Arts Prep', 'Filming', 'Wrap']
SET p.scheduleTimes = ['03:30:00', '05:00:00', '05:30:00', '08:00:00', '19:00:00']
SET p.scheduleDurations = [1.5, 0.5, 2.5, 11, 1]
SET p.wireworkDays = 68
SET p.challengingLocations = ['Bamboo forest', 'Desert', 'Historic sites'];

// Add reviews
CREATE (TitanicReview:Review:GeneratedByClaudeAI {
    title: 'The Spectacle and Heart of Titanic',
    stars: 4.8,
    date: date('1997-12-22'),
    time: time('14:30:00-05:00'),
    isVerified: true,
    aspectDirection: 4.9,
    aspectActing: 4.7,
    aspectVisuals: 5.0,
    aspectMusic: 4.9,
    aspectEmotionalImpact: 4.8,
    reviewText: 'James Cameron\'s Titanic is a towering achievement that masterfully blends historical tragedy with intimate romance. The film\'s technical achievements are breathtaking, while DiCaprio and Winslet\'s performances ensure the human story remains captivating throughout the epic three-hour runtime.',
    upvotes: 24563
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'The Spectacle and Heart of Titanic'})
SET r.commentTimestamps = [datetime('1997-12-22T16:45:22-05:00'), datetime('1997-12-23T09:15:34-05:00'), datetime('1997-12-24T18:22:51-05:00')]
SET r.keywords = ['historical', 'romance', 'disaster', 'epic']
SET r.readerLocationsLat = [40.7128, 51.5074, 34.0522]
SET r.readerLocationsLong = [-74.0060, -0.1278, -118.2437];

CREATE (TheGodfatherReview:Review:GeneratedByClaudeAI {
    title: 'The Definitive American Crime Epic',
    stars: 5.0,
    date: date('1972-04-02'),
    time: time('11:30:00-05:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 5.0,
    aspectWriting: 5.0,
    aspectCinematography: 5.0,
    aspectMusicScore: 5.0,
    reviewText: 'Francis Ford Coppola\'s The Godfather is filmmaking at its most sublime, a perfect confluence of outstanding performances, rich storytelling, and visual artistry. Marlon Brando\'s Don Corleone and Al Pacino\'s Michael create an unforgettable dramatic arc as the film explores themes of family, power, and the American Dream through the lens of organized crime.',
    historicalRelevance: 'Genre-defining'
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'The Definitive American Crime Epic'})
SET r.culturalImpactAssessments = [date('1982-04-02'), date('2002-04-02'), date('2022-04-02')]
SET r.historicalSignificanceRatings = [9.5, 9.8, 9.9]
SET r.assessmentYears = [1982, 2002, 2022]
SET r.keywords = ['crime', 'family', 'power', 'masterpiece', 'italian-american']
SET r.academicCitations = 3842;

CREATE (TheDarkKnightReview:Review:GeneratedByClaudeAI {
    title: 'A Revolutionary Superhero Film',
    stars: 4.9,
    date: date('2008-07-21'),
    time: time('18:45:30-04:00'),
    isVerified: true,
    aspectDirection: 4.9,
    aspectActing: 5.0,
    aspectWriting: 4.8,
    aspectCinematography: 4.9,
    aspectScore: 4.8,
    reviewText: 'Christopher Nolan\'s The Dark Knight transcends its superhero origins to deliver a gripping crime thriller with psychological depth. Heath Ledger\'s anarchic, terrifying Joker redefines the concept of the cinematic villain, while the film explores complex ethical themes about heroism, sacrifice, and the thin line between order and chaos.',
    upvotes: 35784
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Revolutionary Superhero Film'})
SET r.commentTimestamps = [datetime('2008-07-21T20:15:48-04:00'), datetime('2008-07-22T09:32:14-04:00'), datetime('2008-07-23T15:45:29-04:00')]
SET r.keywords = ['superhero', 'crime-thriller', 'joker', 'ethical-dilemma', 'imax']
SET r.readerLocationsLat = [40.7128, 34.0522, 41.8781]
SET r.readerLocationsLong = [-74.0060, -118.2437, -87.6298];

CREATE (PulpFictionReview:Review:GeneratedByClaudeAI {
    title: 'Tarantino\'s Narrative Masterpiece',
    stars: 5.0,
    date: date('1994-10-18'),
    time: time('15:20:00-04:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 4.9,
    aspectWriting: 5.0,
    aspectStructure: 5.0,
    aspectDialogue: 5.0,
    reviewText: 'Pulp Fiction revolutionizes storytelling with its non-linear narrative and razor-sharp dialogue. Tarantino weaves together three interconnected crime stories with stylistic flair, creating moments both brutally violent and unexpectedly humorous. The ensemble cast delivers unforgettable performances in a film that permanently altered the landscape of independent cinema.',
    upvotes: 28935
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Tarantino\'s Narrative Masterpiece'})
SET r.commentTimestamps = [datetime('1994-10-18T17:45:22-04:00'), datetime('1994-10-19T10:15:34-04:00'), datetime('1994-10-20T14:22:51-04:00')]
SET r.keywords = ['non-linear', 'crime', 'dialogue', 'indie', 'pop-culture']
SET r.readerLocationsLat = [40.7128, 34.0522, 51.5074]
SET r.readerLocationsLong = [-74.0060, -118.2437, -0.1278];

CREATE (CrouchingTigerReview:Review:GeneratedByClaudeAI {
    title: 'A Graceful Blend of Action and Poetry',
    stars: 4.8,
    date: date('2000-12-15'),
    time: time('19:45:00-05:00'),
    isVerified: true,
    aspectDirection: 4.9,
    aspectActing: 4.8,
    aspectVisuals: 5.0,
    aspectMartialArts: 5.0,
    aspectEmotionalDepth: 4.7,
    reviewText: 'Ang Lee\'s Crouching Tiger, Hidden Dragon elevates martial arts cinema to high art. The breathtaking fight choreography functions as visual poetry, with gravity-defying wire work that feels like an extension of the characters\' emotions. Beyond the spectacular action, the film is a moving exploration of honor, forbidden love, and personal freedom against the backdrop of Qing Dynasty China.',
    upvotes: 18452
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Graceful Blend of Action and Poetry'})
SET r.commentTimestamps = [datetime('2000-12-15T21:12:33-05:00'), datetime('2000-12-16T10:45:22-05:00'), datetime('2000-12-17T14:36:51-05:00')]
SET r.keywords = ['martial-arts', 'wuxia', 'visual-poetry', 'honor', 'foreign-language']
SET r.readerLocationsLat = [40.7128, 34.0522, 37.7749]
SET r.readerLocationsLong = [-74.0060, -118.2437, -122.4194];

// Create relationships between nodes
MATCH 
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'}),
  (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (j)-[:DIRECTED {
    year: 1997,
    daysOnSet: 160,
    satisfaction: 4.8,
    awardNominations: 14,
    awardWins: 11,
    completionDate: date('1997-07-31'),
    premiereEvent: datetime('1997-12-14T19:30:00-05:00'),
    durationMonths: 7,
    budgetOverruns: true,
    scheduleOverruns: true
}]->(t);

MATCH 
  (f:Person:GeneratedByClaudeAI {name: 'Francis Ford Coppola'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (f)-[:DIRECTED {
    year: 1972,
    daysOnSet: 112,
    satisfaction: 4.7,
    awardNominations: 11,
    awardWins: 3,
    completionDate: date('1971-11-25'),
    premiereEvent: datetime('1972-03-14T20:00:00-05:00'),
    durationMonths: 4,
    studioFights: true,
    castingBattles: 'Significant'
}]->(g);

MATCH 
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (d:Movie:GeneratedByClaudeAI {title: 'The Dark Knight'})
CREATE (c)-[:DIRECTED {
    year: 2008,
    daysOnSet: 127,
    satisfaction: 4.9,
    awardNominations: 8,
    awardWins: 2,
    completionDate: date('2008-04-15'),
    premiereEvent: datetime('2008-07-14T19:00:00-04:00'),
    durationMonths: 6,
    iMAXUsage: 'Extensive',
    practicalEffectsPercentage: 70
}]->(d);

MATCH 
  (q:Person:GeneratedByClaudeAI {name: 'Quentin Tarantino'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Pulp Fiction'})
CREATE (q)-[:DIRECTED {
    year: 1994,
    daysOnSet: 51,
    satisfaction: 4.9,
    awardNominations: 7,
    awardWins: 1,
    completionDate: date('1994-01-30'),
    premiereEvent: datetime('1994-05-21T20:30:00+02:00'),
    durationMonths: 2,
    scriptToScreen: 'Nearly identical',
    nonLinearExperiment: true
}]->(p);

MATCH 
  (a:Person:GeneratedByClaudeAI {name: 'Ang Lee'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Crouching Tiger, Hidden Dragon'})
CREATE (a)-[:DIRECTED {
    year: 2000,
    daysOnSet: 135,
    satisfaction: 4.8,
    awardNominations: 10,
    awardWins: 4,
    completionDate: date('1999-12-25'),
    premiereEvent: datetime('2000-05-18T21:00:00+02:00'),
    durationMonths: 5,
    crossCulturalChallenges: true,
    actionChoreography: 'Revolutionary'
}]->(c);

// Actor to Movie relationships
MATCH
  (k:Person:GeneratedByClaudeAI {name: 'Kate Winslet'}),
  (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (k)-[:ACTED_IN {
    roles: ['Rose DeWitt Bukater'],
    salary: 2000000,
    screenTimeMinutes: 120,
    startDate: date('1996-07-31'),
    endDate: date('1997-03-23'),
    scheduleConflicts: false,
    criticScore: 94,
    audienceScore: 95,
    awardNominations: 2,
    awardWins: 0,
    underwaterScenes: 7
}]->(t);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Al Pacino'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (a)-[:ACTED_IN {
    roles: ['Michael Corleone'],
    salary: 35000,
    screenTimeMinutes: 95,
    startDate: date('1971-03-29'),
    endDate: date('1971-08-07'),
    scheduleConflicts: false,
    criticScore: 98,
    audienceScore: 97,
    awardNominations: 1,
    awardWins: 0,
    studioOpposition: true
}]->(g);

MATCH
  (h:Person:GeneratedByClaudeAI {name: 'Heath Ledger'}),
  (d:Movie:GeneratedByClaudeAI {title: 'The Dark Knight'})
CREATE (h)-[:ACTED_IN {
    roles: ['Joker'],
    salary: 5000000,
    screenTimeMinutes: 33,
    startDate: date('2007-04-18'),
    endDate: date('2007-08-25'),
    scheduleConflicts: false,
    criticScore: 99,
    audienceScore: 98,
    awardNominations: 10,
    awardWins: 8,
    characterImmersion: 'Extreme'
}]->(d);

MATCH
  (u:Person:GeneratedByClaudeAI {name: 'Uma Thurman'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Pulp Fiction'})
CREATE (u)-[:ACTED_IN {
    roles: ['Mia Wallace'],
    salary: 500000,
    screenTimeMinutes: 28,
    startDate: date('1993-09-20'),
    endDate: date('1993-10-15'),
    scheduleConflicts: false,
    criticScore: 96,
    audienceScore: 95,
    awardNominations: 1,
    awardWins: 0,
    iconicScenes: ['Twist contest', 'Adrenaline shot']
}]->(p);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Michelle Yeoh'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Crouching Tiger, Hidden Dragon'})
CREATE (m)-[:ACTED_IN {
    roles: ['Yu Shu Lien'],
    salary: 1000000,
    screenTimeMinutes: 95,
    startDate: date('1999-04-15'),
    endDate: date('1999-09-17'),
    scheduleConflicts: false,
    criticScore: 97,
    audienceScore: 94,
    awardNominations: 5,
    awardWins: 2,
    martialArtsPerformed: true,
    stuntPercentage: 90
}]->(c);

// Studio relationships
MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'}),
  (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (p)-[:PRODUCED {
    investment: 100000000,
    return: 1097585239,
    roi: 10.98,
    contractSigned: date('1995-12-15'),
    studioShare: 0.5,
    directorShare: 0.25,
    producerShare: 0.15,
    topCastShare: 0.1,
    marketingBudget: 50000000,
    isProfitable: true,
    marketingStart: datetime('1997-06-15T00:00:00Z'),
    coProduction: 'Fox'
}]->(t);

MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (p)-[:PRODUCED {
    investment: 6000000,
    return: 245066411,
    roi: 40.84,
    contractSigned: date('1970-09-15'),
    studioShare: 0.7,
    directorShare: 0.1,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 1000000,
    isProfitable: true,
    marketingStart: datetime('1972-01-15T00:00:00Z'),
    executiveOpposition: true
}]->(g);

MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (d:Movie:GeneratedByClaudeAI {title: 'The Dark Knight'})
CREATE (w)-[:PRODUCED {
    investment: 185000000,
    return: 1003045358,
    roi: 5.42,
    contractSigned: date('2006-08-22'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 100000000,
    isProfitable: true,
    marketingStart: datetime('2007-12-15T00:00:00Z'),
    franchiseEntry: 2
}]->(d);

MATCH
  (m:Studio:GeneratedByClaudeAI {name: 'Miramax Films'}),
  (p:Movie:GeneratedByClaudeAI {title: 'Pulp Fiction'})
CREATE (m)-[:PRODUCED {
    investment: 8000000,
    return: 213928762,
    roi: 26.74,
    contractSigned: date('1993-04-15'),
    studioShare: 0.6,
    directorShare: 0.2,
    producerShare: 0.1,
    topCastShare: 0.1,
    marketingBudget: 10000000,
    isProfitable: true,
    marketingStart: datetime('1994-05-30T00:00:00Z'),
    festivalStrategy: 'Cannes premiere'
}]->(p);

MATCH
  (s:Studio:GeneratedByClaudeAI {name: 'Sony Pictures Entertainment'}),
  (c:Movie:GeneratedByClaudeAI {title: 'Crouching Tiger, Hidden Dragon'})
CREATE (s)-[:PRODUCED {
    investment: 17000000,
    return: 213525736,
    roi: 12.56,
    contractSigned: date('1998-08-15'),
    studioShare: 0.55,
    directorShare: 0.15,
    producerShare: 0.15,
    topCastShare: 0.15,
    marketingBudget: 15000000,
    isProfitable: true,
    marketingStart: datetime('2000-09-15T00:00:00Z'),
    internationalFocus: true
}]->(c);

// Studio to filming relationship
MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'}),
  (t:Production:GeneratedByClaudeAI {name: 'Titanic Production'})
CREATE (p)-[:FINANCED {
    contractDate: date('1995-12-15'),
    amount: 100000000,
    isFullyPaid: true,
    transferTime1: datetime('1996-01-15T00:00:00Z'),
    transferTime2: datetime('1996-06-15T00:00:00Z'),
    transferTime3: datetime('1996-12-15T00:00:00Z'),
    paymentDate1: date('1996-01-15'),
    paymentAmount1: 30000000,
    paymentDate2: date('1996-06-15'),
    paymentAmount2: 40000000,
    paymentDate3: date('1996-12-15'),
    paymentAmount3: 30000000,
    costOverrunConcerns: 'Significant'
}]->(t);

MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures'}),
  (g:Production:GeneratedByClaudeAI {name: 'The Godfather Production'})
CREATE (p)-[:FINANCED {
    contractDate: date('1970-09-15'),
    amount: 6000000,
    isFullyPaid: true,
    transferTime1: datetime('1970-12-01T00:00:00Z'),
    transferTime2: datetime('1971-03-01T00:00:00Z'),
    paymentDate1: date('1970-12-01'),
    paymentAmount1: 3000000,
    paymentDate2: date('1971-03-01'),
    paymentAmount2: 3000000,
    budgetControl: 'Strict',
    producerOversight: 'Heavy'
}]->(g);

MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (d:Production:GeneratedByClaudeAI {name: 'The Dark Knight Production'})
CREATE (w)-[:FINANCED {
    contractDate: date('2006-08-22'),
    amount: 185000000,
    isFullyPaid: true,
    transferTime1: datetime('2007-01-15T00:00:00Z'),
    transferTime2: datetime('2007-04-15T00:00:00Z'),
    transferTime3: datetime('2007-07-15T00:00:00Z'),
    paymentDate1: date('2007-01-15'),
    paymentAmount1: 60000000,
    paymentDate2: date('2007-04-15'),
    paymentAmount2: 70000000,
    paymentDate3: date('2007-07-15'),
    paymentAmount3: 55000000,
    tentpoleStatus: true
}]->(d);

MATCH
  (m:Studio:GeneratedByClaudeAI {name: 'Miramax Films'}),
  (p:Production:GeneratedByClaudeAI {name: 'Pulp Fiction Production'})
CREATE (m)-[:FINANCED {
    contractDate: date('1993-04-15'),
    amount: 8000000,
    isFullyPaid: true,
    transferTime1: datetime('1993-07-01T00:00:00Z'),
    transferTime2: datetime('1993-09-01T00:00:00Z'),
    paymentDate1: date('1993-07-01'),
    paymentAmount1: 4000000,
    paymentDate2: date('1993-09-01'),
    paymentAmount2: 4000000,
    independentBudgeting: true,
    tightControls: true
}]->(p);

// Filming to movie relationship
MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Titanic Production'}),
  (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 7,
    durationDays: 23,
    locationCount: 5,
    setCount: 35,
    dailyAverageCost: 450000,
    scheduleAdherence: 0.75,
    weatherDelaysDays: 15,
    originalScheduledEnd: date('1997-01-15'),
    budgetOverrun: 0.3,
    scheduleOverrun: 0.4
}]->(t);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'The Godfather Production'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 4,
    durationDays: 9,
    locationCount: 12,
    setCount: 24,
    dailyAverageCost: 45000,
    scheduleAdherence: 0.85,
    weatherDelaysDays: 6,
    originalScheduledEnd: date('1971-07-20'),
    castingDisputes: 'Major',
    studioInterference: 'Significant'
}]->(g);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'The Dark Knight Production'}),
  (d:Movie:GeneratedByClaudeAI {title: 'The Dark Knight'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 6,
    durationDays: 24,
    locationCount: 10,
    setCount: 28,
    dailyAverageCost: 430000,
    scheduleAdherence: 0.9,
    weatherDelaysDays: 12,
    originalScheduledEnd: date('2007-10-30'),
    iMAXPercentage: 28,
    practicalEffects: 'Extensive'
}]->(d);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Pulp Fiction Production'}),
  (pf:Movie:GeneratedByClaudeAI {title: 'Pulp Fiction'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 2,
    durationDays: 10,
    locationCount: 25,
    setCount: 18,
    dailyAverageCost: 75000,
    scheduleAdherence: 0.95,
    weatherDelaysDays: 3,
    originalScheduledEnd: date('1993-11-25'),
    castChemistry: 'Exceptional',
    improvisationLevel: 'Moderate'
}]->(pf);

// Award relationships
MATCH
  (t:Movie:GeneratedByClaudeAI {title: 'Titanic'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (t)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 1998,
    ceremony: 70,
    isWinner: true,
    ceremonyDate: date('1998-03-23'),
    announcementTime: localtime('21:45:00'),
    votesFor: 4862,
    votesAgainst: 2153,
    totalOscars: 11,
    recordTying: true
}]->(a);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (j)-[:NOMINATED_FOR {
    category: 'Best Director',
    year: 1998,
    ceremony: 70,
    isWinner: true,
    ceremonyDate: date('1998-03-23'),
    announcementTime: localtime('21:15:00'),
    votesFor: 4715,
    votesAgainst: 2300,
    speechDuration: duration({minutes: 2, seconds: 45}),
    speechMemorable: true,
    quotedLine: 'I\'m the king of the world!'
}]->(a);

MATCH
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (g)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 1973,
    ceremony: 45,
    isWinner: true,
    ceremonyDate: date('1973-03-27'),
    announcementTime: localtime('21:45:00'),
    votesFor: 3982,
    votesAgainst: 1573,
    controversies: 'Marlon Brando boycott',
    culturalImpact: 'Groundbreaking'
}]->(a);

MATCH
  (h:Person:GeneratedByClaudeAI {name: 'Heath Ledger'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (h)-[:NOMINATED_FOR {
    category: 'Best Supporting Actor',
    year: 2009,
    ceremony: 81,
    isWinner: true,
    ceremonyDate: date('2009-02-22'),
    announcementTime: localtime('20:45:00'),
    votesFor: 5823,
    votesAgainst: 842,
    posthumousAward: true,
    acceptedBy: 'Family',
    emotionalImpact: 'Significant'
}]->(a);

MATCH
  (p:Movie:GeneratedByClaudeAI {title: 'Pulp Fiction'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (p)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 1995,
    ceremony: 67,
    isWinner: false,
    ceremonyDate: date('1995-03-27'),
    announcementTime: localtime('21:45:00'),
    votesFor: 3254,
    votesAgainst: 3645,
    competitionWinner: 'Forrest Gump',
    indieBreakthrough: true
}]->(a);

MATCH
  (q:Person:GeneratedByClaudeAI {name: 'Quentin Tarantino'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (q)-[:NOMINATED_FOR {
    category: 'Best Original Screenplay',
    year: 1995,
    ceremony: 67,
    isWinner: true,
    ceremonyDate: date('1995-03-27'),
    announcementTime: localtime('20:15:00'),
    votesFor: 4215,
    votesAgainst: 2682,
    speechDuration: duration({minutes: 1, seconds: 50}),
    independentCelebration: true
}]->(a);

MATCH
  (c:Movie:GeneratedByClaudeAI {title: 'Crouching Tiger, Hidden Dragon'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (c)-[:NOMINATED_FOR {
    category: 'Best Foreign Language Film',
    year: 2001,
    ceremony: 73,
    isWinner: true,
    ceremonyDate: date('2001-03-25'),
    announcementTime: localtime('20:30:00'),
    votesFor: 4561,
    votesAgainst: 1823,
    broadestRecognition: 'Foreign language film',
    additionalNominations: 9
}]->(a);

// Professional relationships between people
MATCH
  (j:Person:GeneratedByClaudeAI {name: 'James Cameron'}),
  (k:Person:GeneratedByClaudeAI {name: 'Kate Winslet'})
CREATE (j)-[:DIRECTED_ACTOR {
    films: 1,
    firstFilm: 'Titanic',
    firstYear: 1997,
    chemistry: 4.2,
    conflicts: 'Notable',
    intensityLevel: 'Very high',
    futurePlans: 'None stated',
    reconciliation: true
}]->(k);

MATCH
  (f:Person:GeneratedByClaudeAI {name: 'Francis Ford Coppola'}),
  (a:Person:GeneratedByClaudeAI {name: 'Al Pacino'})
CREATE (f)-[:DIRECTED_ACTOR {
    films: 3,
    firstFilm: 'The Godfather',
    firstYear: 1972,
    chemistry: 4.9,
    conflicts: 'Minimal',
    intensityLevel: 'High',
    collaborationQuotes: 'Career defining',
    artisticPartnership: 'Legendary'
}]->(a);

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (h:Person:GeneratedByClaudeAI {name: 'Heath Ledger'})
CREATE (c)-[:DIRECTED_ACTOR {
    films: 1,
    firstFilm: 'The Dark Knight',
    firstYear: 2008,
    chemistry: 5.0,
    conflicts: 'None',
    intensityLevel: 'Very high',
    characterCreation: 'Collaborative',
    characterOwnership: 'Actor-driven',
    respectLevel: 'Profound'
}]->(h);

MATCH
  (q:Person:GeneratedByClaudeAI {name: 'Quentin Tarantino'}),
  (u:Person:GeneratedByClaudeAI {name: 'Uma Thurman'})
CREATE (q)-[:DIRECTED_ACTOR {
    films: 3,
    firstFilm: 'Pulp Fiction',
    firstYear: 1994,
    chemistry: 4.9,
    conflicts: 'Later projects',
    intensityLevel: 'Very high',
    museCategorization: true,
    collaborationLongevity: 'Multi-decade',
    inspirationLevel: 'Significant'
}]->(u);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Ang Lee'}),
  (m:Person:GeneratedByClaudeAI {name: 'Michelle Yeoh'})
CREATE (a)-[:DIRECTED_ACTOR {
    films: 1,
    firstFilm: 'Crouching Tiger, Hidden Dragon',
    firstYear: 2000,
    chemistry: 4.8,
    conflicts: 'None',
    intensityLevel: 'Moderate',
    languageBarrier: 'Minimal',
    physicalDemands: 'Extreme',
    mutualRespect: 'Very high'
}]->(m);

// Create soundtracks
CREATE (TitanicSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'Titanic: Music from the Motion Picture',
    composer: 'James Horner',
    released: date('1997-11-18'),
    duration: duration({minutes: 72, seconds: 38}),
    trackCount: 15,
    recordingStudio: 'Air Lyndhurst Studios',
    recordingStudioLat: 51.5689,
    recordingStudioLong: -0.1781,
    peakChartPosition: 1,
    weeksAtNumberOne: 16,
    salesUnits: 30000000,
    streamingCount: 320000000
})
WITH 1 as dummy
MATCH (t:Movie:GeneratedByClaudeAI {title: 'Titanic'}),
      (s:Soundtrack:GeneratedByClaudeAI {title: 'Titanic: Music from the Motion Picture'})
CREATE (s)-[:COMPOSED_FOR {
    contractDate: date('1996-05-15'),
    completion: date('1997-08-25'),
    nominatedAwards: ['Academy Award', 'Golden Globe', 'Grammy Award'],
    wonAwards: ['Academy Award', 'Golden Globe', 'Grammy Award'],
    diamondCertification: true,
    iconicSongs: ['My Heart Will Go On'],
    vocalistFeatured: 'Celine Dion',
    orchestraSize: 85,
    recordingDays: 25
}]->(t);

CREATE (TheGodfatherSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'The Godfather: Music from the Original Motion Picture Soundtrack',
    composer: 'Nino Rota',
    released: date('1972-03-07'),
    duration: duration({minutes: 31, seconds: 24}),
    trackCount: 11,
    recordingStudio: 'Paramount Studios',
    recordingStudioLat: 34.0841,
    recordingStudioLong: -118.3213,
    peakChartPosition: 45,
    salesUnits: 500000,
    streamingCount: 150000000,
    culturalInfluence: 'Definitive'
})
WITH 1 as dummy
MATCH (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'}),
      (s:Soundtrack:GeneratedByClaudeAI {title: 'The Godfather: Music from the Original Motion Picture Soundtrack'})
CREATE (s)-[:COMPOSED_FOR {
    contractDate: date('1971-02-15'),
    completion: date('1971-11-10'),
    nominatedAwards: ['Academy Award', 'Grammy Award'],
    wonAwards: [],
    disqualificationReason: 'Previous usage',
    iconicThemes: ['Love Theme', 'The Godfather Waltz'],
    culturalResonance: 'Immediate and lasting',
    ethnicInfluences: 'Sicilian folk music',
    orchestraSize: 65
}]->(g);

// Create filming locations
CREATE (MexicoLocation:FilmingLocation:GeneratedByClaudeAI {
    name: 'Baja Studios',
    country: 'Mexico',
    region: 'Baja California',
    latitude: 32.3662,
    longitude: -117.0723,
    elevation: 10,
    elevationUnit: 'm',
    climate: 'Mediterranean',
    permitCost: 15000000,
    permitCurrency: 'USD',
    firstUsed: date('1996-07-31'),
    lastUsed: date('1997-03-23'),
    purpose: 'Water tank filming'
})
WITH 1 as dummy
MATCH (t:Movie:GeneratedByClaudeAI {title: 'Titanic'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Baja Studios'})
CREATE (t)-[:FILMED_AT {
    startDate: date('1996-07-31'),
    endDate: date('1997-03-23'),
    sceneCount: 95,
    totalDays: 160,
    weatherDelayDays: 15,
    crewSize: 850,
    logisticsCost: 25000000,
    accommodationCost: 15000000,
    setConstruction: 'Full-size ship sections',
    waterTankGallons: 17000000,
    specialRequirements: 'Gimbal systems for sinking sequences'
}]->(l);

CREATE (ChicagoLocation:FilmingLocation:GeneratedByClaudeAI {
    name: 'Chicago',
    country: 'USA',
    region: 'Illinois',
    latitude: 41.8781,
    longitude: -87.6298,
    elevation: 182,
    elevationUnit: 'm',
    climate: 'Continental',
    permitCost: 8000000,
    permitCurrency: 'USD',
    firstUsed: date('2007-04-18'),
    lastUsed: date('2007-08-24'),
    buildingAccess: 'Multiple skyscrapers'
})
WITH 1 as dummy
MATCH (d:Movie:GeneratedByClaudeAI {title: 'The Dark Knight'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Chicago'})
CREATE (d)-[:FILMED_AT {
    startDate: date('2007-04-18'),
    endDate: date('2007-08-24'),
    sceneCount: 75,
    totalDays: 95,
    weatherDelayDays: 8,
    crewSize: 450,
    logisticsCost: 15000000,
    accommodationCost: 8000000,
    characterPresent: ['Batman', 'Joker', 'Harvey Dent'],
    buildingsUsed: ['Sears Tower', 'Trump Tower', 'Board of Trade'],
    streetClosures: 42,
    helicopterShots: 28
}]->(l);

// Create costume designers
CREATE (JanetPatterson:Person:GeneratedByClaudeAI {
    name: 'Janet Patterson',
    born: 1956,
    died: 2016,
    birthdate: date('1956-06-27'),
    deathdate: date('2016-10-21'),
    nationality: 'Australian',
    oscarNominations: 4,
    isActive: false,
    firstFilm: datetime('1986-06-15T00:00:00Z'),
    lastFilm: datetime('2015-11-22T00:00:00Z'),
    careerLength: duration({years: 29}),
    specialization: 'Period Costume Design'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Janet Patterson'}),
      (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (p)-[:DESIGNED_COSTUMES_FOR {
    year: 1997,
    costumesCreated: 1250,
    budget: 8500000,
    awardNominations: 1,
    awardWins: 1,
    startDate: date('1995-11-15'),
    completionDate: date('1996-07-15'),
    specialCostumes: ['Rose\'s boarding suit', 'Rose\'s evening gown', 'Flying dress'],
    researchHours: 850,
    historicalAccuracy: 'Very high',
    costumesSubmerged: 450
}]->(t);

CREATE (LindiHemming:Person:GeneratedByClaudeAI {
    name: 'Lindy Hemming',
    born: 1948,
    birthdate: date('1948-05-21'),
    nationality: 'British',
    oscarWins: 1,
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('1985-06-15T00:00:00Z'),
    careerLength: duration({years: 38}),
    specialization: 'Character-driven Costume Design'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Lindy Hemming'}),
      (d:Movie:GeneratedByClaudeAI {title: 'The Dark Knight'})
CREATE (p)-[:DESIGNED_COSTUMES_FOR {
    year: 2008,
    costumesCreated: 650,
    budget: 6500000,
    awardNominations: 3,
    awardWins: 1,
    startDate: date('2006-12-15'),
    completionDate: date('2007-04-05'),
    specialCostumes: ['Batsuit', 'Joker costume', 'Two-Face makeup'],
    researchHours: 450,
    characterEmphasis: 'Psychological aspects',
    functionalDesign: true,
    batSuitIterations: 15
}]->(d);

// Create cinematographer relationships
CREATE (RussellCarpenter:Person:GeneratedByClaudeAI {
    name: 'Russell Carpenter',
    born: 1950,
    birthdate: date('1950-12-09'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 1,
    isActive: true,
    firstFilm: datetime('1983-05-15T00:00:00Z'),
    visualStyle: 'Cinematic grandeur with intimate moments',
    cameraPreference: 'Panavision',
    collaborations: 3
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Russell Carpenter'}),
      (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (p)-[:CINEMATOGRAPHY_FOR {
    year: 1997,
    cameras: ['Panavision Panaflex Platinum', 'Panavision Panaflex Gold'],
    lenses: ['Panavision Primo', 'Panavision Super High Speed'],
    awardNominations: 5,
    awardWins: 1,
    startDate: date('1996-07-31'),
    completionDate: date('1997-03-23'),
    signature_shots: ['Bow flying scene', 'Grand staircase', 'Underwater corridors'],
    lighting_setups: 485,
    underwaterChallenges: true,
    epochalCinematography: true
}]->(t);

CREATE (GordonWillis:Person:GeneratedByClaudeAI {
    name: 'Gordon Willis',
    born: 1931,
    died: 2014,
    birthdate: date('1931-05-28'),
    deathdate: date('2014-05-18'),
    nationality: 'American',
    oscarNominations: 2,
    oscarHonoraryAward: true,
    isActive: false,
    firstFilm: datetime('1970-01-18T00:00:00Z'),
    lastFilm: datetime('1997-09-16T00:00:00Z'),
    careerLength: duration({years: 27}),
    visualStyle: 'Chiaroscuro lighting with deep shadows',
    nickname: 'Prince of Darkness'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Gordon Willis'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (p)-[:CINEMATOGRAPHY_FOR {
    year: 1972,
    cameras: ['Arriflex 35BL', 'Mitchell BNCR'],
    lenses: ['Cooke Speed Panchro', 'Angenieux Zoom'],
    awardNominations: 0,
    awardWins: 0,
    startDate: date('1971-03-29'),
    completionDate: date('1971-08-07'),
    signature_shots: ['Brando in shadow', 'Wedding sequence', 'Restaurant shooting'],
    lighting_setups: 215,
    colorScheme: 'Amber and shadows',
    innovationLevel: 'Revolutionary',
    academicStudies: 850
}]->(g);

// Create fan community for blockbuster
CREATE (TitanicFandom:FanCommunity:GeneratedByClaudeAI {
    name: 'Titanic Fan Community',
    established: date('1998-02-15'),
    memberCount: 1250000,
    onlinePlatforms: 18,
    annualEvents: 12,
    largestEventAttendance: 15000,
    contentCreators: 35000,
    fanfictionCount: 85000,
    fanArtCount: 150000,
    academicPapers: 350
})
WITH 1 as dummy
MATCH (f:FanCommunity:GeneratedByClaudeAI {name: 'Titanic Fan Community'}),
      (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (f)-[:ENGAGED_WITH {
    anniversaryCelebrations: 25,
    commemorationEvents: ['Ship sinking date', 'Film release date'],
    romanticFocus: 0.7,
    historicalFocus: 0.3,
    debateTopics: ['Door Size Controversy', 'Historical Accuracy', 'Alternate Endings'],
    fanTheories: 235,
    museumExhibits: 35,
    shipwreckExpeditions: 12,
    merchandiseSales: 450000000,
    digitalPlatformRevival: 'Significant'
}]->(t);

// Create TDK Joker Costume
CREATE (JokerCostume:Prop:GeneratedByClaudeAI {
    name: 'The Dark Knight Joker Costume',
    movie: 'The Dark Knight',
    material: 'Mixed textiles, custom dyes',
    weight: 5.4,
    weightUnit: 'kg',
    createdDate: date('2007-03-15'),
    screenTime: duration({minutes: 33, seconds: 0}),
    isIconic: true,
    auctionValue: 5000000,
    copiesMade: 8
})
WITH 1 as dummy
MATCH (d:Movie:GeneratedByClaudeAI {title: 'Dark Knight'}),
      (p:Prop:GeneratedByClaudeAI {name: 'The Dark Knight Joker Costume'})
CREATE (p)-[:USED_IN {
    scenes: ['Bank robbery', 'Interrogation room', 'Hospital explosion'],
    sceneCount: 15,
    firstAppearance: time('00:04:22'),
    lastAppearance: time('02:12:15'),
    isCloseup: true,
    significance: 'Character defining',
    historicalImpact: 'Reinvented character visually',
    costumeElements: ['Purple coat', 'Green vest', 'Hexagonal pattern shirt', 'Makeup'],
    weatheringTechniques: ['Acid washing', 'Sandpaper distressing', 'Oil staining'],
    psychologicalImportance: 'Visual manifestation of chaos'
}]->(d);

// Create educational institution
CREATE (FilmSchool:Institution:GeneratedByClaudeAI {
    name: 'American Film Institute',
    founded: date('1967-06-05'),
    headquartersLat: 34.1184,
    headquartersLong: -118.3004,
    studentCount: 650,
    facultyCount: 120,
    courseCount: 85,
    filmArchiveSize: 60000,
    digitalArchiveSize: 45000,
    digitalArchiveUnit: 'TB',
    annualBudget: 65000000
})
WITH 1 as dummy
MATCH (i:Institution:GeneratedByClaudeAI {name: 'American Film Institute'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (i)-[:TEACHES_WITH {
    yearAdded: 1973,
    coursesUsedIn: 35,
    primaryFocus: ['Direction technique', 'Screenplay structure', 'Character development', 'Cinematography technique'],
    studentPapersCount: 25850,
    mostCommonAnalysisTopics: ['Visual storytelling', 'Character transformation', 'Thematic elements', 'Shadow and light'],
    teachingHoursAnnually: 820,
    requiredForDegrees: ['MFA Directing', 'MFA Cinematography', 'MFA Screenwriting'],
    teachingValue: 9.9,
    preservationEfforts: 'Significant',
    restorationPartnership: true
}]->(g);

// Create cultural movement for Pulp Fiction
CREATE (Independent90sCinema:CulturalMovement:GeneratedByClaudeAI {
    name: '1990s Independent Cinema',
    established: date('1989-01-15'),
    influentialDirectors: 25,
    internationalFestivals: 45,
    majorAwards: 85,
    criticalReception: 'Revolutionary',
    geographicalSpread: 'Global',
    periodStart: date('1989-01-15'),
    periodPeak: date('1994-10-14'),
    academicStudies: 350
})
WITH 1 as dummy
MATCH (c:CulturalMovement:GeneratedByClaudeAI {name: '1990s Independent Cinema'}),
      (p:Movie:GeneratedByClaudeAI {title: 'Pulp Fiction'})
CREATE (c)-[:DEFINED_BY {
    significanceRating: 9.8,
    globalImpact: 'Transformative',
    boxOfficeMultiplierEffect: 4.5,
    independentFilmIncrease: 0.85,
    subsequentDistributionDeals: 145,
    academicAnalyses: 525,
    filmSchoolAdoption: 'Immediate and canonical',
    newFilmmakersInspired: 'Generation defining',
    narrativeExperimentation: 'Widespread adoption',
    dialogueRevolution: 'Industry-changing',
    genreSubversionTechniques: 'Widely adopted'
}]->(p);

// Create merchandising relationship
CREATE (TitanicMerchandise:Merchandise:GeneratedByClaudeAI {
    name: 'Heart of the Ocean Necklace Replica',
    released: date('1998-01-10'),
    manufacturer: 'J. Peterman Company',
    manufacturerLocationLat: 38.0406,
    manufacturerLocationLong: -84.5037,
    retailPrice: 198.00,
    priceCurrency: 'USD',
    productionRun: 500000,
    materialQuality: 'Mixed',
    limitedEdition: false,
    marketingTagline: 'Inspired by the film that captured the world\'s heart',
    collectorValue: 'Moderate'
})
WITH 1 as dummy
MATCH (m:Merchandise:GeneratedByClaudeAI {name: 'Heart of the Ocean Necklace Replica'}),
      (t:Movie:GeneratedByClaudeAI {title: 'Titanic'})
CREATE (m)-[:DERIVED_FROM {
    licensingDeal: date('1997-10-15'),
    unitsSold: 385000,
    geographicalDistribution: ['North America', 'Europe', 'Asia', 'Australia', 'South America'],
    salesDistribution: [0.55, 0.25, 0.10, 0.05, 0.05],
    retailersCarrying: 18500,
    valentinesPeaks: 5,
    anniversarySalesBumps: 3,
    brandRecognition: 0.85,
    merchandisingLongevity: '25+ years, still available',
    collectibleStatus: 'Moderate',
    reissueVersions: 3
}]->(t);