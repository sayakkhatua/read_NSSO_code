* Loading Data for NSS 38 Round

set trace off
local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS38/Data/"
set more off
*set trace on

/* Working on Record Type 01 and 14 
*  only do once
* combine data files for record type 01 and 14 rural and urban
foreach s in "R" "U" {
	local snames "`snames'DL0114`s'.TXT "
}
!cat `snames' > NSS38_1raw.txt

* combine data files for record type 02 rural and urban
foreach s in "R" "U" {
	local snames "`snames'D200l02`s'.TXT "
}
!cat `snames' > NSS38_2raw.txt

* combine data files for record type 02 rural and urban
foreach s in "R" "U" {
	local snames "`snames'D120L03`s'.TXT "
}
!cat `snames' > NSS38_3raw.txt

forvalues s=1/12 {
	local snames "`snames'NSS38`s'.TXT "
}
!cat `snames' > NSS38raw.txt
*/

local commonvar_1		///
	 rec_type			1-2		///
	 rnd				3-3		///
	 sec				4-4		///
	 str fsu				5-9		///
	 str state_reg			10-12	///
	 sub_rnd			13-13	///
	 str hhd				14-15	///
	 sample				16-16	///
	 str strat				17-18	///
	 sub_sample			19-19	///
	 block				20-21	///
	 inf_code			22-22	///
	 inf_type			23-23	///
	 surv_code			24-24	///
	 subs_code			25-25	///
	 inc_acc			26-26	///
	 exp_acc			27-27	///
	 adult_m			28-29	///
	 adult_f			30-31	///
	 child				32-33	///
	 total_mem			34-35	///
	 nic				36-41	///
	 hh_type			42-42	/// not included
	 religion			43-43	///
	 soc_grp			44-44	///
	 hstead_type		45-45	///
	 land_possess_w		46-51	///
	 mpce				52-59	///
	 latrine			60-60	///
	 f_latrine			61-62	///
	 water				63-63	///
	 cook				64-64	///
	 light				65-65	///
	 land				66-66	/// check
	 area_covered		67-71	///
	 land_possess		72-72	///
	 plinth				73-73	///
	 dwell_type			74-74	///
	 struc_type			75-75	///
	 floor_type			76-76	///
	 rent_mon			77-83	///
	 house_con			84-84	///
	 get_food			85-85	///
	 rec_no				86-87	///
	 last_rec			88-88	///
	 update				89-89	///
	 p_strat			90-92	///
	 mult_com			93-101	///
	 mult_ss			102-110

local commonvar_2				///
	sec					1-1		///
	str state_reg			2-4		///
	str strat				5-7		///
	sub_rnd				8-8		///
	sub_sample			9-9		///
	str fsu					10-14	///
	str hhd					15-16	///
	soc_grp				17-17	///
	hhtype				18-18	///
	mpce				19-26	///
	mpce_code			27-28	///
	persons				29-30	///
	con_unit			31-34	///
	meal_cerm			35-38	///
	meal_guest			39-42	///
	meal_employee		43-46	///
	meal_free			47-49	///
	meal_pay			50-52	///
	meal_home			53-55	///
	cereal				56-63	///
	cereal_sub			64-71	///
	food_grp1			72-79	///
	food_grp2			80-87	///
	food_grp3			88-95	///
	food_grp4			96-103	///
	food_grp5			104-111	///
	calorie_total		112-119	///
	cereals_dec			120-126	///
	pulses				127-133	///
	milk				134-140	///
	meat_etc			141-147	///
	protein_tot			148-154	///
	fat_tot				155-161	///
	exp_tot_food		162-171	///
	exp_tot_nonfood		172-181	///
	mult_com			182-190	///
	mult_ss				191-199	///
	hhtype_old			200-200

local commonvar_3				///
	sec					1-1		///
	str state_reg			2-4		///
	str strat				5-7		///
	sub_rnd				8-8		///
	sub_sample			9-9		///
	str fsu					10-14	///
	str hhd					15-16	///
	soc_grp				17-17	///
	hhtype				18-18	///
	mpce				19-26	///
	mpce_code			27-28	///
	persons				29-30	///
	male				31-32	///
	female				33-34	///
	child				35-36	///
	cer_no				37-38	///
	con_unit			39-42	///
	meal_cerm			43-46	///
	meal_guest			47-50	///
	meal_employee		51-54	///
	meal_home			55-57	///
	meal_pay			58-60	///
	meal_free			61-63	///
	no_meals			64-65	///
	dwell_type			66-66	///
	struc_type			67-67	///
	land				68-68	///
	rent_mon			69-75	///
	area_covered		76-80	///
	mpce_adj			81-88	///
	rent_mpce			89-96	///
	latrine				97-97	///
	water				98-98	///
	cook				99-99	///
	light				100-100	///
	get_food			101-101	///
	mult_com			102-110	///
	mult_ss				111-119	///
	hhd_old				120-120
	
