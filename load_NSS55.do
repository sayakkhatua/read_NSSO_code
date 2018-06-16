* Loading Data for NSS 55 Round

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS55/Data/"

/*  only do once */
* combine all data files 
foreach s in "1" "1A" "2R" "2U" "3" "4rev" "6re" "7R" "7U" "52R" "52U" {  
	local snames "`snames'ALL10`s'.TXT "
}
!cat `snames' > NSS55raw.txt  
/**/
//set more off
//set trace on

local commonvar				///
	str workfile		1-2	///
	str round_sch		3-5	///
	str sector			6-6 	///
	str state_region	7-9 	///
	str strat_num		10-11 ///
	str dist				12-13 ///
	str sub_round		14-14 ///
	str sub_sample		15-15 ///
	str fsu_no			16-20	///
	str vist_no			21-21	///
	str seg_no			22-22	///
	str sec_strat		23-24 ///
	str hhs				25-26 ///
	str svc				27-27	///
	str res_subs		28-28	///
	str nss				29-31	///
	str nsc				32-34	///
	str mults			35-44	///
	str ss_replicate	45-45	///
	str mpce_30			46-51	///
	str mpce_7			52-57	///
	str hh_size			58-60	///
	str hh_type			61-61	///
	str religion		62-62	///
	str scl_group		63-63	///
	str land_possess	64-68

local workfile1var				///	
	str src_cook		69-70		///
	str src_light		71-71		///
	str irdp				72-72		///
	str pub_work		73-73		///
	str inc_cultivate	74-74		///
	str inc_othr_agri	75-75		///
	str inc_wage		76-76		///
	str inc_non_agri	77-77		///
	str inc_pension	78-78		///
	str inc_rent		79-79		///
	str inc_remit		80-80		///
	str inc_interest	81-81		///
	str inc_othr		82-82		///
	str get_food		83-83		///
	str mon1				84-85		///
	str mon2				86-87		///
	str mon3				88-89		///
	str mon4				90-91		///
	str mon5				92-93		///
	str mon6				94-95		///
	str mon7				96-97		///
	str mon8				98-99		///
	str mon9				100-101	///
	str mon10			102-103	///
	str mon11			104-105	///
	str tot_mnth		106-107	///
	str ask				108-108	///
	str tmcnv			109-111	///
	str nic				112-116	///
	str nco				117-119	///
	str if_own_land	120-120	///
	str land_type		121-121	///
	str land_own		122-126	///
	str land_leasein	127-131	///
	str nith_own_nor_lsd	132-136	///
	str land_leaseout	137-141	///
	str land_cult		142-146	///
	str land_irrig		147-151	///
	str possd_ktg		152-152	///
	str mpc_code_ru	153-154	///
	str mpc_code_comb	155-156

local workfile2var				///
	str personid		69-71		///
	str relation		72-72		///
	str sex				73-73		///
	str age				74-75		///
	str marital_stat	76-76		///
	str educ				77-78		///
	str work_code		79-79		///
	str type_inc		80-80		///
	str away_home_d	81-82		///
	str no_meal_d		83-83		///
	str meal_school	84-85		///
	str meal_employ	86-87		///
	str meal_other		88-89		///
	str meal_pay		90-91		///
	str meal_home		92-93		///
	str nic				94-98		///
	str nco				99-101	///
	str if_own_land2	102-102	///
	str land_type		103-103	///
	str mpccode_ru		104-105	///
	str mpccode_comb	106-107

local workfile3var				///
	str item_code		69-71		///
	str quant7			72-79		///
	str val7				80-87		///
	str quant30			88-95		///
	str val30			96-103	///
	str source			104-104	///
	str food_code		105-105	///
	str mpce_code_sec	106-107	///
	str mpce_code_c	108-109	///
	str no_durables	110-112

local workfile4var				///
	str item_code		69-71		///
	str quant7			72-79		///
	str val7				80-87		///
	str quant30			88-95		///
	str val30			96-103	///
	str nic				104-108	///
	str nco				109-111	///
	str kitchen_garden 112-112	///
	str land_possess2	113-113	///
	str type_land_own	114-114	///
	str mpce_code_sec	115-116	///
	str mpce_code_c	117-118

local workfile5var				///
	str rec_type		69-69		///
	str item_code		70-72		///
	str pur_type		73-73		///
	str quant_pds		74-81		///
	str val_pds			82-89		///
	str quant_othr		90-97		///
	str val_othr		98-105	///
	 rep_item1		106-141		///
	 rep_item2		142-177		///
	 rep_item3		178-213		///
	 rep_item4		214-249		///
	str mpce_code_sec	279-280	///
	str mpce_code_c	281-282
	
local workfile6var				///
	str item_code		69-71		///
	str quant1			72-79		///
	str val1				80-87		///
	str quant2			88-95		///
	str val2				96-103	///
	str quant3			104-111	///
	str val3				112-119	///
	str mpce_code_sec	120-121	///
	str mpce_code_c	122-123

local workfile7var				///
	str tot_unit_con 	69-73		///
	str food_exp7		74-83		///
	str food_exp30		84-93		///
	str intake7			94-99		///
	str intake30		100-105	///
	str item_code		106-108	///
	str food_grp_code	109-110	///
	str cal_equiv7		111-122	///
	str cal_equiv30	123-134	///
	str pro_equiv7		135-146	///
	str pro_equiv30	147-158	///
	str fat_equiv7		159-170	///
	str fat_equiv30	171-182	///
	str mpce_code_sec	183-184	///
	str mpce_code_c	185-186


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

la def survcodelbl
	1 "Original"
	2 "Substitute"
	3 "Casualty";
	
la def subscodelbl
	1 "Informant Busy"
	2 "Members away from home"
	3 "Informant non-cooperative"
	9 "Others";

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
	6 "Others"
	7 "No lighting arrangement";
	
la def irdplbl
	1 "No"
	2 "Milch Animal"
	3 "Draught Animal"
	4 "Sheep/Goat"
	5 "Pumpset"
	6 "For fish pond"
	7 "Sewing Machine"
	8 "Others: agricultural tools and equipment"
	9 "others";
	
la def yesnolbl
	1 "Yes"
	2 "No";

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
	02 "Literate without formal education(NFEC/AEC)"
	03 "Literate without formal education(TLC)"
	04 "Others"
	05 "Literate but below primary"
	06 "Primary"
	07 "Middle"
	08 "Secondary"
	09 "Higher Secondary"
	10 "Graduate and above: Agriculture"
	11 "Graduate and above: Engineering/Technology"
	12 "Graduate and above: Medicine"
	13 "Graduate and above: other Subjects";
	
la def inctypelbl
	1 "Economic Activity"
	2 "Other sources"
	3 "No income";
	
la def landtypelbl
	1 "Homestead only"
	2 "Homestead and other land"
	3 "Other land only";
	
la def sorlbl
	1 "Only purchase"
	2 "Only home grown stock"
	3 "Both purchase and home grown stock"
	4 "Only free collection"
	9 "Others";
	
la def purtypelbl
	1 "Only from PDS"
	2 "Only from other sources"
	3 "From both sources"
	4 "Not purchased";
	
la def nopurlbl
	1 "Not entitled"
	2 "Not having ration card"
	3 "Item not required"
	4 "Item not available in ration shop"
	5 "Quality unsatisfactory"
	6 "Not available in sufficient quantity"
	9 "Others";
	
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
	319 "Pan: s.t. (310-315)"
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

forvalues f=1/7 {
	infix `commonvar' `workfile`f'var' using NSS55raw.txt if workfile=="W`f'", clear
	gen hhid=fsu_no+seg_no+sec_strat+hhs
	gen state =substr(state_region,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var hhid				"Household Id"
	la var state			"State"
	la var round_sch		"Round Schedule"
	la var sector			"Sector"
	la var state_region	"State-Region"
	la var strat_num		"Stratum Number"
	la var dist				"District"
	la var sub_round		"Sub-Round"
	la var sub_sample		"Sub-Sample"
	la var fsu_no			"FSU Number"
	la var vist_no			"Visit Number"
	la var seg_no			"Segment Number"
	la var sec_strat		"Second-stage Stratum"
	la var hhs				"Sample Household"
	la var svc				"Survey Code"
	la var res_subs		"Reason for substitute"
	la var nss				"NSS"
	la var nsc				"NSC"
	la var mults			"Multiplier"
	la var ss_replicate	"....."
	la var mpce_30			"MPCE 30 days"
	la var mpce_7			"MPCE 7 days"
	la var hh_size			"Household Size"
	la var hh_type			"Household Type"
	la var religion		"Religion"
	la var scl_group		"Social Group"
	la var land_possess	"Possession of land"
	la var workfile		"File id"
	la val state statelbl
	la val hh_type hhtypelbl
	la val res_subs subscodelbl
	la val religion relilbl
	la val scl_group socgrlbl

	if `f'==1 {
		replace land_type=["10"] if land_type=="x"
		destring land_type, replace
		la var src_cook		"Primary source of Cooking"
		la var src_light		"Primary source of Lighting"
		la var irdp				"IRDP help"
		la var pub_work		"Public works for 60 days(Member working)"
		la var inc_cultivate	"Income from Cultivation(last 365 days)"
		la var inc_othr_agri	"Income from Fishing/other agriculture(last 365 days)"
		la var inc_wage		"Income from wage/salaried employment"
		la var inc_non_agri	"Income from non-agricultural enterprises"
		la var inc_pension	"Income from pension"
		la var inc_rent		"Income from rent"
		la var inc_remit		"Income from remittances"
		la var inc_interest	"Income from interests and dividends"
		la var inc_othr		"Other Income sources"
		la var get_food		"Get enough food everyday"
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
		la var tot_mnth		"Number of months not getting enough food"
		la var ask				"Whether the get food question asked"
		la var tmcnv			"......"
		la var nic				"NIC"
		la var nco				"NCO"
		la var if_own_land	"Whether a person owns land"
		la var land_type		"Type of land"
		la var land_own		"Amount of land owned on date of survey"
		la var land_leasein	"Amount of land leased in"
		la var nith_own_nor_lsd	"Land neither owned nor leased in"
		la var land_leaseout	"Amount of land leased out"
		la var land_cult		"Total land cultivated"
		la var land_irrig		"Total land irrigated"
		la var possd_ktg		"Whether possess a kitchen-garden"
		la var mpc_code_ru	"MPC Code(R/U)"
		la var mpc_code_comb	"MPC Code combined"
		la val src_cook penergyclbl
		la val src_light penergyllbl
		la val irdp irdplbl
		la val mon1-mon11 monthlbl
		la val land_type landtypelbl
		la val pub_work if_own_land possd_ktg inc_wage inc_non_agri ///
			   inc_pension inc_rent inc_remit inc_interest inc_othr ///
			   inc_cultivate inc_othr_agri get_food ask yesnolbl
		}
	
	if `f'==2 {
	    la var personid		"Individual ID"
	    la var relation		"Relationship to the Head of Family"
	    la var sex				"Sex"
	    la var age				"Age"
	    la var marital_stat	"Marital Status"
	    la var educ			"Education Level"
	    la var work_code		"Whether a Worker"
	    la var type_inc		"Type of Income"
	    la var away_home_d	"Number of days stayed away from home"
	    la var no_meal_d		"Number of meals usually taken during the day"
	    la var meal_school	"Meals free of cost from school"
	    la var meal_employ	"Meals free of cost from employer"
	    la var meal_other	"Meals free of cost from others"
	    la var meal_pay		"Meals on payment"
	    la var meal_home		"Meals at home"
	    la var nic				"NIC"
	    la var nco				"NC0"
	    la var if_own_land2	"Whether owns land"
	    la var land_type		"Type of land owned"
	    la var mpccode_ru	"MPC Code(R/U)"
	    la var mpccode_comb	"MPC Code combined"
	    la val relation rellbl
	    la val sex sexlbl
	    la val marital_stat mstatuslbl
	    la val educ edulbl
	    la val type_inc inctypelbl
	    la val land_type landtypelbl
	    la val work_code if_own_land2 yesnolbl
	}
	
	if `f'==3 {
		la var item_code		"Item Code"
		la var quant7			"Quantity last 7 days"
		la var val7				"Value in last 7 days"
		la var quant30			"Quantity last 30 days"
		la var val30			"Value in last 30 days"
		la var source			"Source of food"
		la var food_code		"Food Code"
		la var mpce_code_sec	"MPC Code(R/U)"
		la var mpce_code_c	"MPC Code combined"
		la var no_durable		"Number of Durables"
		la val item_code itemlbl
		la val source sorlbl
	}
	
	if `f'==4 {
	   la var item_code			"Item Code"
		la var quant7				"Quantity last 7 days"
		la var val7					"Value in last 7 days"
		la var quant30				"Quantity last 30 days"
		la var val30				"Value in last 30 days"
	   la var nic					"NIC"
	   la var nco					"NCO"
	   la var kitchen_garden	"Whether possess a kictchen garden"
	   la var land_possess2		"Whether possess land"
	   la var type_land_own		"Type of land owned"
	   la var mpce_code_sec		"MPC Code(R/U)"
	   la var mpce_code_c		"MPC Code combined"
		la val item_code itemlbl
		la val kitchen_garden land_possess2 yesnolbl
	}
		 
	 if `f'==5 {
	    la var rec_type			"2 generated"
	    la var item_code			"Item for block 11"
	    la var pur_type			"Purchase type"
	    la var quant_pds			"Quantity purchased from PDS"
	    la var val_pds			"Value of items purchased from PDS"
	    la var quant_othr		"Quantity purchased from other sources"
	    la var val_othr			"Value of items purchased from other sources"
	    la var rep_item1			"Repeat item set"
	    la var rep_item2			"Repeat item set"
	    la var rep_item3			"Repeat item set"
	    la var rep_item4			"Repeat item set"
	    la var mpce_code_sec	"MPC Code(R/U)"
	    la var mpce_code_c		"MPC Code combined"
	    la val pur_type purtypelbl
	    la val item_code rep_item1-rep_item4 itemlbl 
	}    
	   	

	if `f'==6 {
	    la var item_code			"Item Code"
	    la var quant1				"Quantity of Goods and Services Received"
	    la var val1				"Value of Goods and Services received"
	    la var quant2				"Quantity of goods given as gifts"
	    la var val2				"Value of goods given as gifts"
	    la var quant3				"Quantity of goods received as gifts"
	    la var val3				"Value of goods received as gifts"
	    la var mpce_code_sec	"MPC Code(R/U)"
	    la var mpce_code_c		"MPC Code combined"
	    la val item_code itemlbl
	    
	}
	
	if `f'==7 {
	    la var tot_unit_con		"Total Units Consumed"
	    la var food_exp7			"Expenditure on food(7 days)"
	    la var food_exp30		"Expenditure on food(30 days)"
	    la var intake7			"Food intake level(7 days)"
	    la var intake30			"Food intake level(30 days)"
	    la var item_code			"Item Code"
	    la var food_grp_code	"Food Group Code"
	    la var cal_equiv7		"Calorie(7 days)"
	    la var cal_equiv30		"Calorie(30 days)"
	    la var pro_equiv7		"Protein(7 days)"
	    la var pro_equiv30		"Protein(30 days)"
	    la var fat_equiv7		"Fat(7 days)"
	    la var fat_equiv30		"Fat(30 days)"
	    la var mpce_code_sec	"MPC Code(R/U)"
	    la var mpce_code_c		"MPC Code combined"
	    la val item_code itemlbl
	    
	}
	save "`datadir'/dta/NSS55/workfile`f'var", replace
}

