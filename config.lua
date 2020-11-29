Config = {}

Config.Locale = 'es'

--Options

Config.EnableMapsBlimps = false -- Enables the blips on the map.
Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.
Config.ChemicalsLicenseEnabled = true --Will Enable or Disable the need for a Chemicals License.
Config.MoneyWashLicenseEnabled = false --Will Enable or Disable the need for a MoneyWash License.
Config.RestrictLicenseShopAcces = false --Will Restrict the access to the license shop to players with a specific job and grade.
Config.RequireCopsOnline = true --Will require that cops are online to pickup or process.
Config.EnableCopCheckMessage = false --Will enable a message in the console when the server refreshes the current cop count.

--The time the server will wait until checking the current cop count again (in Minutes).
Config.CopsCheckRefreshTime = 5

--The time it takes to process one item
Config.Delays = {
	WeedProcessing = 1000 * 10,
	MethProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	lsdProcessing = 1000 * 10,
	HeroinProcessing = 1000 * 10,
	thionylchlorideProcessing = 1000 * 10,
}

--Drug Dealer item Prices
Config.DrugDealerItems = {
	heroin = 300,
	marijuana = 500,
	meth = 1400,
	coke = 800,
	lsd = 1900,
}

--License Shop Item Prices
Config.Licenses = {
	--moneywash = 75000,
	chemicalslisence = 100000,
}

--Items that are included in the Chemicals Convertion menu
Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 0,
	sodium_hydroxide = 0,
	sulfuric_acid = 0,
	lsa = 0,
}

--Jobs and job grades that are allowed to access the license shop.
--Only needed when RestrictLicenseShopAcces is set to true
Config.AllowedJobs = {
	Cartel4 = {name = 'cartel', grade = 4},
	Cartel3 = {name = 'cartel', grade = 3},
	Police4 = {name = 'police', grade = 4},
}

--The amount of cops that need to be online to harvest/process these drugs.
--Only needed when RequireCopsOnline is set to true
Config.Cops = {
	Heroin = 0,
	Weed = 0,
	Coke = 0,
	Meth = 0,
	LSD = 0,
	Chemicals = 0,
	MoneyWash = 0,
	ChemicalsMenu = 0,
	DrugDealer = 4,
	LicenseShop = 0,
}

--Interior Teleport Locations
Config.Interiors = {
	Weed = {EnteranceCoords = vector3(-317.11, -2778.90, 5.00), ExitCoords = vector3(1066.06, -3183.45, -38.16)},
	Meth = {EnteranceCoords = vector3(1017.67, -2529.29, 28.30), ExitCoords = vector3(997.22, -3200.43, -35.39)},
	Coke = {EnteranceCoords = vector3(1092.58, -2251.89, 31.23), ExitCoords = vector3(1088.65, -3187.70, -38.00)},
	Moneywash = {EnteranceCoords = vector3(-1933.67, 2039.53, 140.83), ExitCoords = vector3(1138.02, -3198.94, -38.66)},
	Cartel = {EnteranceCoords = vector3(1400.51, 1127.68, 115.33), ExitCoords = vector3(1400.48, 1129.57, 114.33)},
	DocumentForgeryOffice = {EnteranceCoords = vector3(15.97, -1032.29, 30.47), ExitCoords = vector3(1173.68, -3196.67, -39.00)},
}