local commonvar				///
	sec					1-1		///
	str state_reg			2-4		///
	str strat				5-7		///
	sub_rnd				8-8		///
	sub_sample			9-9		///
	str fsu					10-14	///
	str hhd					15-16	///
	soc_grp				17-17	///
	hhtype				18-18	///
	mpce				19-26	///
	mpce_code			27-28	///
	male				29-30	///
	female				31-32	///
	person_tot			33-34	///
	rec_type			35-36	///
	item_code			37-39

local level4var					///	
	type				40-40	///
	quant_c				41-48	///
	val_c				49-56	///
	quant_h				57-64	///
	val_h				65-72	///
	quant_t				73-80	///
	val_t				81-88	///
	mult_com			89-97	///
	mult_ss				98-106	///
	hhtype_old			107-107

local level5var					///	
	type				40-40	///
	quant_c				41-48	///
	val_c				49-56	///
	quant_h				57-64	///
	val_h				65-72	///
	quant_t				73-80	///
	val_t				81-88	///
	mult_com			89-97	///
	mult_ss				98-106	///
	hhtype_old			107-107

local level6var					///	
	type				40-40	///
	quant_c				41-48	///
	val_c				49-56	///
	quant_h				57-64	///
	val_h				65-72	///
	quant_t				73-80	///
	val_t				81-88	///
	mult_com			89-97	///
	mult_ss				98-106	///
	hhtype_old			107-107
	
local level7var					///
	quant_pair			40-42	///
	val_pair			43-50	///
	quanth_pair			51-53	///
	valh_pair			54-61	///
	quantt_pair			62-64	///
	valt_pair			65-72	///
	mult_com			73-81	///
	mult_ss				82-90	///
	hhtype_old			91-91

local level8var					///
	quant_pair			40-42	///
	val_pair			43-50	///
	quanth_pair			51-53	///
	valh_pair			54-61	///
	quantt_pair			62-64	///
	valt_pair			65-72	///
	mult_com			73-81	///
	mult_ss				82-90	///
	hhtype_old			91-91

local level9var					///
	val_c				40-47	///
	val_c_k				48-55	///
	mult_com			56-64	///
	mult_ss				65-73	///
	hhd_old			74-74

local level10var				///
	number				40-42	///
	val_c_fir			43-50	///
	val_ck_fir			51-58	///
	val_c_sec			59-66	///
	val_ck_sec			67-74	///
	mult_com			75-83	///
	mult_ss				84-92	///
	hhd_old			93-93

local level11var				///
	number				40-42	///
	val_c_fir			43-50	///
	val_ck_fir			51-58	///
	val_c_sec			59-66	///
	val_ck_sec			67-74	///
	mult_com			75-83	///
	mult_ss				84-92	///
	hhd_old			93-93				

local level12var				///
	number				40-42	///
	val_c				43-50	///
	val_c_k				51-58	///
	mult_com			59-67	///
	mult_ss				68-76	///
	hhd_old			77-77

local level13var				///
	number				40-42	///
	val_c				43-50	///
	val_c_k				51-58	///
	mult_com			59-67	///
	mult_ss				68-76	///
	hhd_old			77-77

	
#delimit ;
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

la def infcodelbl
	1 "Head of Household"		
	2 "Other members of household"
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

la def hsteadlbl
	1 "Owned"
	9 "Other";
	
la def latrine
	1 "NO latrine"
	2 "Service shared"
	3 "Service exclusive"
	4 "Septic tank Shared"
	5 "Septic tank exclusive"
	6 "Flush System shared"
	7 "Flush System exclusive"
	8 "Others shared"
	9 "Others exclusive";

la def waterlbl
	1 "Tap water"
	2 "Tube-well"
	3 "Hand Pump"
	4 "Pucca well"
	5 "Ponds, tanks reserved for drinking"
	6 "Canal, river, spring"
	9 "Others";

la def cookcodelbl
	1  "Coke,Coal"
	2  "Firewood and Chips"
	3  "LPG"
	4  "Gobar gas"
	5  "Dung Cake"
	6  "Charcoal"
	7  "Kerosene"
	8  "Electricity"
	9  "Others";

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
	
