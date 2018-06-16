* loads raw data from NSS61

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS61/Data/"

/* combine all state data files (only do one time - uncomment to redo)
forvalues s=1/8 {  // create list of file names for different states
	local snames "`snames'RMAH`s'C01.TXT "
}
!cat `snames' > NSS61raw.txt  // combine all states into 1 file (Unix/Mac only)
*/

local commonvar					///
	str centrecode		1-3		///
	str lot_fsu			4-8		///
	str round			9-10 	///
	str sch_no			11-13 	///
	str sample			14-14 	///
	str sector			15-15 	///
	str state_region	16-18 	///
	str dist			19-20 	///
	str strat_num		21-22 	///
	str sub_strat		23-24 	///
	str sub_round		25-25 	///
	str sub_sample		26-26 	///
	str sub_region		27-30 	///
	str sub_block		31-31 	///
	str sec_strat		32-32 	///
	str hhs				33-34 	///
	str level			35-36
	
local level1var					///
	str inf_no     		42-43 	///
	str respcode   		44-44 	///
	str surv_code  		45-45 	///
	str sub_code   		46-46 	///
	str d_o_s      		47-52 	///
	str d_o_d      		53-58 	///
	str time_canvas		59-61 	///
	str every_food 		62-62 	///
	str mon1   			63-64 	///
	str mon2   			65-66 	///
	str mon3   			67-68 	///
	str mon4   			69-70 	///
	str mon5   			71-72 	///
	str mon6   			73-74 	///
	str mon7   			75-76 	///
	str mon8   			77-78 	///
	str mon9   			79-80 	///
	str mon10   		81-82 	///
	str mon11   		83-84 	///
	str inf_actual   	85-85 	///
	str spl_char   		86-87

local level2var						///
	str hhsize 				42-43 	///
	str nic_code 			44-48 	///
	str nco_code 			49-51 	///
	str hhtype 				52-52 	///
	str religion 			53-53 	///
	str soc_grp 			54-54 	///
	str own_land 			55-55 	///
	str own_land_type 		56-56 	///
	str land_own_posses 	57-65 	///
	str land_leased 		66-74 	///
	str land_none 			75-83 	///
	str land_out 			84-92 	///
	str land_total 			93-101 	///
	str cultivate 			102-110 	///
	str irrigate 			111-119 	///
	str spl_char 			120-121

local level3var					///
	str dwell_unit   	42-42 	///
	str cook_code   	43-44 	///
	str light_code   	45-45 	///
	str reg_income   	46-46 	///
	str rationcard   	47-47 	///
	str rationc_type 	48-48 	///
	str food_work   	49-49 	///
	str anno   			50-50 	///
	str icds   			51-51 	///
	str mdm   			52-52 	///
	str perf_ceremony 	53-53 	///
	str meal_nonhh   	54-57 	///
	str mpce30   		58-65 	///
	str mpce365   		66-73 	///
	str spl_char   		74-75

local level4var					///
	str person_no   	40-41 	///
	str relation   		42-42 	///
	str sex   			43-43 	///
	str age   			44-46 	///
	str marital_stat  	47-47 	///
	str educ   			48-49 	///
	str days_away   	50-51 	///
	str meal_daily   	52-52 	///
	str meal_school   	53-54 	///
	str meal_employer 	55-56 	///
	str meal_other   	57-58 	///
	str meal_pay   		59-60 	///
	str meal_home   	61-62
		
local level5var						///
	str item_code   		39-41 	///
	str home_prod_q   		42-50 	///
	str home_prod_v   		51-58 	///
	str total_consume_q 	59-67 	///
	str total_consume_v 	68-75 	///
	str source_code   		76-76
	
local level6var					///
	str item_code   	39-41 	///
	str last30_q   		42-50 	///
	str last30_v   		51-58 	///
	str last365_q   	59-67 	///
	str last365_v   	68-75 	///
	str spl_char   		76-76
	
local level7var					///
	str item_code   	39-41 	///
	str last_30_v   	42-49 	///
	str last_365_v   	50-57 	///
	str spl_char   		58-59
	
local level8var					///
	str item_code   	39-41 	///
	str value   		42-49
	
