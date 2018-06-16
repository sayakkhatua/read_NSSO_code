 * Loading Data for NSS 68 Round

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS68_Type1/Data/"
set more off
set trace on

/*  only do once
* combine all data files 
forvalues s=1/11 {
	local snames "`snames'R6801T1L`s'.TXT "
}
!cat `snames' > NSS68raw.txt  
*/

local commonvar					///
	 centrecode			1-3		///
	 str lot_fsu		4-8		///
	 round				9-10 	///
	 sch_no				11-13 	///
	 sample				14-14 	///
	 sector				15-15	///
	 str state_reg		16-18 	///
	 dist				19-20 	///
	 strat_num			21-22 	///
	 sub_strat			23-24 	///
	 sch_type			25-25	///
	 sub_round			26-26 	///
	 sub_sample			27-27 	///
	 sub_region			28-31 	///
	 str sub_block		32-32	///
	 str sec_strat		33-33 	///
	 str hhs			34-35 	///
	 level				36-37	///
	 nss				127-129	///
	 nsc				130-132	///
	 mlt				133-142
	 
local level1var					///
	 inf_no     		43-44 	///
	 respcode   		45-45 	///
	 surv_code  		46-46 	///
	 sub_code   		47-47 	///
	 d_o_s      		48-53 	///
	 d_o_d      		54-59 	///
	 time_canvas		60-62	///
	 r_blk_1			63-63	///
	 r_blk_2			64-64	///
	 r_blk_else_1		65-65	///
	 r_blk_else_2		66-66
	 
local level2var						///
	 hhsize 			43-44 	///
	 nic_code 			45-49 	///
	 nco_code 			50-52 	///
	 hhtype 			53-53 	///
	 religion 			54-54 	///
	 soc_grp 			55-55 	///
	 land_possess		56-56	///
	 land_type			57-57	///
	 land_owned			58-65	///
	 land_leasedin		66-73	///
	 land_other			74-81	///
	 land_leasedout		82-89	///
	 land_total			90-97	///
	 land_cultivate		98-105	///
	 land_irrigate		106-113
	 
local level3var					///
	cook_code			43-44	///
	light_code			45-45	///
	dwell_unit			46-46	///
	reg_salary			47-47	///
	perf_ceremony		48-48	///
	meal_nonhh			49-52	///
	poss_rcard			53-53	///
	rcard_type			54-54	///
	mpce_urp			55-63	///
	mpce_mrp			64-72

local level4var					///
	 person_no   		41-42 	///
	 relation   		43-43	///
	 sex   				44-44 	///
	 age   				45-47 	///
	 marital_stat  		48-48	///
	 educ   			49-50 	///
	 days_away   		51-52 	///
	 meal_daily   		53-53 	///
	 meal_school   		54-55	///
	 meal_employer 		56-57 	///
	 meal_other   		58-59 	///
	 meal_pay   		60-61 	///
	 meal_home   		62-63

local level5var					///
	 item_code   		40-42 	///
	 quant_h			43-51	///
	 val_h				52-59	///
	 quant_total		60-68	///
	 val_total			69-76	///
	 source_code   		77-77

local level6var					///
	item_code			40-42	///
	quant_pairs30		43-51	///
	val_pairs30			52-59	///
	quant_pairs365		60-68	///
	val_pairs365		69-76
	
local level7var					///
	item_code			40-42	///
	val_30				43-50	///
	val_365				51-58
	
local level8var					///
	item_code			40-42	///
	val					43-50
	
local level9var					///
	item_code			40-42	///
	possess				43-43	///
	fir_h_no			44-46	///
	hire_w				47-47	///
	fir_h_val			48-55	///
	cost30				56-63	///
	sec_h_val			64-71	///
	exp_total			72-79	///
	fir_h_no365			80-82	///
	hire_w365			83-83	///
	fir_h_val365		84-91	///
	cost365				92-99	///
	sec_h_no365			100-102	///
	sec_h_val365		103-110	///
	exp_total365		111-118

local level10var				///
	w_ayush				43-43	///
	no_reason			44-44	///
	yes_reason			45-45	///
	med_indian			46-46	///
	med_homoeo			47-47	///
	med_yoga_nat		48-48	///
	med_ind_place		49-49	///
	med_hom_place		50-50	///
	ayush_hos			51-51	///
	find_docs			52-52	///
	med_ayush_avail		53-53	///
	med_ayush_effect	54-54	///
	advised_ind			55-55	///
	advised_hom			56-56	///
	advised_yoga		57-57
	