la def item5lbl
	101 "Paddy"
	102 "Rice – other sources"
	103 "Chira"
	104 "Khoi, lawa"
	105 "Muri"
	109 "Other rice products"
	110 "Rice s.t."
	111 "Wheat"
	112 "Atta"
	113 "Maida"
	114 "Suji, rawa"
	115 "Sewai, noodles"
	116 "Bread (bakery)"
	119 "Other wheat products"
	110 "Wheat s.t."
	121 "Jowar"
	122 "Jowar products"
	120 "Jowar s.t."
	131 "Bajra"
	132 "Bajra products"
	130 "Bajra s.t."
	141 "Maize"
	142 "Maize Products"
	140 "Maize s.t."
	151 "Barley"
	152 "Barley products"
	150 "Barley s.t."
	161 "Small millets"
	162 "Small millet products"
	160 "Small millet s.t."
	171 "Ragi"
	172 "Ragi and products"
	170 "Ragi s.t."
	999 "Cereal: sub-total (109+119+129+139+149+159+169+179)"
	181 "Gram: whole"
	182 "Gram Products"
	180 "Gram s.t."
	191 "Tapioca dry/sago"
	192 "Tapioca-green"
	193 "Mahua"
	194 "Jackfruit seed"
	199 "Other Cereal Substitutes"
	190 "Cereal substitutes: s.t.(200-208)"
	201 "Arhur"
	202 "Gram-split"
	203 "Moong"
	204 "Masur"
	205 "Urd"
	206 "Khesari"
	207 "Peas"
	208 "Soyabean"
	209 "Other pulses"
	200 "Pulses: s.t.(210-218)"
	211 "Besan"
	219 "Other pulse products"
	210 "Pulses & pulse products: s.t. (219+220+228)"
	221 "Milk: liquid (litre)"
	222 "Baby food"
	223 "Milk: condensed/ powder"
	224 "Curd"
	225 "Ghee"
	226 "Butter"
	227 "Ice-cream"
	229 "Other milk products"
	220 "Milk & milk products: s.t.(230-239)"
	231 "Vanaspati"
	232 "Margarine"
	233 "Mustard oil"
	234 "Groundnut oil"
	235 "Coconut oil"
	236 "Til oil"
	237 "Linseed oil"
	238 "Refined oil"
	241 "Palm oil"
	242 "Rapeseed oil"
	243 "Oilseed"
	249 "Edible oil(others)"
	240 "Edible oil: s.t. (240-258)"
	251 "Goat meat/mutton"
	252 "Mutton"
	253 "Beef"
	254 "Pork"
	255 "Buffalo Meat"
	259 "Other meat"
	250 "Meat:s.h."
	261 "Poultry"
	262 "Other Birds"
	271 "Eggs (no.)"
	272 "Egg(Products)"
	281 "Fish fresh"
	282 "Fish Dry"
	280 "Meat,Egg,Fish:s.t."
	301 "Potato"
	302 "Arum"
	303 "Radish"
	304 "Carrot"
	305 "Turnip"
	306 "Beet"
	307 "Sweet Potato"
	308 "Onion"
	309 "Other root vegetable"
	300 "Root vegetables:s.t."
	311 "Pumpkin"
	312 "Gourd"
	313 "Bitter gourd"
	314 "Cucumber"
	315 "Parwal/patal"
	316 "Jhinga, torai"
	317 "Snake gourd"
	319 "Other gourd"
	310 "Gourd: s.t."
	321 "Cauliflower"
	322 "Cabbage"
	323 "Brinjal"
	324 "Lady's finger"
	325 "Palak"
	326 "Other leafy vegetables"
	327 "French beans, barbati"
	320 "Other vegetables:s.t.(310-318)"
	330 "Vegetables all"
	341 "Banana (no.)"
	342 "Jackfruit"
	343 "Watermelon"
	344 "Pineapple (no.)"
	345 "Coconut (no.)"
	346 "Guava"
	347 "Singara"
	348 "Orange, mausami (no.)"
	351 "Mango"
	352 "Kharbooza"
	353 "Pears/naspati"
	354 "Berries"
	355 "Leechi"
	356 "Apple"
	357 "Grapes"
	359 "Other fresh fruits"
	350 "Fruits (fresh): s.t.(330-348)"
	361 "Coconut: copra"
	362 "Groundnut"
	363 "Dates"
	364 "Cashewnut"
	365 "Walnut"
	366 "Other nuts"
	367 "Raisin, kishmish, monacca, etc."
	369 "Other dry fruits"
	360 "Fruits (dry): s.t."
	371 "Sugar(crystal)"
	372 "khandsari"
	373 "Gur(cane)"
	374 "Gur(others)"
	375 "Sugar Candy, misri"
	376 "Honey"
	379 "Sugar(others)"
	370 "Sugar: s.t. (360-368)"
	381 "Sea Salt"
	382 "other Salt"
	380 "Salt:s.t.(370-378)"
	391 "Turmeric (gm)"
	392 "Black pepper (gm)"
	393 "Dry chillies (gm)"
	394 "Garlic"
	395 "Tamarind (gm)"
	396 "Ginger"
	397 "Curry powder (gm)"
	399 "Other spices (gm)"
	390 "Spices: s.t. (380-388)"
	401 "Tea : cups (no.)"
	402 "Tea : leaf (gm)"
	403 "Coffee : cups (no.)"
	404 "Coffee: powder (gm)"
	405 "Ice"
	406 "Cold beverages: bottled/canned (litre)"
	407 "Fruit juice and shake (litre)"
	408 "Coconut Green(no.)"
	409 "Other beverages: cocoa, chocolate, etc."
	400 "Beverages s.t."
	411 "Biscuits"
	412 "Salted refreshments"
	413 "Prepared sweets"
	414 "Cooked meals (no.)"
	415 "Cake, pastry"
	416 "Pickles (gm)"
	417 "Sauce (gm)"
	418 "Jam, jelly (gm)"
	419 "Other processed food"
	410 "Processed Food: s.t."
	420 "Beverages, etc.: sub-total (290-308)"
	501 "Pan: leaf (no.)"
	502 "Pan: finished (no.)"
	503 "Supari (gm)"
	504 "Lime(gm)"
	505 "Katha(gm)"
	509 "Other ingredients for Pan (gm)"
	500 "Pan: s.t. (430-438)"
	511 "Bidi (no.)"
	512 "Cigarettes (no.)"
	513 "Leaf tobacco (gm)"
	514 "Snuff (gm)"
	515 "Hookah tobacco (gm)"
	516 "Cheroot (no.)"
	517 "Zarda, kimam, surti (gm)"
	519 "Other tobacco products"
	510 "Tobacco: s.t. (320-327)"
	521 "Ganja (gm)"
	522 "Toddy (litre)"
	523 "Country liquor (litre)"
	524 "Opium, Bhang, Charas"
	525 "Beer (litre)"
	526 "Foreign liquor or refined liquor"
	529 "other drugs and intoxicants"
	520 "Intoxicants: s.t. (450-458)"
	601 "Coke"
	602 "Firewood and chips"
	603 "Electricity (std. unit)"
	604 "Dung cake"
	605 "Kerosene"
	606 "Matches (box)"
	607 "Coal"
	608 "Coal gas"
	611 "Gas:oil/natural "
	612 "Charcoal"
	613 "Other oil used for lighting"
	614 "Candle (no.)"
	615 "Methylated spirit"
	616 "Gobar gas"
	600 "Fuel and light: s.t.(460-478)";

