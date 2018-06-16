* Loading Data for NSS 43 Round

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS43/Data/"
set more off
set trace on

/*
forvalues s=1/6 {
	local snames "`snames'NSS43`s'.TXT "
}
!cat `snames' > NSS43raw.txt
*/

local commonvar			///
	rnd					10-11	///
	sch					12-14	///
	sample				15-15	///
	sec					16-16	///
	str vill_no			17-21	///
	str state_reg		22-24	///
	strat				25-26	///
	sub_sample			27-27	///
	str block			28-30	///
	sub_rnd				31-31	///
	sub_strat			32-32	///
	str hhd				33-34	///
	level				35-36
	
local level1var					/// 1,2,3,4,14
	dist				37-38	///
	sex					39-39	///
	surv_seq			40-40	///
	inf_code			41-41	///
	inf_type			42-42	///
	surv_code			43-43	///
	subs_code			44-44	/// check schedule
	hh_size				45-47	///
	nic					48-53	///
	hh_type				54-54	/// rural urban
	religion			55-55	///
	soc_grp				56-56	///
	hom_type			57-57	///
	land_o				58-61	///
	land_leasein		62-65	///
	land_other			66-69	///
	land_leaseout		70-73	///
	land_total			74-77	///
	land_c				78-81	///
	land_c_lin			82-85	///
	land_c_other		86-89	///
	land_c_total		90-93	///
	land_irri			94-97	///
	labor_crop			98-98	///
	labor_other			99-99	///
	pce_last			100-107	///
	cook				108-108	///
	light				109-109	///
	rice_h				110-110	///
	wheat_h				111-111	///
	jowar_h				112-112	///
	bajra_h				113-113	///
	maize_h				114-114	///
	barley_h			115-115	///
	ragi_h				116-116	///
	gram_h				117-117	///
	pub_work			118-118	///
	cultivate			119-119	///
	fish				120-120	///
	wage_emp			121-121	///
	non_agri			122-122	///
	pension				123-123	///
	remit				124-124	///
	int_div				125-125	///
	other_inc			126-126	///
	irdp				127-127	///
	milch				128-128	///
	draught				129-129	///
	ration				130-130	///
	alcohol				131-131	///
	bananas				132-132	///
	mango				133-133	///
	citrus				134-134	///
	apple				135-135	///
	grape				136-136	///
	others				137-137	///
	work_t				138-138	///
	educ_t				139-139	///
	other_t				140-140	///
	work_b				141-141	///
	educ_b				142-142	///
	other_b				143-143	///
	perf_cerm			144-144	///
	srl_no_c1			145-145	///
	ceremony1			146-146	///
	meal_guest1			147-152	///
	srl_no_c2			153-153	///
	ceremony2			154-154	///
	meal_guest2			155-160	/// layout code wrong
	srl_no_c3			161-161	///
	ceremony3			162-162	///
	meal_guest3			163-168	///
	srl_no_c4			169-169	///
	ceremony4			170-170	///
	meal_guest4			171-176	///
	srl_no_c5			177-177	///
	ceremony5			178-178	///
	meal_guest5			179-184	///
	s_no1				185-185	///
	type1				186-186	///
	meal_no1			187-192	///
	s_no2				193-193	///
	type2				194-194	///
	meal_no2			195-200	///
	dwell_unit			201-201	///
	area_covered		202-206	///
	land_possess		207-207	///
	plinth				208-208	///
	dwell_type			209-209	///
	struc_type			210-210	///
	floor				211-211	///
	rent_mon			212-219	///
	house_con			220-220	///
	house_cat			221-222	///
	adult_m				223-224	///
	adult_f				225-226	///
	child_m				227-228	///
	child_f				229-230	///
	mpce				231-232	///
	hh_type_n			233-233	///
	soc_grp_n			234-234	///
	land_possess_n		235-235	///
	size_class			236-236	///
	mult				237-244	///
	con_unit			245-248	///
	age_head			249-250

local level5var					///
	srl_no				37-39	///
	type				40-40	///
	rel					41-41	///
	sex					42-42	///
	age					43-44	///
	mstat				45-45	///
	educ				46-46	///
	days_away			47-48	///
	meal_daily			49-49	///
	meal_free			50-52	///
	meal_pay			53-55	///
	meal_home			56-58	///
	smoke				59-59	///
	chew				60-60	///
	snuff				61-61	///
	tob_pwr				62-62	///
	adult_m				121-122	///
	adult_f				123-124	///
	child_m				125-126	///
	child_f				127-128	///
	mpce_code			129-130	///
	hh_type_n			131-131	///
	soc_grp_n			132-132	///
	land_possess_n		133-133	///
	size_class			134-134	///
	mult				135-142	///
	con_unit			143-146	///
	age_head			147-148	///
	mpce				151-158
	
local level6var					/// 6,7,8,9,10
	item_code			37-39	///
	type				40-40	///
	quant_c				41-48	///
	val_c				49-56	///
	quant_h				57-64	///
	val_h				65-72	///
	quant_g				73-80	///
	val_g				81-88	///
	quant_total			89-96	///
	val_total			97-104	///
	nic					107-112	///
	rice_h				113-113	///
	wheat_h				114-114	///
	jowar_h				115-115	///
	bajra_h				116-116	///
	maize_h				117-117	///
	barley_h			118-118	///
	ragi_h				119-119	///
	gram_h				120-120	///
	adult_m				121-122	///
	adult_f				123-124	///
	child_m				125-126	///
	child_f				127-128	///
	mpce_code			129-130	///
	hh_type_n			131-131	///
	soc_grp_n			132-132	///
	land_possess_n		133-133	///
	size_class			134-134	///
	mult				135-142	///
	con_unit			143-146	///
	age_head			147-148	///
	mpce				151-158