local level11var				///
	srl_no				41-42	///
	val					43-52
	
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
	01  "Jammu & Kashmir"
	02  "Himachal Pradesh"
	03  "Punjab"
	04  "Chandigarh"
	05  "Uttaranchal"
	06  "Haryana"
	07  "Delhi"
	08  "Rajasthan"
	09  "Uttar Pradesh"
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
	1 "Self employed in agriculture"
	2 "Self employed in non-agriculture"
	3 "Regular wage/salary earning" 
	4 "Agriculture labour"
	5 "Non-agriculture labour"
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

la def land_typelbl
	1 "Homestead Only"
	2 "Homestead and Other Land"
	3 "Other land only";
	
la def dwellunitlbl
	1 "Owned"
	2 "Hired"
	3 "No-Dwelling Unit"
	9 "Others";
	
la def rcard_typelbl
	1 "Antodaya"
	2 "BPL"
	3 "Others";

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
	02 "Literate without formal education through EGS/NFEC/AEC"
	03 "Literate without formal education through TLC"
	04 "Literate without formal education through others"
	05 "Literate below primary"
	06 "Primary"
	07 "Middle"
	08 "Secondary"
	10 "Higher Secondary"
	11 "Diploma/Certificate course"
	12 "Graduate"
	13 "Post graduate and above";
	
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
	115 "Jowar & its products"
	116 "Bajra & its products"
	117 "Maize & products"
	118 "Barley & its products"
	120 "Small millets & their products"
	121 "Ragi & its products"
	122 "Other cereals"
	129 "Cereal: sub-total (101-122)"
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
	170 "Salt"
	171 "Sugar-PDS"
	172 "Sugar-Other Sources"
	173 "Gur"
	174 "Candy, Mishri"
	175 "Honey"
	179 "Salt and Sugar s.t."
	180 "Vanaspati, margarine"
	181 "Mustard oil"
	182 "Groundnut oil"
	183 "Coconut oil"
	184 "Edible oil: others"
	189 "Edible oil: s.t. (170-174)"
	190 "Eggs (no.)"
	191 "Fish, prawn"
	192 "Goat meat/mutton"
	193 "Beef/ buffalo meat"
	194 "Pork"
	195 "Chicken"
	196 "Others: birds, crab, oyster, tortoise, etc."
	199 "Egg, fish & meat: s.t. (180-186)"
	200 "Potato"
	201 "Onion"
	202 "Tomato"
	203 "Brinjal"
	204 "Radish"
	205 "Carrot"
	206 "Palak/other leafy vegetables"
	207 "Green Chillies"
	208 "Lady's Finger"
	210	"Parwal/patal, kudru"
	211 "Cauliflower"
	212 "Cabbage"
	213 "Gourd, Pumpkin"
	214 "Peas"
	215 "Beans. barbati"
	216 "Lemon(no)"
	217 "Other Vagetables"
	219 "Vegetable s.t."
	220 "Banana (no.)"
	221 "Jackfruit"
	222 "Watermelon"
	223 "Pineapple (no.)"
	224 "Coconut (no.)"
	225 "Green Coconut(no.)"
	226 "Guava"
	227 "Singara"
	228 "Orange, mausami (no.)"
	230 "Papaya"
	231 "Mango"
	232 "Kharbooza"
	233 "Pears/naspati"
	234 "Berries"
	235 "Leechi"
	236 "Apple"
	237 "Grapes"
	238 "Other fresh fruits"
	239 "Fruits (fresh): s.t.(230-247)"
	240 "Coconut: copra"
	241 "Groundnut"
	242 "Dates"
	243 "Cashewnut"
	244 "Walnut"
	245 "Other nuts"
	246 "Raisin, kishmish, monacca, etc."
	247 "Other dry fruits"
	249 "Fruits (dry): s.t. (250-257)"
	250 "Ginger(gm)"
	251 "Garlic(gm)"
	252 "Jeera(gm)"
	253 "Dhania(gm)"
	254 "Turmeric (gm)"
	255 "Black pepper (gm)"
	256 "Dry chillies (gm)"
	257 "Tamarind (gm)"
	258 "Curry powder (gm)"
	260 "Oilseeds (gm)"
	261 "Other spices (gm)"
	269 "Spices: s.t. (280-288)"
	270 "Tea : cups (no.)"
	271 "Tea : leaf (gm)"
	272 "Coffee : cups (no.)"
	273 "Coffee: powder (gm)"
	274 "Ice, mineral water"
	275 "Cold beverages: bottled/canned (litre)"
	276 "Fruit juice and shake (litre)"
	277 "Other beverages: cocoa, chocolate, etc."
	279 "Beverages s.t."
	280 "Cooked meals purchased(no.)"
	281 "Cooked meals at workplace(free)"
	282 "Cooked meals received as assistance(no.)"
	283 "Cooked snacks purchased"
	284 "Other served Processed food"
	289 "Served processed food s.t."
	290 "Cake, pastry"
	291 "Biscuits, Chocolates etc."
	292 "Papad, Bhujia, Namkeen"
	293 "Chips(gm)"
	294 "Pickles (gm)"
	295 "Sauce (gm), Jam, jelly (gm)"
	296 "Other processed food"
	299 "Packaged Processed food s.t."
	300 "Pan: leaf (no.)"
	301 "Pan: finished (no.)"
	302 "Ingredients of Pan(gm)"
	309 "Pan s.t."
	310 "Bidi (no.)"
	311 "Cigarettes (no.)"
	312 "Leaf tobacco (gm)"
	313 "Snuff (gm)"
	314 "Hookah tobacco (gm)"
	315 "Cheroot (no.)"
	316 "Zarda, kimam, surti (gm)"
	317 "Other tobacco products"
	319 "Tobacco: s.t. (320-327)"
	320 "Ganja (gm)"
	321 "Toddy (litre)"
	322 "Country liquor (litre)"
	323 "Beer (litre)"
	324 "Foreign/refined liquor or wine (litre)"
	325 "Other intoxicants"
	329 "Intoxicants: s.t. (330-335)"
	330 "Coke"
	331 "Firewood and chips"
	332 "Electricity (std. unit)"
	333 "Dung cake"
	334 "Kerosene - PDS (litre)"
	335 "Kerosene - other sources (litre)"
	336 "Matches (box)"
	337 "Coal"
	338 "LPG (conveyance)"
	340 "Charcoal"
	341 "Candle (no.)"
	342 "Gobar gas"
	343 "Petrol(litre) conveyance"
	344 "Diesel(litre) conveyance"
	345 "Other fuel"
	349 "Fuel and light: s.t.(340-353)"
	350 "Dhoti (no)"
	351 "Sari (no)"
	352 "Cloth for shirt, pyjama, salwar, etc. (metre)"
	353 "Cloth for coat, trousers, overcoat, etc. (metre)"
	354 "Coat, Jacket, Sweater, Windcheater"
	355 "Chaddar, dupatta, shawl, etc. (no.)"
	356 "School/College Uniform Boys"
	357 "School/College Uniform Girls"
	358 "Kurta-Pajama suits Males"
	360 "Kurta-Pajama suits Females"
	361 "Kurta, Kameez(no.)"
	362 "Pajama, Salwar(no.)"
	363 "Shirts, tshirts(no.)"
	364 "Shorts, Trousers, Bermudas(no.)"
	365 "Frocks, skirts etc.(no.)"
	366 "Blouse, dupatta, scarf, muffler(no.)"
	367 "Lungi (no.)"
	368 "Other Casual wear"
	370 "Baniyan, Socks, Other hosiery and Under garments (no.)"
	371 "Gamchha, towel, handkerchief (no.)"
	372 "Infant Clothing"
	373 "Headwear, Belts"
	374 "Knitting Wool"
	375 "Clothing (first-hand): other"
	376 "Clothing: second-hand"
	379 "Clothing: sub-total"
	380 "Bed sheet, bed cover (no.)"
	381 "Rug, blanket (no.)"
	382 "Pillow, quilt, mattress (no.)"
	383 "Cloth for upholstery, curtain, table-cloth, etc. (metre)"
	384 "Mosquito net (no.)"
	385 "Bedding: others"
	389 "Bedding, etc.: s.t."
	390 "Leather boots, shoes"
	391 "Leather sandals, chappals, etc."
	392 "Other leather footwear"
	393 "Rubber / PVC footwear"
	394 "Other footwear"
	395 "Footwear:Second hand"
	399 "Footwear: sub-total (390-394)"
	400 "Books, journals- first hand"
	401 "Books, Journals-second hand"
	402 "Newspapers, periodicals"
	403 "Library charges"
	404 "Stationery"
	405 "Tuition and other fees (school, college, etc.)"
	406 "Private tutor/ coaching centre"
	407 "Educational CD"
	408 "Other educational expenses"
	409 "Education: s.t."
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
	429 "Medical non-institutional: sub-total (420-424)"
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
	445 "Other minor durable type goods"
	449 "Minor durable type goods s.t."
	450 "Toilet soap"
	451 "Toothpaste, toothbrush, comb, etc."
	452 "Powder, snow, cream, lotion and perfume"
	453 "Hair oil, shampoo, hair cream"
	454 "Shaving blades, shaving stick, razor"
	455 "Shaving cream, aftershave lotion"
	456 "Sanitary napkins"
	457 "Other toilet articles"
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
	472 "Mosquito repellent, Insecticide, acid, etc"
	473 "Other petty articles"
	479 "Other household consumables: sub-total (460-473)"
	480 "Domestic servant/cook"
	481 "Attendent"
	482 "Sweeper"
	483 "Barber, beautician, etc."
	484 "Washerman, laundry, ironing"
	485 "Tailor"
	486 "Grinding Charges"	
	487 "Telephone Charges:Landline"
	488 "Telephone Charges:Mobile"
	490 "Postage and Telegram"
	491 "Miscellaneous expenses"
	492 "Priest"
	493 "Legal Expenses"
	494 "Repair charges for non-durables"
	495 "Pet animals(incl. bird, fish)"
	496 "Internet Expenses"
	497 "Other consumer services excluding conveyance"
	499 "Consumer services excluding conveyance: sub-total"
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
	511 "Lubricants and other fuel for vehicles"
	512 "School bus, van, etc."
	513 "Other conveyance expenses"
	519 "Conveyance: sub-total (500-513)"
	520 "House rent, garage rent (actual)"
	521 "Hotel Lodging Charges"
	522 "Residential land rent"
	523 "Other consumer rent"
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
	560 "Radio"
	561 "Television"
	562 "VCR/VCD/DVD"
	563 "Camera & photographic equipment"
	564 "CD, DVD, etc"
	565 "Musical instruments"
	566 "Other goods for recreation"
	569 "Goods for recreation: sub-total"
	570 "Stainless steel utensils"
	571 "Other metal utensils"
	572 "Casseroles, thermos, thermoware"
	573 "Other crockery & utensils"
	579 "Crockery & utensils: sub-total (580-583)"
	580 "Electric fan"
	581 "Air conditioner,Air Cooler"
	582 "Inverter"
	583 "Lantern, lamp, electric lampshade"
	584 "Sewing machine"
	585 "Washing machine"
	586 "Stove"
	587 "Pressure cooker/ pressure pan"
	588 "Refrigerator"
	590 "Water Purifier"
	591 "Electric iron, heater, toaster, oven & other electric heating appliances"
	592 "Other cooking/ household appliances"
	599 "Cooking & other household appliances: sub-total (590-601)"
	600 "Bicycle"
	601 "Motor cycle, scooter"
	602 "Motor car, jeep"
	603 "Tyres & tubes"
	604 "Other transport equipment"
	609 "Personal transport equipment: sub-total (600-604)"
	610 "Glass eyes, hearing aids & orthopaedic equipment"
	611 "Other medical equipment"
	619 "Therapeutic appliances: sub-total (620-621)"
	620 "Clock, watch"
	621 "Other machines for household work"
	622 "Personal Computer, Laptop"
	623 "Mobile handset"
	624 "Telephone Instrument(Landline)"
	625 "Any other personal goods"
	629 "Other personal goods: sub-total (630-634)"
	630 "Bathroom and sanitary equipment"
	631 "Plugs, switches & other electrical fittings"
	632 "Residential building & land (cost of repairs only)"
	633 "Other durables (specify)"
	639 "Residential building, land and other durables: sub-total (630-633)"
	640 "Gold ornaments"
	641 "Silver ornaments"
	642 "Jewels, pearls"
	643 "Other ornaments"
	649 "Jewellery & ornaments: sub-total (570-573)" 
	659 "Durable goods: total (559+569+579+599+609+619+629+639+649)";

