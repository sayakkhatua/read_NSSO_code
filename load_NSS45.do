* loads raw data from NSS45

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/Nss45_1.0/Data/"
set more off
set trace on

/*foreach s in "R" "U" {  
	local snames "`snames'D126`s'.TXT "
}
!cat `snames' > NSS45raw.txt  // combine rural and urban
*/

local commonvar			///
	 str plot_no		5-9		///
	 rnd				10-12	///
	 sub_reg			13-16	///
	 vill_no			17-21	///
	 str sub_block		22-22	///
	 str hhd			24-25	///
	 str level			26-27
	
local level1var				///
	 item_code		28-30	///
	 type			31-31	///
	 rel_inf		32-32	///
	 resp_code		33-33	///
	 surv_code		34-34	///
	 cas_code		35-35	///
	 hh_size		36-37	///
	 work			38-43	///
	 reli			44-44	///
	 grp_code		45-45	///
	 hh_type		46-46	///
	 land_own		47-52	///
	 lease_in		53-58	///
	 n_o_l			59-64	///
	 lease_out		65-70	///
	 land_poss		71-76	///
	 percap_exp		77-84	///
	 cook			85-85	///
	 light			86-86	///
	 dist	   		115-116	///
	 sec		   	117-117	///
	 str state_reg  118-120	///
	 strat	   		121-122	///
	 sub_strat  	123-123	///
	 sub_sample 	124-124	///
	 sub_rnd	   	125-125	///
	 update	   		126-126

local level2var				///
	 item_code		28-30	///
	 type			31-31	///
	 rel			32-32	///
	 sex			33-33	///
	 age			34-35	///
	 mar_stat		36-36	///
	 educ			37-37	///
	 away_days		38-39	///
	 meal_daily		40-40	///
	 meal_free		41-44	///
	 meal_pay		45-48	///
	 meal_home		49-52	///
	 week_act		53-54	///
	 ind_sec		55-55	///
	 ups			56-57	///
	 ind_sec2		58-58	///
	 ss				59-60	///
	 ind_sec3		61-61	///
	 update	   		126-126
	
local level3var				///
	 item_code		28-30	///
	 type			31-31	///
	 quant_c		32-39	///
	 val_c			40-47	///
	 quant_h		48-55	///
	 val_h			56-63	///
	 quant_g		64-71	///
	 val_g			72-79	///
	 quant_t		80-87	///
	 val_t			88-95	///
	 update	   		126-126

local level4var				///
	 item_code		28-30	///
	 type_cloth		31-31	///
	 quant_c		32-39	///
	 val_c			40-47	///
	 quant_h		48-55	///
	 val_h			56-63	///
	 quant_g		64-71	///
	 val_g			72-79	///
	 quant_t		80-87	///
	 val_t			88-95	///
	 update	   		126-126

local level5var				///
	 item_code		28-30	///
	 type			31-31	///
	 quant_c		32-39	///
	 val_c			40-47	///
	 quant_h		48-55	///
	 val_h			56-63	///
	 quant_g		64-71	///
	 val_g			72-79	///
	 quant_t		80-87	///
	 val_t			88-95	///
	 update	   		126-126

local level6var				///
	 item_code		28-30	///
	 type			31-31	///
	 val_c			32-39	///
	 val_ck			40-47	///
	 update	   		126-126

local level7var				///
	 item_code		28-30	///
	 type			31-31	///
	 fir_h_no		32-35	///
	 hire_w			36-36	///
	 cash_fir		37-44	///
	 c_k_fir		45-52	///
	 cash_r			53-60	///
	 c_k_r			61-68	///
	 cash_exp		69-76	///
	 c_k_exp		77-84	///
	 sec_h_no		85-88	///
	 cash_sec		89-96	///
	 c_k_sec		97-104	///
	 update	   		126-126
	
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

la def rel_inflbl
	1 "Head of household"
	2 "Other members of Hpisehold"
	9 "Others";
	