la def item6lbl
	101 "Dhoti (Metre)"
	102 "Sari (Metre)"
	103 "Cloth for shirt, pyjama, salwar, etc. (metre)"
	104 "Cloth for coat, trousers, overcoat, etc. (metre)"
	105 "Chaddar, dupatta, shawl, etc. (no.)"
	106 "Lungi (no.)"
	107 "Gamchha, towel, handkerchief (no.)"
	108 "Hosiery articles, stockings, undergarments, etc.(no.)"
	111 "Ready-made garments (no.)"
	112 "Headwear (no.)"
	113 "Sweater, muffler, scarf,Knitted garments, pullover etc."
	114 "Bed sheet, bed cover (no.)"
	115 "Rug, blanket (no.)"
	116 "Pillow, quilt, mattress (no.)"
	117 "Cloth for upholstery, curtain, table-cloth, etc. (metre)"
	118 "Mosquito net (no.)"
	121 "Mats and matting (no.)"
	122 "Cotton (gm)"
	123 "Knitting wool"
	129 "Clothing Others"
	120 "Clothing: s.t.(480-508)"
	131 "Tailoring charges"
	132 "Stitching charges"
	133 "Knitting Charges"
	130 "Tailoring s.t.";
	
la def item7lbl
	141 "Leather boots, shoes"
	142 "Leather sandals, chappals, etc."
	148 "Other leather footwear"
	149 "Other footwear"
	140 "Footwear: sub-total (390-394)";