local level11var				///
	item_code			37-39	///
	type				40-40	///
	val_c				41-48	///
	val_c_k				49-56	///
	adult_m				121-122	///
	adult_f				123-124	///
	child_m				125-126	///
	child_f				127-128	///
	mpce_code			129-130	///
	hh_type_n			131-131	///
	soc_grp_n			132-132	///
	land_possess_n		133-133	///
	size_class			134-134	///
	mult				135-142	///
	con_unit			143-146	///
	age_head			147-148	///
	mpce				151-158
	
 local level12var				/// 12,13
 	item_code			37-39	///
 	type				40-40	///
 	dos					41-44	///
 	fir_h_no			45-48	///
 	hire_w				49-49	///
 	val_c				50-57	///
 	val_c_k				58-65	///
 	cost_c				66-73	///
 	cost_c_k			74-81	///
 	exp_c				82-89	/// layout wrong
 	exp_c_k				90-97	///
 	number				98-101	///
 	tot_c				102-109	///
 	tot_c_k				110-117	///
 	adult_m				121-122	///
	adult_f				123-124	///
	child_m				125-126	///
	child_f				127-128	///
	mpce_code			129-130	///
	hh_type_n			131-131	///
	soc_grp_n			132-132	///
	land_possess_n		133-133	///
	size_class			134-134	///
	mult				135-142	///
	con_unit			143-146	///
	age_head			147-148	///
	mpce				151-158

#delimit;
la drop _all;

la def yesnolbl
	1 "Yes"
	2 "No";

la def samplelbl
	1 "Central"
	2 "State";

la def seclbl
	1 "Rural"
	2 "Urban";

la def statelbl
	8  "Jammu & Kashmir"
	7  "Himachal Pradesh"
	17  "Punjab"
	26  "Chandigarh"
	6  "Haryana"
	28  "Delhi"
	18  "Rajasthan"
	22  "Uttar Pradesh"
	4 "Bihar"
	19 "Sikkim"
	25 "Arunachal Pradesh"
	15 "Nagaland"
	13 "Manipur"
	31 "Mizoram"
	21 "Tripura"
	14 "Meghalaya"
	3 "Assam"
	23 "West Bengal"
	16 "Orissa"
	11 "Madhya Pradesh"
	5 "Gujarat"
	27 "D & N Haveli"
	12 "Maharastra"
	2 "Andhra Pradesh"
	9 "Karnataka"
	29 "Goa"
	30 "Lakshadweep"
	10 "Kerala"
	20 "Tamil Nadu"
	32 "Pondicherry"
	24 "A & N Islands"; 

la def sexlbl
	1 "Male"
	2 "Female";
	
la def survseqlbl
	1 "First"
	2 "Second";
	
la def infcodelbl
	1 "Head of Household"		
	2 "Other members of household"
	9 "Others";
	
la def inftypelbl 
	1 "Co-operative and capable" 
	2 "Co-operative but not capable" 
	3 "Busy" 
	4 "Reluctant" 
	9 "Others";

la def survcodelbl 
	1 "Original" 
	2 "Substitute" 
	3 "Nothing Surveyed";

la def subscodelbl 
	1 "Informant busy" 
	2 "Members away from home" 
	3 "Informant non-cooperative" 
	9 "Others";

la def hhtyperlbl
	1 "Self employed in non-agriculture"
	2 "Agriculture labour"
	3 "Other labour"
	4 "Self employed in agriculture"
	9 "Others";

la def hhtypeulbl
	1 "Self employed"
	2 "Reguar wage/salary earning"
	3 "Casual labour"
	9 "Others";

la def relilbl 
	1 "Hinduism"
	2 "Islam"
	3 "Christianity"
	4 "Sikhism"
	5 "Jainism"
	6 "Buddhism"
	7 "Zoroastrianism"
	9 "Others";
	
la def socgrlbl
	1 "Scheduled Tribe"
	2 "Scheduled Caste"
	3 "Other backward Classes"
	9 "Others";

la def homlbl
	1 "Owned"
	9 "Others";

la def cropotherlbl
	1 "Regularly"
	2 "During Peak Season only"
	3 "Casually"
	4 "Hires no labor for crop production"
	5 "NO Crop Production";

la def irdplbl
	1 "Milch Animals"
	2 "Draught Animals"
	3 "Sheep/Goat"
	4 "Pumpset"
	5 "Fish Pond"
	6 "Sewing Machine"
	9 "Others"
	0 "NO";

la def milchlbl
	1 "Cows"
	2 "Buffaloes"
	3 "Both Cows and Buffaloes"
	9 "Others"
	0 "None";

la def draughtlbl
	1 "Pair or more"
	2 "Single"
	0 "None";
	
la def ceremonylbl
	1 "Birth"
	2 "Marriages"
	3 "Death"
	4 "Other Ceremony";
 
la def cookcodelbl
	1 "Coke,Coal"
	2 "Firewood and Chips"
	3 "LPG"
	4 "Gobar gas"
	5 "Dung Cake"
	6 "Charcoal"
	7 "Kerosene"
	8 "Electricity"
	9 "Others";

la def lightcodelbl
	1 "Kerosene"
	2 "Other oil"
	3 "Gas"
	4 "Candle"
	5 "Electricity"
	9 "Others";
	
la def landlbl
	1 "Owned"
	2 "Hired"
	9 "Others";

la def landpossesslbl
	1 "Owned"
	2 "Rented"
	3 "Leased in"
	9 "Others";

la def plinthlbl
	1 "Basement"
	2 "0.00 Metre"
	3 "More than 0.00 metre";

