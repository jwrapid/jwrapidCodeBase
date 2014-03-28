# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Default Categories
Category.delete_all

Category.create( name: 'Refrigerators')
Category.create( name: 'Wine Coolers')
Category.create( name: 'Freezers')
Category.create( name: 'Cooking')
Category.create( name: 'Microwaves')
Category.create( name: 'Dishwashers')
Category.create( name: 'Kitchen Accessories')
Category.create( name: 'Washers & Dryers')

Product.delete_all

#reset primary key to zero
#ActiveRecord::Base.connection.reset_pk_sequence!('products')

#Product1
Product.create( code: 'c000001',
				image: 'c000001.jpg',
                                quantity: 100,
				name: 'LG Tall Tub Built-In Dishwasher',
				price: 1099.99,
				description: "The LG LDF7551 is a quiet dishwasher, packed with cutting-edge features that make it convenient and easy to clean your dishes. The low noise level means you can easily talk on the phone while the dishwasher is operating, and the EasyRack Plus system is flexible enough to accommodate just about any combination of dishes, pots, and cups. ",
category_id: Category.find_by_name('Dishwashers').id)

#Product2
Product.create( code: 'c000002',
				image: 'c000002.jpg',
                                quantity: 100,
				name: 'LG 6.3 Cu. Ft. Self-Clean Smooth Top Range',
				price: 1399.99,
				description: "This LG electric stove features IntuiTouch controls and premium finishes that make cooking and cleanup practically effortless. The large oven has a spacious capacity of 6.3 cu. ft. and uses the EvenJet Advanced Convection System to blow hot air throughout the oven, ensuring your food is cooked precisely and evenly. ",
category_id: Category.find_by_name('Cooking').id)

#Product3
Product.create( code: 'c000003',
				image: 'c000003.jpg',
                                quantity: 100,
				name: 'LG 5.4 Cu. Ft. Self-Clean Gas Range',
				price: 1699.99,
				description: "Cooking doesn't come much more stylish than LG's LRG3093ST Gas Range. Decked out in tasteful stainless steel, this LG range delivers excellent cooking performance thanks to a host of advanced features which include; five sealed cooktop burners, a large 5.4 cubic foot capacity and an Intuitouch Control Panel. Take your recipes to the next level with the LG LRG3093ST Gas Range.",
category_id: Category.find_by_name('Cooking').id)
#Product4
Product.create( code: 'c000004',
				image: 'c000004.jpg',
                                quantity: 100,
				name: 'Samsung 18.7 Cu. Ft. Bottom Mount Refrigerator',
				price: 1299.99,
				description: "Samsung's RB194 refrigerator keeps food fresh longer than conventional fridges, while giving you optimized storage with the movable fresh box, and the handy bottom freezer. In addition, it features Samsung's Twin Cooling System so both food compartments maintain just the right temperature, making your food fresher and last longer.",
category_id: Category.find_by_name('Refrigerators').id)

#Product5
Product.create( code: 'c000005',
				image: 'c000005.jpg',
                                quantity: 100,
				name: 'GE Profile 20.2 Cu. Ft. Bottom Mount Refrigerator',
				price: 1599.99,
				description: "Offering a snappy combination of elegant looks and storage space, the GE Profile PDRS0MBYLSS Stainless Steel Bottom Mount Refrigerator is the perfect addition to any style of kitchen. Sporting 20.2 cubic feet of storage and a host of technologically advanced features that help your food stay fresh, this fridge is the perfect addition to your home. ",
category_id: Category.find_by_name('Refrigerators').id)