la def item8lbl
	201 "Cinema, theatre"
	202 "Mela, fair, picnic"
	203 "Sports goods, toys, etc."
	204 "Goods for recreation and hobbies"
	207 "Photography"
	205 "Newspapers, periodicals"
	206 "Library charges"
	209 "Other amusement"
	200 "Amusement s.t."
	211 "Allopathic Medicine"
	212 "Homeopathic Medicine"
	213 "Ayurvedic Medicine"
	214 "Unani Medicine"
	215 "Doctor charges"
	216 "Family planning appliances"
	219 "Other Medical expenses"
	210 "Medical:s.t."
	221 "Shaving Blades"
	222 "Other non-electrical shaving requisites"
	223 "Torch Light and batteries"
	224 "Fountain Pen"
	225 "Lock"
	226 "Walking Stick"
	228 "Sunglass"
	229 "Other goods for personal care and effect"
	220 "Goods for personal care s.t."
	231 "Toilet soap"
	232 "Toothpaste, toothbrush, comb, etc."
	233 "Powder, snow, cream, lotion and perfume"
	234 "Hair oil, shampoo, hair cream"
	235 "Comb"
	239 "Other toilet articles"
	230 "Toilet articles: sub-total (450-458)"
	241 "Electric bulb, tubelight"
	242 "Electric Batteries"
	243 "Other non-durable electric goods"
	244 "Earthenware"
	245 "Glassware"
	246 "Bucket, water bottle/ feeding bottle & other plastic goods"
	247 "Choir, rope, etc."
	248 "Washing soap"
	249 "Washing soda"
	251	"Other washing requisites"
	252 "Incense (agarbatti)"
	259 "Other petty articles"
	250 "Sundry Articles: s.t.(570-588)"
	261 "Barber, beautician, etc."
	262 "Washerman, laundry, ironing"
	263 "Domestic servant/cook"
	264 "Sweeper"
	265 "Priest"
	266 "Postage, Telephone,telegram"
	267 "Repair charges for non-durables"
	269 "Other consumer services excluding conveyance"
	260 "Consumer services excluding conveyance: sub-total (480-494)"
	271 "Railway fare"
	272 "Bus/taxi fare"
	273 "Bullock cart fare"
	274 "Porter Charges"
	275 "Airway fare"
	276 "Steamer, Boat Fare"
	277 "Rickshaw (hand drawn & cycle) fare"
	278 "Horse cart fare"
	281 "Hand Operated Cart Fare"
	282 "Petrol for vehicle"
	289 "Other Hired Conveyence"
	280 "Conveyence: s.t.(620-638)"
	291 "Pet animal and others(Specify)"
	290 "Misc. Consumer services: s.t."
	311 "House Rent, Garage Rent"
	312 "Residential land rent"
	313 "Other consumer rent"
	310 "Rent: sub-total (520-523)"
	320 "Consumer taxes and cesses: sub-total (540-541)";

la def item9lbl
	401 "Bedstead"
	402 "Almirah, dressing table"
	403 "Dressing table"
	404 "Stool, Bench"
	405 "Chair"
	406 "Couch, Sofa"
	407 "Table, desk"
	408 "Suitcase/trunk,box etc."
	411 "Foam, rubber cushion"
	412 "Carpet"
	413 "Paintings and drawings, engravings"
	419 "Other furniture and fixtures"
	421 "Harmonium"
	422 "Piano"
	423 "Gramaphone"
	424 "Radio"
	425 "Radiogram"
	426 "Television"
	427 "Camera and Photographic equipment"
	428 "Tape recorder"
	431 "Record"
	438 "Other Musical instrument"
	439 "Other goods for recreation entertainment hobbies"
	441 "Gold Ornaments"
	442 "Silver ornaments"
	443 "Jewels pearls"
	449 "Other Ornaments"
	451 "Stainless steel utensils"
	452 "Bell metal utensils"
	453 "Copper utensils"
	454 "Aluminium utensils"
	455 "Iron utensils"
	456 "Brass utensils"
	457 "Enamel utensils"
	458 "Crockery"
	459 "Others"
	461 "Electric Fan"
	462 "Lantern, Lamp"
	463 "Electric iron, heater, toaster and other electrical heating appliances"
	464 "Stove (Pressure type)"
	465 "Pressure Cooker"
	466 "Sewing Machine"
	467 "Washing Machine"
	468 "Refrigerator"
	471 "Air Conditioner, Air Cooler"
	479 "Ovens etc. Other cooking and houshold appliances"
	481 "Bicycle"
	482 "Motor Cycle scooter"
	483 "Motor Car"
	484 "Tyres and tubes"
	485 "Perambulator"
	489 "Other transport equipment"
	491 "Hearing aids"
	492 "Glass eyes, artificial limbs etc."
	493 "Surgical belts, trusses and supports"
	494 "Clinical thermometer"
	499 "Other therapeutic applicances"
	501 "Spectacles"
	502 "Clock, Watch"
	503 "Umbrella, Raincoat"
	504 "Type writer"
	505 "Electric Hair Dryer and Shaver"
	509 "Other personal goods"
	511 "residential building and land cost and repairs"
	519 "Other Durables"
	500 "Durable goods Total"
	531 "Books, Journals"
	532 "Tuition fees"
	534	"Stationery"
	539 "Other educational expenses"
	540 "Club fees"
	550 "Medical";
	