local level9var								///
	str item_code   				39-41 	///
	str possess   					42-42 	///
	str firsthand_purchase 			43-50 	///
	str cost   						51-58 	///
	str sechand_purchase   			59-66 	///
	str total_expense   			67-74 	///
	str firsthand_purchase_no		75-77 	///
	str hire_purchase   			78-78 	///
	str firsthand_purchase365  		79-86 	///
	str cost2   					87-94 	///
	str sechand_purchase_no   		95-97 	///
	str sechand_purchase365   		98-105 	///
	str total_expense365   			106-113

#delimit ;
la drop _all;
la def statelbl
	1  "Jammu & Kashmir"
	2  "Himachal Pradesh"
	3  "Punjab"
	4  "Chandigarh"
	5  "Uttaranchal"
	6  "Haryana"
	7  "Delhi"
	8  "Rajasthan"
	9  "Uttar Pradesh"
	10 "Bihar"
	11 "Sikkim"
	12 "Arunachal Pradesh"
	13 "Nagaland"
	14 "Manipur"
	15 "Mizoram"
	16 "Tripura"
	17 "Meghalaya"
	18 "Assam"
	19 "West Bengal"
	20 "Jharkhand"
	21 "Orissa"
	22 "Chattisgarh"
	23 "Madhya Pradesh"
	24 "Gujarat"
	25 "Daman & Diu"
	26 "D & N Haveli"
	27 "Maharastra"
	28 "Andhra Pradesh"
	29 "Karnataka"
	30 "Goa"
	31 "Lakshadweep"
	32 "Kerala"
	33 "Tamil Nadu"
	34 "Pondicherry"
	35 "A & N Islands";
	
la def respcodelbl 
	1 "Co-operative and capable" 
	2 "Co-operative but not capable" 
	3 "Busy" 
	4 "Reluctant" 
	9 "Others";

la def survcodelbl 
	1 "Original" 
	2 "Substitute" 
	3 "Casualty";

la def subscodelbl 
	1 "Informant busy" 
	2 "Members away from home" 
	3 "Informant non-cooperative" 
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
	1 "Self employed in non-agriculture"
	2 "Agriculture labour"
	3 "Other labour"
	4 "Self employed in agriculture"
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
	
la def landtypelbl 
	1 "Homestead only"
	2 "homestead and other land"
	3 "Other land only";
	
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
	5  "Dung Coke"
	6  "Charcoal"
	7  "Kerosene"
	8  "Electricity"
	9  "Others"
	10 "No cooking arrangement";
	
la def penergyllbl
	1 "Kerosene"
	2 "Other oil"
	3 "Gas"
	4 "Candle"
	5 "Electricity"
	6 "No lighting arrangement"
	9 "Others";
	
la def trcardlbl
	1 "Antodaya"
	2 "BPL"
	3 "Others";
	
la def rellbl
	1 "Self"
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
	02 "Literate without formal education"
	03 "Literate below primary"
	04 "Primary"
	05 "Middle"
	06 "Secondary"
	07 "Higher Secondary"
	08 "Diploma/Certificate course"
	10 "Graduate"
	11 "Post graduate and above";