la def dwellunitlbl
	1 "Owned"
	2 "Hired"
	9 "Others"
	0 "No Dwelling unit";
	
la def dwelltypelbl
	1 "Chawl/Bustee"
	2 "Independent House"
	3 "Flat";

la def structypelbl
	1 "Kachcha"
	2 "Semi-Pucca"
	3 "Pucca";

la def floortypelbl
	1 "Mud"
	2 "Wood, Bamboo, Reed"
	3 "Brick, Cement, Stone"
	9 "Others";

la def getfoodlbl 
	1 "Yes: every month of the year" 
	2 "Some month of the year" 
	3 "No: no month of the year";

la def houseconlbl
	1 "Excellent"
	2 "Fairly good and needs no major repair"
	3 "Bad, Dilapidated and impoverished";

la def rellbl
	1 "Head"
	2 "Spouse of Head"
	3 "Married Child"
	4 "Spouse of Married Child"
	5 "Unmarried child"
	6 "Grandchild"
	7 "father/Mother/Father-in-law/Mother-in-Law"
	8 "Brother/Sister/Brother-in-law/Sister-in-law/Other-relatives"
	9 "Servants/employees/other non-relatives";

la def mstatuslbl
	1 "Never married"
	2 "Currently married"
	3 "Widowed"
	4 "Divorced/Seperated";

la def educlbl
	0 "Not literate"
	1 "Literate without formal education"
	2 "Literate below primary"
	3 "Primary"
	4 "Middle"
	5 "Secondary"
	6 "Graduate and above in agriculture"
	7 "Graduate and above in engineering/technology"
	8 "Graduate and above in medicine"
	9 "Graduate and above in other subjects";

la def typelbl
	1 "Cotton Mill made"
	2 "Powerloom"
	3 "Handloom"
	4 "Khadi"
	5 "Wool"
	6 "Art silk rayon synthetic"
	7 "Pure silk"
	8 "Mixed wool/synthetic/cotton"
	9 "Others";

la def consumelbl
	1 "Regular"
	2 "Casual"
	3 "Not Consuming";
		