la def no_reasonlbl
	1 "Need did not arise"
	2 "Not aware of about any system under AYUSH"
	3 "Mdicine treatments are not affective"
	4 "Hospital/dispensary/PHCs/CHCs are not available"
	5 "Doctors/Vaidya/Hakim/Siddha Vaidya/Homoeopaths are not available"
	6 "Midicines are not available"
	9 "Any other reason";

la def yes_reasonlbl
	1 "AYUSH medicines are effective"
	2 "Side effects are negligible"
	3 "AYUSH medicine are inexpensive"
	4 "Well known to local people, family, friends etc."
	9 "Others";
	
la def indianlbl
	1 "Home-made: From home produce, free collections etc."
	2 "Home-made: From purchased ingredients"
	3 "Government Hospitals/ dispensaries/PHCs/CHCs"
	4 "Private Hospitals/dispensaries/Private Practitioners"
	5 "Local Shops/ Medicine stores/ other sellers";

la def homoeolbl
	1 "Government hospital/dispensary/PHCs/CHCs"
	2 "Prvate hospital/dispensary/Private practitioners"
	3 "Local shops/Medical stores/ Other sellers"
	9 "Others";
	
la def ayush_hoslbl
	1 "Once"
	2 "2-3 times"
	3 "More than 3 times"
	4 "Nil";
	