la def itemlbl
	101 "Rice – PDS"
	102 "Rice – other sources"
	103 "Chira"
	104 "Khoi, lawa"
	105 "Muri"
	106 "Other rice products"
	107 "Wheat/ atta – PDS"
	108 "Wheat/ atta – other sources"
	110 "Maida"
	111 "Suji, rawa"
	112 "Sewai, noodles"
	113 "Bread (bakery)"
	114 "Other wheat products"
	115 "Jowar & its products"
	116 "Bajra & its products"
	117 "Maize & products"
	118 "Barley & its products"
	120 "Small millets & their products"
	121 "Ragi & its products"
	122 "Other cereals"
	129 "Cereal: sub-total (101-122)"
	139 "Cereal substitutes: tapioca, etc."
	140 "Arhar, tur"
	141 "Gram: split"
	142 "Gram: whole"
	143 "Moong"
	144 "Masur"
	145 "Urd"
	146 "Peas"
	147 "Soyabean"
	148 "Khesari"
	150 "Other pulses"
	151 "Gram products"
	152 "Besan"
	153 "Other pulse products"
	159 "Pulses & pulse products: s.t. (140-152)"
	160 "Milk: liquid (litre)"
	161 "Baby food"
	162 "Milk: condensed/ powder"
	163 "Curd"
	164 "Ghee"
	165 "Butter"
	166 "Ice-cream"
	167 "Other milk products"
	169 "Milk & milk products: s.t.(160-167)"
	170 "Vanaspati, margarine"
	171 "Mustard oil"
	172 "Groundnut oil"
	173 "Coconut oil"
	174 "Edible oil: others"
	179 "Edible oil: s.t. (190-194)"
	180 "Eggs (no.)"
	181 "Fish, prawn"
	182 "Goat meat/mutton"
	183 "Beef/ buffalo meat"
	184 "Pork"
	185 "Chicken"
	186 "Others: birds, crab, oyster, tortoise, etc."
	189 "Egg, fish & meat: s.t. (180-186)"
	190 "Potato"
	191 "Onion"
	192 "Radish"
	193 "Carrot"
	194 "Turnip"
	195 "Beet"
	196 "Sweet potato"
	197 "Arum"
	198 "Pumpkin"
	200 "Gourd"
	201 "Bitter gourd"
	202 "Cucumber"
	203 "Parwal, patal"
	204 "Jhinga, torai"
	205 "Snake gourd"
	206 "Papaya: green"
	207 "Cauliflower"
	208 "Cabbage"
	210 "Brinjal"
	211 "Lady's finger"
	212 "Palak/other leafy vegetables"
	213 "French beans, barbati"
	214 "Tomato"
	215 "Peas"
	216 "Chillis: green"
	217 "Capsicum"
	218 "Plantain: green"
	220 "Jackfruit: green"
	221 "Lemon (no.)"
	222 "Garlic"
	223 "Ginger"
	224 "Other vegetables"
	229 "Vegetables: s.t. (190-224)"
	230 "Banana (no.)"
	231 "Jackfruit"
	232 "Watermelon"
	233 "Pineapple (no.)"
	234 "Coconut (no.)"
	235 "Guava"
	236 "Singara"
	237 "Orange, mausami (no.)"
	238 "Papaya"
	240 "Mango"
	241 "Kharbooza"
	242 "Pears/naspati"
	243 "Berries"
	244 "Leechi"
	245 "Apple"
	246 "Grapes"
	247 "Other fresh fruits"
	249 "Fruits (fresh): s.t.(230-247)"
	250 "Coconut: copra"
	251 "Groundnut"
	252 "Dates"
	253 "Cashewnut"
	254 "Walnut"
	255 "Other nuts"
	256 "Raisin, kishmish, monacca, etc."
	257 "Other dry fruits"
	259 "Fruits (dry): s.t. (250-257)"
	260 "Sugar - PDS"
	261 "Sugar - other sources"
	262 "Gur"
	263 "Candy, misri"
	264 "Honey"
	269 "Sugar: s.t. (170-174)"
	279 "Salt"
	280 "Turmeric (gm)"
	281 "Black pepper (gm)"
	282 "Dry chillies (gm)"
	283 "Tamarind (gm)"
	284 "Curry powder (gm)"
	285 "Oilseeds (gm)"
	286 "Other spices (gm)"
	289 "Spices: s.t. (280-288)"
	290 "Tea : cups (no.)"
	291 "Tea : leaf (gm)"
	292 "Coffee : cups (no.)"
	293 "CoffeE: powder (gm)"
	294 "Ice"
	295 "Cold beverages: bottled/canned (litre)"
	296 "Fruit juice and shake (litre)"
	297 "Coconut Green(no.)"
	298 "Other beverages: cocoa, chocolate, etc."
	300 "Biscuits"
	301 "Salted refreshments"
	302 "Prepared sweets"
	303 "Cooked meals (no.)"
	304 "Cake, pastry"
	305 "Pickles (gm)"
	306 "Sauce (gm)"
	307 "Jam, jelly (gm)"
	308 "Other processed food"
	309 "Beverages, etc.: sub-total (290-308)"
	310 "Pan: leaf (no.)"
	311 "Pan: finished (no.)"
	312 "Supari (gm)"
	313 "Lime(gm)"
	314 "Katha(gm)"
	315 "Other ingredients for Pan (gm)"
	319 "Pan: s.t. (310-312)"
	320 "Bidi (no.)"
	321 "Cigarettes (no.)"
	322 "Leaf tobacco (gm)"
	323 "Snuff (gm)"
	324 "Hookah tobacco (gm)"
	325 "Cheroot (no.)"
	326 "Zarda, kimam, surti (gm)"
	327 "Other tobacco products"
	329 "Tobacco: s.t. (320-327)"
	330 "Ganja (gm)"
	331 "Toddy (litre)"
	332 "Country liquor (litre)"
	333 "Beer (litre)"
	334 "Foreign/refined liquor or wine (litre)"
	335 "Other intoxicants"
	339 "Intoxicants: s.t. (330-335)"
	340 "Coke"
	341 "Firewood and chips"
	342 "Electricity (std. unit)"
	343 "Dung cake"
	344 "Kerosene – PDS (litre)"
	345 "Kerosene – other sources (litre)"
	346 "Matches (box)"
	347 "Coal"
	348 "LPG "
	350 "Charcoal"
	351 "Candle (no.)"
	352 "Gobar gas"
	353 "Other fuel"
	359 "Fuel and light: s.t.(340-353)"
	360 "Dhoti (Metre)"
	361 "Sari (Metre)"
	362 "Cloth for shirt, pyjama, salwar, etc. (metre)"
	363 "Cloth for coat, trousers, overcoat, etc. (metre)"
	364 "Chaddar, dupatta, shawl, etc. (no.)"
	365 "Lungi (no.)"
	366 "Gamchha, towel, handkerchief (no.)"
	367 "Hosiery articles, stockings, undergarments, etc.(no.)"
	368 "Ready-made garments (no.)"
	370 "Headwear (no.)"
	371 "Sweater, muffler, scarf, etc. (no.)"
	372 "Knitting wool, cotton yarn (gm)"
	373 "Clothing (first-hand): other"
	374 "Clothing: second-hand"
	379 "Clothing: sub-total (360-374)"
	380 "Bed sheet, bed cover (no.)"
	381 "Rug, blanket (no.)"
	382 "Pillow, quilt, mattress (no.)"
	383 "Cloth for upholstery, curtain, table-cloth, etc. (metre)"
	384 "Mosquito net (no.)"
	385 "Mats and matting (no.)"
	386 "Cotton (gm)"
	387 "Bedding: others"
	389 "Bedding, etc.: s.t. (380-387)"
	390 "Leather boots, shoes"
	391 "Leather sandals, chappals, etc."
	392 "Other leather footwear"
	393 "Rubber / PVC footwear"
	394 "Other footwear"
	399 "Footwear: sub-total (390-394)"
	400 "Books, journals"
	401 "Newspapers, periodicals"
	402 "Library charges"
	403 "Stationery"
	404 "Tuition and other fees (school, college, etc.)"
	405 "Private tutor/ coaching centre"
	406 "Other educational expenses"
	409 "Education: s.t. (400-406)"
	410 "Medicine"
	411 "X-ray, ECG, pathological test, etc."
	412 "Doctor's/surgeon's fee"
	413 "Hospital & nursing home charges"
	414 "Other medical expenses"
	419 "Medical - institutional: s.t. (410-414)"
	420 "Medicine"
	421 "X-ray, ECG, pathological test, etc."
	422 "Doctor’s/ surgeon’s fee"
	423 "Family planning appliances"
	424 "Other medical expenses"
	429 "Medical – non-institutional: sub-total (420-424)"
	430 "Cinema, theatre"
	431 "Mela, fair, picnic"
	432 "Sports goods, toys, etc."
	433 "Club fees"
	434 "Goods for recreation and hobbies"
	435 "Photography"
	436 "VCD/ DVD hire (incl. instrument)"
	437 "Cable TV Connection"
	438 "Other entertainment"
	439 "Entertainment: sub-total (430-438)"
	440 "Spectacles"
	441 "Torch"
	442 "Lock"
	443 "Umbrella, raincoat"
	444 "Lighter (bidi/ cigarette/ gas stove)"
	445 "Other goods for personal care and effects"
	449 "Goods for personal care and effects: sub-total (440-445)"
	450 "Toilet soap"
	451 "Toothpaste, toothbrush, comb, etc."
	452 "Powder, snow, cream, lotion and perfume"
	453 "Hair oil, shampoo, hair cream"
	454 "Comb"
	455 "Shaving blades, shaving stick, razor"
	456 "Shaving cream, aftershave lotion"
	457 "Sanitary napkins"
	458 "Other toilet articles"
	459 "Toilet articles: sub-total (450-458)"
	460 "Electric bulb, tubelight"
	461 "Batteries"
	462 "Other non-durable electric goods"
	463 "Earthenware"
	464 "Glassware"
	465 "Bucket, water bottle/ feeding bottle & other plastic goods"
	466 "Choir, rope, etc."
	467 "Washing soap/soda/powder"
	468 "Other washing requisites"
	470 "Incense (agarbatti)"
	471 "Flower (fresh): all purposes"
	472 "Insecticide, acid, etc"
	473 "Other petty articles"
	479 "Other household consumables: sub-total (460-473)"
	480 "Domestic servant/cook"
	481 "Sweeper"
	482 "Barber, beautician, etc."
	483 "Washerman, laundry, ironing"
	484 "Tailor"
	485 "Priest"
	486 "Legal Expenses"
	487 "Postage & telegram"
	488 "Telephone charges"
	490 "Repair charges for non-durables"
	491 "Grinding charges"
	492 "Miscellaneous expenses"
	493 "Pet animals(incl. bird, fish)"
	494 "Other consumer services excluding conveyance"
	499 "Consumer services excluding conveyance: sub-total (480-494)"
	500 "Air fare"
	501 "Railway fare"
	502 "Bus/tram fare"
	503 "Taxi, auto-rickshaw fare"
	504 "Steamer, boat fare"
	505 "Rickshaw (hand drawn & cycle) fare"
	506 "Horse cart fare"
	507 "Porter charges"
	508 "Petrol for vehicle"
	510 "Diesel for vehicle"
	511 "Lubricants & other fuels for vehicle"
	512 "School bus, van, etc."
	513 "Other conveyance expenses"
	519 "Conveyance: sub-total (500-513)"
	520 "House rent, garage rent (actual)"
	521 "Residential land rent"
	522 "Other consumer rent"
	529 "Rent: sub-total (520-523)"
	539 "House rent, garage rent (imputed-urban only)"
	540 "Water charges"
	541 "Other consumer taxes & cesses"
	549 "Consumer taxes and cesses: sub-total (540-541)"
	550 "Bedstead"
	551 "Almirah, dressing table"
	552 "Chair, stool, bench, table"
	553 "Suitcase, trunk, box, handbag and other travel goods"
	554 "Foam, rubber cushion"
	555 "Carpet, daree & other floor mattings"
	556 "Paintings, drawings, engravings, etc."
	557 "Other furniture & fixtures (couch, sofa, etc.)"
	559 "Furniture & fixtures: sub-total (550-557)"
	560 "Gramaphone and Record Player"
	561 "Radio"
	562 "Television"
	563 "VCR/VCD/DVD"
	564 "Camera & photographic equipment"
	565 "Tape Recorder,CD Player"
	566 "Gramaphone Record, audio/video cassette, etc"
	567 "Musical instruments"
	568 "Other goods for recreation"
	569 "Goods for recreation: sub-total (560-568)"
	570 "Gold ornaments"
	571 "Silver ornaments"
	572 "Jewels, pearls"
	573 "Other ornaments"
	579 "Jewellery & ornaments: sub-total (570-573)" 
	580 "Stainless steel utensils"
	581 "Other metal utensils"
	582 "Casseroles, thermos, thermoware"
	583 "Other crockery & utensils"
	589 "Crockery & utensils: sub-total (580-583)"
	590 "Electric fan"
	591 "Air conditioner"
	592 "Air Cooler"
	593 "Lantern, lamp, electric lampshade"
	594 "Sewing machine"
	595 "Washing machine"
	596 "Stove"
	597 "Pressure cooker/ pressure pan"
	598 "Refrigerator"
	600 "Electric iron, heater, toaster, oven & other electric heating appliances"
	601 "Other cooking/ household appliances"
	609 "Cooking & other household appliances: sub-total (590-601)"
	610 "Bicycle"
	611 "Motor cycle, scooter"
	612 "Motor car, jeep"
	613 "Tyres & tubes"
	614 "Other transport equipment"
	619 "Personal transport equipment: sub-total (600-604)"
	620 "Hearing aids & orthopaedic equipment"
	621 "Other medical equipment"
	629 "Therapeutic appliances: sub-total (620-621)"
	630 "Clock, watch"
	631 "Other machines for household work"
	632 "Personal Computer"
	633 "Mobile handset"
	634 "Any other personal goods"
	639 "Other personal goods: sub-total (630-634)"
	640 "Bathroom and sanitary equipment"
	641 "Plugs, switches & other electrical fittings"
	642 "Residential building & land (cost of repairs only)"
	643 "Other durables (specify)"
	649 "Residential building, land and other durables: sub-total (630-633)"
	659 "Durable goods: total (559+569+579+599+609+619+629+639+649)";