#Product6
Product.create( code: 'c000006',
				image: 'c000006.jpg',
                                quantity: 100,
				name: 'LG WaveForce 5.4 Cu. Ft. Top Load HE Washer with Heater',
				price: 1199.99,
				description:"The top-loading LG WT5170 gets your clothes cleaner using deep-cleaning WaveForce technology. It combines fast drum movement with powerful water jets while being gentle on garments. It also comes complete with features like ColdWash technology, a large capacity, and more. ",
category_id: Category.find_by_name('Washers & Dryers').id)
#Product7
Product.create( code: 'c000007',
				image: 'c000007.jpg',
                                quantity: 100,
				name: 'LG 5.0 Cu. Ft. Front Load Washer',
				price: 849.99,
				description: "Tackle those towers of laundry with more gusto. The LG large capacity 5.0 cu.ft. washer lets you do more laundry in fewer loads, giving you more free time and using less water. The Direct Drive Motor operates ultra-efficiently, and the TrueBalance anti-vibration system and LoDecibel quiet operation reduce washer noise and vibration for smooth, whisper-quiet performance. ",
category_id: Category.find_by_name('Washers & Dryers').id)

#Product8
Product.create( code: 'c000008',
				image: 'c000008.jpg',
                                quantity: 100,
				name: 'Frigidaire Affinity 4.2 Cu. Ft. Front-Load Washer',
				price: 849.99,
				description: "Ultra efficient and super quiet, the Frigidaire Affinity front-load washer gets clothes clean using advanced technology and an array of convenient features. An NSF-certified allergen cycle removes up to 95% of allergens, while the Vibration Control System and SilentDesign technology ensure near-silent operation. Other features include Express Select Controls, Stay-Fresh Door seal, and more. ",
category_id: Category.find_by_name('Washers & Dryers').id)

#Product9
Product.create( code: 'c000009',
				image: 'c000009.jpg',
                                quantity: 100,
				name: 'Frigidaire 16.6 Cu.Ft. Upright Freezer',
				price: 799.99,
				description: "Stock up on the frozen food you love with this handy Frigidaire upright freezer. Get ready for a raft of convenient features including three wire shelves, a basket for simple organisation of your food, a control lock feature and automatic alerts if the door is left open. ", 
category_id: Category.find_by_name('Freezers').id)
#Product10
Product.create( code: 'c000010',
				image: 'c000010.jpg',
                                quantity: 100,
				name: 'Haier 5.0 Cu. Ft. Chest Freezer',
				price: 179.99,
				description: "The Haier 5.0 Cu. Ft. capacity chest freezer with removable basket holds approximately 175 pounds of frozen food. A front side adjustable thermostat control is easy to access. And the manual defrost drain makes maintenance for this chest freezer simple. Includes a Power On indicator light and space-saving flat back design. ",
category_id: Category.find_by_name('Freezers').id)

#Product11
Product.create( code: 'c000011',
				image: 'c000011.jpg',
                                quantity: 100,
				name: 'Danby 38 Bottle Wine Cooler',
				price: 299.99,
				description: "For those who appreciate a great glass of wine with dinner or while entertaining, this Danby 38-bottle wine chiller lets you dial in your personally-customized settings. A temperature range between 4-18 degrees C with dual temperature zones lets you chill red and whites at their optimal temperature. The LED lighting system showcases your collection beautifully. ", category_id: Category.find_by_name('Wine Coolers').id)

#Product12
Product.create( code: 'c000012',
				image: 'c000012.jpg',
                                quantity: 100,
				name: 'Sunbeam 4.3 Cu. Ft. Bar Fridge',
				price: 199.99,
				description: "This compact 4.3 cubic foot fridge from Sunbeam is an ideal addition to the rec room, the dorm, or anywhere else you want to keep cool beverages and snacks close by. It's counter-height, and features the Canstor beverage dispenser, adjustable glass shelves, and a compact freezer space. ", 
category_id: Category.find_by_name('Refrigerators').id)

#Product13
Product.create( code: 'c000013',
				image: 'c000013.jpg',
                                quantity: 100,
				name: 'Panasonic 1.6 Cu. Ft. Microwave',
				price: 279.99,
				description: "The Panasonic NNH794S 1.6 Cu. Ft. Microwave offers 1200 watts of power output and comes equipped with fifteen Genius Sensor Cook functions. This model also gives you convenient feature settings like Auto Reheat, Auto Defrost, Quick Minute and Popcorn. ",
category_id: Category.find_by_name('Microwaves').id)