la def itemlbl
	101 "Paddy"
	102 "Rice – other sources"
	103 "Chira"
	104 "Khoi, lawa"
	105 "Muri"
	108 "Other rice products"
	109 "Rice s.t."
	110 "Wheat"
	111 "Atta"
	112 "Maida"
	113 "Suji, rawa"
	114 "Sewai, noodles"
	115 "Bread (bakery)"
	118 "Other wheat products"
	119 "Wheat s.t."
	120 "Jowar"
	121 "Jowar products"
	129 "Jowar s.t."
	130 "Bajra"
	131 "Bajra products"
	139 "Bajra s.t."
	140 "Maize"
	143 "Maize Products"
	149 "Maize s.t."
	150 "Barley"
	151 "Barley products"
	159 "Barley s.t."
	160 "Small millets"
	161 "Small millet products"
	169 "Small millet s.t."
	170 "Ragi"
	171 "Ragi and products"
	179 "Ragi s.t."
	189 "Cereal: sub-total (109+119+129+139+149+159+169+179)"
	190 "Gram: whole"
	191 "Gram Products"
	199 "Gram s.t."
	200 "Tapioca dry/sago"
	201 "Tapioca-green"
	202 "Mahua"
	203 "Jackfruit seed"
	208 "Other Cereal Substitutes"
	209 "Cereal substitutes: s.t.(200-208)"
	210 "Arhur"
	211 "Gram-split"
	212 "Moong"
	213 "Masur"
	214 "Urd"
	215 "Khesari"
	216 "Peas"
	217 "Soyabean"
	218 "Other pulses"
	219 "Pulses: s.t.(210-218)"
	220 "Besan"
	228 "Other pulse products"
	229 "Pulses & pulse products: s.t. (219+220+228)"
	230 "Milk: liquid (litre)"
	231 "Baby food"
	232 "Milk: condensed/ powder"
	233 "Curd"
	234 "Ghee"
	235 "Butter"
	236 "Ice-cream"
	238 "Other milk products"
	239 "Milk & milk products: s.t.(230-239)"
	240 "Vanaspati"
	241 "Margarine"
	242 "Mustard oil"
	243 "Groundnut oil"
	244 "Coconut oil"
	245 "Til oil"
	246 "Linseed oil"
	247 "Refined oil"
	250 "Palm oil"
	251 "Rapeseed oil"
	252 "Oilseed"
	258 "Edible oil(others)"
	259 "Edible oil: s.t. (240-258)"
	260 "Goat meat/mutton"
	261 "Mutton"
	262 "Beef"
	263 "Pork"
	264 "Buffalo Meat"
	268 "Other meat"
	269 "Meat:s.h."
	270 "Poultry"
	271 "Other Birds"
	272 "Eggs (no.)"
	273 "Egg(Products)"
	274 "Fish fresh"
	275 "Fish Dry"
	279 "Meat,Egg,Fish:s.t."
	280 "Potato"
	281 "Arum"
	282 "Radish"
	283 "Carrot"
	284 "Turnip"
	285 "Beet"
	286 "Sweet Potato"
	287 "Onion"
	288 "Other root vegetable"
	289 "Root vegetables:s.t."
	290 "Pumpkin"
	291 "Gourd"
	292 "Bitter gourd"
	293 "Cucumber"
	294 "Parwal/patal"
	295 "Jhinga, torai"
	296 "Snake gourd"
	298 "Other gourd"
	299 "Gourd: s.t."
	300 "Cauliflower"
	301 "Cabbage"
	302 "Brinjal"
	303 "Lady's finger"
	304 "Palak"
	305 "Other leafy vegetables"
	306 "French beans, barbati"
	307 "Tomato"
	310 "Peas"
	311 "Chillis: green"
	312 "Capsicum"
	313 "Plantain: green"
	314 "Jackfruit: green"
	315 "Lemon (no.)"
	318 "Other vegetables"
	319 "Other vegetables:s.t.(310-318)"
	329 "Vegetables all"
	330 "Banana (no.)"
	331 "Jackfruit"
	332 "Watermelon"
	333 "Pineapple (no.)"
	334 "Coconut (no.)"
	335 "Guava"
	336 "Singara"
	337 "Orange, mausami (no.)"
	340 "Mango"
	341 "Kharbooza"
	342 "Pears/naspati"
	343 "Berries"
	344 "Leechi"
	345 "Apple"
	346 "Grapes"
	348 "Other fresh fruits"
	349 "Fruits (fresh): s.t.(330-348)"
	350 "Coconut: copra"
	351 "Groundnut"
	352 "Dates"
	353 "Cashewnut"
	354 "Walnut"
	355 "Other nuts"
	356 "Raisin, kishmish, monacca, etc."
	358 "Other dry fruits"
	359 "Fruits (dry): s.t. (350-358)"
	360 "Sugar(crystal)"
	361 "khandsari"
	362 "Gur(cane)"
	363 "Gur(others)"
	364 "Sugar Candy, misri"
	365 "Honey"
	368 "Sugar(others)"
	369 "Sugar: s.t. (360-368)"
	370 "Sea Salt"
	371 "other Salt"
	379 "Salt:s.t.(370-378)"
	380 "Turmeric (gm)"
	381 "Black pepper (gm)"
	382 "Dry chillies (gm)"
	383 "Garlic"
	384 "Tamarind (gm)"
	385 "Ginger"
	386 "Curry powder (gm)"
	388 "Other spices (gm)"
	389 "Spices: s.t. (380-388)"
	390 "Tea : cups (no.)"
	391 "Tea : leaf (gm)"
	392 "Coffee : cups (no.)"
	393 "Coffee: powder (gm)"
	394 "Ice"
	395 "Cold beverages: bottled/canned (litre)"
	396 "Fruit juice and shake (litre)"
	400 "Coconut Green(no.)"
	408 "Other beverages: cocoa, chocolate, etc."
	409 "Beverages s.t."
	410 "Biscuits"
	411 "Salted refreshments"
	412 "Prepared sweets"
	413 "Cooked meals (no.)"
	414 "Cake, pastry"
	415 "Pickles (gm)"
	416 "Sauce (gm)"
	417 "Jam, jelly (gm)"
	418 "Other processed food"
	419 "Processed Food: s.t."
	429 "Beverages, etc.: sub-total (290-308)"
	430 "Pan: leaf (no.)"
	431 "Pan: finished (no.)"
	432 "Supari (gm)"
	433 "Lime(gm)"
	434 "Katha(gm)"
	438 "Other ingredients for Pan (gm)"
	439 "Pan: s.t. (430-438)"
	440 "Bidi (no.)"
	441 "Cigarettes (no.)"
	442 "Leaf tobacco (gm)"
	443 "Snuff (gm)"
	444 "Hookah tobacco (gm)"
	445 "Cheroot (no.)"
	446 "Zarda, kimam, surti (gm)"
	448 "Other tobacco products"
	449 "Tobacco: s.t. (320-327)"
	450 "Ganja (gm)"
	451 "Toddy (litre)"
	452 "Country liquor (litre)"
	453 "Opium, Bhang, Charas"
	454 "Beer (litre)"
	455 "Foreign liquor or refined liquor"
	458 "other drugs and intoxicants"
	459 "Intoxicants: s.t. (450-458)"
	460 "Coke"
	461 "Firewood and chips"
	462 "Electricity (std. unit)"
	463 "Dung cake"
	464 "Kerosene"
	465 "Matches (box)"
	466 "Coal"
	467 "Coal gas"
	470 "LPG "
	471 "Charcoal"
	472 "Other oil used for lighting"
	473 "Candle (no.)"
	474 "Methylated spirit"
	475 "Gobar gas"
	479 "Fuel and light: s.t.(460-478)"
	480 "Dhoti (Metre)"
	481 "Sari (Metre)"
	482 "Cloth for shirt, pyjama, salwar, etc. (metre)"
	483 "Cloth for coat, trousers, overcoat, etc. (metre)"
	484 "Chaddar, dupatta, shawl, etc. (no.)"
	485 "Lungi (no.)"
	486 "Gamchha, towel, handkerchief (no.)"
	487 "Hosiery articles, stockings, undergarments, etc.(no.)"
	490 "Ready-made garments (no.)"
	491 "Headwear (no.)"
	492 "Sweater, muffler, scarf,Knitted garments, pullover etc."
	493 "Bed sheet, bed cover (no.)"
	494 "Rug, blanket (no.)"
	495 "Pillow, quilt, mattress (no.)"
	496 "Cloth for upholstery, curtain, table-cloth, etc. (metre)"
	497 "Mosquito net (no.)"
	500 "Mats and matting (no.)"
	501 "Cotton (gm)"
	502 "Knitting wool"
	508 "Clothing Others"
	509 "Clothing: s.t.(480-508)"
	510 "Leather boots, shoes"
	511 "Leather sandals, chappals, etc."
	512 "Other leather footwear"
	513 "Rubber / PVC footwear"
	518 "Other footwear"
	519 "Footwear: sub-total (390-394)"
	520 "Cinema, theatre"
	521 "Mela, fair, picnic"
	523 "Sports goods, toys, etc."
	522 "Club fees"
	524 "Goods for recreation and hobbies"
	525 "Photography"
	526 "Video casette"
	528 "Other entertainment"
	529 "Entertainment: sub-total (430-438)"
	530 "Books, journals"
	531 "Newspapers, periodicals"
	532 "Library charges"
	533 "Stationery"
	534 "Tuition and other fees (school, college, etc.)"
	538 "Other educational expenses"
	539 "Education: s.t."
	540 "Allopathic Medicine"
	541 "Homeopathic Medicine"
	542 "Ayurvedic Medicine"
	543 "Unani Medicine"
	544 "Family planning appliances"
	548 "Other Medical expenses"
	549 "Medical:s.t."
	550 "Spectacles"
	551 "Torch light & batteries"
	552 "Fountain Pen"
	553 "Lock"
	554 "Umbrella, raincoat"
	555 "Walking Stick"
	556 "Lighter"
	558 "Other goods for personal care and effects"
	559 "Goods for personal care and effects: sub-total (440-445)"
	560 "Toilet soap"
	561 "Toothpaste, toothbrush, comb, etc."
	562 "Powder, snow, cream, lotion and perfume"
	563 "Hair oil, shampoo, hair cream"
	564 "Comb"
	565 "Shaving blades, shaving stick, razor"
	566 "Shaving cream, aftershave lotion"
	567 "Other saving requisites"
	568 "Other toilet articles"
	569 "Toilet articles: sub-total (450-458)"
	570 "Electric bulb, tubelight"
	571 "Electric Batteries"
	572 "Other non-durable electric goods"
	573 "Earthenware"
	574 "Glassware"
	575 "Bucket, water bottle/ feeding bottle & other plastic goods"
	576 "Choir, rope, etc."
	577 "Washing soap"
	580 "Washing soda"
	581	"Other washing requisites"
	582 "Incense (agarbatti)"
	583 "Other petty articles"
	589 "Sundry Articles: s.t.(570-588)"
	599 "Misc. Consumer Goods:s.t."
	600 "Doctor"
	601 "Nurse, midwife"
	602 "Hospital Charges"
	603 "Private tutor"
	604 "Domestic servant/cook"
	605 "Sweeper"
	606 "Barber, beautician, etc."
	607 "Washerman, laundry, ironing"
	610 "Tailor"
	611 "Priest"
	612 "Lawyer"
	613 "Postage, Telephone,telegram"
	614 "Repair charges for non-durables"
	618 "Other consumer services excluding conveyance"
	619 "Consumer services excluding conveyance: sub-total (480-494)"
	620 "Railway fare"
	621 "Bus/tram fare"
	622 "Taxi, auto-rickshaw fare"
	623 "Bullock cart fare"
	624 "Airways Fare"
	625 "Reporter Charges"
	626 "Steamer, Boat Fare"
	627 "Rickshaw (hand drawn & cycle) fare"
	630 "Horse cart fare"
	631 "Hand Operated Cart Fare"
	632 "Petrol for vehicle"
	633 "Diesel for vehicle"
	634 "Lubricants & other fuels for vehicle"
	635 "Other imputed value of owned conveyence"
	636 "School Bus/Van"
	638 "Other Hired Conveyence"
	639 "Conveyence: s.t.(620-638)"
	640 "Pet animal and others(Specify)"
	649 "Misc. Consumer services: s.t."
	650 "House Rent, Garage Rent"
	651 "Residential land rent"
	652 "Other consumer rent"
	659 "Rent: sub-total (520-523)"
	669 "Consumer taxes and cesses: sub-total (540-541)"
	670 "Bedstead"
	671 "Almirah, dressing table"
	672 "Dressing table"
	673 "Chair"
	674 "Couch, Sofa"
	675 "Table, desk"
	676 "Stool, Bench"
	677 "Suitcase, Trunk"
	680 "Foam, Rubber, Cushion"
	681 "Carpet"
	682 "Paintings, Drawing"
	688 "Other Furniture"
	689 "Furniture & fixtures: sub-total (550-557)"
	690 "Gramaphone and Record Player"
	691 "Radio"
	692 "Radiogram"
	693 "Television"
	694 "Camera & photographic equipment"
	695 "Tape Recorder"
	696 "Harmonium"
	697 "Piano"
	700	"Record Cassette"
	701	"Video cassette"
	702 "Other Musical Insturuments"
	708 "Other goods for recreation"
	709 "Goods for recreation: sub-total"
	710 "Gold Ornaments"
	711 "Silver ornaments"
	712 "Jewels, pearls"
	718 "Other Ornaments"
	719 "Jewellery & ornaments: s.t."
	720 "Stainless steel"
	721 "Bell Metal"
	722 "Copper"
	723 "Aluminium"
	724 "Iron"
	725 "Brass"
	726 "Enamel"
	727 "Crockery"
	728 "Others"
	729 "Household Utensils: s.t."
	730 "Electric Fan"
	731 "Stove (Pressure type)"
	732 "Pressure Cooker"
	733 "Sewing Machine"
	734 "Washing Machine"
	735 "Refrigerator"
	736 "Air Conditioner, Air Cooler"
	737 "Lantern, Lamp"
	740 "Electric iron, heater, toaster and other electrical heating appliances"
	748 "Ovens etc. Other cooking and houshold appliances"
	749 "Cooking and Household appliances"
	750 "Bicycle"
	751 "Motor Cycle scooter"
	752 "Motor Car"
	753 "Tyres and tubes"
	754 "Perambulator"
	758 "Other transport equipment"
	759 "Personal Transport equipment s.t."
	760 "Hearing aids"
	761 "Glass eyes, artificial limbs etc."
	762 "Surgical belts, trusses and supports"
	763 "Clinical thermometer"
	768 "Other therapeutic applicances"
	769 "Therapeutic appliances and equipments s.t."
	770 "Clock, Watch"
	771 "Type writer"
	772 "Electric Hair Dryer and Shaver"
	778 "Other personal goods"
	779 "Personal goods s.t."
	780 "residential building and land cost and repairs"
	788 "Other Durables"
	789 "Durable goods Total";