la def respcodelbl 
	1 "Co-operative and capable" 
	2 "Co-operative but not capable" 
	3 "Busy" 
	4 "Reluctant" 
	9 "Others";

la def survcodelbl 
	1 "Original" 
	2 "Substitute" 
	3 "Nothing Surveyed";

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
	
la def socgrlbl
	1 "Scheduled Tribe"
	2 "Scheduled Caste"
	3 "Neo-Buddhist"
	9 "Others";
	
la def dwellunitlbl
	1 "Owned"
	2 "Hired"
	3 "No-Dwelling Unit"
	9 "Others";
	
la def penergyclbl
	1  "Coke,Coal"
	2  "Firewood and Chips"
	3  "LPG"
	4  "Gobar gas"
	5  "Dung Cake"
	6  "Charcoal"
	7  "Kerosene"
	8  "Electricity"
	9  "Others"
	0  "No cooking arrangement";

la def lightcodelbl
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
	1 "Literate without formal education"
	2 "Literate below primary"
	3 "Primary"
	4 "Middle"
	5 "Secondary"
	6 "Graduate and above in agriculture"
	7 "Graduate and above in engineering/technology"
	8 "Graduate and above in medicine"
	9 "Graduate and above in other subjects";

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
	689 "Furniture & fixtures: sub-total (550-557)"
	690 "Gramaphone and Record Player"
	691 "Radio"
	692 "Radiogram"
	693 "Television"
	694 "Camera & photographic equipment"
	695 "Tape Recorder"
	709 "Goods for recreation: sub-total"
	719 "Jewellery & ornaments: s.t."
	729 "Household Utensils: s.t."
	730 "Electric Fan"
	731 "Stove (Pressure type)"
	732 "Pressure Cooker"
	733 "Sewing Machine"
	734 "Washing Machine"
	735 "Refrigerator"
	736 "Air Conditioner, Air Cooler"
	749 "Cooking and Household appliances";

#delimit cr;
set more off
	