la def findlbl
	1 "On every occasion"
	2 "On majority of occasions"
	3 "On a few occasions(not majority)"
	4 "Never";

la def adviselbl
	1 "On your own"
	2 "Family members and relatives"
	3 "Friends and Neighbors"
	4 "Private Praticitoners"
	5 "Doctors/practitioners of government  hospitals/dispensary"
	6 "Media"; 

#delimit cr
set more off
	
forvalues l=1/11 {
	infix `commonvar' `level`l'var' using NSS68raw.txt if level==`l', clear
	gen hhid=lot_fsu+sub_block+sec_strat+hhs
	gen state =substr(state_reg,1,2)
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
	la var state_reg	 	"State-Region"
	la var dist   			"District"
	la var strat_num   		"Stratum Number"
	la var sub_strat   		"Sub-Stratum"
	la var sch_type			"Schedule Type"
	la var sub_round   		"Sub-Round"
	la var sub_sample   	"Sub-Sample"
	la var sub_region   	"FOD Sub-Region"
	la var sub_block		"Sub-Block"
	la var sec_strat   		"Second Stage stratum"
	la var hhs   			"HHS NO."
	la var level     		"Level"
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
		la var r_blk_1		"Whether Schedule contains remarks in block 14/15"
		la var r_blk_2 		"Whether Schedule contains remarks in block 14/15"
		la var r_blk_else_1	"Whether Schedule contains remarks elsewhere"
		la var r_blk_else_2	"Whether Schedule contains remarks elsewhere"
		la val respcode respcodelbl
		la val surv_code survcodelbl
		la val sub_code subscodelbl
		la val r_blk_1 r_blk_2 r_blk_else_1 r_blk_else_2 yesnolbl
	}
	
	if level==2 {
		la var hhsize   		"Household Size"
		la var nic_code   		"NIC Code"
		la var nco_code   		"NCO Code"
		la var religion   		"Religion"
		la var soc_grp   		"Social Group"
		la var land_possess		"Whether owns any land"
		la var land_type		"Type of Land owned"
		la var land_owned		"Land owned on d.o.s"
		la var land_leasedin	"Land Leased In on d.o.s"
		la var land_other 		"Land otherwise possessed, neither owned nor leased in"
		la var land_leasedout	"land Leased out"
		la var land_total		"Total Land Possessed"
		la var land_cultivate	"Land cultivated during july 2010 to june 2011"
		la var land_irrigate	"Land Irrigated during july 2010 to june 2011"
		la val religion relilbl
		la val soc_grp socgrlbl
		la val land_type land_typelbl		
		la val land_possess yesnolbl
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
		la var cook_code   		"Cooking Code"
		la var light_code   	"Lighting Code"
		la var dwell_unit   	"Dwelling unit Code"
		la var reg_salary		"Is any member of the household a regualr salary earner?"		
		la var perf_ceremony	"Whether household perform any ceremony"
		la var meal_nonhh		"Number of meals served to non household members"
		la var poss_rcard		"Whether household possesses a ration card"
		la var rcard_type		"Type of Ration card Possessed"
		la var mpce_urp			"Monthly per capita expenditure URP"
		la var mpce_mrp			"Monthly per capita expenditure MRP"
		la val dwell_unit dwellunitlbl
		la val cook_code cookcodelbl
		la val light_code lightcodelbl
		la val rcard_type rcard_typelbl
		la val perf_ceremony reg_salary poss_rcard yesnolbl
	}
	
		
	if level==4 {
		la var person_no   		"Person Serial No."
		la var relation   		"Relation"
		la var sex   			"Sex"
		la var age   			"Age(years)"
		la var marital_stat		"Marital Status"
		la var educ   			"Education"
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
	}
	
	if level==5 {
		la var item_code	"Items"
		la var quant_h		"Quantity of Goods consumed home grown"
		la var val_h		"Value of goods consumed home grown"
		la var quant_total	"Total Quantity of Goods consumed home grown"
		la var val_total  	"Total Value of goods consumed home grown"
		la var source_code	"Source of Food items"
		la val item_code itemlbl
		la val source_code sorlbl
	}
	
	if level==6 {
		la var item_code			"Items"
		la var quant_pairs30		"Quantity of goods consumed in last 30 days"
		la var val_pairs30			"Value of goods consumed in last 30 days"
		la var quant_pairs365		"Quantity of goods consumed in last 365 days"
		la var val_pairs365			"Value of goods consumed in last 365 days"
		la val item_code itemlbl
	}
	
	if level==7 {
		la var item_code		"Items"
		la var val_30			"Value of items in last 30 days"
		la var val_365			"Value of items in last 365 days"
		la val item_code itemlbl
	}
	
	if level==8 {
		la var item_code		"Items"
		la var val				"Value of Items"
		la val item_code itemlbl
	}
	
	if level==9 {
		la var item_code				"Items"
		la var possess					"Whether posses any item"
		la var fir_h_no					"Number of first hand good purchased in last 30 days"
		la var hire_w					"Whether the good is hire purchased in last 30 days"
		la var fir_h_val				"Value of first hand goods purchased in last 30 days"
		la var cost30					"Cost of raw materials, repairs etc.(in Rs.)in the last 30 days"
		la var sec_h_val				"Value of second hand goods purchased"
		la var exp_total				"Total expenditure"
		la var fir_h_no365				"Number of first hand goods purchased in last 365 days"
		la var hire_w365				"Whether the goods hire purchased in last 365 days"
		la var fir_h_val365				"Value of purchase in last 365 days(in Rs.)"
		la var cost365 					"Cost of raw materials, repairs etc.(in Rs.) in the last 365 days"
		la var sec_h_no365				"Number of second hand good purchased in the last 365 days"
		la var sec_h_val365				"Value of purchase in last 365 days(in Rs.)"
		la var exp_total365				"Total expense in the last 365 days(in Rs.)"
		la val item_code itemlbl
		la val hire_w hire_w365 possess yesnolbl
	}
	
	if level==10 {
		la var w_ayush				"Whether any member of the household use ayurveda, yoga, naturopathy, unani, siddha, homoeopathy in the last 30 days"
		la var no_reason			"Reason for not using AYUSH"
		la var yes_reason			"Reason for using AYUSH"
		la var med_indian			"Whether Indian system of medicine used"
		la var med_homoeo			"Whether Homoeopathy used"
		la var med_yoga_nat			"Whether yoga and naturopathy used"
		la var med_ind_place		"Where did you usually get Indian Sysytem of medicine"
		la var med_hom_place		"Where did you get homoeopathy medicines"
		la var ayush_hos			"How often do you visit AYUSH hospitals"
		la var find_docs			"How often on your visits did you find doctors present"
		la var med_ayush_avail		"What is your assessment of the AYUSH medicine on availability"
		la var med_ayush_effect		"What is your assessment of the AYUSH medicine on effectiveness"
		la var advised_ind			"Who advised you take Indian system of medicine"
		la var advised_hom			"Who advised you take Homoeopathy medicine"
		la var advised_yoga			"Who advised you take Yoga and Naturopathy"
		la val no_reason no_reasonlbl
		la val yes_reason yes_reasonlbl
		la val med_indian med_homoeo med_yoga_nat yesnolbl
		la val med_ind_place indianlbl
		la val med_hom_place homoeolbl
		la val ayush_hos ayush_hoslbl
		la val find_docs med_ayush_avail med_ayush_effect findlbl
		la val advised_ind advised_hom advised_yoga adviselbl
	}
	
	if level==11 {
		la var srl_no 		"Serial No. of Item"
		la var val			"Value of Item"
	}
	
	save "`datadir'/dta/NSS68/level`l'", replace
}
	
