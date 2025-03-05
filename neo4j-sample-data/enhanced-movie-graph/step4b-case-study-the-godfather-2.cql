// Add key producers for The Godfather
CREATE (AlbertRuddy:Person:GeneratedByClaudeAI {
    name: 'Albert S. Ruddy',
    born: 1930,
    birthdate: date('1930-03-28'),
    nationality: 'Canadian-American',
    oscarWins: 2,
    oscarNominations: 2,
    isActive: true,
    firstProduction: datetime('1965-09-15T00:00:00Z'),
    heightInMeters: 1.80,
    netWorth: 85000000,
    businessBackground: 'Construction and Architecture'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Albert S. Ruddy'})
SET p.languages = ['English', 'Italian']
SET p.production_titles = ['The Godfather', 'Million Dollar Baby', 'The Longest Yard']
SET p.production_years = [1972, 2004, 1974]
SET p.education = 'Brooklyn College, University of Southern California'
SET p.negotiation_style = 'Direct and persistent';

MATCH
  (a:Person:GeneratedByClaudeAI {name: 'Albert S. Ruddy'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (a)-[:PRODUCED {
    role: 'Primary Producer',
    contractSigned: date('1970-09-15'),
    budget_secured: 6000000,
    profit_percentage: 0.08,
    production_challenges: ['Studio interference', 'Casting battles', 'Location security', 'Budget constraints'],
    key_decisions: ['Supporting Coppola vision', 'Negotiating with real mafia figures', 'Managing studio expectations'],
    day_to_day_involvement: 'Very high',
    crisis_management: 'Essential buffer between director and studio',
    studio_relationship: 'Contentious but effective',
    marketing_input: 'Moderate',
    award_acceptance: 'Accepted Best Picture Oscar',
    career_impact: 'Defining project',
    production_company: 'Alfran Productions'
}]->(g);

CREATE (RobertEvans:Person:GeneratedByClaudeAI {
    name: 'Robert Evans',
    born: 1930,
    died: 2019,
    birthdate: date('1930-06-29'),
    deathdate: date('2019-10-26'),
    nationality: 'American',
    oscarNominations: 0,
    isActive: false,
    firstProduction: datetime('1967-05-15T00:00:00Z'),
    lastProduction: datetime('2003-11-25T00:00:00Z'),
    careerLength: duration({years: 36}),
    heightInMeters: 1.78,
    studioExecutive: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Robert Evans'})
SET p.languages = ['English']
SET p.studio_role = 'Head of Production, Paramount Pictures'
SET p.key_productions = ['The Godfather', 'Chinatown', 'Rosemary\'s Baby', 'Love Story']
SET p.production_years = [1972, 1974, 1968, 1970]
SET p.business_background = 'Actor turned executive';

MATCH
  (r:Person:GeneratedByClaudeAI {name: 'Robert Evans'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (r)-[:EXECUTIVE_PRODUCED {
    role: 'Head of Production at Paramount',
    authority_level: 'Final approval on major decisions',
    budget_approval: date('1970-08-10'),
    risk_assessment: 'High risk with high potential',
    studio_advocates: ['Peter Bart', 'Stanley Jaffe'],
    studio_opponents: ['Charles Bluhdorn', 'Frank Yablans'],
    key_contributions: ['Approving Coppola as director', 'Supporting Brando casting', 'Defending film runtime'],
    corporate_pressure_handling: 'Repeatedly risked position to protect film',
    marketing_strategies: ['Emphasize bestselling novel connection', 'Focus on family drama, not just crime'],
    boardroom_battles: 5,
    personal_stake: 'Reputation and career',
    retrospective_assessment: 'Career-defining decision'
}]->(g);

// Add Charles Bluhdorn as the Gulf+Western CEO (parent company of Paramount)
CREATE (CharlesBluhdorn:Person:GeneratedByClaudeAI {
    name: 'Charles Bluhdorn',
    born: 1926,
    died: 1983,
    birthdate: date('1926-09-13'),
    deathdate: date('1983-02-19'),
    nationality: 'Austrian-American',
    isActive: false,
    corporateRole: 'Chairman and CEO, Gulf+Western',
    heightInMeters: 1.75,
    netWorth: 100000000,
    businessBackground: 'Conglomerate building'
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Charles Bluhdorn'})
SET p.languages = ['English', 'German']
SET p.business_titles = ['Chairman', 'CEO', 'President']
SET p.business_entities = ['Gulf+Western', 'Paramount Pictures (parent company)', 'Madison Square Garden']
SET p.leadership_years = ['1956-1983']
SET p.acquisition_strategy = 'Aggressive conglomeration';

MATCH
  (c:Person:GeneratedByClaudeAI {name: 'Charles Bluhdorn'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (c)-[:CORPORATE_OVERSIGHT {
    company_role: 'Chairman and CEO of Gulf+Western (Paramount parent)',
    investment_approval: true,
    budget_concerns: 'Significant initial skepticism',
    profit_expectations: 'Limited initial expectations',
    corporate_interference: 'Several attempts to redirect project',
    key_interventions: ['Initial opposition to Coppola', 'Questioning Brando insurance', 'Budget limitation enforcement'],
    quarterly_reports_impact: 'Monitored project as significant financial risk',
    executive_chain: 'Bluhdorn → Frank Yablans → Robert Evans → Albert Ruddy',
    reaction_to_success: 'Claimed credit in annual report',
    financial_analysis_commissioned: 'Return-on-investment case study',
    shareholder_communication: 'Highlighted in 1972 annual report',
    corporate_strategy_impact: 'Influenced future film investment strategy'
}]->(g);

// Add Peter Bart as development executive
CREATE (PeterBart:Person:GeneratedByClaudeAI {
    name: 'Peter Bart',
    born: 1932,
    birthdate: date('1932-07-24'),
    nationality: 'American',
    isActive: false,
    firstPosition: datetime('1967-08-15T00:00:00Z'),
    heightInMeters: 1.79,
    executiveRole: 'Paramount Pictures VP of Production',
    journalismBackground: true,
    tradePublicationLeadership: true
})
WITH 1 as dummy
MATCH (p:Person:GeneratedByClaudeAI {name: 'Peter Bart'})
SET p.languages = ['English']
SET p.career_positions = ['Paramount Pictures executive', 'New York Times reporter', 'Variety Editor-in-Chief']
SET p.position_years = ['1967-1975', '1961-1967', '1989-2009']
SET p.key_developments = ['The Godfather', 'Harold and Maude', 'Paper Moon']
SET p.development_years = [1972, 1971, 1973];

MATCH
  (p:Person:GeneratedByClaudeAI {name: 'Peter Bart'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (p)-[:DEVELOPED {
    executive_role: 'Vice President of Production at Paramount',
    project_champion: true,
    book_rights_advocate: true,
    development_start: date('1969-07-10'),
    novel_acquisition: date('1969-03-10'),
    price_negotiated: 12500,
    price_currency: 'USD',
    key_negotiations: ['Novel rights', 'Coppola contract', 'Budget approvals'],
    director_selection_influence: 'Strongly advocated for Coppola after others declined',
    script_development_supervision: 'Multiple drafts reviewed',
    project_timeline_oversight: 'Maintained pressure for timely delivery',
    production_notes_provided: 'Extensive screenplay feedback',
    internal_advocacy: 'Crucial support within Paramount hierarchy',
    creative_insights: 'Recognized potential despite commercial risk'
}]->(g);

// Add Paramount Pictures as the main studio
CREATE (ParamountPictures:Studio:GeneratedByClaudeAI {
    name: 'Paramount Pictures Corporation',
    founded: date('1912-05-08'),
    reorganized: date('1966-10-19'),
    headquartersLat: 34.0841,
    headquartersLong: -118.3213,
    yearlyRevenue1971: 96000000,
    yearlyRevenue1972: 129000000,
    yearlyRevenue1973: 152000000,
    filmReleases1972: 18,
    totalStudioLots: 2,
    totalSoundstages: 30,
    employeeCount: 2450,
    parentCompany: 'Gulf+Western Industries'
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures Corporation'})
SET s.subsidiaries = ['Paramount Television', 'Famous Music', 'Paramount Home Entertainment']
SET s.distribution_markets = ['Global']
SET s.studioLotsLat = [34.0841, 40.7590]
SET s.studioLotsLong = [-118.3213, -73.9845]
SET s.chairmen_history = ['Adolph Zukor', 'Barney Balaban', 'Charles Bluhdorn']
SET s.production_heads = ['Robert Evans', 'Frank Yablans', 'Barry Diller']
SET s.mountain_logo = true;

MATCH
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures Corporation'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (p)-[:STUDIO_PRODUCED {
    project_greenlight: date('1970-08-10'),
    total_investment: 6000000,
    return: 245066411,
    roi: 40.84,
    production_account: 'PA-GF-1971-001',
    financial_risk_assessment: 'High',
    completion_guarantor: 'Film Finances, Inc.',
    insurance_underwriter: 'Lloyd\'s of London',
    special_insurance: 'Marlon Brando health policy',
    production_facilities_provided: ['Soundstages 14-16', 'Backlot streets', 'Editing suites'],
    distribution_commitment: 'Wide national release',
    marketing_budget_initial: 1000000,
    marketing_budget_expanded: 1500000,
    theatrical_distribution_strategy: 'Platform release expanding to wide',
    corporate_tension: 'Significant throughout production',
    profit_participants: ['Coppola', 'Puzo', 'Brando', 'Paramount executives'],
    profit_sharing_tiers: ['First dollar gross', 'Net profit', 'Backend points']
}]->(g);

// Add Alfran Productions as the production company
CREATE (AlfranProductions:Studio:GeneratedByClaudeAI {
    name: 'Alfran Productions',
    founded: date('1970-06-15'),
    headquarters: 'Los Angeles',
    headquartersLat: 34.0522,
    headquartersLong: -118.2437,
    employeeCount: 8,
    annualBudget: 6500000,
    companyType: 'Independent Production Company',
    namedFor: 'Albert Francis Ruddy',
    parentCompany: null,
    officeSpace: 1200,
    officeSpaceUnit: 'square feet'
})
WITH 1 as dummy
MATCH (s:Studio:GeneratedByClaudeAI {name: 'Alfran Productions'})
SET s.production_titles = ['The Godfather', 'The Longest Yard', 'Matilda']
SET s.production_years = [1972, 1974, 1978]
SET s.studio_partnerships = ['Paramount Pictures', 'Columbia Pictures']
SET s.founded_for = 'The Godfather production'
SET s.company_structure = 'S-Corporation';

MATCH
  (a:Studio:GeneratedByClaudeAI {name: 'Alfran Productions'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (a)-[:PRODUCTION_COMPANY_FOR {
    contract_signed: date('1970-06-15'),
    legal_entity_type: 'Special Purpose Vehicle',
    paramount_deal_terms: 'Negative pickup arrangement',
    company_formed_for_film: true,
    production_staff: 8,
    overhead_budget: 450000,
    office_location: 'Paramount lot, bungalow C',
    company_responsibilities: ['Physical production', 'Budget management', 'Location logistics', 'Cast and crew contracts'],
    liability_coverage: 10000000,
    completion_bond: 6500000,
    production_bank: 'Bank of America',
    production_account_number: 'GF-7172-AP',
    signatory_status: 'Full unions signatory',
    cost_reporting_frequency: 'Weekly',
    paramount_oversight_level: 'High'
}]->(g);

// Add Gulf+Western as the parent corporation
CREATE (GulfWestern:Business:GeneratedByClaudeAI {
    name: 'Gulf+Western Industries',
    founded: date('1956-09-15'),
    acquired_paramount: date('1966-10-19'),
    headquartersLat: 40.7484,
    headquartersLong: -73.9857,
    employees: 100000,
    annualRevenue1972: 3500000000,
    marketValueUSD1972: 1750000000,
    publiclyTraded: true,
    tickerSymbol: 'GW',
    ceoCompensation: 450000,
    globalOperations: 35,
    diversificationLevel: 'Extreme',
    conglomerateStructure: true
})
WITH 1 as dummy
MATCH (b:Business:GeneratedByClaudeAI {name: 'Gulf+Western Industries'})
SET b.business_sectors = ['Entertainment', 'Manufacturing', 'Financial Services', 'Automotive', 'Sugar Production']
SET b.key_subsidiaries = ['Paramount Pictures', 'Madison Square Garden', 'Simon & Schuster', 'Consolidated Cigar', 'New Jersey Zinc']
SET b.annual_reports = [1967, 1968, 1969, 1970, 1971, 1972, 1973]
SET b.ceo_tenure = '1956-1983'
SET b.acquisition_strategy = 'Aggressive conglomeration';

MATCH
  (g:Business:GeneratedByClaudeAI {name: 'Gulf+Western Industries'}),
  (p:Studio:GeneratedByClaudeAI {name: 'Paramount Pictures Corporation'})
CREATE (g)-[:CORPORATE_PARENT_OF {
    acquisition_date: date('1966-10-19'),
    acquisition_price: 125000000,
    price_currency: 'USD',
    ownership_percentage: 100.0,
    board_seats: 5,
    corporate_representatives: ['Charles Bluhdorn', 'David Judelson', 'Martin Davis'],
    annual_investment: 50000000,
    profit_expectation: 15.5,
    expectation_unit: 'Percentage',
    quarterly_reviews: 4,
    financial_reporting_requirements: 'Extensive',
    autonomy_level: 'Moderate',
    capital_allocation_committee: 'Yes',
    investment_approval_threshold: 1000000,
    corporate_synergy_requirements: 'Limited',
    conglomerate_portfolio_position: 'Prestige acquisition'
}]->(p);

MATCH
  (g:Business:GeneratedByClaudeAI {name: 'Gulf+Western Industries'}),
  (gf:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (g)-[:ULTIMATE_OWNER {
    investment_category: 'Entertainment division capital expenditure',
    board_approval: date('1970-07-15'),
    financial_oversight: 'Quarterly review',
    risk_assessment: 'High risk, high potential return',
    corporate_resources_allocated: 'Studio facilities and distribution network',
    project_code: 'PAR-71-GF',
    quarterly_reports_mentioned: 4,
    annual_report_highlight: 'Featured in 1972 shareholder letter',
    stock_impact: 'Positive after release',
    conglomerate_synergy_attempts: 'Book publishing division promotion',
    executive_visits: 3,
    shareholder_questions: 'Addressed in 1972 annual meeting',
    financial_impact_rating: 'Significant to entertainment division',
    corporate_prestige_factor: 'Major enhancement to corporate image'
}]->(gf);

// Add detailed budget breakdown for The Godfather
CREATE (GodfatherBudget:FinancialRecord:GeneratedByClaudeAI {
    name: 'The Godfather Budget',
    created: date('1970-09-15'),
    finalized: date('1971-02-28'),
    total_amount: 6000000,
    currency: 'USD',
    accounting_standard: 'Film industry standard',
    line_items: 215,
    revisions: 12,
    final_approval: date('1971-03-01'),
    tracking_system: 'Weekly variance reports',
    accounting_firm: 'Price Waterhouse',
    audit_status: 'Fully audited',
    preservation_status: 'Paramount financial archives'
})
WITH 1 as dummy
MATCH (f:FinancialRecord:GeneratedByClaudeAI {name: 'The Godfather Budget'})
SET f.department_allocations = ['Cast', 'Crew', 'Sets', 'Locations', 'Wardrobe', 'Transportation', 'Post-production', 'Music']
SET f.department_amounts = [1300000, 1100000, 800000, 950000, 350000, 400000, 600000, 500000]
SET f.contingency_amount = 500000
SET f.completion_bond = 450000
SET f.insurance_costs = 350000
SET f.major_overages = ['Sicily location', 'Extended shooting schedule', 'Special effects']
SET f.overage_amounts = [175000, 225000, 125000];

MATCH
  (f:FinancialRecord:GeneratedByClaudeAI {name: 'The Godfather Budget'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (f)-[:FINANCIAL_PLAN_FOR {
    prepared_by: 'Paramount Pictures Financial Affairs',
    authorized_by: 'Robert Evans, Albert S. Ruddy',
    initial_budget: 4500000,
    final_budget: 6000000,
    actual_spend: 6200000,
    variance_percentage: 3.33,
    cost_overrun_approval: date('1971-07-10'),
    cost_categories: ['Above-the-line', 'Below-the-line', 'Post-production', 'Other'],
    category_allocations: [2500000, 2300000, 700000, 500000],
    key_talent_costs: ['Brando: $50,000 + points', 'Pacino: $35,000', 'Caan: $35,000'],
    set_construction_costs: 625000,
    location_fees: 345000,
    transportation_logistics: 285000,
    daily_shooting_costs: 42000,
    accounting_code: 'PAR-71-GF-FIN',
    financial_reporting_cycle: 'Weekly with monthly summaries',
    studio_overhead_allocation: 750000,
    distribution_advance: 1500000
}]->(g);

// Add box office performance details
CREATE (GodfatherBoxOffice:FinancialRecord:GeneratedByClaudeAI {
    name: 'The Godfather Box Office Performance',
    created: date('1972-12-31'),
    updated: date('1975-06-30'),
    total_amount: 245066411,
    currency: 'USD',
    accounting_standard: 'MPAA reporting standards',
    line_items: 45,
    revisions: 8,
    final_certification: date('1975-07-15'),
    tracking_system: 'Paramount distribution reports',
    accounting_firm: 'Price Waterhouse',
    audit_status: 'Fully audited',
    preservation_status: 'Paramount financial archives'
})
WITH 1 as dummy
MATCH (f:FinancialRecord:GeneratedByClaudeAI {name: 'The Godfather Box Office Performance'})
SET f.revenue_streams = ['Domestic theatrical', 'International theatrical', 'Re-releases', 'Television rights', 'Early ancillary']
SET f.revenue_amounts = [134966411, 110100000, 5000000, 12000000, 8000000]
SET f.top_markets = ['United States', 'United Kingdom', 'France', 'Italy', 'Japan', 'Germany']
SET f.market_revenues = [129966411, 18500000, 16200000, 15800000, 14600000, 13500000]
SET f.theatrical_runs = 3
SET f.peak_theaters = 1150
SET f.weeks_in_release = 78;

MATCH
  (f:FinancialRecord:GeneratedByClaudeAI {name: 'The Godfather Box Office Performance'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (f)-[:FINANCIAL_PERFORMANCE_OF {
    tracking_start: date('1972-03-24'),
    tracking_end: date('1975-06-30'),
    opening_weekend: 302393,
    opening_theaters: 5,
    platform_release: true,
    wide_release_date: date('1972-04-07'),
    wide_release_theaters: 316,
    peak_weekly_gross: 5263765,
    weeks_at_number_one: 8,
    domestic_total: 134966411,
    international_total: 110100000,
    distribution_fee_percentage: 30,
    exhibitor_split_percentage: 55,
    profit_calculation_method: 'Standard distribution waterfall',
    profit_participants: ['Paramount', 'Producers', 'Director', 'Key cast', 'Mario Puzo'],
    profit_tiers: ['First dollar gross', 'Adjusted gross', 'Net profit'],
    breakeven_date: date('1972-05-12'),
    profit_participation_payments: 25000000,
    studio_net_profit: 115000000
}]->(g);

// Add theatrical distribution details
CREATE (GodfatherDistribution:DistributionPlan:GeneratedByClaudeAI {
    name: 'The Godfather Theatrical Distribution Strategy',
    created: date('1971-12-15'),
    implemented: date('1972-03-24'),
    territories: 62,
    domestic_theaters_initial: 5,
    domestic_theaters_wide: 316,
    international_territories: 61,
    language_versions: 32,
    subtitled_versions: 38,
    dubbed_versions: 20,
    print_count_domestic: 350,
    print_count_international: 850,
    marketing_territories: 45
})
WITH 1 as dummy
MATCH (d:DistributionPlan:GeneratedByClaudeAI {name: 'The Godfather Theatrical Distribution Strategy'})
SET d.release_strategy = 'Platform release expanding to wide'
SET d.key_markets = ['United States', 'Canada', 'United Kingdom', 'France', 'Italy', 'Japan', 'Germany']
SET d.release_dates = ['1972-03-24', '1972-03-24', '1972-08-24', '1972-10-18', '1972-09-14', '1972-12-09', '1972-09-28']
SET d.censorship_issues = ['Italy', 'Spain', 'South Korea', 'Philippines']
SET d.distribution_partners = ['United International Pictures', 'CIC']
SET d.theatrical_windows = 'Extended due to popularity';

MATCH
  (d:DistributionPlan:GeneratedByClaudeAI {name: 'The Godfather Theatrical Distribution Strategy'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (d)-[:DISTRIBUTION_STRATEGY_FOR {
    plan_architect: 'Frank Yablans, Paramount Distribution',
    release_pattern: 'Platform release with slow geographic expansion',
    initial_markets: ['New York', 'Los Angeles', 'Chicago', 'San Francisco', 'Boston'],
    expansion_timeline: 'Weekly addition of top 10 markets',
    nationwide_date: date('1972-04-07'),
    print_strategy: 'Limited initial with expansion as demand proven',
    theaters_targeted: 'Premium first-run venues with prestige positioning',
    booking_approach: 'Reserved seating in select venues',
    run_length_guarantee: 'Minimum 4 weeks with extension options',
    exhibition_terms: '90/10 first week, 80/20 second week, 70/30 third week, 60/40 thereafter',
    international_strategy: 'Major European markets 4-6 months after US',
    censorship_negotiations: 'Significant in catholic countries',
    release_pattern_success_metrics: 'Word-of-mouth amplification, sustained weekly grosses',
    distribution_team_size: 85,
    logistics_base: 'Paramount distribution headquarters, New York'
}]->(g);

// Add marketing campaign details
CREATE (GodfatherMarketing:MarketingCampaign:GeneratedByClaudeAI {
    name: 'The Godfather Marketing Campaign',
    created: date('1971-10-15'),
    launched: date('1972-01-15'),
    completed: date('1972-06-30'),
    total_budget: 1500000,
    currency: 'USD',
    target_demographics: 'Adult males 18-49, secondary adult females 25-54',
    markets: 'National with urban emphasis',
    creative_agencies: 3,
    media_buyers: 2,
    publicists: 8,
    press_events: 12,
    premieres: 5,
    awards_campaign: true,
    taglines: 4
})
WITH 1 as dummy
MATCH (m:MarketingCampaign:GeneratedByClaudeAI {name: 'The Godfather Marketing Campaign'})
SET m.marketing_channels = ['Print', 'Television', 'Radio', 'Outdoor', 'Theatrical trailers', 'Press coverage']
SET m.channel_allocation = [350000, 450000, 200000, 150000, 100000, 250000]
SET m.key_publications = ['New York Times', 'Time Magazine', 'Variety', 'Hollywood Reporter', 'Life Magazine']
SET m.tv_networks = ['ABC', 'CBS', 'NBC']
SET m.key_visuals = ['Marlon Brando portrait', 'Puppet strings logo', 'Wedding scene']
SET m.campaign_phases = ['Teaser', 'Novel connection', 'Critical acclaim', 'Awards push'];

MATCH
  (m:MarketingCampaign:GeneratedByClaudeAI {name: 'The Godfather Marketing Campaign'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (m)-[:MARKETED {
    campaign_director: 'Martin Davis, Paramount VP Marketing',
    primary_tagline: 'The Godfather - the most anticipated film of the year',
    secondary_tagline: 'An offer you can\'t refuse',
    campaign_concept: 'Prestige literary adaptation with star power',
    key_art_development: 'Puppet strings concept with strong Brando imagery',
    media_strategy: 'Heavy emphasis on print media and selective television',
    publicity_focus: 'Brando comeback, literary source, Italian-American saga',
    controversy_management: 'Italian-American civic groups concerns addressed',
    preview_screenings: 25,
    media_impressions: 250000000,
    press_coverage_inches: 14500,
    tv_spot_count: 12,
    radio_spot_count: 24,
    newspaper_insertions: 450,
    magazine_insertions: 65,
    billboard_locations: 35,
    premiere_strategy: 'Exclusive New York opening with celebrity attendance',
    promotional_partnerships: 'Fawcett Books (novel tie-in)',
    merchandising_limited: 'Minimal due to adult theme'
}]->(g);

// Add film investment structure
CREATE (GodfatherFinancing:FinancialStructure:GeneratedByClaudeAI {
    name: 'The Godfather Production Financing',
    created: date('1970-08-15'),
    executed: date('1970-09-20'),
    total_amount: 6000000,
    currency: 'USD',
    structure_type: 'Studio financing with completion bond',
    primary_investor: 'Paramount Pictures (Gulf+Western)',
    secondary_investors: 'None',
    gap_financing: 'None',
    tax_structures: 'Standard US production',
    completion_guarantor: 'Film Finances, Inc.',
    banking_partner: 'Bank of America',
    legal_counsel: 'Paramount legal department'
})
WITH 1 as dummy
MATCH (f:FinancialStructure:GeneratedByClaudeAI {name: 'The Godfather Production Financing'})
SET f.funding_sources = ['Studio equity', 'Distribution advances', 'Foreign pre-sales']
SET f.funding_amounts = [4500000, 1000000, 500000]
SET f.financial_triggers = ['Script approval', 'Cast approval', 'Production commencement', 'Rough cut delivery']
SET f.trigger_payments = [500000, 1500000, 3000000, 1000000]
SET f.recoupment_priority = ['Distribution expenses', 'Negative cost', 'Studio overhead', 'Profit participants']
SET f.risk_mitigation = 'Full completion bond with contingency';

MATCH
  (f:FinancialStructure:GeneratedByClaudeAI {name: 'The Godfather Production Financing'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (f)-[:FINANCED {
    deal_structure: 'Studio financing with negative pickup',
    financing_method: 'Direct studio investment from Gulf+Western capital allocation',
    funding_approvals: 'Corporate investment committee and studio head',
    payment_schedule: 'Pre-production, principal photography, post-production phases',
    cash_flow_management: 'Weekly disbursement against approved budget',
    financial_controls: 'Daily cost reports, weekly variance analysis',
    completion_guarantee: 'Full guarantee with studio as beneficiary',
    insurance_coverage: 'Cast, negative, props, general liability, errors and omissions',
    currency_hedging: 'Forward contracts for Italian lira during Sicily filming',
    tax_considerations: 'Standard US production without special incentives',
    profit_definition: 'Standard distribution waterfall with negotiated definitions',
    financial_reporting_requirements: 'Weekly to Paramount, monthly to Gulf+Western',
    audit_rights: 'Studio, completion guarantor, and profit participants',
    banking_relationships: 'Production account through Bank of America',
    financial_close_process: 'Final cost report and audit completed November 1972'
}]->(g);

// Add contracts and negotiations
CREATE (GodfatherContracts:LegalDocument:GeneratedByClaudeAI {
    name: 'The Godfather Key Contracts Collection',
    created: date('1970-08-01'),
    executed: date('1971-02-28'),
    document_count: 287,
    pages_total: 1450,
    signatories: 312,
    amendments: 45,
    legal_jurisdictions: 5,
    governing_law: 'California',
    dispute_mechanisms: 'Arbitration with JAMS',
    confidentiality_level: 'High',
    storage_location: 'Paramount legal archives'
})
WITH 1 as dummy
MATCH (l:LegalDocument:GeneratedByClaudeAI {name: 'The Godfather Key Contracts Collection'})
SET l.contract_types = ['Employment', 'Rights acquisitions', 'Location agreements', 'Distribution', 'Licensing']
SET l.contract_counts = [145, 38, 52, 12, 40]
SET l.key_signatories = ['Paramount Pictures', 'Francis Ford Coppola', 'Mario Puzo', 'Marlon Brando', 'Al Pacino']
SET l.legal_disputes = 2
SET l.dispute_resolutions = ['Settlement', 'Arbitration ruling']
SET l.template_sources = ['Paramount standard agreements', 'WGA agreements', 'SAG agreements'];

MATCH
  (l:LegalDocument:GeneratedByClaudeAI {name: 'The Godfather Key Contracts Collection'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (l)-[:LEGAL_FRAMEWORK_FOR {
    chief_counsel: 'Barry Langberg, Paramount Pictures',
    key_agreements: ['Novel rights acquisition', 'Director employment', 'Cast agreements', 'Production services', 'Distribution'],
    novel_rights_acquired: date('1969-03-10'),
    rights_purchase_price: 12500,
    rights_additional_terms: 'Percentage of net profits, sequel rights options',
    director_contract_executed: date('1970-09-05'),
    director_compensation: '$125,000 plus 6% of net profits',
    brando_contract_special_terms: '$50,000 plus $50,000 bonus and percentage of gross',
    pacino_contract_negotiations: 'Lengthy with multiple screen tests required',
    pacino_final_terms: '$35,000 with small percentage of profits',
    guild_agreements: 'WGA, DGA, SAG, IATSE, Teamsters',
    completion_guarantor_contract: 'Film Finances, Inc. - standard terms',
    location_agreement_challenges: 'New York permits required political intervention',
    music_rights_clearances: 'Extensive for wedding sequence',
    contract_execution_timeline: 'Accelerated to meet production schedule',
    legal_department_staffing: '4 attorneys dedicated to production',
    rights_chain_documentation: 'Complete with title clearance report'
}]->(g);

// Add production logistics details
CREATE (GodfatherLogistics:ProductionLogistics:GeneratedByClaudeAI {
    name: 'The Godfather Production Logistics',
    created: date('1970-11-15'),
    implemented: date('1971-03-29'),
    completed: date('1971-08-07'),
    total_shooting_days: 93,
    locations: 14,
    soundstages: 4,
    cast_members: 110,
    crew_size: 120,
    extras_total: 450,
    vehicles_used: 85,
    equipment_vendors: 35,
    catering_services: 2,
    hotel_room_nights: 4500
})
WITH 1 as dummy
MATCH (p:ProductionLogistics:GeneratedByClaudeAI {name: 'The Godfather Production Logistics'})
SET p.location_types = ['Urban streets', 'Estates', 'Sound stages', 'Restaurants', 'Churches', 'International']
SET p.location_shooting_days = [35, 12, 24, 8, 5, 9]
SET p.primary_locations = ['New York City', 'Long Island', 'Los Angeles', 'Sicily']
SET p.location_days = [28, 14, 45, 6]
SET p.transportation_fleet = ['Cast cars', 'Crew vans', 'Equipment trucks', 'Period vehicles', 'Production RVs']
SET p.fleet_counts = [12, 8, 15, 32, 4];

MATCH
  (p:ProductionLogistics:GeneratedByClaudeAI {name: 'The Godfather Production Logistics'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (p)-[:OPERATIONS_FOR {
    production_manager: 'Fred Gallo',
    first_assistant_director: 'Fred Roos',
    location_manager: 'Robert Greenhut',
    shooting_schedule: 'March 29, 1971 to August 7, 1971',
    shooting_order: 'Non-sequential based on location availability',
    company_moves: 26,
    daily_call_times: '6:00 AM typical',
    average_wrap_time: '7:30 PM typical',
    overtime_frequency: '35% of shooting days',
    weather_delays: 9,
    crew_composition: 'Union with Italian specialists',
    equipment_package: 'Panavision cameras with extensive lighting',
    dailies_review: 'Evening screenings at Paramount',
    security_concerns: 'High in New York locations',
    mafia_interactions: 'Several unofficially documented',
    permit_challenges: 'Significant in New York',
    sicily_logistics: 'Challenging with limited infrastructure',
    production_office_locations: ['Paramount Studios', 'New York location office'],
    communication_systems: 'Pre-mobile era with runners and radios',
    catering_approach: 'Full Italian meals featured',
    transportation_coordination: 'Complex for period vehicles and equipment',
    accommodation_strategy: 'Hotels near location clusters',
    insurance_claims: 3,
    safety_incidents: 'Minor only'
}]->(g);

// Add international distribution partners
CREATE (InternationalDistribution:DistributionNetwork:GeneratedByClaudeAI {
    name: 'The Godfather International Distribution Network',
    established: date('1971-12-10'),
    activated: date('1972-03-24'),
    territories: 62,
    distribution_partners: 24,
    language_versions: 32,
    subtitled_markets: 38,
    dubbed_markets: 20,
    censorship_challenges: 8,
    material_delivery_date: date('1972-02-15'),
    international_prints: 850,
    marketing_localization: 42,
    box_office_reporting: 'Weekly'
})
WITH 1 as dummy
MATCH (d:DistributionNetwork:GeneratedByClaudeAI {name: 'The Godfather International Distribution Network'})
SET d.key_markets = ['United Kingdom', 'France', 'Italy', 'Germany', 'Japan', 'Australia', 'Brazil', 'Mexico']
SET d.market_distributors = ['CIC', 'Paramount France', 'Dear Film', 'CIC Germany', 'Toho-Towa', 'CIC Australia', 'Paramount Brazil', 'Paramount Mexico']
SET d.release_dates = ['1972-08-24', '1972-10-18', '1972-09-14', '1972-09-28', '1972-12-09', '1972-08-30', '1972-11-02', '1972-10-05']
SET d.censorship_countries = ['Italy', 'Spain', 'Ireland', 'South Korea', 'Philippines', 'South Africa', 'Brazil', 'Argentina']
SET d.censorship_issues = ['Violence', 'Crime glorification', 'Religious disrespect', 'Language', 'Sexual content']
SET d.international_awards = 35;

MATCH
  (d:DistributionNetwork:GeneratedByClaudeAI {name: 'The Godfather International Distribution Network'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (d)-[:DISTRIBUTED {
    distribution_head: 'Frank Yablans, Paramount International',
    global_strategy: 'Staggered release focusing on major territories first',
    distribution_model: 'Studio-owned distribution in major markets, sub-distributors in smaller territories',
    revenue_split_structure: 'Varied by territory, averaging 35-40% to distributor',
    materials_provided: ['35mm prints', 'Marketing materials', 'Press kits', 'Publicity stills'],
    subtitle_quality_control: 'Rigorous with cultural consultants',
    dubbing_supervision: 'Director-approved voice casting in major markets',
    censorship_negotiation_strategy: 'Minimal cuts with alternative versions prepared',
    international_premiere_approach: 'Major festival launches where possible',
    european_distribution_headquarters: 'London with Paris satellite',
    asian_distribution_headquarters: 'Tokyo',
    latin_american_coordination: 'Mexico City',
    box_office_collection_methods: 'On-ground auditors in key markets',
    currency_repatriation_challenges: 'Significant in developing markets',
    piracy_protection_measures: 'Print serialization and security',
    international_critical_reception: 'Overwhelmingly positive',
    cultural_impact_variance: 'Strongest in Italy, significant worldwide'
}]->(g);

// Add the production insurance policy
CREATE (GodfatherInsurance:InsurancePolicy:GeneratedByClaudeAI {
    name: 'The Godfather Production Insurance Package',
    issued: date('1971-02-15'),
    effective: date('1971-03-01'),
    expiration: date('1971-12-31'),
    premium_total: 350000,
    currency: 'USD',
    underwriter: 'Lloyd\'s of London',
    broker: 'Marsh & McLennan',
    policy_number: 'PP-GF-7172-001',
    coverage_limit: 12000000,
    deductible: 50000,
    claims_filed: 3,
    claims_paid: 2,
    claims_total: 85000
})
WITH 1 as dummy
MATCH (i:InsurancePolicy:GeneratedByClaudeAI {name: 'The Godfather Production Insurance Package'})
SET i.coverage_types = ['Cast insurance', 'Negative insurance', 'Props & sets', 'Third-party liability', 'Workers compensation', 'E&O insurance']
SET i.coverage_limits = [5000000, 2000000, 1500000, 2000000, 1000000, 500000]
SET i.special_endorsements = ['Marlon Brando health', 'Sicily filming', 'Vintage automobiles', 'Period weapons']
SET i.premium_allocations = [120000, 85000, 60000, 40000, 25000, 20000]
SET i.excluded_risks = ['War', 'Nuclear incident', 'Intentional damage', 'Pre-existing conditions']
SET i.policy_extensions = 2;

MATCH
  (i:InsurancePolicy:GeneratedByClaudeAI {name: 'The Godfather Production Insurance Package'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (i)-[:INSURED {
    policy_holder: 'Paramount Pictures/Alfran Productions',
    additional_insureds: ['Cast members', 'Key crew', 'Location owners', 'Equipment vendors'],
    special_risk_assessment: 'High-profile production with multiple risk factors',
    brando_medical_examination: date('1971-02-20'),
    medical_underwriting: 'Extensive for lead actors',
    location_risk_surveys: 'Completed for all shooting locations',
    script_breakdown_analysis: 'Scene-by-scene risk assessment',
    stunt_coordination_review: 'Pre-approved with safety protocols',
    completion_bond_integration: 'Coordinated coverage with Film Finances, Inc.',
    claim_incidents: ['Minor set damage', 'Equipment theft', 'Weather delay'],
    claim_resolutions: ['Paid in full', 'Paid partial', 'Denied'],
    policy_adjustments: 'Extended twice for post-production',
    premium_payment_schedule: 'Quarterly with final audit',
    certificate_holders: 15,
    international_coverage_extensions: 'Special rider for Sicily',
    coverage_territories: 'Worldwide with notification requirements',
    exclusions_negotiated: 'Reduced war risk exclusion for Sicily',
    risk_management_program: 'Weekly safety meetings and reports'
}]->(g);

// Add archive and preservation details
CREATE (GodfatherPreservation:ArchiveRecord:GeneratedByClaudeAI {
    name: 'The Godfather Preservation Project',
    established: date('1990-05-15'),
    updated: date('2020-09-30'),
    materials_cataloged: 1450,
    physical_elements: 385,
    digital_elements: 1065,
    storage_locations: 4,
    climate_controlled: true,
    disaster_recovery_plan: true,
    access_level: 'Restricted',
    scholarly_access: 'By application',
    public_exhibitions: 15,
    restoration_projects: 4,
    preservation_budget: 1750000,
    historical_designation: 'National Film Registry'
})
WITH 1 as dummy
MATCH (a:ArchiveRecord:GeneratedByClaudeAI {name: 'The Godfather Preservation Project'})
SET a.material_types = ['Original negative', 'Camera reports', 'Sound elements', 'Continuity photos', 'Production documents', 'Marketing materials']
SET a.material_counts = [15, 125, 85, 450, 650, 125]
SET a.storage_facilities = ['Paramount Archives', 'Library of Congress', 'Academy Film Archive', 'Eastman House']
SET a.restoration_years = [1997, 2007, 2015, 2022]
SET a.restoration_technologies = ['Photochemical', 'Digital 2K', 'Digital 4K', 'Digital 4K HDR']
SET a.access_requests_annual = 45;

MATCH
  (a:ArchiveRecord:GeneratedByClaudeAI {name: 'The Godfather Preservation Project'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (a)-[:PRESERVES {
    preservation_status: 'Full archival protection',
    original_negative_condition: 'Good with some deterioration addressed',
    preservation_elements_created: 'Multiple fine grain masters and digital masters',
    digital_scan_resolution: '4K from original negative',
    color_timing_reference: 'Gordon Willis approved timing lights',
    audio_preservation: 'Original magnetic stems to digital',
    paper_materials_digitization: '100% with acid-free storage of originals',
    conservation_treatments: 'Completed with minimal intervention philosophy',
    access_copies_available: 'Various formats for approved researchers',
    rights_documentation: 'Comprehensive with chain of title',
    cultural_significance_documentation: 'Extensive scholarly analysis',
    technical_history_documentation: 'Complete production technology context',
    restoration_philosophy: 'Maintain original artistic intent',
    director_involvement: 'Francis Ford Coppola approved final restorations',
    cinematographer_consultation: 'Gordon Willis consulted until his death',
    registered_cultural_heritage: 'Multiple national registries',
    preservation_partners: 'Major film archives and Paramount',
    future_preservation_plan: 'Ongoing monitoring with technology migration'
}]->(g);

// Add labor relations and union agreements
CREATE (GodfatherLaborRelations:LaborAgreement:GeneratedByClaudeAI {
    name: 'The Godfather Union Agreements',
    negotiated: date('1970-12-15'),
    effective: date('1971-03-01'),
    expiration: date('1971-12-31'),
    signatory_unions: 6,
    total_union_members: 168,
    grievances_filed: 3,
    grievances_resolved: 3,
    work_stoppages: 0,
    contract_variations: 12,
    payroll_service: 'Cast & Crew',
    compliance_audit: date('1972-02-15'),
    pension_contributions: 187500,
    health_contributions: 224000
})
WITH 1 as dummy
MATCH (l:LaborAgreement:GeneratedByClaudeAI {name: 'The Godfather Union Agreements'})
SET l.union_agreements = ['Directors Guild of America', 'Screen Actors Guild', 'Writers Guild of America', 'IATSE', 'Teamsters', 'Musicians Union']
SET l.agreement_variations = ['Extended hours', 'Location premiums', 'International provisions', 'Period costume allowances']
SET l.payroll_categories = ['Cast', 'Director/Producers', 'Below-the-line', 'Writers', 'Musicians']
SET l.payroll_totals = [1850000, 450000, 2200000, 250000, 85000]
SET l.overtime_hours = 2450
SET l.meal_penalties = 185;

MATCH
  (l:LaborAgreement:GeneratedByClaudeAI {name: 'The Godfather Union Agreements'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (l)-[:LABOR_FRAMEWORK_FOR {
    signatory_production_company: 'Alfran Productions',
    guarantor: 'Paramount Pictures',
    labor_relations_director: 'Michael Eisner, Paramount VP',
    union_business_representatives: ['DGA: Joe Riley', 'SAG: Chester Davis', 'IATSE: Thomas Short'],
    special_conditions_negotiated: ['Extended shooting days in New York', 'Italian location provisions', 'Second unit arrangements'],
    work_rules_modifications: 'Turnaround adjustments for night shooting',
    international_travel_accommodations: 'Business class for key personnel',
    per_diem_rates: 'Standard plus location adjustments',
    pension_and_health_calculations: 'Standard guild formulas',
    working_condition_provisions: 'Era-appropriate with safety considerations',
    grievance_procedure: 'Standard with production-specific representatives',
    jurisdictional_agreements: 'Clear delineation between crafts',
    credit_requirements: 'Guild standard with negotiated exceptions',
    residual_structure: 'Standard with perpetuity provisions',
    foreign_levies: 'Standard collection agreements',
    payroll_processing: 'Weekly with daily tracking',
    compliance_documentation: 'Comprehensive with studio oversight',
    labor_peace_commitment: 'No work stoppage guarantee with arbitration'
}]->(g);

// Add the merchandising and licensing program
CREATE (GodfatherMerchandising:LicensingProgram:GeneratedByClaudeAI {
    name: 'The Godfather Merchandising & Licensing Program',
    established: date('1971-10-15'),
    activated: date('1972-02-10'),
    product_categories: 6,
    licensees: 12,
    territories: 35,
    license_term: duration({years: 3}),
    renewal_options: 2,
    minimum_guarantees: 250000,
    royalty_rates: '8-12%',
    approval_process: 'Multi-stage with studio sign-off',
    quality_control: 'Strict with product samples',
    marketing_support: 'Coordinated with film release',
    program_manager: 'Paramount Consumer Products'
})
WITH 1 as dummy
MATCH (l:LicensingProgram:GeneratedByClaudeAI {name: 'The Godfather Merchandising & Licensing Program'})
SET l.product_lines = ['Publishing', 'Soundtrack', 'Apparel', 'Posters', 'Collectibles', 'Board game']
SET l.licensee_advances = [75000, 50000, 40000, 35000, 30000, 20000]
SET l.top_markets = ['United States', 'Canada', 'United Kingdom', 'Japan', 'Germany', 'France', 'Italy']
SET l.market_revenues = [650000, 125000, 110000, 95000, 85000, 80000, 75000]
SET l.design_guidelines = 'Comprehensive 45-page style guide'
SET l.logo_treatments = 5;

MATCH
  (l:LicensingProgram:GeneratedByClaudeAI {name: 'The Godfather Merchandising & Licensing Program'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (l)-[:MERCHANDISE_RIGHTS_FOR {
    licensing_director: 'Howard Leeds, Paramount Consumer Products',
    program_approach: 'Tasteful adult-oriented products emphasizing prestige',
    key_licensed_categories: ['Book tie-ins', 'Soundtrack', 'Film stills', 'Limited collectibles'],
    prohibited_categories: ['Toys', 'Children\'s products', 'Weapons replicas', 'Controversial items'],
    approval_chain: 'Product concept → design → pre-production sample → final product',
    rights_restrictions: 'No character merchandising without specific approval',
    intellectual_property_elements: ['Film logo', 'Key art', 'Selected film stills', 'Limited quotes'],
    royalty_collection: 'Quarterly with annual audits',
    minimum_guarantees_structure: 'Recoupable against royalties',
    quality_control_process: 'Physical samples reviewed by studio',
    contract_term: '3 years with performance-based renewal options',
    top_performing_licensee: 'Fawcett Books - novel tie-in',
    international_adaptation: 'Limited with cultural sensitivity review',
    marketing_coordination: 'Joint promotional activities around film release',
    retail_distribution_channels: 'Bookstores, record stores, specialty retailers',
    program_evolution: 'Expanded significantly with sequels',
    second_phase_activation: 'Reactivated for home video release',
    legacy_program_development: 'Continued as classic film property'
}]->(g);

// Add product placement deals
CREATE (GodfatherProductPlacements:CommercialDeal:GeneratedByClaudeAI {
    name: 'The Godfather Product Integrations',
    negotiated: date('1971-01-15'),
    executed: date('1971-03-01'),
    brands_featured: 5,
    cash_compensation: 25000,
    in_kind_value: 75000,
    screen_time_total: duration({minutes: 3, seconds: 45}),
    negotiation_rounds: 8,
    contract_pages: 65,
    legal_review_hours: 35,
    authenticity_restrictions: 'Period appropriate only',
    anachronism_avoidance: 'Strict historical review',
    director_approvals: 'Required for all placements'
})
WITH 1 as dummy
MATCH (c:CommercialDeal:GeneratedByClaudeAI {name: 'The Godfather Product Integrations'})
SET c.product_categories = ['Automobiles', 'Beverages', 'Clothing', 'Food', 'Tobacco']
SET c.brand_names = ['Lincoln Continental', 'Jack Daniel\'s', 'Florsheim', 'Genco Olive Oil (fictional)', 'Camel']
SET c.compensation_types = ['Vehicle provision', 'Cash payment', 'Wardrobe provision', 'Product supply', 'Historical props']
SET c.compensation_values = [60000, 15000, 10000, 5000, 10000]
SET c.screen_placements = [4, 2, 6, 3, 5]
SET c.placement_seconds = [65, 35, 60, 45, 55];

MATCH
  (c:CommercialDeal:GeneratedByClaudeAI {name: 'The Godfather Product Integrations'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (c)-[:BRAND_INTEGRATION_FOR {
    integration_director: 'Fred Gallo, Production Manager',
    period_authenticity_requirement: 'Strict 1945-1955 appropriate products only',
    placement_philosophy: 'Subtle integration serving narrative',
    negotiation_priority: 'Authenticity over compensation',
    historical_consistency_review: 'Thorough with production design department',
    legal_clearance_process: 'Full trademark clearances for visible brands',
    automobile_supplier_agreement: 'Period vehicles provided with technical support',
    beverage_integration_parameters: 'Background presence only with authentic packaging',
    clothing_supplier_arrangement: 'Historical accurate wardrobe supplementation',
    additional_consideration: 'Technical advisors for period authenticity',
    brand_approval_restrictions: 'No contemporary marketing allowed during release',
    contemporaneous_promotion_prohibition: 'No tie-in advertising permitted',
    screen_credit_provisions: 'Thank you credits only, no logos',
    integration_subtlety_requirement: 'No focal attention to commercial products',
    product_supply_logistics: 'Delivery to set with historical documentation',
    future_rights_limitations: 'No merchandising or promotional usage',
    deal_structure_innovation: 'Focused on production value enhancement not promotion'
}]->(g);

// Add post-production facilities
CREATE (GodfatherPostProduction:PostProductionFacility:GeneratedByClaudeAI {
    name: 'The Godfather Post-Production Services',
    engaged: date('1971-08-10'),
    completed: date('1972-02-15'),
    facility_locations: 3,
    editing_suites: 5,
    sound_stages: 2,
    mixing_rooms: 3,
    screening_rooms: 4,
    technical_staff: 45,
    creative_staff: 15,
    equipment_value: 4500000,
    dailies_processed: 875000,
    dailies_unit: 'feet',
    final_runtime: duration({hours: 2, minutes: 55})
})
WITH 1 as dummy
MATCH (p:PostProductionFacility:GeneratedByClaudeAI {name: 'The Godfather Post-Production Services'})
SET p.service_categories = ['Film editing', 'Sound design', 'Music recording', 'Color timing', 'Optical effects', 'Film processing']
SET p.facility_names = ['Paramount Editorial', 'Todd-AO Sound', 'Paramount Scoring Stage', 'Technicolor', 'Cinema Research', 'Consolidated Film Industries']
SET p.service_durations = [24, 16, 6, 8, 5, 22]
SET p.service_durations_unit = 'weeks'
SET p.technical_systems = ['Moviola editing', 'Mag film sound', '35mm projection', 'Optical printer']
SET p.deliverable_formats = ['35mm theatrical prints', 'Magnetic soundtrack masters', 'Optical soundtrack negatives'];

MATCH
  (p:PostProductionFacility:GeneratedByClaudeAI {name: 'The Godfather Post-Production Services'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (p)-[:POST_PRODUCED {
    post_supervisor: 'Peter Zinner',
    editorial_process: 'Traditional film cutting on Moviolas',
    primary_editing_location: 'Paramount Pictures Editorial Department',
    editor_collaboration_approach: 'Co-editors with sequence responsibilities',
    workprint_creation: 'Dailies synced and assembled next day',
    screening_schedule: 'Weekly with director and producers',
    sound_design_facility: 'Todd-AO Studios',
    foley_recording: 'Custom effects for gun shots and period authenticity',
    sound_mixing_approach: '6-track mix down to mono theatrical',
    music_recording_studio: 'Paramount Scoring Stage',
    orchestra_size: 65,
    color_timing_supervision: 'Gordon Willis personally supervised at Technicolor',
    lab_processing: 'Consolidated Film Industries with special instructions',
    optical_effects_house: 'Cinema Research for titles and opticals',
    title_design_process: 'Multiple concepts presented with puppet strings winning',
    dailies_processing: 'Overnight with morning screening',
    edit_decision_workflow: 'Director/Editor collaborative with producer input',
    technical_challenges: 'Low light cinematography requiring special processing',
    post_schedule_adherence: 'On schedule with planned extensions',
    delivery_requirements: '600 release prints with precise quality control'
}]->(g);

// Add film laboratory services
CREATE (TechnicolorLab:FilmLaboratory:GeneratedByClaudeAI {
    name: 'Technicolor Film Laboratory - Hollywood',
    established: date('1915-11-19'),
    project_engaged: date('1971-03-29'),
    project_completed: date('1972-03-10'),
    facility_size: 120000,
    facility_size_unit: 'square feet',
    employees: 450,
    processing_capacity: 1000000,
    capacity_unit: 'feet per day',
    film_formats: '35mm, 65mm, 16mm',
    processing_systems: 'Proprietary Technicolor, Standard ECN',
    quality_control_points: 24,
    technical_certifications: 8,
    industry_leadership: 'Color processing innovation'
})
WITH 1 as dummy
MATCH (f:FilmLaboratory:GeneratedByClaudeAI {name: 'Technicolor Film Laboratory - Hollywood'})
SET f.services_provided = ['Negative processing', 'Daily prints', 'Optical printing', 'Color timing', 'Release printing', 'Preservation elements']
SET f.equipment_types = ['Processing machines', 'Printing machines', 'Sensitometry equipment', 'Color analyzers', 'Densitometers']
SET f.equipment_counts = [24, 36, 12, 18, 15]
SET f.chemical_systems = ['ECN-1 negative process', 'ECP-1 print process', 'Silver recovery systems']
SET f.processing_standards = ['ASA standards', 'Technicolor proprietary', 'SMPTE specifications']
SET f.client_list = ['Paramount', 'Warner Bros.', 'Universal', 'Independent productions'];

MATCH
  (f:FilmLaboratory:GeneratedByClaudeAI {name: 'Technicolor Film Laboratory - Hollywood'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (f)-[:LABORATORY_SERVICES_FOR {
    lab_contact: 'Richard Dayton, Technicolor Account Executive',
    services_contracted: ['Negative processing', 'Daily prints', 'Color timing', 'Answer prints', 'Release prints'],
    dailies_turnaround: '24-hour standard, rush available',
    negative_developing_process: 'ECN-1 with special instructions',
    special_processing_instructions: 'Underexposed negative compensation',
    color_timing_approach: 'Gordon Willis supervised personally',
    amber_tone_development: 'Custom filtration and timing for period look',
    print_specification: 'Release prints with amber bias',
    quality_control_process: 'Multiple checkpoints with cinematographer approval',
    print_runs: 'Answer print → color timing → check print → release prints',
    technical_challenges: 'Maintaining consistent dark exposure look',
    process_innovations: 'Special development times for low-light footage',
    release_print_order: 600,
    print_quality_control: 'Individual inspection of first 50 prints',
    archival_elements_created: 'Preservation YCM separations created',
    lab-studio_relationship: 'Long-standing Paramount account',
    processing_schedule: 'Dailies priority scheduling',
    confidentiality_protocols: 'Special security for high-profile production',
    technical_documentation: 'Comprehensive timing records preserved'
}]->(g);

// Add accounting and financial reporting services
CREATE (GodfatherAccounting:FinancialService:GeneratedByClaudeAI {
    name: 'The Godfather Production Accounting Services',
    engaged: date('1970-09-15'),
    completed: date('1972-12-31'),
    accounting_staff: 6,
    transactions_processed: 12500,
    invoices_processed: 4250,
    payroll_transactions: 6800,
    financial_reports: 85,
    audits_conducted: 3,
    tax_filings: 12,
    accounting_system: 'Studio production accounting system',
    chart_of_accounts: 'Standard film production CoA',
    fiscal_year: 'Calendar year',
    record_retention: '7 years physical, permanent digital'
})
WITH 1 as dummy
MATCH (f:FinancialService:GeneratedByClaudeAI {name: 'The Godfather Production Accounting Services'})
SET f.service_categories = ['Production accounting', 'Payroll services', 'Cash management', 'Tax compliance', 'Financial reporting', 'Audit support']
SET f.report_types = ['Daily cost reports', 'Weekly cost reports', 'Monthly summaries', 'Cost-to-complete', 'Variance analysis', 'Cash flow projections']
SET f.report_recipients = ['Production team', 'Studio executives', 'Completion guarantor', 'Paramount finance', 'Gulf+Western corporate']
SET f.compliance_frameworks = ['GAAP', 'Film industry practices', 'Studio requirements', 'Completion bond requirements']
SET f.software_systems = ['Studio proprietary systems', 'Cast & Crew payroll', 'Manual ledgers']
SET f.banking_relationships = ['Bank of America', 'Chemical Bank'];

MATCH
  (f:FinancialService:GeneratedByClaudeAI {name: 'The Godfather Production Accounting Services'}),
  (g:Movie:GeneratedByClaudeAI {title: 'The Godfather'})
CREATE (f)-[:FINANCIAL_SERVICES_FOR {
    production_accountant: 'Joseph Scotti, CPA',
    accounting_team_structure: 'Controller, payroll supervisor, AP specialist, production accountants (3)',
    accounting_system_implementation: 'Paramount standard production accounting system',
    chart_of_accounts_customization: 'Standard film production with project-specific cost centers',
    daily_cost_reporting: 'Detailed actuals vs. budget by department',
    weekly_financial_meetings: 'Production team with studio representatives',
    monthly_financial_review: 'Studio executives and production leadership',
    cash_flow_management: 'Weekly disbursements against approved expenses',
    banking_structure: 'Production accounts with controlled disbursement',
    petty_cash_controls: 'Daily reconciliation with receipts',
    purchase_order_system: 'Standard with approval hierarchies',
    vendor_payment_terms: 'Net 30 standard with exceptions',
    payroll_processing: 'Weekly for crew, by production block for cast',
    tax_withholding_management: 'Multi-state and international considerations',
    completion_bond_reporting: 'Weekly cost reports and variance analysis',
    audit_trails_maintenance: 'Complete documentation for all transactions',
    financial_controls_implementation: 'Segregation of duties and approval levels',
    cost_containment_measures: 'Exception reporting and approval escalation',
    final_cost_reporting: 'Comprehensive cost analysis by category',
    profit_participation_accounting: 'Foundation for subsequent statement preparation'
}]->(g);