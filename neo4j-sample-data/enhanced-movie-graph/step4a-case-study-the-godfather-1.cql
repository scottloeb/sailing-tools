// Add key cast members from The Godfather
CREATE (MarlonBrando:Person:GeneratedByClaudeAI {
    name: 'Marlon Brando',
    born: 1924,
    died: 2004,
    birthdate: date('1924-04-03'),
    deathdate: date('2004-07-01'),
    nationality: 'American',
    oscarWins: 2,
    oscarNominations: 8,
    isActive: false,
    firstFilm: datetime('1950-09-29T00:00:00Z'),
    lastFilm: datetime('2001-09-07T00:00:00Z'),
    careerLength: duration({years: 51}),
    heightInMeters: 1.75,
    methodActingPioneer: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Marlon Brando'})
SET p.languages = ['English', 'French']
SET p.filmography_titles = ['The Godfather', 'On the Waterfront', 'Apocalypse Now']
SET p.filmography_years = [1972, 1954, 1979]
SET p.filmography_roles = ['Vito Corleone', 'Terry Malloy', 'Colonel Walter E. Kurtz']
SET p.actingInfluence = 'Revolutionary';

CREATE (JamesCaan:Person:GeneratedByClaudeAI {
    name: 'James Caan',
    born: 1940,
    died: 2022,
    birthdate: date('1940-03-26'),
    deathdate: date('2022-07-06'),
    nationality: 'American',
    oscarNominations: 1,
    isActive: false,
    firstFilm: datetime('1963-09-15T00:00:00Z'),
    lastFilm: datetime('2021-10-01T00:00:00Z'),
    careerLength: duration({years: 58}),
    heightInMeters: 1.76,
    athleticBackground: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'James Caan'})
SET p.languages = ['English']
SET p.filmography_titles = ['The Godfather', 'Misery', 'Elf']
SET p.filmography_years = [1972, 1990, 2003]
SET p.filmography_roles = ['Santino "Sonny" Corleone', 'Paul Sheldon', 'Walter Hobbs']
SET p.sportsPassions = ['Martial arts', 'Boxing', 'Baseball'];

CREATE (RobertDuvall:Person:GeneratedByClaudeAI {
    name: 'Robert Duvall',
    born: 1931,
    birthdate: date('1931-01-05'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 7,
    isActive: true,
    firstFilm: datetime('1962-04-28T00:00:00Z'),
    heightInMeters: 1.74,
    netWorth: 70000000,
    militaryService: 'United States Army'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Robert Duvall'})
SET p.languages = ['English', 'Spanish']
SET p.filmography_titles = ['The Godfather', 'Apocalypse Now', 'Tender Mercies']
SET p.filmography_years = [1972, 1979, 1983]
SET p.filmography_roles = ['Tom Hagen', 'Lieutenant Colonel Bill Kilgore', 'Mac Sledge']
SET p.directorCredits = 4;

CREATE (DianeKeaton:Person:GeneratedByClaudeAI {
    name: 'Diane Keaton',
    born: 1946,
    birthdate: date('1946-01-05'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 4,
    isActive: true,
    firstFilm: datetime('1970-05-27T00:00:00Z'),
    heightInMeters: 1.69,
    netWorth: 100000000,
    photographyExhibits: 2
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Diane Keaton'})
SET p.languages = ['English']
SET p.filmography_titles = ['The Godfather', 'Annie Hall', 'Something\'s Gotta Give']
SET p.filmography_years = [1972, 1977, 2003]
SET p.filmography_roles = ['Kay Adams', 'Annie Hall', 'Erica Barry']
SET p.bookAuthor = true;

// Connect cast members to The Godfather
MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Marlon Brando'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (m)-[:ACTED_IN {
    roles: ['Don Vito Corleone'],
    salary: 50000,
    bonuses: 'Percentage of gross',
    screenTimeMinutes: 45,
    startDate: date('1971-03-29'),
    endDate: date('1971-05-15'),
    scheduleConflicts: true,
    criticScore: 100,
    audienceScore: 98,
    awardNominations: 5,
    awardWins: 2,
    makeupHoursDaily: 3,
    improvisationLevel: 'Significant',
    methodPreparation: 'Extensive character backstory'
}]->(g);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'James Caan'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (j)-[:ACTED_IN {
    roles: ['Santino "Sonny" Corleone'],
    salary: 35000,
    screenTimeMinutes: 32,
    startDate: date('1971-03-29'),
    endDate: date('1971-06-25'),
    scheduleConflicts: false,
    criticScore: 95,
    audienceScore: 96,
    awardNominations: 1,
    awardWins: 0,
    intensityLevel: 'Very high',
    physicalPreparation: 'Combat training',
    improvisation: 'Wedding scene fight'
}]->(g);

MATCH
  (r:Person:GeneratedByClaudeAI {name: 'Robert Duvall'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (r)-[:ACTED_IN {
    roles: ['Tom Hagen'],
    salary: 36000,
    screenTimeMinutes: 30,
    startDate: date('1971-03-29'),
    endDate: date('1971-07-10'),
    scheduleConflicts: false,
    criticScore: 96,
    audienceScore: 95,
    legalResearch: 'Consulted with attorneys',
    characterSubtlety: 'Highest level',
    loyaltyPortrayal: 'Central to character'
}]->(g);

MATCH
  (d:Person:GeneratedByClaudeAI {name: 'Diane Keaton'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (d)-[:ACTED_IN {
    roles: ['Kay Adams'],
    salary: 25000,
    screenTimeMinutes: 18,
    startDate: date('1971-03-29'),
    endDate: date('1971-06-15'),
    scheduleConflicts: false,
    criticScore: 92,
    audienceScore: 90,
    outsiderPerspective: 'Audience surrogate',
    characterArc: 'Disillusionment',
    sequelDevelopment: 'Substantial'
}]->(g);

// Add screenplay writers
CREATE (MarioPuzo:Person:GeneratedByClaudeAI {
    name: 'Mario Puzo',
    born: 1920,
    died: 1999,
    birthdate: date('1920-10-15'),
    deathdate: date('1999-07-02'),
    nationality: 'American',
    oscarWins: 2,
    oscarNominations: 3,
    isActive: false,
    firstNovel: datetime('1955-01-15T00:00:00Z'),
    lastNovel: datetime('1996-09-01T00:00:00Z'),
    careerLength: duration({years: 45}),
    novelistFirst: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Mario Puzo'})
SET p.languages = ['English', 'Italian']
SET p.book_titles = ['The Godfather', 'The Sicilian', 'The Last Don']
SET p.book_years = [1969, 1984, 1996]
SET p.screenplay_credits = ['The Godfather', 'The Godfather Part II', 'Superman']
SET p.mafia_knowledge = 'Research-based, not personal experience';

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Mario Puzo'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (m)-[:WROTE {
    year: 1972,
    coWriter: 'Francis Ford Coppola',
    draftCount: 6,
    finalPageCount: 172,
    writingStartDate: date('1970-03-15'),
    writingCompletionDate: date('1971-01-10'),
    adaptationSource: 'His own novel',
    studioNotes: 'Extensive',
    scriptChanges: 'Significant from novel',
    scriptNominations: 5,
    scriptWins: 2,
    keyContributions: ['Family dynamics', 'Memorable dialogue', 'Crime authenticity']
}]->(g);

// Create the novel entity as source material for The Godfather
CREATE (TheGodfatherNovel:Book:GeneratedByClaudeAI {
    title: 'The Godfather',
    published: 1969,
    publisher: 'G. P. Putnam\'s Sons',
    pageCount: 448,
    wordCount: 192000,
    isbn: '0399103422',
    publicationDate: date('1969-03-10'),
    weeksOnBestsellerList: 67,
    totalSales: 14000000,
    initialPrintRun: 100000,
    advancePayment: 5000,
    genre: 'Crime fiction'
})
WITH 1 as dummy
MATCH (b:Book:GeneratedByClaudeAI {title: 'The Godfather'})
SET b.languages_translated = 25
SET b.themes = ['Family loyalty', 'Power', 'Americanization', 'Corruption', 'Honor']
SET b.literary_awards = ['None initially']
SET b.film_rights_cost = 12500
SET b.cultural_impact_rating = 9.5;

// Connect the novel to the film
MATCH
  (b:Book:GeneratedByClaudeAI {title: 'The Godfather'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (b)-[:ADAPTED_INTO {
    adaptationFidelity: 0.85,
    contractSigned: date('1969-10-15'),
    authorInvolvement: 'Extensive - co-wrote screenplay',
    significantChanges: ['Condensed timeline', 'Combined characters', 'Added wedding scene'],
    preservedElements: ['Core family dynamics', 'Key plot points', 'Iconic dialogue'],
    adaptation_quality: 'Considered superior to source',
    publicReception: 'Both acclaimed separately',
    adaptationRights: 12500,
    novelSalesAfterFilm: 5000000
}]->(g);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Mario Puzo'}),
  (b:Book:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (m)-[:AUTHORED {
    writingStartDate: date('1967-01-15'),
    writingCompletionDate: date('1968-10-20'),
    inspirationSources: ['Crime news', 'Depression-era upbringing', 'Italian-American experience'],
    researchMethods: ['News archives', 'Trial transcripts', 'Personal observations'],
    advance: 5000,
    royaltyPercentage: 0.12,
    initialExpectations: 'Modest commercial success',
    personalConnection: 'Italian-American heritage',
    literaryAim: 'Commercial success after literary novels'
}]->(b);

// Add key filming locations from The Godfather
CREATE (LittleItalyNYC:FilmingLocation:GeneratedByClaudeAI {
    name: 'Little Italy, New York City',
    country: 'USA',
    region: 'New York',
    district: 'Manhattan',
    latitude: 40.7192,
    longitude: -73.9970,
    elevation: 7,
    elevationUnit: 'm',
    climate: 'Temperate',
    permitCost: 75000,
    permitCurrency: 'USD',
    firstUsed: date('1971-04-10'),
    lastUsed: date('1971-05-15'),
    historicalContext: 'Italian-American enclave'
})
WITH 1 as dummy
MATCH (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Little Italy, New York City'})
CREATE (g)-[:FILMED_AT {
    startDate: date('1971-04-10'),
    endDate: date('1971-05-15'),
    sceneCount: 25,
    totalDays: 35,
    weatherDelayDays: 5,
    crewSize: 85,
    logisticsCost: 300000,
    accommodationCost: 125000,
    scenesFilmed: ['Vito shot in street', 'Exterior Genco Olive Oil', 'Clemenza purchasing oranges'],
    securityChallenges: true,
    localReaction: 'Mixed - authentic representation but criminal stereotype',
    locationAccuracy: 'Historically authentic',
    permitDifficulties: 'Some resistance'
}]->(l);

CREATE (SicilyLocation:FilmingLocation:GeneratedByClaudeAI {
    name: 'Forza d\'Agrò, Sicily',
    country: 'Italy',
    region: 'Sicily',
    latitude: 37.9146,
    longitude: 15.3327,
    elevation: 420,
    elevationUnit: 'm',
    climate: 'Mediterranean',
    permitCost: 25000,
    permitCurrency: 'USD',
    firstUsed: date('1971-07-15'),
    lastUsed: date('1971-08-10'),
    historicalContext: 'Traditional Sicilian village',
    culturalSignificance: 'Corleone family origins'
})
WITH 1 as dummy
MATCH (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Forza d\'Agrò, Sicily'})
CREATE (g)-[:FILMED_AT {
    startDate: date('1971-07-15'),
    endDate: date('1971-08-10'),
    sceneCount: 12,
    totalDays: 26,
    weatherDelayDays: 3,
    crewSize: 65,
    logisticsCost: 450000,
    accommodationCost: 175000,
    scenesFilmed: ['Michael in exile', 'Meeting Apollonia', 'Countryside walks'],
    localParticipation: true,
    authenticDialect: true,
    visualAuthenticity: 'Preserved historical village',
    logisticalChallenges: 'Remote location, equipment transport'
}]->(l);

// Create iconic props from The Godfather
CREATE (GodfatherPuppet:Prop:GeneratedByClaudeAI {
    name: 'Don Corleone\'s Cat',
    movie: 'The Godfather',
    type: 'Animal actor',
    animal: 'Cat',
    breed: 'Stray',
    weight: 3.6,
    weightUnit: 'kg',
    acquisitionDate: date('1971-04-02'),
    screenTime: duration({minutes: 2, seconds: 45}),
    isIconic: true,
    isImprovised: true,
    handlerCount: 2
})
WITH 1 as dummy
MATCH (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'}),
      (p:Prop:GeneratedByClaudeAI {name: 'Don Corleone\'s Cat'})
CREATE (p)-[:USED_IN {
    scenes: ['Opening office scene'],
    sceneCount: 1,
    firstAppearance: time('00:03:30'),
    lastAppearance: time('00:06:15'),
    isCloseup: true,
    significance: 'Characterization device',
    symbolism: 'Affection beneath ruthlessness',
    isImprovisedElement: true,
    propOrigin: 'Found on studio lot',
    directorNote: 'Brando bonded with the cat between takes',
    culturalImpact: 'Widely referenced visual'
}]->(g);

CREATE (CanoliProp:Prop:GeneratedByClaudeAI {
    name: 'Clemenza\'s Cannoli',
    movie: 'The Godfather',
    type: 'Food',
    material: 'Pastry and cream',
    weight: 0.15,
    weightUnit: 'kg',
    createdDate: date('1971-05-12'),
    screenTime: duration({minutes: 0, seconds: 30}),
    isIconic: true,
    isConsumed: true,
    propMaster: 'Angelo Graham',
    replicas: 12
})
WITH 1 as dummy
MATCH (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'}),
      (p:Prop:GeneratedByClaudeAI {name: 'Clemenza\'s Cannoli'})
CREATE (p)-[:USED_IN {
    scenes: ['Leave the gun, take the cannoli'],
    sceneCount: 1,
    firstAppearance: time('01:42:10'),
    lastAppearance: time('01:42:40'),
    isCloseup: false,
    significance: 'Character defining moment',
    symbolism: 'Casual attitude toward violence',
    quotableConnection: 'Generated iconic line',
    propContinuity: 'Multiple takes required fresh cannoli',
    culturalImpact: 'Entered lexicon',
    merchandisingValue: 'Significant'
}]->(g);

// Add the iconic soundtrack information
CREATE (GodfatherSoundtrack:Soundtrack:GeneratedByClaudeAI {
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
    orchestraSize: 65,
    recordingSessions: 8,
    mainInstrumentation: ['Mandolin', 'Orchestra', 'Trumpet solo'],
    emotionalImpact: 9.7,
    directorCollaboration: 'Very close',
    thematicElements: ['Sicilian traditions', 'Melancholy', 'Family bonds']
}]->(g);

// Add composer information and connection
CREATE (NinoRota:Person:GeneratedByClaudeAI {
    name: 'Nino Rota',
    born: 1911,
    died: 1979,
    birthdate: date('1911-12-03'),
    deathdate: date('1979-04-10'),
    nationality: 'Italian',
    oscarWins: 1,
    oscarNominations: 2,
    isActive: false,
    firstFilm: datetime('1933-01-01T00:00:00Z'),
    lastFilm: datetime('1979-03-05T00:00:00Z'),
    careerLength: duration({years: 46}),
    compositionsCount: 176
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Nino Rota'})
SET p.languages = ['Italian', 'English', 'French']
SET p.collaboration_directors = ['Federico Fellini', 'Francis Ford Coppola', 'Luchino Visconti']
SET p.collaboration_years = ['1952-1979', '1972-1974', '1954-1963']
SET p.musical_education = 'Milan Conservatory'
SET p.composition_style = 'Melodic with classical influences';

MATCH
  (n:Person:GeneratedByClaudeAI {name: 'Nino Rota'}),
  (s:Soundtrack:GeneratedByClaudeAI {title: 'The Godfather: Music from the Original Motion Picture Soundtrack'})
CREATE (n)-[:COMPOSED {
    year: 1972,
    compositionPeriod: duration({months: 8}),
    themes: 14,
    originalPieces: 8,
    adaptedPieces: 3,
    instrumentsPlayed: ['Piano'],
    recordingSupervision: true,
    collaborators: ['Carmine Coppola (conductor)'],
    compositionMethod: 'Piano sketches then orchestration',
    themeInspirations: ['Sicilian folk music', 'Italian opera', 'American jazz'],
    directorFeedback: 'Extensive collaboration'
}]->(s);

// Add cinematographer relationship
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
MATCH (p:Person:GeneratedByClaudeAI {name: 'Gordon Willis'})
SET p.languages = ['English']
SET p.filmography_titles = ['The Godfather', 'The Godfather Part II', 'All the President\'s Men', 'Manhattan']
SET p.filmography_years = [1972, 1974, 1976, 1979]
SET p.camera_preference = 'Panavision'
SET p.lighting_style = 'Naturalistic with heavy shadows';

MATCH
  (g:Person:GeneratedByClaudeAI {name: 'Gordon Willis'}),
  (f:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (g)-[:CINEMATOGRAPHY_FOR {
    year: 1972,
    cameras: ['Panavision Panaflex', 'Mitchell BNCR'],
    lenses: ['Panavision Primo', 'Panavision Ultra Speed'],
    filmStock: 'Eastman Kodak 5254',
    awardNominations: 0,
    awardWins: 0,
    startDate: date('1971-03-29'),
    completionDate: date('1971-08-07'),
    signature_techniques: ['Top-lighting', 'Underexposed faces', 'Amber color palette'],
    lighting_setups: 215,
    challenges_overcome: ['Low light interiors', 'Studio resistance to dark look', 'Period authenticity'],
    technical_innovations: ['Exposure techniques', 'Color timing process'],
    cinematographic_influence: 'Revolutionized Hollywood lighting',
    studio_conflicts: 'Executives concerned about dark visuals'
}]->(f);

// Add costume designer relationship
CREATE (AnnaDeCurio:Person:GeneratedByClaudeAI {
    name: 'Anna Hill Johnstone',
    born: 1913,
    died: 1992,
    birthdate: date('1913-04-15'),
    deathdate: date('1992-04-17'),
    nationality: 'American',
    oscarNominations: 1,
    isActive: false,
    firstFilm: datetime('1950-09-22T00:00:00Z'),
    lastFilm: datetime('1985-06-28T00:00:00Z'),
    careerLength: duration({years: 35}),
    specialization: 'Period Costume Design',
    designPhilosophy: 'Authentic character-driven'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Anna Hill Johnstone'})
SET p.languages = ['English', 'Italian']
SET p.filmography_titles = ['The Godfather', 'On the Waterfront', 'East of Eden']
SET p.filmography_years = [1972, 1954, 1955]
SET p.design_specialties = ['1940s menswear', 'Italian-American style', 'Socioeconomic distinctions through clothing']
SET p.research_methodology = 'Extensive historical photo analysis';

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Anna Hill Johnstone'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (a)-[:DESIGNED_COSTUMES_FOR {
    year: 1972,
    costumesCreated: 500,
    budget: 150000,
    awardNominations: 1,
    awardWins: 0,
    startDate: date('1971-01-15'),
    completionDate: date('1971-03-15'),
    specialCostumes: ['Vito Corleone suits', 'Wedding gowns', 'Military uniforms'],
    researchHours: 450,
    historicalAccuracy: 'Highly authentic',
    specificChallenges: ['Period accuracy', 'Showing wealth gradations', 'Character evolution'],
    fabricsSourced: ['Italian wool', 'American cotton', 'Silk blends'],
    fabricCost: 45000,
    characterProgression: 'Michael\'s suits evolve as he takes power',
    colorSymbolism: 'Studied use of black and gray for power dynamics'
}]->(g);

// Create fan community for The Godfather
CREATE (GodfatherFandom:FanCommunity:GeneratedByClaudeAI {
    name: 'The Godfather Legacy Community',
    established: date('1972-05-15'),
    formalized: date('1997-03-24'),
    memberCount: 750000,
    onlinePlatforms: 12,
    annualEvents: 8,
    largestEventAttendance: 12000,
    contentCreators: 22000,
    fanfictionCount: 45000,
    academicContributions: 850,
    preservationEfforts: true
})
WITH 1 as dummy
MATCH (f:FanCommunity:GeneratedByClaudeAI {name: 'The Godfather Legacy Community'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (f)-[:CELEBRATES {
    anniversaryCelebrations: 50,
    commemorationEvents: ['Film anniversaries', 'Restoration premieres', 'Cast reunions'],
    academicConferences: 35,
    preservationDonations: 2500000,
    quotationContests: true,
    documentaryProductions: 12,
    memorabiliaValue: 'High collectibles market',
    tourismImpact: 'Sicily and New York tours',
    dialogueMemorizationLevel: 'Extremely high',
    culturalDefenseActivities: 'Combating stereotypes while celebrating artistry',
    educationalPrograms: ['Film schools', 'Cinema history courses', 'Screenwriting analysis'],
    merchandisingSales: 75000000
}]->(g);

// Add educational institution teaching The Godfather
CREATE (FilmSchool:Institution:GeneratedByClaudeAI {
    name: 'USC School of Cinematic Arts',
    founded: date('1929-02-06'),
    headquartersLat: 34.0243,
    headquartersLong: -118.2878,
    studentCount: 1850,
    facultyCount: 145,
    courseCount: 230,
    filmArchiveSize: 80000,
    digitalArchiveSize: 175000,
    digitalArchiveUnit: 'TB',
    annualBudget: 85000000,
    endowment: 250000000,
    prestigeRanking: 1
})
WITH 1 as dummy
MATCH (i:Institution:GeneratedByClaudeAI {name: 'USC School of Cinematic Arts'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (i)-[:TEACHES_WITH {
    yearAdded: 1973,
    coursesUsedIn: 47,
    primaryFocus: ['Direction technique', 'Screenplay structure', 'Cinematography', 'Character development', 'Adaptation methodology'],
    studentPapersCount: 35850,
    mostCommonAnalysisTopics: ['Visual storytelling', 'Character arcs', 'Adaptation from novel', 'Cultural impact', 'Photography techniques'],
    teachingHoursAnnually: 950,
    requiredForDegrees: ['MFA Directing', 'MFA Cinematography', 'MFA Screenwriting', 'BA Film Theory'],
    teachingValue: 10.0,
    preservationPartnership: true,
    originalMaterialsAccess: 'Archival agreement with Paramount',
    technicalDeconstruction: ['Lighting workshops', 'Scene analysis seminars', 'Screenplay structure classes'],
    alumniConnections: 'Several faculty worked on film or with creators'
}]->(g);

// Create cultural impact connections
CREATE (ItalianAmericanCulture:CulturalMovement:GeneratedByClaudeAI {
    name: 'Italian-American Cultural Representation',
    established: date('1890-01-01'),
    formalized: date('1945-06-15'),
    influentialWorks: 45,
    politicalImpact: 'Significant',
    academicStudies: 850,
    criticalReception: 'Mixed evolution',
    geographicalSpread: 'North America with global influence',
    periodStart: date('1890-01-01'),
    periodPeak: date('1972-03-15'),
    culturalInstitutions: 125
})
WITH 1 as dummy
MATCH (c:CulturalMovement:GeneratedByClaudeAI {name: 'Italian-American Cultural Representation'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (c)-[:INFLUENCED_BY {
    significanceRating: 9.9,
    culturalImpact: 'Transformative but complicated',
    identityEffects: ['Reinforced stereotypes', 'Added complexity', 'Created enduring iconography'],
    communityReactions: ['Criticism of criminal focus', 'Appreciation of authentic elements', 'Pride in artistic achievement'],
    languageContributions: ['Introduced Italian terms', 'Popularized mafia terminology', 'Created quotable dialogue'],
    academicAnalyses: 1250,
    mediaCoverage: 'Extensive and ongoing',
    culturalShift: 'Redefined Italian-American portrayal',
    controversyLevel: 'Significant but diminishing',
    authenticityClaims: 'Mixed - fictional but culturally informed',
    subsequentPortrayals: 'Set template for decades'
}]->(g);

// Create an organized crime expert who consulted on the film
CREATE (JosephMaio:Person:GeneratedByClaudeAI {
    name: 'Joseph Bonanno',
    born: 1905,
    died: 2002,
    birthdate: date('1905-01-18'),
    deathdate: date('2002-05-11'),
    nationality: 'Italian-American',
    livedInSicily: true,
    isActive: false,
    firstPublicAppearance: datetime('1957-11-14T00:00:00Z'),
    lastPublicAppearance: datetime('1983-05-06T00:00:00Z'),
    careerLength: duration({years: 70}),
    heightInMeters: 1.73,
    memoirAuthor: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Joseph Bonanno'})
SET p.languages = ['English', 'Italian', 'Sicilian']
SET p.public_titles = ['Businessman', 'Memoirist', 'Historical figure']
SET p.activities = ['Commerce', 'Family business', 'Historical consulting']
SET p.book_titles = ['A Man of Honor: The Autobiography of Joseph Bonanno']
SET p.book_years = [1983]
SET p.family_origin = 'Castellammare del Golfo, Sicily';

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Joseph Bonanno'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (j)-[:CONSULTED_FOR {
    year: 1971,
    officialCapacity: false,
    indirectConsultation: true,
    compensation: 0,
    areasAdvised: ['Family structure', 'Traditional customs', 'Historical context', 'Sicilian traditions'],
    informationFlow: 'Through intermediaries',
    accuracyContribution: 'Authentic cultural details',
    publicAcknowledgement: false,
    legalDistancing: true,
    culturalAuthenticity: 'Significant contribution to realism',
    laterComments: 'Acknowledged similarities in memoir'
}]->(g);

// Create iconic scenes from The Godfather
CREATE (HorsesHeadScene:Scene:GeneratedByClaudeAI {
    name: 'Horse Head Scene',
    movie: 'The Godfather',
    sceneNumber: 42,
    duration: duration({minutes: 2, seconds: 45}),
    scriptPages: 3,
    locationCount: 2,
    interiorsOnly: true,
    actors: 2,
    extras: 5,
    animalsUsed: 1,
    stuntsRequired: 0,
    specialEffectsComplexity: 'High',
    dialogueLines: 6
})
WITH 1 as dummy
MATCH (s:Scene:GeneratedByClaudeAI {name: 'Horse Head Scene'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (s)-[:PART_OF {
    timeIndex: time('01:39:15'),
    runningOrder: 42,
    story_significance: 'Shows Corleone power and ruthlessness',
    character_development: 'Establishes Corleone methods',
    filmingDays: 3,
    filmingChallenges: ['Animal welfare', 'Realistic prop', 'Actor reaction'],
    technical_specifications: ['Low light cinematography', 'Practical effects', 'Minimal music'],
    shooting_location: 'Paramount Studios',
    production_cost: 45000,
    trivia: 'Used real horse head from slaughterhouse',
    cultural_impact: 'Iconic scene regularly referenced',
    viewer_reaction: 'Shock and disgust',
    controversies: 'Animal rights concerns',
    symbolic_meaning: 'Ultimate threat against ego and livelihood'
}]->(g);

CREATE (WeddingScene:Scene:GeneratedByClaudeAI {
    name: 'Opening Wedding Scene',
    movie: 'The Godfather',
    sceneNumber: 1,
    duration: duration({minutes: 28, seconds: 15}),
    scriptPages: 31,
    locationCount: 1,
    interiorsOnly: false,
    actors: 24,
    extras: 120,
    animalsUsed: 4,
    stuntsRequired: 2,
    specialEffectsComplexity: 'Low',
    dialogueLines: 112
})
WITH 1 as dummy
MATCH (s:Scene:GeneratedByClaudeAI {name: 'Opening Wedding Scene'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (s)-[:PART_OF {
    timeIndex: time('00:03:15'),
    runningOrder: 1,
    story_significance: 'Introduces all key characters and dynamics',
    character_development: 'Establishes family relationships and hierarchy',
    filmingDays: 12,
    filmingChallenges: ['Weather', 'Crowd management', 'Animal coordination'],
    technical_specifications: ['Extensive tracking shots', 'Natural lighting', 'Complex sound mixing'],
    shooting_location: 'Staten Island and Paramount Studios',
    production_cost: 175000,
    trivia: 'Many extras were actual Italian-American neighborhood residents',
    cultural_impact: 'Defined cinematic portrayal of Italian wedding',
    viewer_reaction: 'Immersive introduction to world',
    directing_technique: 'Masterful blocking and crowd choreography',
    exposition_method: 'Natural dialogue and visual storytelling'
}]->(g);

// Create business entities related to The Godfather
CREATE (GalloWineries:Business:GeneratedByClaudeAI {
    name: 'Paramount Pictures Merchandising',
    founded: date('1933-09-15'),
    headquartersLat: 34.0841,
    headquartersLong: -118.3213,
    employees: 850,
    annualRevenue: 450000000,
    marketValueUSD: 750000000,
    publiclyTraded: true,
    tickerSymbol: 'PARA',
    ceoCompensation: 12000000,
    globalOffices: 15,
    digitalTransformation: date('1995-06-12')
})
WITH 1 as dummy
MATCH (b:Business:GeneratedByClaudeAI {name: 'Paramount Pictures Merchandising'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (b)-[:MERCHANDISED {
    contractStart: date('1972-02-15'),
    contractEnd: date('2050-12-31'),
    initialProducts: ['Posters', 'Soundtrack', 'Film stills'],
    expandedProducts: ['Clothing', 'Home decor', 'Collectibles', 'Digital content'],
    anniversaryReleases: [1997, 2002, 2007, 2012, 2022],
    totalRevenue: 850000000,
    highestGrossingProduct: 'DVD/Blu-ray collections',
    productRevenues: [350000000, 200000000, 150000000, 100000000, 50000000],
    productCategories: ['Media', 'Apparel', 'Collectibles', 'Publishing', 'Digital'],
    licensingPartnerships: 125,
    globalDistribution: 'Worldwide with focus on North America and Europe',
    intellectualPropertyRights: 'Exclusive with narrow exceptions',
    digitalExpansion: 'Significant since 2005'
}]->(g);

// Create restoration project for The Godfather
CREATE (GodfatherRestoration:DigitalProject:GeneratedByClaudeAI {
    name: 'The Godfather 4K Restoration',
    started: date('2007-06-15'),
    completed: date('2008-09-22'),
    teamSize: 30,
    originalNegativeUsed: true,
    resolutionOutput: '4096x3112',
    colorDepth: '16-bit',
    storageSizeRaw: 225,
    storageSizeUnit: 'TB',
    finalMasterSize: 18,
    finalMasterUnit: 'TB',
    budget: 1500000,
    supervisionLevel: 'Director and cinematographer involved'
})
WITH 1 as dummy
MATCH (d:DigitalProject:GeneratedByClaudeAI {name: 'The Godfather 4K Restoration'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (d)-[:PRESERVED {
    frameCorrectionCount: 542500,
    frameTotalCount: 189216,
    originalDamagePercentage: 0.23,
    restorationFidelity: 0.988,
    audioChannelsPreserved: 4,
    audioSamplingRate: 192,
    audioSamplingUnit: 'kHz',
    primaryRestorationChallenges: ['Color timing', 'Negative deterioration', 'Audio synchronization', 'Director approval'],
    challengeComplexity: [9.7, 9.5, 8.5, 9.2],
    technologiesUsed: ['Frame-by-frame restoration', 'Wetgate scanning', 'Neural network cleanup', 'HDR color grading'],
    directorInvolvement: 'Francis Ford Coppola personally supervised',
    cinematographerConsultation: 'Gordon Willis consulted on color timing',
    preservationStandard: 'Library of Congress Archival Standard',
    publicReception: 'Critically acclaimed restoration',
    physicalPreservationCopies: 5,
    archivalStorageLocations: ['Library of Congress', 'Paramount Archives', 'Academy Film Archive']
}]->(g);

// Create a critical review for The Godfather from a prominent critic
CREATE (PaulineKaelReview:Review:GeneratedByClaudeAI {
    title: 'Gangster Baroque',
    author: 'Pauline Kael',
    publication: 'The New Yorker',
    date: date('1972-03-18'),
    time: time('09:00:00-05:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 5.0,
    aspectWriting: 4.8,
    aspectCinematography: 5.0,
    aspectMusic: 4.9,
    reviewText: 'Francis Ford Coppola has made one of the most brutal and moving chronicles of American life ever designed within the limits of popular entertainment. The Godfather has been executed with such authenticity that it becomes a genuine work of art.',
    wordCount: 3500,
    criticalInfluence: 'Highly influential'
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'Gangster Baroque'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 'Unknown historically',
    reprintCount: 35,
    anthologized: true,
    publicationPage: 'Lead review',
    criticalImpact: 'Set critical consensus',
    academicCitations: 845,
    historicalValue: 'Definitive contemporary assessment',
    culturalContext: 'Recognized immediate significance',
    industryInfluence: 'Helped secure film\'s reputation',
    criticPerspective: 'Aesthetic and sociological analysis',
    publicationDateTime: datetime('1972-03-18T09:00:00-05:00')
}]->(g);

// Create a connection between the critic and the review
CREATE (PaulineKael:Person:GeneratedByClaudeAI {
    name: 'Pauline Kael',
    born: 1919,
    died: 2001,
    birthdate: date('1919-06-19'),
    deathdate: date('2001-09-03'),
    nationality: 'American',
    oscarInfluence: 'Significant',
    isActive: false,
    firstReview: datetime('1953-10-15T00:00:00Z'),
    lastReview: datetime('1991-02-20T00:00:00Z'),
    careerLength: duration({years: 38}),
    reviewCount: 6500,
    criticalApproach: 'Visceral and intellectual'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Pauline Kael'})
SET p.languages = ['English']
SET p.publications = ['The New Yorker', 'McCall\'s', 'Various film journals']
SET p.books = ['I Lost It at the Movies', 'Going Steady', 'Reeling', 'Taking It All In']
SET p.critical_philosophy = 'Emotional honesty and artistic integrity'
SET p.writing_style = 'Direct, passionate, and witty';

MATCH
  (p:Person:GeneratedByClaudeAI {name: 'Pauline Kael'}),
  (r:Review:GeneratedByClaudeAI {title: 'Gangster Baroque'})
CREATE (p)-[:WROTE {
    date: date('1972-03-15'),
    timeSpentWriting: duration({days: 3}),
    wordCount: 3500,
    isVerified: true,
    submissionTime: time('18:45:00-05:00'),
    editorialChanges: 'Minimal',
    researchConducted: 'Film viewing and film history context',
    influenceLevel: 'Set critical standard',
    laterReassessments: 'None - stood by original assessment',
    perspectiveApplied: 'Cultural, aesthetic, and narrative analysis',
    paymentReceived: 1200,
    recognitionReceived: 'National Magazine Award consideration'
}]->(r);

// Connect The Godfather to other mob films it influenced
MATCH
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'}),
  (g2:Movie:GeneratedByClaudeAI {title: 'The Godfather: Part II'})
CREATE (g)-[:INFLUENCED {
    aspectsInfluenced: ['Direct sequel', 'Character continuation', 'Visual style', 'Thematic expansion'],
    influenceStrength: 'Direct and fundamental',
    continuityElements: ['Characters', 'Visual language', 'Musical themes', 'Narrative structure'],
    expandedThemes: ['Immigration', 'Corruption', 'American Dream'],
    creativeTeamOverlap: 0.85,
    narrativeConnection: 'Both prequel and sequel',
    criticComparison: 'Often considered superior to original',
    academicAnalysis: 'Studied as rare case of sequel equaling or surpassing original'
}]->(g2);

// Create awards received by The Godfather
CREATE (BestPictureOscar:Award:GeneratedByClaudeAI {
    name: 'Academy Award for Best Picture',
    presentedBy: 'Academy of Motion Picture Arts and Sciences',
    firstAwarded: date('1929-05-16'),
    category: 'Best Picture',
    prestige: 10.0,
    recipients: 93,
    monetary: false,
    physicalAward: true,
    awardMaterial: 'Gold-plated britannium',
    awardHeight: 34.3,
    heightUnit: 'cm',
    awardWeight: 3.856,
    weightUnit: 'kg',
    applicationRequired: false
})
WITH 1 as dummy
MATCH (a:Award:GeneratedByClaudeAI {name: 'Academy Award for Best Picture'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (a)-[:AWARDED_TO {
    ceremonyNumber: 45,
    awardDate: date('1973-03-27'),
    presentedBy: 'Clint Eastwood',
    acceptedBy: 'Albert S. Ruddy',
    competitor1: 'Cabaret',
    competitor2: 'Deliverance',
    competitor3: 'The Emigrants',
    competitor4: 'Sounder',
    acceptanceSpeechLength: duration({minutes: 2, seconds: 15}),
    controversies: 'Marlon Brando boycott',
    historicalContext: 'End of "Old Hollywood" era',
    industryImpact: 'New Hollywood legitimization',
    votingPercentage: 0.58,
    mediaHeadlines: 'Triumph of "New Hollywood"'
}]->(g);

// Create editor relationship
CREATE (WilliamReynolds:Person:GeneratedByClaudeAI {
    name: 'William Reynolds',
    born: 1910,
    died: 1997,
    birthdate: date('1910-06-14'),
    deathdate: date('1997-07-16'),
    nationality: 'American',
    oscarNominations: 2,
    oscarWins: 0,
    isActive: false,
    firstFilm: datetime('1936-05-11T00:00:00Z'),
    lastFilm: datetime('1977-12-18T00:00:00Z'),
    careerLength: duration({years: 41}),
    editingStyle: 'Character-focused pacing'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'William Reynolds'})
SET p.languages = ['English']
SET p.filmography_titles = ['The Godfather', 'The Sound of Music', 'The Sting']
SET p.filmography_years = [1972, 1965, 1973]
SET p.technical_expertise = 'Moviola editing system master'
SET p.working_style = 'Close collaboration with directors';

MATCH
  (w:Person:GeneratedByClaudeAI {name: 'William Reynolds'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (w)-[:EDITED {
    year: 1972,
    editingSystems: ['Moviola'],
    cuttingRatio: 20.1,
    footageReviewed: 500000,
    footageUnit: 'feet',
    editingSessions: 185,
    directorSessions: 65,
    completionDate: date('1972-01-15'),
    narrativeContributions: ['Parallel action sequences', 'Pacing adjustments', 'Scene reordering'],
    significantEdits: ['Wedding sequence compression', 'Hospital sequence tension', 'Final montage'],
    initialCutLength: duration({hours: 3, minutes: 15}),
    finalCutLength: duration({hours: 2, minutes: 55}),
    editingApproach: 'Character-driven rhythms',
    controversies: 'Studio pressure to shorten',
    directorRelationship: 'Collaborative and supportive'
}]->(g);

// Connection between Puzo and The Godfather Part II
MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Mario Puzo'}),
  (g2:Movie:GeneratedByClaudeAI {title: 'The Godfather: Part II'})
CREATE (m)-[:WROTE {
    year: 1974,
    coWriter: 'Francis Ford Coppola',
    draftCount: 5,
    finalPageCount: 165,
    writingStartDate: date('1973-02-10'),
    writingCompletionDate: date('1973-08-15'),
    originalMaterial: 'Expanded from unused novel sections',
    adaptationSource: 'Partial novel material with new content',
    studioNotes: 'Limited after original success',
    sequelChallenges: ['Narrative complexity', 'Dual timeline', 'Meeting expectations'],
    narrativeInnovations: ['Parallel past/present', 'Character devolution', 'Thematic expansion'],
    scriptNominations: 2,
    scriptWins: 1
}]->(g2);

// Create the production challenges node
CREATE (GodfatherChallenges:ProductionChallenge:GeneratedByClaudeAI {
    name: 'The Godfather Production Obstacles',
    productionPhase: 'Pre-production and principal photography',
    startDate: date('1971-02-15'),
    endDate: date('1971-08-07'),
    severityLevel: 8.5,
    budgetImpact: 1200000,
    scheduleImpact: duration({days: 25}),
    departmentsAffected: 6,
    resolutionSuccess: 0.95,
    documentationLevel: 'Extensively chronicled',
    industryLessons: 'Legendary case study'
})
WITH 1 as dummy
MATCH (c:ProductionChallenge:GeneratedByClaudeAI {name: 'The Godfather Production Obstacles'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (c)-[:AFFECTED {
    chiefChallenges: ['Studio interference', 'Casting disputes', 'Location difficulties', 'Budget constraints', 'Mafia intimidation'],
    challengeRatings: [9.5, 9.2, 8.7, 8.5, 7.9],
    riskedCancellation: true,
    studioConflicts: 'Paramount executives opposed nearly all creative decisions',
    castingBattles: ['Studio opposed Brando', 'Studio opposed Pacino', 'Studio wanted established stars'],
    locationProblems: ['Permit difficulties', 'Mafia threats', 'Neighborhood access'],
    keyAdvocates: ['Robert Evans', 'Peter Bart', 'Albert Ruddy'],
    resolutionStrategies: ['Director persistence', 'Screen tests', 'Producer diplomacy', 'Budget compromise'],
    compromisesMade: ['Budget limitations', 'Schedule tightening', 'Some cast reassignments'],
    victoriousDecisions: ['Brando casting', 'Pacino casting', 'Period setting', 'Visual style'],
    historicalLegacy: 'Template for director-studio creative battles'
}]->(g);

// Create dialect coach for authentic Italian
CREATE (DialectCoach:Person:GeneratedByClaudeAI {
    name: 'Saro Urzì',
    born: 1913,
    died: 1979,
    birthdate: date('1913-02-24'),
    deathdate: date('1979-11-01'),
    nationality: 'Italian',
    sicilianNative: true,
    isActive: false,
    firstFilm: datetime('1940-06-15T00:00:00Z'),
    lastFilm: datetime('1978-11-20T00:00:00Z'),
    careerLength: duration({years: 38}),
    dialectsKnown: 5,
    actingCredits: 98
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Saro Urzì'})
SET p.languages = ['Italian', 'Sicilian', 'English']
SET p.dialect_expertise = ['Sicilian regional variations', 'Italian regional accents', 'Italian-American adaptations']
SET p.film_appearances = ['The Godfather', 'The Leopard', 'Divorce Italian Style']
SET p.appearance_years = [1972, 1963, 1961]
SET p.teaching_methodology = 'Immersive with cultural context';

MATCH
  (s:Person:GeneratedByClaudeAI {name: 'Saro Urzì'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (s)-[:COACHED_DIALECTS_FOR {
    year: 1972,
    languagesTaught: ['Sicilian', 'Italian', 'Italian-American English'],
    actorsTrained: ['Marlon Brando', 'Al Pacino', 'James Caan', 'Robert Duvall'],
    trainingHours: 120,
    startDate: date('1971-02-15'),
    completionDate: date('1971-07-25'),
    methodsUsed: ['Phonetic breakdown', 'Cultural context', 'Phrase memorization'],
    dialectSpecifics: ['Castellammare accent', 'Corleone dialect markers', 'Generational differences'],
    pronunciationAccuracy: 0.92,
    culturalContextTeaching: 'Hand gestures, body language, social customs',
    audienceReception: 'Highly authentic to native speakers',
    caseDifferences: ['Brando: stylized but effective', 'Pacino: highly authentic', 'Caan: good for American-born character']
}]->(g);

// Create connection between Diane Keaton and Al Pacino (romantic relationship during filming)
MATCH
  (d:Person:GeneratedByClaudeAI {name: 'Diane Keaton'}),
  (a:Person:GeneratedByClaudeAI {name: 'Al Pacino'})
CREATE (d)-[:ROMANTICALLY_INVOLVED_WITH {
    startDate: date('1971-04-15'),
    endDate: date('1974-06-30'),
    relationship_duration: duration({years: 3, months: 2}),
    met_on_set: 'The Godfather',
    public_disclosure: date('1972-05-10'),
    professional_collaborations: 3,
    collaborative_projects: ['The Godfather', 'The Godfather Part II', 'Godfather Saga'],
    collaboration_years: [1972, 1974, 1977],
    on_screen_chemistry: 'Powerful, complex dynamic',
    media_coverage: 'Moderate but respectful',
    relationship_impact: 'Enhanced screen dynamics',
    relationship_end: 'Amicable, continued professional respect'
}]->(a);

// Create luxury item from the film set that became collectible
CREATE (GodftherDesk:Collectible:GeneratedByClaudeAI {
    name: 'Don Corleone\'s Desk',
    type: 'Furniture',
    material: 'Walnut',
    dimensions: '180x90x76',
    dimensionUnit: 'cm',
    weight: 125,
    weightUnit: 'kg',
    creationDate: date('1971-02-10'),
    acquisitionDate: date('1972-09-15'),
    appraised_value: 450000,
    valuation_currency: 'USD',
    insured: true,
    authenticity_verified: true,
    condition: 'Excellent'
})
WITH 1 as dummy
MATCH (c:Collectible:GeneratedByClaudeAI {name: 'Don Corleone\'s Desk'}),
      (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (c)-[:FEATURED_IN {
    scenes: ['Opening scene', 'Various office scenes'],
    screen_minutes: 18,
    significance: 'Symbolic seat of power',
    original_cost: 2500,
    auction_house: 'Christie\'s',
    auction_date: date('1999-06-15'),
    auction_lot: 157,
    hammer_price: 375000,
    buyer_premium: 75000,
    total_price: 450000,
    competing_bidders: 12,
    provenance: 'Paramount Studios → Private collection → Auction',
    exhibition_history: ['Museum of Modern Art', 'Academy Museum of Motion Pictures'],
    exhibition_dates: [date('2012-05-15'), date('2021-09-30')],
    cultural_significance: 'Iconic symbol of power and business',
    restoration: 'Minor conservation work only'
}]->(g);