#delimit cr
set more off
	
forvalues l=1/9 {
	infix `commonvar' `level`l'var' using NSS61raw.txt if level=="0`l'", clear
	gen hhid=lot_fsu+sub_block+sec_strat+hhs
	gen state =substr(state_region,1,2)
	destring *, replace
	order hhid state
	sort hhid

	la var hhid      		"Household ID"
	la var state     		"State"
	la var centrecode   	"Centre code"
	la var lot_fsu	 		"FSU NO."
	la var round   			"Round"
	la var sch_no   		"Schedule Number"
	la var sample   		"Sample"
	la var sector   		"Sector"
	la var state_region 	"State-Region"
	la var dist   			"District"
	la var strat_num   		"Stratum Number"
	la var sub_strat   		"Sub-Stratum"
	la var sub_round   		"Sub-Round"
	la var sub_sample   	"Sub-Sample"
	la var sub_region   	"FOD Sub-Region"
	la var sub_block   		"Hamlet-Group/Sub-BLock No."
	la var sec_strat   		"Second Stage stratum"
	la var hhs   			"HHS NO."
	la var level     		"Level"
	la val state statelbl
	
	if level==1 {
		la var inf_no   		"Sl. No. of Informant"
		la var respcode   		"Response Code"
		la var surv_code   		"Survey Code"
		la var sub_code   		"Substitution Code"
		la var d_o_s   			"Date of Survey"
		la var d_o_d   			"Date of Despatch"
		la var time_canvas		"Time to Canvas"
		la var every_food   	"Get Enough Food everyday"
		la var mon1   			"Month not getting enough food"
		la var mon2   			"Month not getting enough food"
		la var mon3   			"Month not getting enough food"
		la var mon4   			"Month not getting enough food"
		la var mon5   			"Month not getting enough food"
		la var mon6   			"Month not getting enough food"
		la var mon7   			"Month not getting enough food"
		la var mon8   			"Month not getting enough food"
		la var mon9   			"Month not getting enough food"
		la var mon10   			"Month not getting enough food"
		la var mon11   			"Month not getting enough food"
		la var inf_actual   	"information actually obtained from"
		la var spl_char   		"Special character for OK stamp"
		la val respcode respcodelbl
		la val surv_code survcodelbl
		la val sub_code subscodelbl
		la val every_food getfoodlbl
		la val mon1-mon11 monthlbl
		la val inf_actual yesnolbl
	}
	
	if level==2 {
		la var hhsize   			"HH Size"
		la var nic_code   			"NIC Code"
		la var nco_code   			"NCO Code"
		la var hhtype   			"HH Type"
		la var religion   			"Religion"
		la var soc_grp   			"Social Group"
		la var own_land   			"Whether Owns a land"
		la var own_land_type   		"Type of Land owned"
		la var land_own_posses		"Land-owned and possessed"
		la var land_leased   		"Land leased in"
		la var land_none   			"Land neither owned nor leased in"
		la var land_out   			"Land Leased out"
		la var land_total   		"Land Total Possessed"
		la var cultivate   			"Cultivated-July03-June04"
		la var irrigate   			"Irrigated-July03-June04"
		la var spl_char   			"Special Characters for OK Stamp"
		la val hhtype hhtypelbl
		la val religion relilbl
		la val soc_grp socgrlbl
		la val own_land yesnolbl
		la val own_land_type landtypelbl
	}
	
	if level==3 {
		la var dwell_unit   	"Dwelling unit Code"
		la var cook_code   		"Cooking Code"
		la var light_code   	"Lighting Code"
		la var reg_income   	"Regular Salary Income"
		la var rationcard   	"Possess Ration card"
		la var rationc_type 	"Type of ration Card"
		la var food_work   		"Beneficiary-Food for Work"
		la var anno   			"Beneficiary-Annopoorna"
		la var icds   			"Beneficiary-ICDS"
		la var mdm   			"Benficiary-Midday Meal"
		la var perf_ceremony	"Perform Ceremony"
		la var meal_nonhh   	"Meals served to non household members"
		la var mpce30   		"MPCE 30 days"
		la var mpce365   		"MPCE 365 days"
		la var spl_char   		"Special Characters for ok stamp"
		la val reg_income rationcard food_work anno icds mdm perf_ceremony yesnolbl
		la val dwell_unit dwellunitlbl
		la val cook_code penergyclbl
		la val light_code penergyllbl
		la val rationc_type trcardlbl
	}
		
	if level==4 {
		la var person_no   		"Person Serial No."
		la var relation   		"Relation"
		la var sex   			"Sex"
		la var age   			"Age"
		la var marital_stat		"Marital Status"
		la var educ   			"Education"
		la var days_away   		"Days Stayed Away"
		la var meal_daily   	"No. of Meals Per day"
		la var meal_school   	"Meals(school)"
		la var meal_employer	"Meals(Employer)"
		la var meal_other   	"Meals(others)"
		la var meal_pay   		"Meals(Payment)"
		la var meal_home   		"Meals(At home)"
		la val relation rellbl
		la val sex sexlbl
		la val marital_stat mstatuslbl
		la val educ edulbl
	}
	
	if level==5 {
		la var item_code   		"Item code"
		la var home_prod_q   	"Home-Produce-Quantity"
		la var home_prod_v   	"Home Produce Value"
		la var total_consume_q	"Total Consumption-Quantity"
		la var total_consume_v	"Total Consumption-Value"
		la var source_code   	"Source Code"
		la val item_code itemlbl
	}
	
	if level==6 {
		la var item_code   "Item code"
		la var last30_q    "Last 30 Days Quantity"
		la var last30_v    "Last 30 Days Value"
		la var last365_q   "Last 365 Days Quantity"
		la var last365_v   "Last 365 Days Value"
		la var spl_char    "Source Code"
		la val item_code itemlbl
	}
	
	if level==7 {
		la var item_code   "Item Code"
		la var last_30_v   "Last 30 days Value"
		la var last_365_v  "Last 365 days Value"
		la var spl_char    "Special Characters"
		la val item_code itemlbl
	}
	
	if level==8 {
		la var item_code	"Item Code"
		la var value   		"Value"
		la val item_code itemlbl
	}
	
	if level==9 {
		la var item_code   				"Item Code"
		la var possess   				"Whether Possess"
		la var firsthand_purchase   	"First Hand Purchase Value(30)"
		la var cost   					"Cost-raw material,services and repairs"
		la var sechand_purchase   		"Second Hand Purchase Value(30)"
		la var total_expense   			"Total Expenditure(30)"
		la var firsthand_purchase_no	"First Hand Purchase Number(365)"
		la var hire_purchase   			"Whether Hire Purchased"
		la var firsthand_purchase365  	"First Hand Purchase Value(365)"
		la var cost2   					"Cost-raw materials, service and repairs"
		la var sechand_purchase_no   	"Second Hand Purchase Number(365)"
		la var sechand_purchase365   	"Second Hand Purchase Value(365)"
		la var total_expense365   		"Total Expenditure(365)"
		la val item_code itemlbl
		la val possess hire_purchase yesnolbl
	}
		
	save "`datadir'/dta/NSS61/level`l'", replace
}
