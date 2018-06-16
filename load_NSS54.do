* loads raw data from NSS54

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/Nss54_1.0/Data/"
set more off
set trace on

foreach s in "R" "U" {  
	local snames "`snames'D146`s'.TXT "
}
!cat `snames' > NSS54raw.txt  // combine rural and urban

local commonvar		///
	srl_no			1-4		///
	rnd				5-7		///
	str state_reg	8-10	///
	sub_sample		11-11	///
	sub_rnd			12-12	///
	str plot_no		13-17	///
	vill_no			18-22	///
	str block		23-25	///
	str sec_strat	26-26	///
	str hhd			27-28	///
	str level		29-30	///
	sec				120-120	///
	dist			121-122	///
	strat			123-124	///
	sub_strat		125-125	///
	update			126-126	///
	mult			127-136	///
	mult_com		137-146

local level1var				///
	 inf_srlno		34-36	///
	 resp_code		37-37	///
	 surv_code		38-38	///
	 subs_code		39-39	///
	 time			40-42	///
	 d_o_s			43-48	///
	 hh_size		49-50	///
	 nic			51-56	///
	 hh_type		57-57	///
	 grp_code		58-58	///
	 land_poss		59-60	///
	 percap_exp		61-67	///
	 dwell_unit		68-68	///
	 dwell_type		69-69	///
	 struc_type		70-70	///
	 area_covered	71-76	///
	 cook			77-78	///
	 light			79-79	///
	 meal_out		80-80	///
	 perform_c		81-81	///
	 ration			82-82

local level2var				///
	get_food		34-34	///
	mon1			35-36	///
	mon2			37-38	///
	mon3			39-40	///
	mon4			41-42	///
	mon5			43-44	///
	mon6			45-46	///
	mon7			47-48	///
	mon8			49-50	///
	mon9			51-52	///
	mon10			53-54	///
	mon11			55-56	///
	mon12			57-58	///
	ask_ques		59-59

local level3var				///
	 personid		31-33	///
	 rel			34-34	///
	 sex			35-35	///
	 age			36-37	///
	 mar_stat		38-38	///
	 educ			39-40	///
	 ups			41-42	///
	 ind_sec2		43-43	///
	 ss				44-45	///
	 ind_sec3		46-46	///
	 week_act		47-48	///
	 ind_sec		49-49	///
	 away_days		50-51	///
	 meal_daily		52-52	///
	 meal_sch		53-54	///
	 meal_employ	55-56	///
	 meal_others	57-58	///
	 meal_pay		59-60	///
	 meal_home		61-62
	 
local level4var				///
	 item_code		31-33	///
	 quant_c		34-41	///
	 val_c			42-49	///
	 quant_h		50-57	///
	 val_h			58-65	///
	 quant_t		66-73	///
	 val_t			74-81

local level5var				///
	 item_code		31-33	///
	 quant_c		34-41	///
	 val_c			42-49	///
	 quant_h		50-57	///
	 val_h			58-65	///
	 quant_t		66-73	///
	 val_t			74-81

local level6var				///
	 item_code		31-33	///
	 quant_c		34-41	///
	 val_c			42-49	///
	 quant_h		50-57	///
	 val_h			58-65	///
	 quant_t		66-73	///
	 val_t			74-81

local level7var				///
	 item_code		31-33	///
	 val_c			34-41	///
	 val_ck			42-49

local level8var				///
	 item_code		31-33	///
	 val_c			34-41	///
	 val_ck			42-49
	 
local level9var				///
	 item_code		31-33	///
	 fir_h_no		34-36	///
	 hire_w			37-37	///
	 cash_fir		38-45	///
	 c_k_fir		46-53	///
	 cash_r			54-61	///
	 c_k_r			62-69	///
	 cash_exp		70-77	///
	 c_k_exp		78-85	///
	 sec_h_no		86-88	///
	 cash_sec		89-96	///
	 c_k_sec		97-104
	 
local level10var			///
	ceremony_no		31-33	///
	code			34-34	///
	exp_food		35-42	///
	exp_f_l			43-50	///
	exp_cloth		51-58	///
	exp_misc		59-66	///
	exp_goods		67-74	///
	all				75-82

local level11var			///
	ceremony_no		31-33	///
	code			34-34	///
	exp_food		35-42	///
	exp_f_l			43-50	///
	exp_cloth		51-58	///
	exp_misc		59-66	///
	exp_goods		67-74	///
	all				75-82
	
local level12var			///
	item_code		30-32	///
	type			33-33	///
	val				34-41
	
#delimit;
la drop _all;

la def statelbl
	2  "Andhra Pradesh"
	3  "Arunachal Pradesh"
	4  "Assam"
	5  "Bihar"
	6  "Goa"
	7  "Gujarat"
	8  "Haryana"
	9  "Himachal Pradesh"
	10 "Jammu & Kashmir"
	11 "Karnataka"
	12 "Kerala"
	13 "Madhya Pradesh"
	14 "Maharastra"
	15 "Manipur"
	16 "Meghalaya"
	17 "Mizoram"
	18 "Nagaland"
	19 "Orissa"
	20 "Punjab"
	21 "Rajasthan"
	22 "Sikkim"
	23 "Tamil Nadu"
	24 "Tripura"
	25 "Uttar Pradesh"
	26 "West Bengal"
	27 "Andaman & Nicobar"
	28 "Chandigarh"
	29 "Dadra & Nager Haveli"
	30 "Daman & Diu"
	31 "Delhi"
	32 "Lakshdweep"
	33 "Pondicherry";
	
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
	01 	"January"
	02 	"February"
	03 	"March"
	04 	"April"
	05 	"May"
	06 	"June"
	07 	"July"
	08 	"August"
	09 	"September"
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
	01 "Not literate"
	02 "Literate without formal Schooling"
	03 "Literate below primary"
	04 "Primary"
	05 "Middle"
	06 "Secondary"
	07 "Graduate and above in agriculture"
	08 "Graduate and above in engineering/technology"
	09 "Graduate and above in medicine"
	99 "Graduate and above in other subjects";

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
	530	"Spectacles"
	531	"Torch Light"
	532 "Fountain Pen"
	533 "Lock"
	534 "Umbrella, Rain Coat"
	535 "Walking Stick"
	536 "Lighter"
	537 "Sanitary Napkins"
	538 "Other Goods for personal care"
	539 "Other Goods for personal care s.t."
	540 "Toilet Soap"
	541 "Toothbrush, toothpaste, tooth powder"
	542 "Powder, snow, cream"
	543 "Hair Oil,lotion,shampoo,hair cream"
	544 "Comb"
	545 "Shaving Blades, Shaving stick"
	546 "Shaving Cream"
	547 "Other Shaving requisites"
	548 "Other toilet articles"
	549 "Toilet Articles s.t."
	550 "Electric bulb, tube light"
	551 "Electric Batteries"
	552 "Other non-durable electric goods"
	553 "Earthenware"
	554 "Glassware"
	555 "Plastic Goods"
	556 "Coir, Rope, etc."
	557 "Washing Soap"
	560 "Washing Soda"
	561 "Other washing requisites"
	562 "Incense"
	563 "Fresh Flowers"
	564 "Insecticides and related products"
	568 "Other petty articles"
	569 "sundry articles s.t."
	579 "Misc. Consumer goods s.t."
	580 "Domestic servant/cook"
	581 "Sweeper"
	582 "Barber, Beautician, etc."
	583 "Washerman, Launderer"
	584 "Tailor"
	585 "Priest"
	586 "Legal expenses"
	587 "Post and Telegram"
	590 "Telephone Charges"
	591 "Repair charges"
	592 "Grinding charges"
	593 "Misc. Expenses"
	594 "Pet animals"
	599 "Consumer Services s.t."
	600 "Airfare"
	601 "Railway Fare"
	602 "Bus Fare"
	603 "Taxi, auto-rickshaw fare"
	604 "Steamer, Boat fare"
	605 "Rickshaw(hand-drawn)"
	606 "Bullock Cart fare"
	607 "Horse cart fare"
	610 "Hand operated cart"
	611 "Porter charges"
	612 "Petrol"
	613 "Diesel"
	614 "LUbricating oil"
	615 "other imputed value of owned conveyances"
	616 "School bus/van fare"
	618 "Other hired conveyance"
	619 "Conveyance s.t."
	629 "Misc. Consumer services s.t."
	630 "House rent, garage rent "
	631 "Residential land rent"
	632 "Consumer rent(other goods)"
	639 "Rent s.t."
	640 "Consumer taxes and Cesses"
	641 "Water Charges"
	648 "Other Taxes etc."
	649 "Consumer taxes and Cesses"
	650 "Books, journals"
	651 "Newspapers, periodicals"
	652 "Library charges"
	653 "Stationery"
	654 "Tuition and other fees (school, college, etc.)"
	655 "Private Tutor"
	658 "Other educational expenses"
	659 "Education: s.t."
	660 "Institutional medicine"
	661 "Institutional x-ray, ECG, pathological tests etc."
	662 "Institutional doctor's/surgeon's fee"
	663 "Institutional nurse/midwife"
	664 "Hospital Charges"
	665 "Nursing home/polyclinic charges"
	668 "Other medical expenses"
	669 "Institutional Medical expenses s.t."
	670 "Non-Institutional medicine"
	671 "Family Planning Appliances"
	672 "Non-Institutional x-ray, ECG, pathological tests etc."
	673 "Non-Institutional doctor's fees"
	674 "Non-Institutional Nurse/Midwife"
	678 "Other medical expenses"
	679 "Non-Institutional Medical  expenses s.t."	
	690 "Bedstead"
	691 "Almirah"
	692 "Dressing table"
	693 "Chair"
	694 "Couch, Sofa"
	695 "Table, desk"
	696 "Stool, Bench"
	697 "Suitcase, trunks, box, hand bag and other travel goods"
	700 "Foam, rubber cushion"
	701 "Carpet, daree and other floor matting"
	702 "Paintings, drawings, engravings etc."
	708 "Other furniture and fixtures"
	709 "Furniture & fixtures: sub-total (550-557)"
	710 "Gramaphone and Record Player"
	711 "Radio"
	712 "Radiogram"
	713 "Television"
	714 "Camera & photographic equipment"
	715 "Tape Recorder"
	716 "Harmonium"
	717 "Piano"
	720 "Musical record,video/audio cassette"
	721 "Other Musical Intruments"
	728 "Other goods for recreation, entertainment and hobbies"
	729 "Goods for recreation: sub-total"
	730 "Gold Ornaments"
	731 "Silver Ornaments"
	732 "Jewels, Pearls"
	738 "Other Ornaments"
	739 "Jewellery & ornaments: s.t."
	740 "Stainless steel"
	741 "Bell Metal Utensils"
	742 "Copper Utensils"
	743 "Aluminium Utensils"
	744 "Iron Utensils"
	745 "Brass Utensils"
	746 "Enamel Utensils"
	747 "Melamine crockery"
	748 "Other household utensils"
	749 "Household Utensils: s.t."
	750 "Electric Fan"
	751 "Stove (Pressure type)"
	752 "Pressure Cooker/pan"
	753 "Non-Stick Pan"
	754 "Geyser"
	755 "Sewing Machine"
	756 "Washing Machine"
	757 "Refrigerator"
	760 "Air Conditioner, Air Cooler"
	761 "Latern, Lamp,Tube light"
	762 "Electric iron, Heater, toaster and other electric heating appliances"
	763 "Thermos/Thermoware"
	768 "Oven and other cooking and household appliances"
	769 "Cooking and Household appliances"
	770 "Bicycle"
	771 "Motor Cycle, Scooter"
	772 "Motor Car, Jeep"
	773 "Tyres/Tubes"
	774 "Parambulator"
	778 "Other Transport equipment"
	779 "Personal transport Equipment"
	780 "Hearing Aid"
	781 "Glass eyes, artificial limbs, Orthopaedic braces"
	782 "Surgical belts, trusses and supports"
	783 "Clinical thermometer"
	788 "Other Therapautic appliances and equipments"
	789 "Therapeutic Appliances and equipments"
	790 "Clock/watch"
	791 "Type-writer"
	792 "Electric Hair dryer and shaver"
	798 "Other Personal Goods"
	799 "Other Personal Goods s.t."
	800 "Pipes and other sanitary fittings"
	801 "Plugs switches and other electrical fittings"
	802 "Residential building and land(Cost of repairs)"
	808 "Other Durables"
	809 "Residential building land and other durables s.t."
	819 "Durable Grand Total";
#delimit cr
set more off
	
forvalues l=1/12 {
	infix `commonvar' `level`l'var' using NSS54raw.txt if level=="0`l'", clear
	gen hhid=plot_no+block+sec_strat+hhd
	gen state= substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var srl_no			"Serial Number"
	la var rnd				"Round"
	la var state_reg		"State-Region"
	la var sub_sample 		"Sub-Sample"
	la var state			"State"
	la var sub_rnd			"Sub-Round"	
	la var plot_no			"Plot Number"
	la var vill_no			"Village Number"
	la var block			"Block Number/Sample Village No."
	la var sec_strat		"Second Stage Stratum"
	la var hhd				"Sample Household"
	la var level			"Level"
	la var sec				"Sector"
	la var dist				"District Code"
	la var strat			"Stratum"
	la var sub_strat		"Sub-Stratum"
	la var update			"Update Code"
	la var mult				"Multiplier Code"
	la var mult_com			"Multiplier Combined Code"
	la val state statelbl
	la val sec seclbl
	
	if level==1 {
		la var inf_srlno		"Informant's Serial Number"
		la var resp_code		"Response Code"
		la var surv_code		"Survey Code"
		la var subs_code		"Reason for Informant's Substitute"
		la var time				"Time taken to Survey"
		la var d_o_s			"Date of Survey"
		la var hh_size			"Household Size"
		la var nic				"NIC Codes"
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
		la val meal_out perform_c ration yesnolbl
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
		la var get_food			"Do all members of the family get 2 meals"
		la var mon1				"Month 1"
		la var mon2				"Month 2"
		la var mon3				"Month 3"
		la var mon4				"Month 4"
		la var mon5				"Month 5"
		la var mon6				"Month 6"
		la var mon7				"Month 7"
		la var mon8				"Month 8"
		la var mon9				"Month 9"
		la var mon10			"Month 10"
		la var mon11			"Month 11"
		la var mon12			"Month 12"
		la var ask_ques			"Whether question actually asked"
		la val ask_ques get_food yesnolbl
		la val mon1-mon12 monthlbl
	}
	
	if level==3 {
		la var personid			"Person Id"
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
	
	if level==4 {
		la var item_code		"Item Code"
		la var quant_c			"Quantity of Cash Purchase"
		la var val_c			"Value of Cash Purchse"
		la var quant_h			"Quantity of consumption out of home grown produce"
		la var val_h			"Value of home grown produce"
		la var quant_t			"Quantity of Total Consumption"
		la var val_t			"value of Total Consumption"
		la val item_code itemlbl
	}

	if level==5 {
		la var item_code		"Item Code"
		la var quant_c			"Quantity of Cash Purchase"
		la var val_c			"Value of Cash Purchse"
		la var quant_h			"Quantity of consumption out of home produced stock"
		la var val_h			"Value of home grown produce"
		la var quant_t			"Quantity of Total Consumption"
		la var val_t			"value of Total Consumption"
		la val item_code itemlbl
	}
	
	if level==6 {
		la var item_code		"Item Code"
		la var quant_c			"Quantity of Cash Purchase"
		la var val_c			"Value of Cash Purchse"
		la var quant_h			"Quantity of consumption out of home grown produce"
		la var val_h			"Value of home grown produce"
		la var quant_t			"Quantity of Total Consumption"
		la var val_t			"value of Total Consumption"
		la val item_code itemlbl
	}
	
	if level==7 {
		la var item_code		"Item Code"
		la var val_c			"Value of Goods in cash"
		la var val_ck			"Value of Goods in cash and kind"
		la val item_code itemlbl
	}
	
	if level==8 {
		la var item_code		"Item Code"
		la var val_c			"Value of Goods in cash"
		la var val_ck			"Value of Goods in cash and kind"
		la val item_code itemlbl
	}
		
	if level==9 {
		la var item_code		"Item Code"
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
		la val hire_w yesnolbl
	}
	
	if level==10 {
		la var ceremony_no		"Serial Number of Ceremony"
		la var code				"Code"
		la var exp_food			"Expenditure on Food"
		la var exp_f_l			"Expenditure on Fuel and Light"
		la var exp_cloth		"Expenditure on Clothes and Footwear"
		la var exp_misc			"Expenditure on Miscellaneous goods and services"
		la var exp_goods		"Expenditure on Durable Goods"
	}
	
	if level==11 {
		la var ceremony_no		"Serial Number of Ceremony"
		la var code				"Code"
		la var exp_food			"Expenditure on Food"
		la var exp_f_l			"Expenditure on Fuel and Light"
		la var exp_cloth		"Expenditure on Clothes and Footwear"
		la var exp_misc			"Expenditure on Miscellaneous goods and services"
		la var exp_goods		"Expenditure on Durable Goods"
	}
	
	if level==12 {
		la var item_code		"Item Code"
		la var type				"Type Code"
		la var val				"Value"
	}
	
	save "`datadir'/dta/NSS54/level`l'", replace
}	 