forvalues l=1/7 {
	infix `commonvar' `level`l'var' using NSS45raw.txt if level=="0`l'", clear
	gen hhid=plot_no+sub_block+hhd
	destring hhid plot_no sub_block hhd level, replace
	order hhid 
	sort hhid

	la var hhid			"Household ID"
	la var plot_no 	 	"Plot Number"
	la var rnd		 	"Round"
	la var sub_reg 		"FOD Sub-Region"
	la var vill_no 	 	"Village Number"
	la var sub_block 	"Hamlet Group/Sub-Block"
	la var hhd		 	"Sample Household Number"
	la var level	 	"Level"
	
	if level==1 {
	gen state =substr(state_reg,1,2)
	destring state state_reg, replace
	la var item_code 	"Generated 000"
	la var type		 	"Generated 0"
	la var rel_inf	 	"Informants Relation"
	la var resp_code	"Response Code"
	la var surv_code	"Survey Code"
	la var cas_code 	"Casualty Code"
	la var hh_size		"Household Size"
	la var work			"Industry Occupation"
	la var reli			"Religion"
	la var grp_code		"Group Code"
	la var hh_type		"Homestead Type"
	la var land_own		"Land Area Owned"
	la var lease_in		"Land leased in"
	la var n_o_l		"Land Neither owned nor leased"
	la var lease_out	"Land leased out"
	la var land_poss	"Total land possess"
	la var percap_exp	"Percapita expenditure"
	la var cook			"Source of Cooking"
	la var light 		"Source of Lighting"
	la var dist			"District Code"
	la var sec			"Sector"
	la var state_reg	"State-Region"
	la var strat		"Stratum"
	la var sub_strat 	"Sub-stratum"
	la var sub_sample	"Sub-sample"
	la var sub_rnd		"Sub-round"
	la var state 	 	"State"
	la val rel_inf rel_inflbl
	la val resp_code respcodelbl
	la val surv_code survcodelbl
	la val hh_type hhtypelbl
	la val reli relilbl
	la val grp_code socgrlbl
	la val cook penergyclbl
	la val light lightcodelbl
	la val state statelbl
	
	}
	
	if level==2 {
	la var item_code	"Item Code"
	la var rel 			"Relation to head"
	la var sex			"Gender"
	la var age			"Age"
	la var mar_stat		"Marital Status"
	la var educ			"General Education Code"
	la var away_days	"Days Stayed Away"
	la var meal_daily	"Meals taken Daily"
	la var meal_free	"No.of meals taken in the last 30 days free of cost"
	la var meal_pay		"No.of meals taken in the last 30 days on payment"
	la var meal_home	"No.of meals taken in the last 30 days at home"
	la var week_act		"Weekly activity status"
	la var ind_sec		"Weekly activity status:Industry Sector"
	la var ups			"Usual Principal Status"
	la var ind_sec2		"UPS: Industry Sector"
	la var ss			"Subsidiary Status"
	la var ind_sec3		"SS: Industry Sector"
	la val rel rellbl
	la val sex sexlbl
	la val mar_stat mstatuslbl
	la val educ edulbl
	}
	
	if level==3 {
	la var item_code	"Code for Consumption of Food"
	la var quant_c		"Quantity of food purchased in Cash"
	la var val_c		"Value of food purchased"
	la var quant_h		"Quantity of food: Home Grown stock"
	la var val_h		"Value of food:Home Grown stock"
	la var quant_g		"Quantity of food: Gift, Loan"
	la var val_g		"Value of food: Gift, Loan"
	la var quant_t		"Total Quantity"
	la var val_t		"Total value of goods"
	la val item_code itemlbl
	}
	
	if level==4 {
	la var item_code	"Code for Consumption of Cloth"
	la var type_cloth	"Type of Cloth"
	la var quant_c		"Quantity of cloth purchased in Cash"
	la var val_c		"Value of cloth purchased"
	la var quant_h		"Quantity of cloth: Home Grown stock"
	la var val_h		"Value of cloth:Home Grown stock"
	la var quant_g		"Quantity of cloth: Gift, Loan"
	la var val_g		"Value of cloth: Gift, Loan"
	la var quant_t		"Total Quantity"
	la var val_t		"Total value of goods"
	la val item_code itemlbl
	la val type_cloth type_clothlbl
	}
	
	if level==5 {
	la var item_code	"Code for Consumption of footwear"
	la var quant_c		"Quantity of footwear purchased in Cash"
	la var val_c		"Value of footwear purchased"
	la var quant_h		"Quantity of footwear: Home Grown stock"
	la var val_h		"Value of footwear:Home Grown stock"
	la var quant_g		"Quantity of footwear: Gift, Loan"
	la var val_g		"Value of footwear: Gift, Loan"
	la var quant_t		"Total Quantity"
	la var val_t		"Total value of goods"
	la val item_code itemlbl
	}
	
	if level==6 {
	la var item_code	"Code for Miscellaneous goods"
	la var val_c		"Value of goods in cash"
	la var val_ck		"Value of goods in cash and kind"
	la val item_code itemlbl
	}
	
	if level==7 {
	la var item_code	"Code for Durable Goods"
	la var fir_h_no		"First hand purchase: number"
	la var hire_w		"Whether hire purchase"
	la var cash_fir		"First Hand Purchase in Cash"
	la var c_k_fir		"First hand purchase in cash and kind"
	la var cash_r		"Quantity of raw materials purchased in cash"
	la var c_k_r		"Quantity of raw materials purchased in cash and kind"
	la var cash_exp		"Total expenditure on durable goods in cash"
	la var c_k_exp		"Total expenditure on durable goods in cash and kind"
	la var sec_h_no		"Second hand purchase:number"
	la var cash_sec		"Second hand purchase in Cash"
	la var c_k_sec		"Second hand purchase in Cash and kind"
	la val hire_w yesnolbl
	la val item_code itemlbl
	}

	save "`datadir'/dta/NSS45/level`l'", replace

}	