--Drug Zones
Config.CircleZones = {
	--Weed
	WeedField = {coords = vector3(1065.32, 4240.71, 35.87), blimpcoords = vector3(1065.32, 4240.71, 35.87), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 0, enabled = true},
	WeedProcessing = {coords = vector3(1035.86, -3205.20, -38.17), blimpcoords = vector3(-317.11, -2778.90, 5.00), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 0.0, enabled = true},
	
	--meth
	MethProcessing = {coords = vector3(1007.27, -3197.93, -38.99), blimpcoords = vector3(1017.67, -2529.29, 28.30), name = _U('blip_methprocessing'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	HydrochloricAcidFarm = {coords = vector3(172.11, -3334.76, 4.78), blimpcoords = vector3(172.11, -3334.76, 4.78), name = _U('blip_HydrochloricAcidFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	SulfuricAcidFarm = {coords = vector3(1501.44, 6324.24, 23.08), blimpcoords = vector3(1501.44, 6324.24, 23.08), name = _U('blip_SulfuricAcidFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	SodiumHydroxideFarm = {coords = vector3(1729.63, 4735.82, 41.09), blimpcoords = vector3(1729.63, 4735.82, 41.09), name = _U('blip_SodiumHydroxideFarm'), color = 5, sprite = 51, radius = 0.0, enabled = true},
	
	--Chemicals
	ChemicalsField = {coords = vector3(-31.51, -2549.77, 5.01), blimpcoords = vector3(-31.51, -2549.77, 5.01), name = _U('blip_ChemicalsFarm'), color = 3, sprite = 499, radius = 0.0, enabled = true},
	ChemicalsConvertionMenu = {coords = vector3(49.50, -782.34, 16.79), blimpcoords = vector3(49.50, -782.34, 16.79), name = _U('blip_ChemicalsProcessing'), color = 3, sprite = 499, radius = 0.0, enabled = true},
	
	--Coke
	CokeField = {coords = vector3(-2197.01, 5184.54, 15.47), blimpcoords = vector3(-2197.01, 5184.54, 15.47), name = _U('blip_CokeFarm'), color = 4, sprite = 501, radius = 0.0, enabled = true},
	CokeProcessing = {coords = vector3(1090.00, -3194.93, -38.99), blimpcoords = vector3(1092.58, -2251.89, 31.23), name = _U('blip_Cokeprocessing'),color = 4, sprite = 501, radius = 0.0, enabled = true},
	
	--LSD
	lsdProcessing = {coords = vector3(2733.51, 1476.43, 45.30), blimpcoords = vector3(2733.51, 1476.43, 45.30), name = _U('blip_lsdprocessing'),color = 12, sprite = 364, radius = 0.0, enabled = true},
	thionylchlorideProcessing = {coords = vector3(2434.09, 4969.13, 42.35), blimpcoords = vector3(2434.09, 4969.13, 42.35), name = _U('blip_thionylchlorideprocessing'),color = 12, sprite = 364, radius = 0.0, enabled = true},
	
	--Heroin
	HeroinField = {coords = vector3(2706.73, -842.03, 24.21), blimpcoords = vector3(2706.73, -842.03, 24.21), name = _U('blip_heroinfield'), color = 7, sprite = 497, radius = 0, enabled = true},
	HeroinProcessing = {coords = vector3(608.76, -459.34, 24.74), blimpcoords = vector3(608.76, -459.34, 24.74), name = _U('blip_heroinprocessing'), color = 7, sprite = 497, radius = 0.0, enabled = true},

	--License
	LicenseShop = {coords = vector3(718.1, -973.6, 30.4), blimpcoords = vector3(718.1, -973.6, 30.4), name = _U('blip_licenseshop'),color = 9, sprite = 498, radius = 0.0, enabled = true},

	--DrugDealer
	DrugDealer = {coords = vector3(-277.70, 2205.52, 130.40), blimpcoords = vector3(-277.70, 2205.52, 130.40), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 0.0, enabled = true},
	DrugDealer2 = {coords2 = vector3(-1928.55, -3087.33, -6.00), blimpcoords2 = vector3(-1928.55, -3087.33, -6.00), name2 = _U('blip_drugdealer'), color2 = 6, sprite2 = 378, radius2 = 0.0, enabled = true},
	--DrugDealer3 = {coords3 = vector3(-444.54, 1599.11, 357.15), blimpcoords3 = vector3(-444.54, 1599.11,357.15), name3 = _U('blip_drugdealer'), color3 = 6, sprite3 = 378, radius3 = 0.0, enabled = true},
	--DrugDealer4 = {coords4 = vector3(1444.51, 6334.24, 22.84), blimpcoords4 = vector3(1444.51, 6334.24, 22.84), name4 = _U('blip_drugdealer'), color4 = 6, sprite4 = 378, radius4 = 0.0, enabled = true},
	--DrugDealer5 = {coords5 = vector3(1210.06, -3121.64, 4.54), blimpcoords5 = vector3(1210.06, -3121.64, 4.54), name5 = _U('blip_drugdealer'), color5 = 6, sprite5 = 378, radius5 = 0.0, enabled = true},
	
	--MoneyWash
	MoneyWash = {coords = vector3(1119.87, -3195.44, -39.40), blimpcoords = vector3(-1933.67, 2039.53, 140.83), name = _U('blip_moneywash'), color = 1, sprite = 500, radius = 0.0, enabled = true},
}