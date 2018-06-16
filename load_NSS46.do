* loads raw data from NSS46

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/Nss46_1.0/Data/"
set more off
set trace on

foreach s in "R" "U" {  
	local snames "`snames'D134`s'.TXT "
}
!cat `snames' > NSS46raw.txt  // combine rural and urban


local commonvar			///
	 rnd			5-7		///
	 sub_reg		8-11	///
	 invest_c		12-15	///
	 str plot_no	16-20	///
	 vill_no		21-25	///
	 str sub_block	26-26	///
	 str sec_strat	27-27	///
	 str hhd		28-29	///
	 str level		30-31	///
	 sample			116-116	///
	 sec		   	117-117	///
	 state  		118-119	///
	 region			120-120	///
	 strat	   		121-122	///
	 sub_strat  	123-123	///
	 sub_sample 	124-124	///
	 sub_rnd	   	125-125
	
local level1var				///
	 item_code		32-34	///
	 type			35-35	///
	 rel_inf		36-36	///
	 resp_code		37-37	///
	 surv_code		38-38	///
	 subs_code		39-39	///
	 hh_size		40-41	///
	 work			42-47	///
	 hh_type		48-48	///
	 grp_code		49-49	///
	 land_poss		50-51	///
	 percap_exp		52-58	///
	 dwell_unit		59-59	///
	 dwell_type		60-60	///
	 struc_type		61-61	///
	 area_covered	62-67	///
	 cook			68-69	///
	 light			70-70	///
	 meal_out		71-71	///
	 perform_c		72-72	///
	 ration			73-73	///
	 meal_daily		74-74	///
	 ask_ques		75-75	///
	 update	   		126-126 ///
	 multiplier		127-134

local level2var				///
	 personid		32-34	///
	 type			35-35	///
	 rel			36-36	///
	 sex			37-37	///
	 age			38-39	///
	 mar_stat		40-40	///
	 educ			41-41	///
	 week_act		42-43	///
	 ind_sec		44-44	///
	 ups			45-46	///
	 ind_sec2		47-47	///
	 ss				48-49	///
	 ind_sec3		50-50	///
	 away_days		51-52	///
	 meal_daily		53-53	///
	 meal_sch		54-56	///
	 meal_employ	57-59	///
	 meal_others	60-62	///
	 meal_pay		63-65	///
	 meal_home		66-68	///
	 update	   		126-126	///
	 multiplier		127-134
	 
	
local level3var				///
	 item_code		32-34	///
	 type			35-35	///
	 quant_c		36-43	///
	 val_c			44-51	///
	 quant_h		52-59	///
	 val_h			60-67	///
	 quant_t		68-75	///
	 val_t			76-83	///
	 update	   		126-126	///
	 multiplier		127-134

local level4var				///
	 item_code		32-34	///
	 type			35-35	///
	 quant_c		36-43	///
	 val_c			44-51	///
	 quant_h		52-59	///
	 val_h			60-67	///
	 quant_t		68-75	///
	 val_t			76-83	///
	 update	   		126-126	///
	 multiplier		127-134

local level5var				///
	 item_code		32-34	///
	 type			35-35	///
	 quant_c		36-43	///
	 val_c			44-51	///
	 quant_h		52-59	///
	 val_h			60-67	///
	 quant_t		68-75	///
	 val_t			76-83	///
	 update	   		126-126	///
	 multiplier		127-134
	 
local level6var				///
	 item_code		32-34	///
	 type			35-35	///
	 val_c			36-43	///
	 val_ck			44-51	///
	 update	   		126-126	///
	 multiplier		127-134

local level7var				///
	 item_code		32-34	///
	 type			35-35	///
	 fir_h_no		36-37	///
	 hire_w			38-38	///
	 cash_fir		39-44	///
	 c_k_fir		45-50	///
	 cash_r			51-56	///
	 c_k_r			57-62	///
	 cash_exp		63-68	///
	 c_k_exp		69-74	///
	 sec_h_no		75-76	///
	 cash_sec		77-82	///
	 c_k_sec		83-88	///
	 update	   		126-126	///
	 multiplier		127-134

local level8var				///
	item_code		32-34	///
	type			35-35	///
	value			36-43	///
	update		   	126-126	///
	multiplier		127-134 

#delimit;
la drop _all;

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
	33 "Daman & Diu"
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

la def samplelbl
	1 "Central"
	2 "State";

la def seclbl
	1 "Rural"
	2 "Urban";

la def rel_inflbl
	1 "Head of household"
	2 "Other members of Household"
	9 "Others";
	
la def respcodelbl 
	1 "Co-operative and capable" 
	2 "Co-operative but not capable" 
	3 "Reluctant";

la def survcodelbl 
	1 "Original" 
	2 "Substitute" 
	3 "Nothing Surveyed";
	
la def subscodelbl
	1 "Not Available"
	2 "Unwilling"
	3 "Others";

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

la def getfoodlbl 
	1 "Yes: every month of the year" 
	2 "Some month of the year" 
	3 "No: no month of the year";

la def monthlbl 
	1 	"January"
	2 	"February"
	3 	"March"
	4 	"April"
	5 	"May"
	6 	"June"
	7 	"July"
	8 	"August"
	9 	"September"
	10 "October"
	11 "November"
	12 "December";
	
la def yesnolbl
	1 "Yes"
	2 "No";

la def hhtypelbl
	1 "Owned"
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
	
la def grpcodelbl
	1 "Scheduled Tribe"
	2 "Scheduled Caste"
	9 "Others";


la def landposslbl
	01 "less than 0.01"
	02 "0.01-0.20"
	03 "0.21-0.40"
	04 "0.41-1.00"
	05 "1.01-2.00"
	06 "2.01-3.00"
	07 "3.01-4.00"
	08 "4.01-6.00"
	09 "6.01-8.00"
	10 "greater than 8.00";
	
la def dwellunitlbl
	1 "Owned"
	2 "Hired"
	3 "No-Dwelling Unit"
	9 "Others";

la def dwelltypelbl
	1 "Chawl/Bustee"
	2 "Independent House"
	3 "Flat";

la def structypelbl
	1 "Katcha"
	2 "Semi-pucca"
	3 "Pucca";
	
la def cooklbl
	01  "Coke,Coal"
	02  "Firewood and Chips"
	03  "LPG"
	04  "Gobar gas"
	05  "Dung Cake"
	06  "Charcoal"
	07  "Kerosene"
	08  "Electricity"
	09  "Others"
	10  "No cooking arrangement";

la def lightlbl
	1 "Kerosene"
	2 "Other oil"
	3 "Gas"
	4 "Candle"
	5 "Electricity"
	6 "No lighting arrangement"
	9 "Others";
	
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
	
la def sexlbl
	1 "Male"
	2 "Female";

la def mstatuslbl
	1 "Never married"
	2 "Currently married"
	3 "Widowed"
	4 "Divorced/Seperated";

la def edulbl
	0 "Not literate"
	1 "Literate without formal Schooling"
	2 "Literate below primary"
	3 "Primary"
	4 "Middle"
	5 "Secondary"
	6 "Graduate and above in agriculture"
	7 "Graduate and above in engineering/technology"
	8 "Graduate and above in medicine"
	9 "Graduate and above in other subjects";

la def statuslbl
	11 "Own account worker"
	21 "Worked as helper in hh enterprise(unpaid family worker)"
	31 "Worked as regular salaried/wage employee"
	41 "Worked as casual labour: in public works"
	51 "Other type of works"
	81 "Did not work but was seeking and/or available for work)"
	91 "Attended educational institution"
	92 "Attended domestic duties only"
	93 "Attended domestic duties and also engaged in free collection of goods,sewing,tailoring for hh use"
	94 "Rentiers,pensioners,remittance recipients"
	95 "Not able to work due o disability"
	96 "Beggars,prostitudes"
	97 "Others"
	61 "Had work in hh enterprise: Not working due to sickness"
	62 "Other reasons"
	71 "Had regular salary/wage employment:Not working due to sickness"
	72 "Other reasons"
	81 "Sought work"
	82 "Did not seek but was available for work"
	98 "Did not work due to temporary illness(casual workers only)";

la def indseclbl
	0 "Agriculture, Hunting, forestry, Fishing"
	1 "Mining and Quarrying"
	2 "Manufacturing"
	3 "Manufacturing"
	4 "Electricity, Gas and Water"
	5 "Construction"
	6 "Wholesale and Retail trade and Restaurants and Hotels"
	7 "Transport, Storage and Communication"
	8 "Financing, Insurance, Real Estate and Business Services"
	9 "Community, Social and Personal Services";

la def type_clothlbl
	1 "Cotton(Mill made)"
	2 "Power Loom"
	3 "Handloom"
	4 "Khadi"
	5 "Wool"
	6 "Silk,Rayon or other sybthetic textile"
	7 "Pure Silk"
	8 "Wool/synthetic/cotton/silk"
	9 "Others";


la def itemlbl
	101 "Paddy"
	102 "Rice"
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
	128 "Jowar products"
	129 "Jowar s.t."
	130 "Bajra"
	138 "Bajra products"
	139 "Bajra s.t."
	140 "Maize"
	148 "Maize Products"
	149 "Maize s.t."
	150 "Barley"
	158 "Barley products"
	159 "Barley s.t."
	160 "Small millets"
	168 "Small millet products"
	169 "Small millet s.t."
	170 "Ragi"
	178 "Ragi and products"
	179 "Ragi s.t."
	189 "Cereal: sub-total (109+119+129+139+149+159+169+179)"
	190 "Gram: whole"
	198 "Gram Products"
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
	270 "Poultry(Chicken)"
	271 "Other Birds"
	272 "Eggs (no.)"
	273 "Egg(Products)"
	274 "Fish fresh"
	275 "Fish Dry"
	276 "Fish Canned"
	278 "Others"
	279 "Meat,Egg,Fish:s.t."
	280 "Potato"
	281 "Onion"
	282 "Radish"
	283 "Carrot"
	284 "Turnip"
	285 "Beet"
	286 "Sweet Potato"
	287 "Arum"
	288 "Other root vegetable"
	289 "Root vegetables:s.t."
	290 "Pumpkin"
	291 "Gourd"
	292 "Bitter gourd"
	293 "Cucumber"
	294 "Parwal, patal"
	295 "Jhinga, torai"
	296 "Snake gourd"
	298 "Other gourd"
	299 "Gourd: s.t."
	300 "Cauliflower"
	301 "Cabbage"
	302 "Brinjal"
	303 "Lady's finger"
	304 "Palak/other leafy vegetables"
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
	319 "Other vegetables:s.t."
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
	349 "Fruits (fresh): s.t.(330-347)"
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
	378 "other Salt"
	379 "Salt:s.t.(370-371)"
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
	478 "Other Fuel and Light"
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
	522 "Sports goods, toys, etc."
	523 "Club fees"
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
	545 "Pathological Test"
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
	588 "Other petty articles"
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
	612 "Legal Expenses"
	613 "Postage, Telephone,telegram"
	614 "Repair charges for non-durables"
	615 "Miscellaneous Expenses"
	616 "Pet Animals"
	618 "Other consumer services excluding conveyance"
	619 "Consumer services excluding conveyance: sub-total (480-494)"
	620 "Railway fare"
	621 "Bus/tram fare"
	622 "Taxi, auto-rickshaw fare"
	623 "Bullock cart fare"
	624 "Airways Fare"
	625 "Porter Charges"
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
	649 "Misc. Consumer services: s.t."
	650 "House Rent, Garage Rent"
	651 "Residential land rent"
	652 "Other consumer rent"
	659 "Rent: sub-total (520-523)"
	660 "Consumer taxes and Cesses"
	661 "Water Charges"
	668 "Other Taxes"
	669 "Consumer taxes and cesses: sub-total (540-541)"
	670 "Bedstead"
	671 "Almirah"
	672 "Dressing table"
	673 "Chair"
	674 "Couch, Sofa"
	675 "Table, desk"
	676 "Stool, Bench"
	677 "Suitcase, trunks, box, hand bag and other travel goods"
	680 "Foam, rubber cushion"
	689 "Furniture & fixtures: sub-total (550-557)"
	690 "Gramaphone and Record Player"
	691 "Radio"
	692 "Radiogram"
	693 "Television"
	694 "Camera & photographic equipment"
	695 "Tape Recorder"
	696 "Harmonium"
	697 "Piano"
	700 "Record/audio cassette"
	701 "Video Cassette"
	702 "Other Musical Intruments"
	708 "Other goods for recreation, entertainment and hobbies"
	709 "Goods for recreation: sub-total"
	710 "Gold Ornaments"
	711 "Silver Ornaments"
	712 "Jewels, Pearls"
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
	733 "Pressure Pan"
	734 "Non-Stick Pan"
	735 "Sewing Machine"
	736 "Washing Machine"
	737 "Refrigerator"
	740 "Air Conditioner, Air Cooler"
	741 "Latern, Lamp,Tube light"
	742 "Electric iron, Heater, toaster and other electric heating appliances"
	743 "Thermos/Thermoware"
	748 "Oven and other cooking and household appliances"
	749 "Cooking and Household appliances"
	750 "Bicycle"
	751 "Motor Cycle, Scooter"
	752 "Motor Car, Jeep"
	753 "Tyres/Tubes"
	754 "Parambulator"
	758 "Other Transport equipment"
	759 "Personal transport Equipment"
	760 "Hearing Aid"
	761 "Glass eyes, artificial limbs, Orthopaedic braces"
	762 "Surgical belts, trusses and supports"
	763 "Clinical thermometer"
	768 "Other Therapautic appliances and equipments"
	769 "Therapeutic Appliances and equipments"
	770 "Clock/watch"
	771 "Type-writer"
	772 "Electric Hair dryer and shaver"
	778 "Other Personal Goods"
	779 "Other Personal Goods s.t."
	780 "Residential building and land(Cost of repairs)"
	788 "Other Durables"
	789 "Residential building land and other durables s.t."
	799 "Durable Grand Total";

#delimit cr
set more off
	
forvalues l=1/8 {
	infix `commonvar' `level`l'var' using NSS46raw.txt if level=="0`l'", clear
	gen hhid=plot_no+sub_block+sec_strat+hhd
	destring *, replace
	order hhid state
	sort hhid
	
	la var rnd				"Round"
	la var sub_reg			"FOD Sub-region"
	la var invest_c 		"Investigator Code"
	la var plot_no			"Plot Number"
	la var vill_no			"Village Number"
	la var sub_block 		"Hamlet group/Sub-block Number"
	la var sec_strat 		"Second Stage stratum"
	la var hhd				"Sample Household"
	la var level			"Level"
	la var sample			"Sample"
	la var sec				"Sector"
	la var state			"State"
	la var region			"Region"
	la var strat			"Stratum"
	la var sub_strat 		"Sub-Stratum"
	la var sub_sample 		"Sub-Sample"
	la var sub_rnd			"Sub-Round"
	la val state statelbl
	la val sample samplelbl
	la val sec seclbl
	
	if level==1 {
		la var item_code		"Person/item serial no."
		la var type				"Type Code"
		la var rel_inf			"Informant's relationship to Head"
		la var resp_code		"Response Code"
		la var surv_code		"Survey Code"
		la var subs_code		"Reason for Informant's Substitute"
		la var hh_size			"Household Size"
		la var work				"Industry Occupation Code"
		la var grp_code			"Group Code"
		la var land_poss		"Land Possessed Code"
		la var percap_exp		"Percapita Monthly Expenditure"
		la var dwell_unit		"Dwelling Unit"
		la var dwell_type		"Type of Dwelling Unit "
		la var struc_type		"Type of Structure"
		la var area_covered		"Covered Area"
		la var cook				"Source of Cooking"
		la var light			"Source of Lighting"
		la var meal_out			"Did any member take food from outside during the last 30 days"
		la var perform_c		"Did the household perform any ceremony"
		la var ration			"Did the household purchase any cereal from ration/fair price/subsidized rates during last 30 days"
		la var ask_ques			"Do all members of the family get 2 meals a day"
		la val rel_inf rel_inflbl
		la val resp_code respcodelbl
		la val surv_code survcodelbl
		la val subs_code subscodelbl
		la val grp_code grpcodelbl
		la val land_poss landposslbl
		la val dwell_unit dwellunitlbl
		la val dwell_type dwelltypelbl
		la val struc_type structypelbl
		la val cook cooklbl
		la val light lightlbl
		la val meal_out perform_c ask_ques ration yesnolbl
	}
	
	if level==1 {
		if sec==1 {
		la var hh_type			"Household Type in Rural Areas"
		la val hh_type hhtyperlbl
		}
		if sec==2 {
		la var hh_type			"Household Type in Urban Areas"
		la val hh_type hhtypeulbl
		}
	}
	
	if level==2 {
		la var personid			"Person Id"
		la var type				"Type Code"
		la var rel				"Relation to the head"
		la var sex				"Sex"
		la var age				"Age"
		la var mar_stat			"Marital Status"
		la var educ				"Education"
		la var week_act			"Current Weekly Activity Status"
		la var ind_sec			"Industry Section Code(Current weekly Status)"
		la var ups				"Usual Principal Status"
		la var ind_sec2			"Industry Section Code(Usual Principal Status)"
		la var ss				"Subsidiary Status"
		la var ind_sec3			"Industry Section Code(Subsidiary Status)"
		la var away_days		"Days stayed away from home during the last 30 days"
		la var meal_daily		"Number of meals usually taken in a day"
		la var meal_sch			"NUmber of meals at School"
		la var meal_employ		"Number of meals from Employer"
		la var meal_others		"Number of meals from others"
		la var meal_pay 		"Number of meals on payment"
		la var meal_home		"Number of meals at home"
		la val rel rellbl
		la val sex sexlbl
		la val mar_stat mstatuslbl
		la val educ edulbl
		la val week_act ups ss statuslbl
		la val ind_sec ind_sec2 ind_sec3 indseclbl
	}
	
	if level==3 {
		la var item_code		"Item Code"
		la var type				"Type Code"
		la var quant_c			"Quantity of Cash Purchase"
		la var val_c			"Value of Cash Purchse"
		la var quant_h			"Quantity of consumption out of home grown produce"
		la var val_h			"Value of home grown produce"
		la var quant_t			"Quantity of Total Consumption"
		la var val_t			"value of Total Consumption"
		la val item_code itemlbl
		la val type type_clothlbl
	}

	if level==4 {
		la var item_code		"Item Code"
		la var type				"Type Code"
		la var quant_c			"Quantity of Cash Purchase"
		la var val_c			"Value of Cash Purchse"
		la var quant_h			"Quantity of consumption out of home produced stock"
		la var val_h			"Value of home grown produce"
		la var quant_t			"Quantity of Total Consumption"
		la var val_t			"value of Total Consumption"
		la val item_code itemlbl
		la val type type_clothlbl
	}
	
	if level==5 {
		la var item_code		"Item Code"
		la var type				"Type Code"
		la var quant_c			"Quantity of Cash Purchase"
		la var val_c			"Value of Cash Purchse"
		la var quant_h			"Quantity of consumption out of home grown produce"
		la var val_h			"Value of home grown produce"
		la var quant_t			"Quantity of Total Consumption"
		la var val_t			"value of Total Consumption"
		la val item_code itemlbl
		la val type type_clothlbl
	}
	
	if level==6 {
		la var item_code		"Item Code"
		la var type				"Type Code"
		la var val_c			"Value of Goods in cash"
		la var val_ck			"Value of Goods in cash and kind"
		la val item_code itemlbl
		la val type type_clothlbl
	}
	
	if level==7 {
		la var item_code		"Item Code"
		la var type				"Type Code"
		la var fir_h_no			"Number of First hand purchase goods"
		la var hire_w			"Whether good hire purchased"
		la var cash_fir			"Value of first hand purchase goods in cash"
		la var c_k_fir			"Value of first hand purchase in cash and kind"
		la var cash_r			"Cost of raw materials and services consumption in cash"
		la var c_k_r			"Cost f raw materials and services consumption in cash and kind"
		la var cash_exp			"Total expenditure in cash"
		la var c_k_exp			"Total expenditure in cash and kind"
		la var sec_h_no			"Number of Second hand purchase goods"
		la var cash_sec			"Value of second hand purchase goods in cash"
		la var c_k_sec			"Value of second hand purchase goods in cash and kind"
		la val item_code itemlbl
		la val type type_clothlbl
		la val hire_w yesnolbl
	}
	
	if level==8 {
		la var item_code		"Item Code"
		la var type				"Type Code"
		la var value			"value of all expenditure"
		la val item_code itemlbl
		la val type type_clothlbl
	}
	save "`datadir'/dta/NSS46/level`l'", replace
}