la def itemlbl
	999 "Cereals"
	180 "Gram"
	190 "Cereal Substitutes"
	210 "Pulses"
	220 "Milk and Milk Products"
	240 "Edible Oil"
	280 "Meat, Egg, Fish"
	330 "Vegetables"
	350 "Fruits"
	360 "Fruits(dry)"
	370 "Sugar"
	380 "Salt"
	390 "Spices"
	420 "Beverages, refreshments and processed food"
	500 "Pan"
	510 "Tobacco"
	520 "Intoxicants"
	600 "Fuel and  Light"
	120 "Clothing"
	130 "Tailoring"
	140 "Footwear"
	290 "Misc goods and services"
	210 "Medical expenses"
	530 "Educational Expenses"
	540 "Club fees"
	310 "Rent"
	320 "Taxes and Cesses";
	
#delimit cr
set more off

foreach s in "1" "14" {
	infix `commonvar_1' using NSS38_1raw.txt if rec_type==`s', clear
	gen hhid=fsu+strat+hhd
	gen state =substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state					"State"
	la var hhid						"Household ID"
	la var rec_type					"Record Type"
	la var rnd						"Round"
	la var sec						"Sector"
	la var fsu						"Serial no.of village"
	la var state_reg				"State-Region"
	la var sub_rnd					"Sub-Round"
	la var hhd						"Sample Household no"
	la var sample					"Sample"
	la var strat					"Stratum"
	la var sub_sample				"Sub-Sample"
	la var block					"Sample Village or block"
	la var inf_code					"Informant Code"
	la var inf_type					"Informant Type"
	la var surv_code				"Survey Code"
	la var subs_code				"Reason for Casualty"
	la var inc_acc					"Whether household maintains account of incomes"
	la var exp_acc					"Whether household maintains account of expenditures"
	la var adult_m					"Adult Male"
	la var adult_f					"Adult Female"
	la var child					"Children"
	la var total_mem				"Total members/household size"
	la var nic						"Household principal industry occupation code"
	la var religion					"Religion"
	la var soc_grp					"Social Group"
	la var hstead_type				"Homestead Type"
	la var land_possess_w			"Household land possessed"
	la var mpce						"Percapita monthly consumer expenditure"
	la var latrine					"Type of Latrine"
	la var f_latrine				"If flush system of latrine no of latrines"
	la var water					"Primary source of drinking water"
	la var cook						"Primary source of energy used for cooking"
	la var light					"Primary source of energy used for lighting"
	la var land						"Land owned, hired, others"
	la var area_covered				"Covered area"
	la var land_possess				"Land Possess code"
	la var plinth					"Plinth Level"
	la var dwell_type				"Type of Dwelling Unit"
	la var struc_type				"Type of Structure"
	la var floor_type				"Type of Floor"
	la var rent_mon					"Monthly Rent"
	la var house_con				"condition of the house"
	la var get_food					"Do all members of the household get 2 square meals a day"
	la var rec_no					"Record Number"
	la var last_rec					"Last record Indicator"
	la var update					"Update code"
	la var p_strat					"Posted stratum code"
	la var mult_com					"Multiplier Combined"
	la var mult_ss					"Multiplier Sub-sample"
	la val state statelbl
	la val inf_code infcodelbl
	la val inf_type respcodelbl
	la val surv_code survcodelbl
	la val subs_code subscodelbl
	la val religion relilbl
	la val soc_grp socgrplbl
	la val hstead_type hsteadlbl
	la val latrine latrinelbl
	la val water waterlbl
	la val cook cookcodelbl
	la val light lightcodelbl
	la val land landlbl
	la val land_possess landpossesslbl
	la val plinth plinthlbl
	la val dwell_type dwelltypelbl
	la val struc_type structypelbl
	la val floor_type floortypelbl
	la val get_food getfoodlbl

	save "`datadir'/dta/NSS38/level`s'", replace
}