* Same workfile name so done seperately

local datadir "~/Google Drive/India NSS/data"
cd "`datadir'/raw/NSS55/Data/"

local commonvar				///
	str workfile		1-2	///
	str round_sch		3-5	///
	str sector			6-6 	///
	str state_region	7-9 	///
	str strat_num		10-11 ///
	str dist				12-13 ///
	str sub_round		14-14 ///
	str sub_sample		15-15 ///
	str fsu_no			16-20	///
	str vist_no			21-21	///
	str seg_no			22-22	///
	str sec_strat		23-24 ///
	str hhs				25-26 ///
	str svc				27-27	///
	str res_subs		28-28	///
	str nss				29-31	///
	str nsc				32-34	///
	str mults			35-44	///
	str ss_replicate	45-45	///
	str mpce_30			46-51	///
	str mpce_7			52-57	///
	str hh_size			58-60	///
	str hh_type			61-61	///
	str religion		62-62	///
	str scl_group		63-63	///
	str land_possess	64-68
	
local workfile51var				///
	str item_code		70-72		///
	str quant_A			73-80		///
	str val_A			81-88		///
	str mpce_code_sec	279-280	///
	str mpce_code_c	281-282

	infix `commonvar' `workfile51var' using ALL1051rev.txt if workfile=="W5", clear
	gen hhid=fsu_no+seg_no+sec_strat+hhs
	gen state =substr(state_region,1,2)
	destring *, replace
	order hhid state
	sort hhid
	
	la var hhid				"Household Id"
	la var state			"State"
	la var round_sch		"Round Schedule"
	la var sector			"Sector"
	la var state_region	"State-Region"
	la var strat_num		"Stratum Number"
	la var dist				"District"
	la var sub_round		"Sub-Round"
	la var sub_sample		"Sub-Sample"
	la var fsu_no			"FSU Number"
	la var vist_no			"Visit Number"
	la var seg_no			"Segment Number"
	la var sec_strat		"Second-stage Stratum"
	la var hhs				"Sample Household"
	la var svc				"Survey Code"
	la var res_subs		"Reason for substitute"
	la var nss				"NSS"
	la var nsc				"NSC"
	la var mults			"Multiplier"
	la var ss_replicate	"....."
	la var mpce_30			"MPCE 30 days"
	la var mpce_7			"MPCE 7 days"
	la var hh_size			"Household Size"
	la var hh_type			"Household Type"
	la var religion		"Religion"
	la var scl_group		"Social Group"
	la var land_possess	"Possession of land"
	la var workfile		"File id"
	la val state statelbl
	la val hh_type hhtypelbl
	la val res_subs subscodelbl
	la val religion relilbl
	la val scl_group socgrlbl
		
		la var item_code			"Item Code"
	    la var quant_A				"Quantity"
	    la var val_A					"Value"
	    la var mpce_code_sec	"MPC Code(R/U)"
	    la var mpce_code_c		"MPC Code combined"
	    la val item_code itemcodelbl

save "`datadir'/dta/NSS55/workfile51var", replace