#delimit cr
set more off

foreach s in "1" "2" "3" "4" "14" {
di "s = `s'"
	infix `commonvar' `level1var' using NSS43raw.txt if level==`s', clear
	gen hhid=vill_no+block+hhd
	gen state=substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state				"State"
	la var hhid					"Household Id"
	la var rnd					"Round"
	la var sch					"Schedule"
	la var sample				"Sample"
	la var sec					"Sector"
	la var vill_no				"Village Number"
	la var state_reg			"State-Region"
	la var strat				"Stratum"
	la var sub_sample			"Sub-Sample"
	la var block				"Block"
	la var sub_rnd				"Sub-Round"
	la var sub_strat			"Sub-Stratum"
	la var hhd					"Sample household number"
	la var level 				"Level(Record Type)"
	la val state statelbl
	la val sec seclbl
	la val sample samplelbl
	
	la var dist					"District Code"
	la var sex					"Sex of the Head Code"
	la var surv_seq				"Survey Sequence"
	la var inf_code				"Informant Code"
	la var inf_type				"Informant Type"
	la var surv_code			"Survey Code"
	la var subs_code			"Reason for Casualty"
	la var hh_size				"Household Size"
	la var nic					"Principal industry occupation, NIC-NCO"
	la var religion				"Religion"
	la var soc_grp				"Social Group Code"
	la var hom_type				"Homestead Type"
	la var land_o				"Land Owned"
	la var land_leasein			"Land Leased in"
	la var land_other			"Land Neither owned nor leased in"
	la var land_leaseout		"Land Leased out"
	la var land_total			"Total land"
	la var land_c				"Land owned Cultivated"
	la var land_c_lin			"Land Leased in cultivated"
	la var land_c_other			"Land neither owned nor leased in cultivated"
	la var land_c_total			"Total Land cultivated"
	la var land_irri			"Land Irrigated"
	la var labor_crop			"Use of hired labor for crop production"
	la var labor_other			"Use of hired labor for other production enterprises"
	la var pce_last				"Per-capita expenditure last month"
	la var cook					"Primary Source of energy for cooking"
	la var light				"Primary Source of energy for light"
	la var rice_h				"Last year did the household cultivate rice"
	la var wheat_h				"Last year did the household cultivate wheat"
	la var jowar_h				"last year did the household cultivate jowar"
	la var bajra_h				"Last year did the household cultivate bajra"
	la var maize_h				"last year did the household cultivate maize"
	la var barley_h				"Last year did the household cultivate barley"
	la var ragi_h				"Last year did the household cultivate ragi"
	la var gram_h				"Last year did the household cultivate gram"
	la var pub_work				"Did any member of the household do public work in thelast 365 days"
	la var cultivate			"Did any member of the household do cultivation"
	la var fish					"Did any member work in Fishing/other agricultural enterprise"
	la var wage_emp				"Did any member have Wage/salaried employment"
	la var non_agri				"Did any member work in Non-agricultural enterprise"
	la var pension				"Receive Pension"
	la var remit				"Receive remittances"
	la var int_div				"Receive interests and dividends"
	la var other_inc			"Other sources of incomes"
	la var irdp					"Did the household receive any assisstance from IRDP in the last 5 years"
	la var milch				"Did the household possess milch animals"
	la var draught				"Did the household possess any draught animals"
	la var ration				"Did the household purchase any commodity from Ration shops during the last 30 days"
	la var alcohol				"Did any member of the household consume any alcoholic beverages in the last 30 days"
	la var bananas				"Did any member of the household consume any bananas in the last 30 days"
	la var citrus				"Did any member od the household consume any citrus fruits"
	la var apple				"Did any member of the household consume any apples"
	la var grape				"Did any member of the household consume any grape"
	la var others				"Did any member of the household consume any other fruits"
	la var work_t				"Did any member of the household make a journey to work by train in the last 30 days"
	la var educ_t				"Did any member of the household make a journey for educational purposes by train in the last 30 days"
	la var other_t				"Did any member of the household make a journey by a train in the last 30 days"
	la var work_b				"Did any member of the household make a journey to work by bus in the last few days"
	la var educ_b				"Did any member of the household make a journey for educational purposes by bus in the last 30 days"
	la var other_b				"Did any member of the household make a journey by a bus in the last 30 days"
	la var perf_cerm			"Whether any ceremony was performed by the household during the last 30 days"
	la var srl_no_c1			"Serial number of the Ceremony"
	la var ceremony1			"Ceremony Code"
	la var meal_guest1			"No. of meals served to the guests"
	la var srl_no_c2			"Serial number of the Ceremony"
	la var ceremony2			"Ceremony Code"
	la var meal_guest2			"No. of meals served to the guests"
	la var srl_no_c3			"Serial number of the Ceremony"
	la var ceremony3			"Ceremony Code"
	la var meal_guest3			"No. of meals served to the guests"
	la var srl_no_c4			"Serial number of the Ceremony"
	la var ceremony4			"Ceremony Code"
	la var meal_guest4			"No. of meals served to the guests"
	la var srl_no_c5			"Serial number of the Ceremony"
	la var ceremony5			"Ceremony Code"
	la var meal_guest5			"No. of meals served to the guests"
	la var s_no1				"Serial number of meals(other than served in ceremony)"
	la var type1				"Type Code"
	la var meal_no1				"NUmber of meals"
	la var s_no2				"Serial number of meals(other than served in ceremony)"
	la var type2				"Type Code"
	la var meal_no2				"NUmber of meals"
	la var dwell_unit			"Dwelling Unit"
	la var area_covered			"Area covered by the house"
	la var land_possess			"land Possess code"
	la var plinth				"Plinth Level"
	la var dwell_type			"Type of dwelling"
	la var struc_type			"Type of structure"
	la var floor				"Floor type"
	la var rent_mon				"Monthly rent for urban only"
	la var house_con			"Condition of the house"
	la var house_cat			"House category code"
	la var adult_m				"Adult-Male"
	la var adult_f				"Adult-Female"
	la var child_m				"Child-Male"
	la var child_f				"Child-Female"
	la var mpce					"Monthly per capita consumption expenditure"
	la var hh_type_n			"Household type new"
	la var soc_grp_n			"Social group New"
	la var land_possess_n		"Land Possess code new"
	la var size_class			"Size of Class code"
	la var mult					"Multiplier"
	la var con_unit				"Consumer unit"
	la var age_head				"Age of head of household"
	la val sex sexlbl
	la val surv_seq survseqlbl
	la val inf_code infcodelbl
	la val inf_type inftypelbl
	la val surv_code survcodelbl
	la val subs_code subscodelbl
	la val religion relilbl
	la val soc_grp socgrplbl
	la val hom_type homlbl
	la val labor_crop labor_other cropotherlbl
	la val irdp irdplbl
	la val milch milchlbl
	la val draught draughtlbl
	la val ceremony1-ceremony5 ceremonylbl
	la val cook cookcodelbl
	la val light lightcodelbl
	la val land_possess landpossesslbl
	la val plinth plinthlbl
	la val dwell_type dwelltypelbl
	la val struc_type structypelbl
	la val floor floortypelbl
	la val house_con houseconlbl
	la val land_possess_n landpossesslbl
	la val rice_h wheat_h jowar_h bajra_h maize_h barley_h ragi_h gram_h ///
	pub_work cultivate fish wage_emp non_agri pension remit int_div other_inc ///
	alcohol bananas mango citrus apple grape others work_t educ_t other_t ///
	work_b educ_b other_b perf_cerm ration yesnolbl
	
	if sec==1 {
		la var hh_type   		"Household Type Rural"
		la val hh_type hhtyperlbl
		}
		if sec==2 {
		la var hh_type   		"Household Type Urban"
		la val hh_type hhtypeulbl
	 }
	save "`datadir'/dta/NSS43/level`s'", replace
more
}
exit