infix `commonvar_2' using NSS38_2raw.txt, clear
	gen hhid=fsu+strat+hhd
	gen state =substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state						"State"
	la var hhid							"Household ID"
	la var sec							"Sector"
	la var state_reg					"State-Region"
	la var strat						"Stratum"
	la var sub_rnd						"Sub-Round"
	la var sub_sample					"Sub-Sample"
	la var fsu							"Serial Number"
	la var hhd							"Sample household number"
	la var soc_grp						"Household Social Group"
	la var mpce							"Monthly Percapita expenditure"
	la var mpce_code					"MPCE Code"
	la var persons						"Persons"
	la var con_unit						"Consumer unit"
	la var meal_cerm					"Number of meals served to guests in ceremony"
	la var meal_guest					"Number of meals served to guests in other ceremonies"
	la var meal_employee				"Number of meals served to employees in other ceremonies"
	la var meal_free					"Number of meals consumed free of cost"
	la var meal_pay						"Number of meals consumed on payment"
	la var meal_home					"Number of meals consumed at home"
	la var cereal						"Calories taken from cereals"
	la var cereal_sub					"Calories taken from cereal substitute"
	la var food_grp1					"Calories taken food group 1"
	la var food_grp2					"Calories taken food group 2"
	la var food_grp3					"Calories taken food group 3"
	la var food_grp4					"Calories taken food group 4"
	la var food_grp5					"Calories taken food group 5"
	la var calorie_total				"Total Calories taken"
	la var cereals_dec					"Protein from Cereals"
	la var pulses						"Protein from pulses"
	la var milk							"Protein from milk"
	la var meat_etc						"Protein from meat, fish, egg"
	la var protein_tot					"Total Protein"
	la var fat_tot						"Total Fat"
	la var exp_tot_food					"Total expenditure on food"
	la var exp_tot_nonfood				"Total expenditure on non food items"
	la var mult_com						"Multiplier-Combined"
	la var mult_ss						"Multiplier sub-sample"
	la var hhtype_old					"Household type old"
	la val state statelbl
	
	if sec==1 {
		la var hhtype   		"Household Type Rural"
		la val hhtype hhtyperlbl
		}
		if sec==2 {
		la var hhtype   		"Household Type Urban"
		la val hhtype hhtypeulbl
	 }
save "`datadir'/dta/NSS38/level2", replace


infix `commonvar_3' using NSS38_3raw.txt, clear
	gen hhid=fsu+strat+hhd
	gen state =substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state						"State"
	la var hhid							"Household ID"
	la var sec							"Sector"
	la var state_reg					"State-Region"
	la var strat						"Stratum"
	la var sub_rnd						"Sub-Round"
	la var sub_sample					"Sub-Sample"
	la var fsu							"Serial Number"
	la var hhd							"Sample household number"
	la var soc_grp						"Household Social Group"
	la var mpce							"Monthly Percapita expenditure"
	la var mpce_code					"MPCE Code"
	la var persons						"Persons"
	la var male							"Males"
	la var female						"Females"
	la var child						"Children"
	la var cer_no						"Number of Ceremony"
	la var con_unit						"Consumer unit"
	la var meal_cerm					"Number of meals served to guests in ceremony"
	la var meal_guest					"Number of meals served to guests in other ceremonies"
	la var meal_employee				"Number of meals served to employees in other ceremonies"
	la var meal_free					"Number of meals consumed free of cost"
	la var meal_pay						"Number of meals consumed on payment"
	la var meal_home					"Number of meals consumed at home"
	la var no_meal						"Number of persons did not take meals"
	la var dwell_type					"Type of Dwelling unit"
	la var struc_type					"Type of Structure"
	la var land							"Land Owned hired"
	la var rent_mon						"MOnthly Rent"
	la var area_covered					"Covered Area"
	la var mpce_adj						"MOnthly Percapita consumption expenditure"
	la var rent_mpce					"Rent adjusted MPCE"
	la var latrine						"type of Latrine"
	la var water						"Primary source of drinking water"
	la var cook							"Primary source of cooking"
	la var light						"Primary source of lighting"
	la var get_food						"Do member get square meals a day"
	la var mult_com						"Multiplier-Combined"
	la var mult_ss						"Multiplier sub-sample"
	la var hhd_old						"Household old"
	la val state statelbl
	la val dwell_type dwelltypelbl
	la val struc_type structypelbl
	la val land landlbl
	la val latrine latrinelbl
	la val water waterlbl
	la val cook cookcodelbl
	la val light lightcodelbl
	la val get_food getfoodlbl

	if sec==1 {
		la var hhtype   		"Household Type Rural"
		la val hhtype hhtyperlbl
		}
		if sec==2 {
		la var hhtype   		"Household Type Urban"
		la val hhtype hhtypeulbl
	 }
save "`datadir'/dta/NSS38/level3", replace