#Product14
Product.create( code: 'c000014',
				image: 'c000014.jpg',
                                quantity: 100,
				name: 'Sunbeam 1.0 Cu. Ft. Microwave',
				price: 99.99,
				description: "This Sunbeam SBMW1049SS microwave comes with 1.0 Cu. Ft. of cooking space and a stylish stainless steel look. ", 
category_id: Category.find_by_name('Microwaves').id)

#Product15
Product.create( code: 'c000015',
				image: 'c000015.jpg',
                                quantity: 100,
				name: 'Frigidaire 19.7 Cu. Ft. Chest Freezer',
				price: 789.99,
				description: "With a 19.7 cubic foot storage capacity, Store-More removable baskets, and the SpaceWise organization system, this Frigidaire chest freezer gives you more frozen storage for your home. Other features include manual defrost and bright lighting. ",
category_id: Category.find_by_name('Freezers').id)

#Product16
Product.create( code: 'c000016',
				image: 'c000016.jpg',
                                quantity: 100,
				name: 'Frigidaire 20.3 Cu. Ft. Bottom Mount Refrigerator',
				price: 1399.99,
				description: "Packed with great cooling technology, this bottom-mount refrigerator from Frigidaire keeps food fresh, makes cleaning easy, and delivers fresh air to your food items. Features include adjustable door bins, SpillSafe shelves, a Cool Zone drawer, and more. It's also Energy Star qualified. ", 
category_id: Category.find_by_name('Refrigerators').id)

#Product17
Product.create( code: 'c000017',
				image: 'c000017.jpg',
                                quantity: 100,
				name: 'GE 4.5 Cu. Ft. Top Load ENERGY STAR Washer with Stainless Steel Interior',
				price: 649.99,
				description: "This GE washing machine comes equipped with amazing technology that gets clothes clean a better way. The HydroWave Wash System uses a 360-degree arc that's gentler and more thorough, while the RainShower Rinse system ensures your garments have been thoroughly rinsed while conserving water. Other great features include an E-Wash Cycle, delay start, and PreciseFill. ",
category_id: Category.find_by_name('Washers & Dryers').id)
#Product18
Product.create( code: 'c000018',
				image: 'c000018.jpg',
                                quantity: 100,
				name: 'Bosch 4.6 Cu. Ft. Self-Clean Smooth Top Convection Range',
				price: 1999.99,
				description: "With 8 cooking modes, a 4.6 cubic foot capacity, and European Convection, this Bosch Range delivers tasty meal after tasty meal. It features TOUCH & TURN oven controls for easy operation, and boasts a smooth black and stainless steel exterior. ",
category_id: Category.find_by_name('Cooking').id)

#Product19
Product.create( code: 'c000019',
				image: 'c000019.jpg',
                                quantity: 100,
				name: 'Bosch 5.0 Cu. Ft. Self-Clean Gas Range',
				price: 1099.99,
				description: "The Bosch Evolution 500 Series Free-Standing Gas Range features 5 sealed burners including oval shaped bridge burner, ranging from 5k to 16k BTUs, a 500 BTU simmer, continuous cast-iron matte grates, a 5.0 cu.ft convection oven, 4 cooking modes, and hidden bake element to meet all of your cooking needs. ",
category_id: Category.find_by_name('Cooking').id)
#Product20
Product.create( code: 'c000020',
				image: 'c000020.jpg',
                                quantity: 100,
				name: 'Breville Cafe Roma Espresso Machine',
				price: 149.99,
				description: "Recreate the taste of Old World Italy in your own home with the Breville Cafe Roma Espresso Maker. Beyond its timeless stainless steel body, the 15 bar pump and Thermoblock heating system delivers the perfect amount of heat and compression, cup after cup. The stainless steel wand and froth enhancer offers effortless milk frothing, and the heating tray heats up to 6 espresso cups at a time. ", 
category_id: Category.find_by_name('Kitchen Accessories').id)

User.delete_all

#Admin User
admin = User.create!(name: "Admin",
                 email: "Admin@example.com",
                 password: "foobar",
                 password_confirmation: "foobar")
admin.toggle!(:admin)
