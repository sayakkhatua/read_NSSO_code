local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS59/Data/"
set more off
set trace on

/* combine all data files
forvalues s=1/8 {
	local snames "`snames'IH`s'10.TXT "
}
!cat `snames' > NSS59raw.txt
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
	str sub_round		23-23 	///
	str sub_sample		24-24 	///
	str sub_region		25-28 	///
	str sub_block		29-29 	///
	str sec_strat		30-30 	///
	str visit			31-31	///
	str hhs				32-33 	///
	str level			34-35	///
	str nss				127-129	///
	str nsc				130-132	///
	str mlt				133-142	
	
local level1var				///
	str inf_no     	41-42 	///
	str respcode   	43-43 	///
	str surv_code  	44-44 	///
	str sub_code   	45-45 	///
	str d_o_s      	46-51 	///
	str d_o_d      	52-57 	///
	str time_canvas	58-60

local level2var				///
	str hhsize 				41-42 	///
	str nic_code 			43-47 	///
	str nco_code 			48-50 	///
	str hhtype 				51-51 	///
	str religion 			52-52 	///
	str soc_grp 			53-53 	///
	str land_possess		54-55	///
	str dwell_unit			56-56	///
	str dwell_type			57-57	///
	str struc_type			58-58	///
	str area_covered		59-64	///
	str cook_code			65-66	///
	str light_code			67-67	///
	str meal_outside		68-68	///
	str meal_cer			69-69	///
	str ration				70-70	///
	str mpce				71-78	///
	str enough_food			79-79	///
	str mon1   				80-81 	///
	str mon2   				82-83 	///
	str mon3   				84-85	///
	str mon4   				86-87 	///
	str mon5   				88-89 	///
	str mon6   				90-91 	///
	str mon7   				92-93 	///
	str mon8   				94-95 	///
	str mon9   				96-97 	///
	str mon10   			98-99 	///
	str mon11   			100-101 ///
	str ask_ques			102-102

local level3var				///
	str person_no   	36-40 	///
	str relation   		41-41	///
	str sex   			42-42 	///
	str age   			43-44 	///
	str marital_stat  	45-45	///
	str educ   			46-47 	///
	str prin_status		48-49	///
	str prin_nic		50-51	///
	str sub_status		52-53	///
	str sub_nic			54-55	///
	str week_act		56-57	///
	str week_act_nic	58-59	///
	str days_away   	60-61 	///
	str meal_daily   	62-62 	///
	str meal_school   	63-64	///
	str meal_employer 	65-66 	///
	str meal_other   	67-68 	///
	str meal_pay   		69-70 	///
	str meal_home   	71-72

local level4var				///
	str item_code		36-40	///
	str quant			41-48	///
	str val				49-56	///
	str source_code		57-57

local level5var				///
	str item_code		36-40	///
	str quant			41-48	///
	str val				49-56

local level6var				///
	str item_code		36-40	///
	str val				41-48

local level7var			///
	str item_code   				36-40 	///
	str no_dos						41-43	///
	str firsthand_purchase_no		44-46 	///
	str hire_purchase   			47-47 	///
	str firsthand_purchase365  		48-55 	///
	str cost2   					56-63 	///
	str sechand_purchase_no   		64-66	///
	str sechand_purchase365   		67-74	///
	str total_expense365   			75-82

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

la def landposslbl
	01 "less than 0.005"
	02 "0.005-0.01"
	03 "0.02-0.20"
	04 "0.21-0.40"
	05 "0.41-1.00"
	06 "1.01-2.00"
	07 "2.01-3.00"
	08 "3.01-4.00"
	10 "4.01-6.00"
	11 "6.01-8.00"
	12 "greater than 8.00";

la def dwellunitlbl
	1 "Owned"
	2 "Hired"
	3 "No-Dwelling Unit"
	9 "Others";

la def dwelltypelbl
	1 "Independent House"
	2 "Flat"
	3 "No dwelling unit"
	9 "Others";

la def structypelbl
	1 "Pucca"
	2 "Semi-pucca"
	3 "Serviceable kachcha"
	4 "Unserviceable kachcha"
	5 "No structure";

la def cookcodelbl
	1  "Coke,Coal and Charcoal"
	2  "Firewood and Chips"
	3  "LPG"
	4  "Gobar gas"
	5  "Dung Cake"
	6  "Kerosene"
	7  "Electricity"
	9  "Others"
	8  "No cooking arrangement";

la def lightcodelbl
	1 "Kerosene"
	2 "Other oil"
	3 "Gas"
	4 "Candle"
	5 "Electricity"
	6 "No lighting arrangement"
	9 "Others";

la def enoughfoodlbl
	1 "Every month of the year"
	2 "Some months of the year"
	3 "No month of the year";

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

la def statuslbl
	11 "Own account worker"
	12 "Employer"
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
	97 "Others";

la def weekactlbl
	11 "Own account worker"
	12 "Employer"
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


la def sorlbl
	1 "Only purchase"
	2 "Only home grown stock"
	3 "Both purchase and home grown stock"
	4 "Only free collection"
	5 "Only exchange goods and services"
	6 "Only gifts/charities"
	9 "Others";


la def itemlbl
	101 "Rice: PDS"
	102 "Rice: other sources"
	103 "Chira"
	104 "Khoi, lawa"
	105 "Muri"
	106 "Other rice products"
	107 "Wheat/ atta � PDS"
	108 "Wheat/ atta � other sources"
	110 "Maida"
	111 "Suji, rawa"
	112 "Sewai, noodles"
	113 "Bread (bakery)"
	114 "Other wheat products"
	115 "Jowar & products"
	116 "Bajra & products"
	117 "Maize & products"
	118 "Barley & products"
	120 "Small millets & their products"
	121 "Ragi & its products"
	129 "Cereal: sub-total (101-121)"
	139 "Cereal substitutes: tapioca, etc."
	140 "Arhar(tur)"
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
	159 "Pulses & pulse products: s.t. (140-153)"
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
	179 "Edible oil: s.t. (170-174)"
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
	203 "Parwal/patal"
	204 "Jhinga/torai"
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
	222 "Other vegetables"
	229 "Vegetables: s.t. (190-222)"
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
	263 "Candy(misri)"
	264 "Honey"
	269 "Sugar: s.t. (170-174)"
	279 "Salt"
	280 "Turmeric (gm)"
	281 "Black pepper (gm)"
	282 "Dry chillies (gm)"
	283 "Garlic(gm)"
	284 "Tamarind (gm)"
	285 "Ginger"
	286 "Curry powder (gm)"
	287 "Oilseeds (gm)"
	288 "Other spices (gm)"
	289 "Spices: s.t. (280-288)"
	290 "Tea : cups (no.)"
	291 "Tea : leaf (gm)"
	292 "Coffee : cups (no.)"
	293 "Coffee: powder (gm)"
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
	344 "Kerosene - PDS (litre)"
	345 "Kerosene - other sources (litre)"
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
	422 "Doctor's/ surgeon's fee"
	423 "Family planning appliances"
	424 "Other medical expenses"
	429 "Medical � non-institutional: sub-total (420-424)"
	430 "Cinema, theatre"
	431 "Mela, fair, picnic"
	432 "Sports goods, toys, etc."
	433 "Club fees"
	434 "Goods for recreation and hobbies"
	435 "Photography"
	436 "VCD/ DVD hire (incl. instrument)"
	437 "Other entertainment"
	439 "Entertainment: sub-total (430-437)"
	440 "Spectacles"
	441 "Torch"
	442 "Pen"
	443	"Lock"
	444 "Umbrella, raincoat"
	445 "Lighter (bidi/ cigarette/ gas stove)"
	446 "Other goods for personal care and effects"
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
	466 "Coir, rope, etc."
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
	487 "Postage and Telegram"
	488 "Telephone Charges"
	490 "Repair charges for non-durables"
	491 "Grinding Charges"
	492 "Miscellaneous Expenses" 
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
	511 "Lubricating oil"
	512 "School bus, van, etc."
	513 "Other conveyance expenses"
	519 "Conveyance: sub-total (500-513)"
	520 "House rent, garage rent (actual)"
	521 "Residential land rent"
	522 "Other consumer rent"
	529 "Rent: sub-total (520-522)"
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
	560 "Gramaphone & record player"
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
	591 "Air conditioner,Air Cooler"
	592 "Lantern, lamp, electric lampshade"
	593 "Sewing machine"
	594 "Washing machine"
	595 "Stove"
	596 "Pressure cooker/ pressure pan"
	597 "Refrigerator"
	598 "Water Purifier"
	600 "Electric iron, heater, toaster, oven & other electric heating appliances"
	601 "Other cooking/ household appliances"
	609 "Cooking & other household appliances: sub-total (590-601)"
	610 "Bicycle"
	611 "Motor cycle, scooter"
	612 "Motor car, jeep"
	613 "Tyres & tubes"
	614 "Other transport equipment"
	619 "Personal transport equipment: sub-total (600-604)"
	620 "Glass eyes, hearing aids & orthopaedic equipment"
	621 "Other medical equipment"
	629 "Therapeutic appliances: sub-total (620-621)"
	630 "Clock, watch"
	631 "Other machines for household work"
	632 "Any other personal goods"
	639 "Other personal goods: sub-total (630-632)"
	640 "Bathroom and sanitary equipment"
	641 "Plugs, switches & other electrical fittings"
	642 "Residential building & land (cost of repairs only)"
	643 "Other durables (specify)"
	649 "Residential building, land and other durables: sub-total (640-643)"
	659 "Durable goods: total (559+569+579+599+609+619+629+639+649)";

#delimit cr
set more off
	
forvalues l=1/7 {
	infix `commonvar' `level`l'var' using NSS59raw.txt if level=="0`l'", clear
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
	la var sub_round   		"Sub-Round"
	la var sub_sample   	"Sub-Sample"
	la var sub_region   	"FOD Sub-Region"
	la var sub_block   		"Sub-Block Number"
	la var sec_strat   		"Second Stage stratum"
	la var visit			"Visit Number"
	la var hhs   			"HHS NO."
	la var level     		"Level"
	la var nss				"NSS code"
	la var nsc				"NSC code"
	la var mlt				"Multiplier"
	la val state statelbl
	la val sector seclbl
	la val sample samplelbl
	
	if level==1 {
		la var inf_no   	"Sl. No. of Informant"
		la var respcode   	"Response Code"
		la var surv_code   	"Survey Code"
		la var sub_code   	"Substitution Code"
		la var d_o_s   		"Date of Survey(DD/MM/YY)"
		la var d_o_d   		"Date of Despatch(DD/MM/YY)"
		la var time_canvas	"Time to Canvas(in minutes)"
		la val respcode respcodelbl
		la val surv_code survcodelbl
		la val sub_code subscodelbl
	}
	
	if level==2 {
		la var hhsize   		"Household Size"
		la var nic_code   		"NIC Code"
		la var nco_code   		"NCO Code"
		la var religion   		"Religion"
		la var soc_grp   		"Social Group"
		la var land_possess		"Amount of Land Possessed(in Hectares)"
		la var dwell_unit   	"Dwelling unit Code"
		la var dwell_type		"Type of Dwelling Unit"
		la var struc_type		"Type of Structure"
		la var area_covered		"Covered Area of structure(sq.m)"
		la var cook_code   		"Cooking Code"
		la var light_code   	"Lighting Code"
		la var meal_outside		"Meal taken outside, last 30 days"
		la var mpce				"MPCE code"
		la var meal_cer			"Whether household perform any ceremony"
		la var ration			"Whether household purchases any cereal from ration shop in last 30 days"
		la var enough_food		"Get enough food  everyday"
		la var mon1				"Month not getting enough food"
		la var mon2				"Month not getting enough food"
		la var mon3				"Month not getting enough food"
		la var mon4				"Month not getting enough food"
		la var mon5				"Month not getting enough food"
		la var mon6				"Month not getting enough food"
		la var mon7				"Month not getting enough food"
		la var mon8				"Month not getting enough food"
		la var mon9				"Month not getting enough food"
		la var mon10			"Month not getting enough food"
		la var mon11			"Month not getting enough food"
		la var ask_ques			"Whether info on enough food obtained from the informant"
		la val religion relilbl
		la val soc_grp socgrlbl
		la val land_possess landposslbl
		la val dwell_unit dwellunitlbl
		la val dwell_type dwelltypelbl
		la val struc_type structypelbl
		la val cook_code cookcodelbl
		la val light_code lightcodelbl
		la val enough_food enoughfoodlbl
		la val mon1-mon11 monthlbl
		la val meal_cer meal_outside ration ask_ques yesnolbl
	}
	
	if level==2 {
		if sector==1 {
		la var hhtype   		"Household Type Rural"
		la val hhtype hhtyperlbl
		}
		if sector==2 {
		la var hhtype   		"Household Type Urban"
		la val hhtype hhtypeulbl
	}
	}
	
	if level==3 {
		la var person_no   		"Person Serial No."
		la var relation   		"Relation"
		la var sex   			"Sex"
		la var age   			"Age(years)"
		la var marital_stat		"Marital Status"
		la var educ   			"Education"
		la var prin_status		"Usual activity"
		la var prin_nic			"NIC code"
		la var sub_status		"Subsidiary activity(economic)"
		la var sub_nic			"NIC code"
		la var week_act			"Current weekly activity"
		la var week_act_nic		"NIC code"
		la var days_away   		"Days Stayed Away"
		la var meal_daily   	"No. of Meals Per day"
		la var meal_school  	"Meals(school)"
		la var meal_employer	"Meals(Employer)"
		la var meal_other   	"Meals(others)"
		la var meal_pay   		"Meals(Payment)"
		la var meal_home   		"Meals(At home)"
		la val relation rellbl
		la val sex sexlbl
		la val marital_stat mstatuslbl
		la val educ edulbl
		la val prin_status sub_status statuslbl
		la val week_act weekactlbl
	}
	
	if level==4 {
		la var item_code	"Items"
		la var quant		"Quantity of Goods consumed"
		la var val			"Value of goods consumed"
		la var source_code	"Source of Food items"
		la val item_code itemlbl
		la val source_code sorlbl
	}
	
	if level==5 {
		la var item_code	"Items"
		la var quant		"Quantity of goods consumed(number)"
		la var val			"Value of goods consumed"
		la val item_code itemlbl
	}
	
	if level==6 {
		la var item_code	"Items"
		la var val			"Value of items"
		la val item_code itemlbl
	}
	
	if level==7 {
		la var item_code				"Items"
		la var no_dos					"Number of items in use on the date of survey"
		la var firsthand_purchase_no	"Number of first hand good purchased"
		la var hire_purchase			"Whether the good is hire purchased"
		la var firsthand_purchase365	"Value of purchase in last 365 days(in Rs.)"
		la var cost2 					"Cost of raw materials, repairs etc.(in Rs.)"
		la var sechand_purchase_no		"Number of second hand good purchased"
		la var sechand_purchase365		"Value of purchase in last 365 days(in Rs.)"
		la var total_expense365			"Total expense in the last 365 days(in Rs.)"
		la val item_code itemlbl
		la val hire_purchase yesnolbl
	}
	save "`datadir'/dta/NSS59/level`l'", replace
}