forvalues s=4/13 {
	infix `commonvar' `level`s'var' using NSS38raw.txt if rec_type==`s', clear
	gen hhid=fsu+strat+hhd
	gen state =substr(state_reg,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var state						"State"
	la var hhid							"Household ID"
	la var sec							"Sector"
	la var state_reg					"State-Region"
	la var strat						"Stratum"
	la var sub_rnd						"Sub-Round"
	la var sub_sample					"Sub-Sample"
	la var fsu							"Serial Number"
	la var hhd							"Sample household number"
	la var soc_grp						"Household Social Group"
	la var mpce							"Monthly Percapita expenditure"
	la var mpce_code					"MPCE Code"
	la var person_tot					"Persons"
	la var male							"Males"
	la var female						"Females"
	la var person_tot					"Total persons"
	la var rec_type						"Record Type"
	la val state statelbl
	la val sec seclbl
	
	if sec==1 {
		la var hhtype   		"Household Type Rural"
		la val hhtype hhtyperlbl
		}
		if sec==2 {
		la var hhtype   		"Household Type Urban"
		la val hhtype hhtypeulbl
	 }

	
	if rec_type==4 {
		la var item_code				"Item Code"
		la var type						"Type Code"
		la var quant_c					"Cash Purchase quantity"
		la var val_c					"Cash Purchase value"
		la var quant_h					"Quantity of home grown produce consumed"
		la var val_h					"value of home grown produce consumed"
		la var quant_t					"Total Quantity Consumption"
		la var val_t					"Total value of Consumption"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhtype_old				"Household type old"
		la val item_code item5lbl
		la val type typelbl
		}
	
	if rec_type==5 {
		la var item_code				"Item Code"
		la var type						"Type Code"
		la var quant_c					"Cash Purchase quantity"
		la var val_c					"Cash Purchase value"
		la var quant_h					"Quantity of home grown produce consumed"
		la var val_h					"value of home grown produce consumed"
		la var quant_t					"Total Quantity Consumption"
		la var val_t					"Total value of Consumption"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhtype_old				"Household type old"
		la val item_code item5lbl
		la val type typelbl
		}
	
	if rec_type==6 {
		la var item_code				"Item Code"
		la var type						"Type Code"
		la var quant_c					"Cash Purchase quantity"
		la var val_c					"Cash Purchase value"
		la var quant_h					"Quantity of home grown produce consumed"
		la var val_h					"value of home grown produce consumed"
		la var quant_t					"Total Quantity Consumption"
		la var val_t					"Total value of Consumption"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhtype_old				"Household type old"
		la val item_code item6lbl
		la val type typelbl
		}
		
	if rec_type==7 {
		la var item_code				"Item Code"
		la var quant_pair				"Quantity of Pairs in cash"
		la var val_pair					"Value of Pairs in cash"
		la var quanth_pair				"Quantity of consumption of Home grown stock"
		la var valh_pair				"Value of consumption of home grown stock"
		la var quantt_pair				"Total quantity consumed"
		la var valt_pair				"Total value of consumption"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhtype_old				"Household type old"
		la val item_code item7lbl
		}
	
	if rec_type==8 {
		la var item_code				"Item Code"
		la var quant_pair				"Quantity of Pairs in cash"
		la var val_pair					"Value of Pairs in cash"
		la var quanth_pair				"Quantity of consumption of Home grown stock"
		la var valh_pair				"Value of consumption of home grown stock"
		la var quantt_pair				"Total quantity consumed"
		la var valt_pair				"Total value of consumption"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhtype_old				"Household type old"
		la val item_code item8lbl
		}
	
	if rec_type==9 {
		 la var item_code				"Item Code"
		 la var val_c					"Value in Cash"
		 la var val_c_k					"value in cash and Kind"
		 la var mult_com					"Multiplier-Combined"
		 la var mult_ss					"Multiplier sub-sample"
		 la var hhd_old					"Household old"
		 la val item_code item9lbl
		 }
	
	if rec_type==10	{
		la var item_code				"Item Code"
		la var number					"Number"
		la var val_c_fir				"Value in Cash of first hand purchase"
		la var val_ck_fir				"value in cash and kind of first hand purchase"
		la var val_c_sec				"Value in cash of second hand purchase"
		la var val_ck_sec				"Value in cash and kind if second hand purchase"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhd_old					"Household old"
		la val item_code item9lbl
	}

	if rec_type==11	{
		la var item_code				"Item Code"
		la var number					"Number"
		la var val_c_fir				"Value in Cash of first hand purchase"
		la var val_ck_fir				"value in cash and kind of first hand purchase"
		la var val_c_sec				"Value in cash of second hand purchase"
		la var val_ck_sec				"Value in cash and kind if second hand purchase"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhd_old					"Household old"
		la val item_code item9lbl
	}
	
	if rec_type==12 {
		la var item_code				"Item Code"
		la var val_c					"Value in Cash"
		la var val_c_k					"value in Cash and Kind"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhd_old					"Household old"
		la val item_code itemlbl
	}
	
	if rec_type==13 {
		la var item_code				"Item Code"
		la var val_c					"Value in Cash"
		la var val_c_k					"value in Cash and Kind"
		la var mult_com					"Multiplier-Combined"
		la var mult_ss					"Multiplier sub-sample"
		la var hhd_old					"Household old"
		la val item_code itemlbl
	}
save "`datadir'/dta/NSS38/level`s'", replace
}	
	