foreach s in "5" {
	infix `commonvar' `level5var' using NSS43raw.txt if level==`s', clear
	gen hhid=vill_no+block+hhd
	gen state=substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state				"State"
	la var hhid					"Household Id"
	la var rnd					"Round"
	la var sch					"Schedule"
	la var sample				"Sample"
	la var sec					"Sector"
	la var vill_no				"Village Number"
	la var state_reg			"State-Region"
	la var strat				"Stratum"
	la var sub_sample			"Sub-Sample"
	la var block				"Block"
	la var sub_rnd				"Sub-Round"
	la var sub_strat			"Sub-Stratum"
	la var hhd					"Sample household number"
	la var level 				"Level(Record Type)"
	la val state statelbl
	la val sec seclbl
	la val sample samplelbl
	
	la var srl_no				"Serial number of member"
	la var type					"Type Code"
	la var rel					"Relation to the head of household"
	la var sex					"Sex"
	la var age					"Age"
	la var mstat				"Marital Status"
	la var educ					"Education status code"
	la var days_away			"Number of days stayed away from home in thelast 30 days"
	la var meal_daily			"Number meals usually taken daily"
	la var meal_free			"Number of meals taken during the last 30 days free of cost"
	la var meal_pay				"Number of meals taken in the last 30 days on payment"
	la var meal_home			"Number of meals taken in the last 30 days at home"
	la var smoke				"Consumption of tobacco Code-Smoking"
	la var chew					"Consumption of tobacco code-Chewing,zarda dokta etc."
	la var snuff				"Consumption of tobacco code-Snuff"
	la var tob_pwr				"Consumption of tobacco code-Burnt tobacco powder"
	la var adult_m				"Adult Male"
	la var adult_f				"Adult Female"
	la var child_m				"Child Male"
	la var child_f 				"Child Female"
	la var mpce_code			"Percapita expenditure class code"
	la var hh_type_n			"Household type new"
	la var soc_grp_n			"Social Group new"
	la var land_possess_n	"Land Possess code new"
	la var mult 				"Multiplier"
	la var con_unit				"Consumer Unit"
	la var age_head				"Age of head of household"
	la var mpce					"Monthly per capita expenditure"
	la val sex sexlbl
	la val rel rellbl
	la val mstat mstatuslbl
	la val educ educlbl
	la val land_possess_n landpossesslbl
	la val smoke chew snuff tob_pwr consumelbl

save "`datadir'/dta/NSS43/level`s'", replace	
}

