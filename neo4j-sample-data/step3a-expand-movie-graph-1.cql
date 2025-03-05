// Create a new modern movie with various data types
CREATE (Interstellar:Movie:GeneratedByClaudeAI {
    title: 'Interstellar', 
    released: 2014,
    tagline: 'Mankind was born on Earth. It was never meant to die here.',
    budget: 165000000,
    revenue: 701800000,
    runtime_minutes: 169,
    rating_avg: 8.6,
    releaseDate: date('2014-11-07'),
    digitalRelease: datetime('2015-03-31T00:00:00Z'),
    isOscarWinner: true
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
SET m.ratings = [8.5, 8.9, 8.3, 8.7]
SET m.genres = ['sci-fi', 'drama', 'adventure']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [36.4071, 49.3988, -33.9249]
SET m.filmingLocationLong = [-116.9703, 8.5685, 18.4241]
SET m.boxOfficeNA = 188020017
SET m.boxOfficeEurope = 228700000
SET m.boxOfficeAsia = 124300000
SET m.boxOfficeOther = 160779983;

// Create a second contemporary film
CREATE (Arrival:Movie:GeneratedByClaudeAI {
    title: 'Arrival',
    released: 2016,
    tagline: 'Why are they here?',
    budget: 47000000,
    revenue: 203400000,
    runtime_minutes: 116,
    rating_avg: 7.9,
    releaseDate: date('2016-11-11'),
    digitalRelease: datetime('2017-02-14T00:00:00Z'),
    isOscarWinner: false
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Arrival'})
SET m.ratings = [7.8, 8.1, 7.6, 8.0]
SET m.genres = ['sci-fi', 'drama', 'mystery']
SET m.certifications = ['PG-13', '12A']
SET m.filmingLocationLat = [45.5017, 50.1109]
SET m.filmingLocationLong = [-73.5673, 8.6821]
SET m.boxOfficeNA = 100546139
SET m.boxOfficeEurope = 50400000
SET m.boxOfficeAsia = 36800000
SET m.boxOfficeOther = 15653861;

// Create another actress with temporal data
CREATE (AmyA:Person:GeneratedByClaudeAI {
    name: 'Amy Adams',
    born: 1974,
    birthdate: date('1974-08-20'),
    nationality: 'American',
    oscarNominations: 6,
    oscarWins: 0,
    isActive: true,
    firstFilm: datetime('1999-04-23T00:00:00Z'),
    typicalDay: localtime('06:30:00'),
    heightInMeters: 1.63,
    netWorth: 60000000,
    methodActingScore: 8.7
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Amy Adams'})
SET p.languages = ['English', 'Italian']
SET p.filmography_titles = ['Arrival', 'American Hustle', 'Enchanted']
SET p.filmography_years = [2016, 2013, 2007]
SET p.filmography_roles = ['Dr. Louise Banks', 'Sydney Prosser', 'Giselle'];

// Create another director with mixed data types
CREATE (DenisV:Person:GeneratedByClaudeAI {
    name: 'Denis Villeneuve',
    born: 1967,
    birthdate: date('1967-10-03'),
    nationality: 'Canadian',
    oscarNominations: 4,
    activeYears: duration({years: 30}),
    isActive: true,
    residenceLat: 45.5017,
    residenceLong: -73.5673,
    lastDirected: datetime('2023-11-03T00:00:00Z'),
    typicalFilmLengthHrs: 2.4
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'})
SET p.preferredAspectRatios = ['2.39:1', '1.85:1']
SET p.collaborators = ['Roger Deakins', 'Joe Walker', 'Jóhann Jóhannsson'];

// Create another actor with null values and mixed types
CREATE (MatthewM:Person:GeneratedByClaudeAI {
    name: 'Matthew McConaughey',
    born: 1969,
    birthdate: date('1969-11-04'),
    spouseName: 'Camila Alves',
    marriageDate: date('2012-06-09'),
    oscarWins: 1,
    oscarWinDate: date('2014-03-02'),
    height: 183,
    weight: 84,
    upcomingProjects: null,
    isCurrentlyFilming: true,
    typicalRolePreparationMonths: 3.5
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Matthew McConaughey'})
SET p.activityDays = ['Monday', 'Tuesday', 'Thursday', 'Friday']
SET p.activityTypes = ['Script reading', 'Physical training', 'Character research']
SET p.activityDurations = [3, 2, 4]
SET p.filmCountDrama = 14
SET p.filmCountThriller = 6
SET p.filmCountComedy = 8
SET p.filmCountSciFi = 3;

// Create a new actress
CREATE (JessicaC:Person:GeneratedByClaudeAI {
    name: 'Jessica Chastain',
    born: 1977,
    birthdate: date('1977-03-24'),
    nationality: 'American',
    oscarWins: 1,
    oscarNominations: 3,
    isActive: true,
    firstFilm: datetime('2008-09-07T00:00:00Z'),
    oscarCeremony: localdatetime('2022-03-27T20:15:00'),
    heightInMeters: 1.63,
    netWorth: 50000000
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Jessica Chastain'})
SET p.languages = ['English', 'French']
SET p.filmography_titles = ['The Help', 'Zero Dark Thirty', 'Interstellar']
SET p.filmography_years = [2011, 2012, 2014]
SET p.filmography_roles = ['Celia Foote', 'Maya', 'Murphy Cooper'];

// Create a new production company
CREATE (A24:Studio:GeneratedByClaudeAI {
    name: 'A24',
    founded: date('2012-08-20'),
    headquartersLat: 40.7405,
    headquartersLong: -74.0022,
    yearlyRevenue2020: 165000000,
    yearlyRevenue2021: 225000000,
    yearlyRevenue2022: 275000000,
    digitalStreamingDate: datetime('2022-06-30T00:00:00Z'),
    isPublic: false,
    marketShare: 0.035
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'A24'})
SET s.subsidiaries = ['A24 Films', 'A24 Television']
SET s.distributionMarkets = ['North America', 'Europe', 'Asia', 'Australia']
SET s.studioLotsLat = [40.7405]
SET s.studioLotsLong = [-74.0022];

// Create a filming event for Interstellar
CREATE (InterstellarFilming:Production:GeneratedByClaudeAI {
    name: 'Interstellar Principal Photography',
    startDate: date('2013-08-13'),
    endDate: date('2013-12-14'),
    durationMonths: 4,
    durationDays: 1,
    startTime: localtime('06:45:00'),
    isCompleted: true,
    budgetPersonnel: 45000000,
    budgetEquipment: 18000000,
    budgetLocations: 30000000,
    budgetVFX: 55000000,
    budgetOther: 17000000,
    weatherGood: 70,
    weatherAcceptable: 25,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Interstellar Principal Photography'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['04:30:00', '06:30:00', '07:00:00', '19:00:00']
SET p.scheduleDurations = [2, 0.5, 12, 1.5];

// Create a filming event for Arrival
CREATE (ArrivalFilming:Production:GeneratedByClaudeAI {
    name: 'Arrival Principal Photography',
    startDate: date('2015-06-07'),
    endDate: date('2015-08-28'),
    durationMonths: 2,
    durationDays: 21,
    startTime: localtime('07:00:00'),
    isCompleted: true,
    budgetPersonnel: 12000000,
    budgetEquipment: 5000000,
    budgetLocations: 8000000,
    budgetVFX: 16000000,
    budgetOther: 6000000,
    weatherGood: 65,
    weatherAcceptable: 30,
    weatherPoor: 5
})
WITH 1 as dummy
MATCH (p:Production:GeneratedByClaudeAI {name: 'Arrival Principal Photography'})
SET p.scheduleActivities = ['Makeup', 'Rehearsal', 'Filming', 'Wrap']
SET p.scheduleTimes = ['05:00:00', '07:00:00', '07:30:00', '18:30:00']
SET p.scheduleDurations = [2, 0.5, 11, 1];

// Add a review for Interstellar
CREATE (InterstellarReview:Review:GeneratedByClaudeAI {
    title: 'A Cosmic Emotional Journey',
    stars: 4.7,
    date: date('2014-11-10'),
    time: time('16:42:18+01:00'),
    isVerified: true,
    aspectDirection: 5.0,
    aspectActing: 4.8,
    aspectVisuals: 5.0,
    aspectMusic: 5.0,
    aspectPlot: 4.5,
    reviewText: 'Christopher Nolan\'s Interstellar is a breathtaking cosmic journey that balances complex scientific concepts with profound emotional depth. The film\'s visual spectacle and Hans Zimmer\'s score create an immersive experience.',
    upvotes: 4267
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Cosmic Emotional Journey'})
SET r.commentTimestamps = [datetime('2014-11-10T18:22:43Z'), datetime('2014-11-11T09:15:12Z'), datetime('2014-11-12T14:32:01Z')]
SET r.keywords = ['space', 'relativity', 'time-dilation', 'love']
SET r.readerLocationsLat = [40.7128, 51.5074, 34.0522]
SET r.readerLocationsLong = [-74.0060, -0.1278, -118.2437];

// Add a review for Arrival
CREATE (ArrivalReview:Review:GeneratedByClaudeAI {
    title: 'A Linguistic Masterpiece',
    stars: 4.6,
    date: date('2016-11-14'),
    time: time('20:15:36+01:00'),
    isVerified: true,
    aspectDirection: 4.9,
    aspectActing: 4.8,
    aspectVisuals: 4.7,
    aspectMusic: 4.6,
    aspectPlot: 4.9,
    reviewText: 'Denis Villeneuve\'s Arrival is a thought-provoking exploration of language and time. Amy Adams delivers a nuanced performance as a linguist tasked with communicating with extraterrestrial visitors. The non-linear storytelling creates a powerful emotional revelation.',
    upvotes: 3842
})
WITH 1 as dummy
MATCH (r:Review:GeneratedByClaudeAI {title: 'A Linguistic Masterpiece'})
SET r.commentTimestamps = [datetime('2016-11-14T22:12:43Z'), datetime('2016-11-15T08:45:22Z'), datetime('2016-11-16T19:38:11Z')]
SET r.keywords = ['language', 'communication', 'aliens', 'time']
SET r.readerLocationsLat = [37.7749, 48.8566, 35.6762]
SET r.readerLocationsLong = [-122.4194, 2.3522, 139.6503];

// Add BAFTA Award ceremony
CREATE (BAFTA:Ceremony:GeneratedByClaudeAI {
    name: 'BAFTA Film Awards',
    nickname: 'BAFTAs',
    established: date('1947-05-29'),
    ceremonyTime: localtime('19:00:00'),
    typicalDurationHrs: 3.0,
    isPrestigious: true,
    locationLat: 51.5101,
    locationLong: -0.1305,
    locationHeight: 15,
    nextCeremony: datetime('2026-02-08T19:00:00Z')
})
WITH 1 as dummy
MATCH (c:Ceremony:GeneratedByClaudeAI {name: 'BAFTA Film Awards'})
SET c.categories = ['Best Film', 'Best Director', 'Best Actor', 'Best Actress']
SET c.viewership2020 = 3200000
SET c.viewership2021 = 2800000
SET c.viewership2022 = 3100000
SET c.viewership2023 = 3400000;

// Create a new film festival
CREATE (Cannes:Ceremony:GeneratedByClaudeAI {
    name: 'Cannes Film Festival',
    nickname: 'Festival de Cannes',
    established: date('1946-09-20'),
    ceremonyTime: localtime('19:30:00'),
    typicalDurationDays: 12,
    isPrestigious: true,
    locationLat: 43.5500,
    locationLong: 7.0167,
    locationHeight: 12,
    nextCeremony: datetime('2026-05-12T19:30:00+02:00')
})
WITH 1 as dummy
MATCH (c:Ceremony:GeneratedByClaudeAI {name: 'Cannes Film Festival'})
SET c.categories = ['Palme d\'Or', 'Grand Prix', 'Jury Prize', 'Best Director']
SET c.attendance2019 = 40000
SET c.attendance2021 = 28000
SET c.attendance2022 = 35000
SET c.attendance2023 = 38000;

// Create relationships between nodes with various data types
MATCH 
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
CREATE (c)-[:DIRECTED {
    year: 2014,
    daysOnSet: 124,
    satisfaction: 4.8,
    awardNominations: 5,
    completionDate: date('2014-09-22'),
    premiereEvent: datetime('2014-10-26T18:30:00Z'),
    durationMonths: 4,
    isFirstCollaboration: false
}]->(i);

// Actor to Movie relationships for Interstellar
MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Matthew McConaughey'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
CREATE (m)-[:ACTED_IN {
    roles: ['Joseph Cooper'],
    salary: 15000000,
    screenTimeMinutes: 135,
    startDate: date('2013-08-13'),
    endDate: date('2013-12-14'),
    scheduleConflicts: false,
    criticScore: 92,
    audienceScore: 94,
    awardNominations: 4
}]->(i);

MATCH
  (j:Person:GeneratedByClaudeAI {name: 'Jessica Chastain'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
CREATE (j)-[:ACTED_IN {
    roles: ['Murphy Cooper'],
    salary: 3500000,
    screenTimeMinutes: 45,
    startDate: date('2013-09-10'),
    endDate: date('2013-11-15'),
    scheduleConflicts: true,
    performanceRating: 4.7
}]->(i);

// Actor to Movie relationships for Arrival
MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Amy Adams'}),
  (r:Movie:GeneratedByClaudeAI {title: 'Arrival'})
CREATE (a)-[:ACTED_IN {
    roles: ['Dr. Louise Banks'],
    salary: 5000000,
    screenTimeMinutes: 104,
    startDate: date('2015-06-07'),
    endDate: date('2015-08-28'),
    scheduleConflicts: false,
    criticScore: 94,
    audienceScore: 89,
    awardNominations: 5
}]->(r);

// Director to Movie relationships for Arrival
MATCH
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'}),
  (r:Movie:GeneratedByClaudeAI {title: 'Arrival'})
CREATE (d)-[:DIRECTED {
    year: 2016,
    daysOnSet: 81,
    satisfaction: 4.9,
    awardNominations: 8,
    completionDate: date('2016-08-15'),
    premiereEvent: datetime('2016-09-01T20:15:00+02:00'),
    durationMonths: 3,
    isFirstCollaboration: true
}]->(r);

// Studio relationships
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
CREATE (w)-[:PRODUCED {
    investment: 165000000,
    return: 701800000,
    roi: 4.25,
    contractSigned: date('2012-08-15'),
    studioShare: 0.55,
    directorShare: 0.2,
    producerShare: 0.15,
    topCastShare: 0.1,
    marketingBudget: 80000000,
    isProfitable: true,
    marketingStart: datetime('2014-05-15T00:00:00Z')
}]->(i);

MATCH
  (a:Studio:GeneratedByClaudeAI {name: 'A24'}),
  (r:Movie:GeneratedByClaudeAI {title: 'Arrival'})
CREATE (a)-[:PRODUCED {
    investment: 47000000,
    return: 203400000,
    roi: 4.33,
    contractSigned: date('2014-11-10'),
    studioShare: 0.6,
    directorShare: 0.15,
    producerShare: 0.15,
    topCastShare: 0.1,
    marketingBudget: 30000000,
    isProfitable: true,
    marketingStart: datetime('2016-04-12T00:00:00Z')
}]->(r);

// Studio to filming relationship
MATCH
  (w:Studio:GeneratedByClaudeAI {name: 'Warner Bros. Pictures'}),
  (p:Production:GeneratedByClaudeAI {name: 'Interstellar Principal Photography'})
CREATE (w)-[:FINANCED {
    contractDate: date('2012-08-15'),
    amount: 165000000,
    isFullyPaid: true,
    transferTime1: datetime('2013-01-10T00:00:00Z'),
    transferTime2: datetime('2013-04-15T00:00:00Z'),
    transferTime3: datetime('2013-07-01T00:00:00Z'),
    paymentDate1: date('2013-01-10'),
    paymentAmount1: 50000000,
    paymentDate2: date('2013-04-15'),
    paymentAmount2: 65000000,
    paymentDate3: date('2013-07-01'),
    paymentAmount3: 50000000
}]->(p);

MATCH
  (a:Studio:GeneratedByClaudeAI {name: 'A24'}),
  (p:Production:GeneratedByClaudeAI {name: 'Arrival Principal Photography'})
CREATE (a)-[:FINANCED {
    contractDate: date('2014-11-10'),
    amount: 47000000,
    isFullyPaid: true,
    transferTime1: datetime('2015-01-15T00:00:00Z'),
    transferTime2: datetime('2015-03-30T00:00:00Z'),
    paymentDate1: date('2015-01-15'),
    paymentAmount1: 22000000,
    paymentDate2: date('2015-03-30'),
    paymentAmount2: 25000000
}]->(p);

// Filming to movie relationship
MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Interstellar Principal Photography'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 4,
    durationDays: 1,
    locationCount: 8,
    dailyAverageCost: 520000,
    scheduleAdherence: 0.92,
    weatherDelaysDays: 8,
    originalScheduledEnd: date('2013-12-05')
}]->(i);

MATCH
  (p:Production:GeneratedByClaudeAI {name: 'Arrival Principal Photography'}),
  (r:Movie:GeneratedByClaudeAI {title: 'Arrival'})
CREATE (p)-[:FOR_MOVIE {
    isCompleted: true,
    durationMonths: 2,
    durationDays: 21,
    locationCount: 5,
    dailyAverageCost: 290000,
    scheduleAdherence: 0.98,
    weatherDelaysDays: 2,
    originalScheduledEnd: date('2015-08-25')
}]->(r);

// Review relationships
MATCH
  (j:Person {name: 'James Thompson'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'A Cosmic Emotional Journey'})
CREATE (j)-[:WROTE {
    date: date('2014-11-10'),
    timeSpentMinutes: 50,
    wordCount: 612,
    isVerified: true,
    submissionTime: time('16:42:18+01:00')
}]->(r);

MATCH
  (a:Person {name: 'Angela Scope'}), // Original person from the graph
  (r:Review:GeneratedByClaudeAI {title: 'A Linguistic Masterpiece'})
CREATE (a)-[:WROTE {
    date: date('2016-11-14'),
    timeSpentMinutes: 45,
    wordCount: 568,
    isVerified: true,
    submissionTime: time('20:15:36+01:00')
}]->(r);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'A Cosmic Emotional Journey'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 152487,
    shares: 6842,
    comments: 2156,
    featuredDurationDays: 21,
    publicationDateTime: datetime('2014-11-10T17:00:00+01:00')
}]->(i);

MATCH
  (r:Review:GeneratedByClaudeAI {title: 'A Linguistic Masterpiece'}),
  (i:Movie:GeneratedByClaudeAI {title: 'Arrival'})
CREATE (r)-[:FOR_MOVIE {
    isPublished: true,
    views: 98245,
    shares: 3621,
    comments: 1583,
    featuredDurationDays: 14,
    publicationDateTime: datetime('2016-11-14T21:00:00+01:00')
}]->(i);

// Award relationships
MATCH
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (i)-[:NOMINATED_FOR {
    category: 'Best Original Score',
    year: 2015,
    ceremony: 87,
    isWinner: false,
    ceremonyDate: date('2015-02-22'),
    announcementTime: localtime('21:15:00'),
    votesFor: 2856,
    votesAgainst: 3012
}]->(a);

MATCH
  (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'}),
  (b:Ceremony:GeneratedByClaudeAI {name: 'BAFTA Film Awards'})
CREATE (i)-[:NOMINATED_FOR {
    category: 'Best Original Music',
    year: 2015,
    ceremony: 68,
    isWinner: true,
    ceremonyDate: date('2015-02-08'),
    announcementTime: localtime('20:45:00'),
    votesFor: 1523,
    votesAgainst: 1287
}]->(b);

MATCH
  (r:Movie:GeneratedByClaudeAI {title: 'Arrival'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (r)-[:NOMINATED_FOR {
    category: 'Best Picture',
    year: 2017,
    ceremony: 89,
    isWinner: false,
    ceremonyDate: date('2017-02-26'),
    announcementTime: localtime('21:45:00'),
    votesFor: 2785,
    votesAgainst: 3142
}]->(a);

MATCH
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'}),
  (a:Ceremony:GeneratedByClaudeAI {name: 'Academy Awards'})
CREATE (d)-[:NOMINATED_FOR {
    category: 'Best Director',
    year: 2017,
    ceremony: 89,
    isWinner: false,
    ceremonyDate: date('2017-02-26'),
    announcementTime: localtime('21:00:00'),
    votesFor: 2456,
    votesAgainst: 3471
}]->(a);

// Professional relationships between people
MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'})
CREATE (c)-[:KNOWS {
    since: date('2010-09-12'),
    projects: 0,
    relationship: 'Professional Acquaintance',
    lastContact: datetime('2023-11-15T11:30:00Z'),
    nextMeeting: datetime('2025-06-20T14:00:00Z')
}]->(d);

MATCH
  (m:Person:GeneratedByClaudeAI {name: 'Matthew McConaughey'}),
  (j:Person:GeneratedByClaudeAI {name: 'Jessica Chastain'})
CREATE (m)-[:WORKED_WITH {
    projects: 1,
    firstProject: 'Interstellar',
    firstYear: 2014,
    chemistry: 4.8,
    interviews: 15,
    jointSceneMinutes: 12,
    relationship: 'Co-stars',
    nextProjectPlanned: date('2026-03-15')
}]->(j);

MATCH
  (l:Person:GeneratedByClaudeAI {name: 'Leonardo DiCaprio'}),
  (m:Person:GeneratedByClaudeAI {name: 'Matthew McConaughey'})
CREATE (l)-[:KNOWS {
    since: date('2006-11-23'),
    relationship: 'Friends',
    lastMeeting: date('2023-12-15'),
    durationYears: 17,
    commonFriends: 8,
    commonProjects: 0
}]->(m);

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Amy Adams'}),
  (j:Person:GeneratedByClaudeAI {name: 'Jessica Chastain'})
CREATE (a)-[:KNOWS {
    since: date('2011-05-07'),
    relationship: 'Friends and Colleagues',
    lastMeeting: date('2024-01-22'),
    durationYears: 13,
    commonAwards: 5,
    commonGenres: ['Drama', 'Sci-Fi']
}]->(j);

// Connection with original graph
MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'}),
  (t:Person {name: 'Tom Cruise'}) // Original person from the graph
CREATE (c)-[:ADMIRES {
    since: date('1998-07-25'),
    projects: 0,
    relationship: 'Professional Admiration',
    lastContact: null,
    inspirationLevel: 4.7,
    influencedWorks: ['Inception', 'Tenet']
}]->(t);

MATCH
  (d:Person:GeneratedByClaudeAI {name: 'Denis Villeneuve'}),
  (r:Person {name: 'Rob Reiner'}) // Original person from the graph
CREATE (d)-[:INSPIRED_BY {
    since: date('1987-10-15'),
    favouriteFilm: 'Stand By Me',
    impactLevel: 4.8,
    mentionedInInterviews: 12,
    influencedWorks: ['Arrival', 'Prisoners']
}]->(r);

// Create additional property types on existing relationships
MATCH (c:Person:GeneratedByClaudeAI {name: 'Christopher Nolan'})-[r:DIRECTED]->(i:Movie:GeneratedByClaudeAI {title: 'Interstellar'})
SET r.technicalChallenges = ['IMAX filming', 'Practical effects', 'Rotating sets']
SET r.techChallengeRatings = [4.2, 4.8, 5.0]
SET r.consultants = ['Kip Thorne', 'Christopher Nolan']
SET r.consultationHours = [240, 500]
SET r.scriptChanges = 18
SET r.finalRuntime = duration({hours: 2, minutes: 49})
SET r.originalRuntime = duration({hours: 3, minutes: 15});

// Create additional node types
CREATE (TeslaModel:CarModel:GeneratedByClaudeAI {
    name: 'Tesla Model S',
    introduced: date('2012-06-22'),
    featured: true,
    featuredInMovies: ['Interstellar Behind the Scenes'],
    featuredInYears: [2014],
    productPlacementCost: 0,
    vehicleType: 'Electric Sedan',
    maxSpeed: 322,
    maxSpeedUnit: 'km/h',
    manufactureLocation: 'Fremont, California',
    manufactureLocationLat: 37.4924,
    manufactureLocationLong: -121.9465
})
WITH 1 as dummy
MATCH (m:Movie:GeneratedByClaudeAI {title: 'Interstellar'}),
      (c:CarModel:GeneratedByClaudeAI {name: 'Tesla Model S'})
CREATE (c)-[:FEATURED_IN {
    screenTimeSeconds: 45,
    isProminentPlacement: false,
    sceneCount: 2,
    firstAppearance: time('00:32:15'),
    lastAppearance: time('01:45:22'),
    contractDate: date('2013-05-12')
}]->(m);

// Create prop node
CREATE (InceptionTotem:Prop:GeneratedByClaudeAI {
    name: 'Spinning Top',
    movie: 'Inception',
    material: 'Metal',
    weight: 0.12,
    weightUnit: 'kg',
    createdDate: date('2009-05-22'),
    screenTime: duration({minutes: 6, seconds: 45}),
    isIconic: true,
    auctionValue: 15000,
    copiesMade: 5
})
WITH 1 as dummy
MATCH (i:Movie:GeneratedByClaudeAI {title: 'Inception'}),
      (p:Prop:GeneratedByClaudeAI {name: 'Spinning Top'})
CREATE (p)-[:USED_IN {
    scenes: ['Opening', 'Hotel', 'Ending'],
    sceneCount: 3,
    firstAppearance: time('00:04:15'),
    lastAppearance: time('02:28:15'),
    isCloseup: true,
    significance: 'Critical plot device'
}]->(i);

// Create soundtrack node
CREATE (InterstellarSoundtrack:Soundtrack:GeneratedByClaudeAI {
    title: 'Interstellar: Original Motion Picture Soundtrack',
    composer: 'Hans Zimmer',
    released: date('2014-11-18'),
    duration: duration({minutes: 71, seconds: 49}),
    trackCount: 16,
    recordingStudio: 'Air Lyndhurst Hall, London',
    recordingStudioLat: 51.5454,
    recordingStudioLong: -0.1388,
    peakChartPosition: 2,
    salesUnits: 250000,
    streamingCount: 150000000
})
WITH 1 as dummy
MATCH (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'}),
      (s:Soundtrack:GeneratedByClaudeAI {title: 'Interstellar: Original Motion Picture Soundtrack'})
CREATE (s)-[:COMPOSED_FOR {
    contractDate: date('2013-01-15'),
    completion: date('2014-09-15'),
    nominatedAwards: ['Academy Award', 'BAFTA', 'Golden Globe'],
    wonAwards: ['BAFTA'],
    spotifyStreams: 250000000,
    youtubeViews: 45000000
}]->(i);

// Create location node
CREATE (IcelandLocation:FilmingLocation:GeneratedByClaudeAI {
    name: 'Svínafellsjökull',
    country: 'Iceland',
    region: 'Vatnajökull National Park',
    latitude: 64.0080,
    longitude: -16.3832,
    elevation: 120,
    elevationUnit: 'm',
    climate: 'Subarctic',
    permitCost: 85000,
    permitCurrency: 'USD',
    firstUsed: date('2013-09-25'),
    lastUsed: date('2013-10-12')
})
WITH 1 as dummy
MATCH (i:Movie:GeneratedByClaudeAI {title: 'Interstellar'}),
      (l:FilmingLocation:GeneratedByClaudeAI {name: 'Svínafellsjökull'})
CREATE (i)-[:FILMED_AT {
    startDate: date('2013-09-25'),
    endDate: date('2013-10-12'),
    sceneCount: 8,
    totalDays: 18,
    weatherDelayDays: 3,
    crewSize: 132,
    logisticsCost: 450000,
    accommodationCost: 320000,
    characterPresent: ['Cooper', 'Brand']
}]->(l);