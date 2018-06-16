* Loading Data for NSS 56 Round

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS56/Data/"
set more off
set trace on

forvalues s=1/4 {
	local snames "`snames'WRK560`s'.TXT "
}

!cat `snames' > NSS56raw.txt

local commonvar					///
	 str id					1-2		///
	 rnd_sch			3-5		///
	 ss_o				6-6		///
	 sec				7-7		///
	 str state_region	8-10	///
	 strat_num			11-12	///
	 sub_strat			13-13	///
	 dist				14-15	///
	 sub_round			16-16	///
	 ss_p				17-17	///
	 str fsu			18-22	///
	 str seg			23-23	///
	 str hhs			24-25	///
	 surv_code			26-26	///
	 sub_code			27-27	///
	 nss_code			28-30	///
	 nsc_code			31-33	///
	 mult_ss			34-43	///
	 hh_size			44-46	///
	 mpce				47-54	///
	 mpce_code			55-56	///
	 cmpce_code			57-58	///
	 hh_type			59-59	///
	 religion			60-60	///
	 soc_grp			61-61	///
	 land_pos			62-63	///
	 dwell_unit			64-64	///
	 dwell_type			65-65	///
	 struc_type			66-66	///
	 area_covered		67-72	///
	 cook_code			73-74	///
	 light_code			75-75	///
	 meal_out			76-76	///
	 per_ceremony		77-77	///
	 pds_purchase		78-78

local workfile1					///	
	 get_food		79-79	///
	 mon1			80-81	///
	 mon2			82-83	///
	 mon3			84-85	///
	 mon4			86-87	///
	 mon5			88-89	///
	 mon6			90-91	///
	 mon7			92-93	///
	 mon8			94-95	///
	 mon9			96-97	///
	 mon10			98-99	///
	 mon11			100-101	///
	 mon12		 	102-103	///
	 tot_mon_nofood	104-105	///
	 ask_ques		106-106	///
	 time_canvas	107-109	///
	 person_no		110-112	///
	 relation		113-113	///
	 sex			114-114	///
	 age			115-116	///
	 marital_stat	117-117	///
	 educ			118-119	///
	 upst_code		120-121	///
	 upnic_code		122-123	///
	 sbst_code		124-125	///
	 sbnic_code		126-127	///
	 cwst_code		128-129	///
	 cwnic_code		130-131	///
	 days_away		132-133	///
	 meal_daily		134-134	///
	 meal_school	135-136	///
	 meal_employer	137-138	///
	 meal_other		139-140	///
	 meal_pay		141-142	///
	 meal_home		143-144

local workfile2					///
	 time_canvas	79-81	///
	 item_code		82-84	///
	 first_hand		85-92	///
	 sec_hand		93-100	///
	 total_val		101-108	///
	 food_code		109-109	///
	 use_durables	110-112

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
	33 "Pondicherry"
	34 "Jharkhand"
	35 "Chattisgarh"
	36 "Uttaranchal";

la def respcodelbl 
	1 "Co-operative and capable" 
	2 "Co-operative but not capable" 
	3 "Busy" 
	4 "Reluctant" 
	9 "Others";
	
la def surv_codelbl 
	1 "Original" 
	2 "Substitute" 
	3 "Casualty";

la def sub_codelbl 
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

la def soc_grplbl
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

la def dwell_unitlbl
	1 "Owned"
	2 "Hired"
	3 "No-Dwelling Unit"
	9 "Others";

la def dwell_typelbl
	1 "Independent House"
	2 "Flat"
	3 "No dwelling unit"
	9 "Others";

la def struc_typelbl
	1 "Pucca"
	2 "Semi-pucca"
	3 "Serviceable kachcha"
	4 "Unserviceable kachcha"
	5 "No structure";

la def cook_codelbl
	1  "Coke,Coal and Charcoal"
	2  "Firewood and Chips"
	3  "LPG"
	4  "Gobar gas"
	5  "Dung Cake"
	6  "Kerosene"
	7  "Electricity"
	9  "Others"
	8  "No cooking arrangement";

la def light_codelbl
	1 "Kerosene"
	2 "Other oil"
	3 "Gas"
	4 "Candle"
	5 "Electricity"
	6 "No lighting arrangement"
	9 "Others";

la def get_foodlbl
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

la def marital_statlbl
	1 "Never married"
	2 "Currently married"
	3 "Widowed"
	4 "Divorced/Seperated";

la def educlbl
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
	107 "Wheat/ atta – PDS"
	108 "Wheat/ atta – other sources"
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
	429 "Medical – non-institutional: sub-total (420-424)"
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
	
forvalues l=1/2 {
	infix `commonvar' `workfile`l'' using NSS56raw.txt if id=="W`l'", clear
	gen hhid=fsu+seg+hhs
	gen state =substr(state_region,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var hhid      		"Household ID"
	la var state     		"State"
	la var fsu		 		"FSU NO."
	la var id 				"Workfile ID"
	la var rnd_sch   		"Round"
	la var sec				"Sector"
	la var state_region 	"State-Region"
	la var strat_num   		"Stratum Number"
	la var sub_strat   		"Sub-Stratum"
	la var dist   			"District"
	la var sub_round   		"Sub-Round"
	la var ss_o			   	"Sub-Sample Original"
	la var ss_p				"Sub-Sample Posted"
	la var seg   			"Segment Number"
	la var hhs   			"HHS NO."
	la var surv_code   		"Survey Code"
	la var sub_code   		"Substitution Code"
	la var nss_code   		"NSS Code"
	la var nsc_code   		"NSC Code"
	la var mult_ss			"Multiplier"
	la var hh_size		   	"Household Size"
	la var mpce				"MPCE"
	la var mpce_code		"MPCE Code"
	la var cmpce_code		"CMPCE Code"
	la var religion   		"Religion"
	la var soc_grp   		"Social Group"
	la var land_pos			"Amount of Land Possessed(in Hectares)"
	la var dwell_unit   	"Dwelling unit Code"
	la var dwell_type		"Type of Dwelling Unit"
	la var struc_type		"Type of Structure"
	la var area_covered		"Covered Area of structure(sq.m)"
	la var cook_code   		"Cooking Code"
	la var light_code   	"Lighting Code"
	la var meal_out			"Number of meals served to non household members"
	la var per_ceremony		"Whether household perform any ceremony"
	la var pds_purchase		"Food purchased under PDS"
	la val sec seclbl
	la val state statelbl
	la val surv_code surv_codelbl
	la val sub_code	sub_codelbl
	la val religion relilbl
	la val soc_grp soc_grplbl
	la val dwell_unit dwell_unitlbl
	la val dwell_type dwell_typelbl
	la val struc_type struc_typelbl
	la val cook_code cook_codelbl
	la val light_code light_codelbl
	la val meal_out per_ceremony pds_purchase yesnolbl
	
	if sec==1 {
		la var hh_type   		"Household Type Rural"
		la val hh_type hhtyperlbl
		}
		if sec==2 {
		la var hh_type   		"Household Type Urban"
		la val hh_type hhtypeulbl
		}
			
	if id=="W1" {
	la var get_food			"Get enough food  everyday"
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
	la var mon12			"Month not getting enough food"
	la var tot_mon_nofood	"Total number of months without food"
	la var ask_ques			"Whether info on enough food obtained from the informant"
	la var time_canvas		"Time taken to Interview"
	la var person_no   		"Person Serial No."
	la var relation   		"Relation"
	la var sex   			"Sex"
	la var age   			"Age(years)"
	la var marital_stat		"Marital Status"
	la var educ   			"Education"
	la var upst_code		"UPST Code"
	la var upnic_code		"UPNIC Code"
	la var sbst_code		"SBST Code"
	la var sbnic_code		"SBNIC Code"
	la var cwst_code		"CWST Code"
	la var cwnic_code		"CWNIC Code"
	la var days_away   		"Days Stayed Away"
	la var meal_daily   	"No. of Meals Per day"
	la var meal_school  	"Meals(school)"
	la var meal_employer	"Meals(Employer)"
	la var meal_other   	"Meals(others)"
	la var meal_pay   		"Meals(Payment)"
	la var meal_home   		"Meals(At home)"
	la val get_food get_foodlbl
	la val mon1-mon12 monthlbl
	la val ask_ques yesnolbl
	la val relation rellbl
	la val sex sexlbl
	la val marital_stat marital_statlbl
	la val educ educlbl
	la val upst_code sbst_code cwst_code statuslbl
	
	}
	
	if id=="W2" {
	la var time_canvas		"Time taken for Canvassing"
	la var item_code		"Item Code"
	la var first_hand		"First hand Value"
	la var sec_hand			"Second hand Value"
	la var total_val		"Total Value"
	la var food_code		"Food Code"
	la var use_durables		"On Use of Durables"
	la val item_code itemlbl
	}
	save "`datadir'/dta/NSS56/id`l'", replace
}