foreach s in "6" "7" "8" "9" "10" {
	infix `commonvar' `level6var' using NSS43raw.txt if level==`s', clear
	gen hhid=vill_no+block+hhd
	gen state=substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state				"State"
	la var hhid					"Household Id"
	la var rnd					"Round"
	la var sch					"Schedule"
	la var sample				"Sample"
	la var sec					"Sector"
	la var vill_no				"Village Number"
	la var state_reg			"State-Region"
	la var strat				"Stratum"
	la var sub_sample			"Sub-Sample"
	la var block				"Block"
	la var sub_rnd				"Sub-Round"
	la var sub_strat			"Sub-Stratum"
	la var hhd					"Sample household number"
	la var level 				"Level(Record Type)"
	la val state statelbl
	la val sec seclbl
	la val sample samplelbl
	
	la var item_code			"Item Code"
	la var type					"Type Code"
	la var quant_c				"Cash Purchase quantity"
	la var val_c				"Cash Purchase value"
	la var quant_h				"Quantity of home grown produce consumed"
	la var val_h				"value of home grown produce consumed"
	la var quant_g				"Quantity of consumption in gift, loan"
	la var val_g				"value of consumption in gift, loan"
	la var quant_total			"Quantity of total consumption"
	la var val_total			"Value of total consumption"
	la var nic					"Principal Industry Occupation Code"
	la var rice_h				"Household cultivate rice"
	la var wheat_h				"Household cultivate wheat"
	la var jowar_h				"Household cultivate jowar"
	la var bajra_h				"Household cultivate bajra"
	la var maize_h				"Household cultivate maize"
	la var barley_h				"Household cultivate barley"
	la var ragi_h				"Household cultivate ragi"
	la var gram_h				"Household cultivate gram"
 	la var adult_m				"Adult Male"
	la var adult_f				"Adult Female"
	la var child_m				"Child Male"
	la var child_f 				"Child Female"
	la var mpce_code			"Monthly per capita consumption expenditure Code"
	la var hh_type_n			"Household type new"
	la var soc_grp_n			"Social group New"
	la var land_possess_n		"Land Possess code new"
	la var size_class			"Size of Class code"
	la var mult					"Multiplier"
	la var con_unit				"Consumer unit"
	la var age_head				"Age of head of household"
	la var mpce					"Monthly per capita expenditure"
	la val item_code itemlbl
	la val type typelbl
	la val land_possess_n landpossesslbl
	la val rice_h wheat_h jowar_h bajra_h maize_h barley_h ragi_h gram_h yesnolbl

save "`datadir'/dta/NSS43/level`s'", replace	
}

foreach s in "11" {
	infix `commonvar' `level11var' using NSS43raw.txt if level==`s', clear
	gen hhid=vill_no+block+hhd
	gen state=substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state				"State"
	la var hhid					"Household Id"
	la var rnd					"Round"
	la var sch					"Schedule"
	la var sample				"Sample"
	la var sec					"Sector"
	la var vill_no				"Village Number"
	la var state_reg			"State-Region"
	la var strat				"Stratum"
	la var sub_sample			"Sub-Sample"
	la var block				"Block"
	la var sub_rnd				"Sub-Round"
	la var sub_strat			"Sub-Stratum"
	la var hhd					"Sample household number"
	la var level 				"Level(Record Type)"
	la val state statelbl
	la val sec seclbl
	la val sample samplelbl
	
	la var item_code			"Item Code"
	la var type					"Type Code"
	la var val_c				"Value in Cash"
	la var val_c_k				"Value in Cash and Kind"
	la var adult_m				"Adult Male"
	la var adult_f				"Adult Female"
	la var child_m				"Child Male"
	la var child_f 				"Child Female"
	la var mpce_code			"Monthly per capita consumption expenditure Code"
	la var hh_type_n			"Household type new"
	la var soc_grp_n			"Social group New"
	la var land_possess_n		"Land Possess code new"
	la var size_class			"Size of Class code"
	la var mult					"Multiplier"
	la var con_unit				"Consumer unit"
	la var age_head				"Age of head of household"
	la var mpce					"Monthly per capita expenditure"
	la val item_code itemlbl
	la val land_possess_n landpossesslbl
	la val type typelbl
	
save "`datadir'/dta/NSS43/level`s'", replace	
}

foreach s in "12" "13" {
	infix `commonvar' `level12var' using NSS43raw.txt if level==`s', clear
	gen hhid=vill_no+block+hhd
	gen state=substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state				"State"
	la var hhid					"Household Id"
	la var rnd					"Round"
	la var sch					"Schedule"
	la var sample				"Sample"
	la var sec					"Sector"
	la var vill_no				"Village Number"
	la var state_reg			"State-Region"
	la var strat				"Stratum"
	la var sub_sample			"Sub-Sample"
	la var block				"Block"
	la var sub_rnd				"Sub-Round"
	la var sub_strat			"Sub-Stratum"
	la var hhd					"Sample household number"
	la var level 				"Level(Record Type)"
	la val state statelbl
	la val sec seclbl
	la val sample samplelbl
	
	la var item_code			"Item Code"
	la var type					"Type Code"
	la var dos					"Date of Survey"
	la var fir_h_no				"First hand purchase number"
	la var hire_w				"Whether Hire purchase"
	la var val_c				"Cash value"
	la var val_c_k				"Value in Cash and kind"
	la var cost_c				"Cost of raw materials repairs in cash"
	la var cost_c_k				"Cost of raw materials and repair in cash and kind"
	la var exp_c				"Total expenditure in Cash"
	la var exp_c_k				"Total expenditure in cash and kind"
	la var number				"Number"
	la var tot_c				"Amount in cash"
	la var tot_c_k				"Amount in cash and kind"
	la var adult_m				"Adult Male"
	la var adult_f				"Adult Female"
	la var child_m				"Child Male"
	la var child_f 				"Child Female"
	la var mpce_code			"Percapita expenditure class code"
	la var hh_type_n			"Household type new"
	la var soc_grp_n			"Social Group new"
	la val land_possess_n	"Land Possess code new"
	la var mult 				"Multiplier"
	la var con_unit				"Consumer Unit"
	la var age_head				"Age of head of household"
	la var mpce					"Monthly per capita expenditure"
	la val item_code itemlbl
	la val type typelbl
	la val land_possess_n landpossesslbl
	la val hire_w yesnolbl
	
	save "`datadir'/dta/NSS43/level`s'", replace	
}
