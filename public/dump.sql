PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE attribute_sets (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    query_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);
INSERT INTO attribute_sets VALUES(1,'Size','Size','text');
INSERT INTO attribute_sets VALUES(2,'Color','Color','swatch');
INSERT INTO attribute_sets VALUES(3,'Capacity','Capacity','text');
INSERT INTO attribute_sets VALUES(4,'With USB 3 ports','With USB 3 ports','text');
INSERT INTO attribute_sets VALUES(5,'Touch ID in keyboard','Touch ID in keyboard','text');
CREATE TABLE attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    query_id VARCHAR(255) NOT NULL,
    value VARCHAR(255) NOT NULL,
    displayValue VARCHAR(255) NOT NULL,
    attribute_set_id INTEGER NOT NULL,
    FOREIGN KEY (attribute_set_id) REFERENCES attribute_sets(id)
);
INSERT INTO attributes VALUES(1,'40','40','40',1);
INSERT INTO attributes VALUES(2,'41','41','41',1);
INSERT INTO attributes VALUES(3,'42','42','42',1);
INSERT INTO attributes VALUES(4,'43','43','43',1);
INSERT INTO attributes VALUES(5,'Small','S','Small',1);
INSERT INTO attributes VALUES(6,'Medium','M','Medium',1);
INSERT INTO attributes VALUES(7,'Large','L','Large',1);
INSERT INTO attributes VALUES(8,'Extra Large','XL','Extra Large',1);
INSERT INTO attributes VALUES(9,'Green','#44FF03','Green',2);
INSERT INTO attributes VALUES(10,'Cyan','#03FFF7','Cyan',2);
INSERT INTO attributes VALUES(11,'Blue','#030BFF','Blue',2);
INSERT INTO attributes VALUES(12,'Black','#000000','Black',2);
INSERT INTO attributes VALUES(13,'White','#FFFFFF','White',2);
INSERT INTO attributes VALUES(14,'512G','512G','512G',3);
INSERT INTO attributes VALUES(15,'1T','1T','1T',3);
INSERT INTO attributes VALUES(16,'512GB','512GB','512GB',3);
INSERT INTO attributes VALUES(17,'256GB','256GB','256GB',3);
INSERT INTO attributes VALUES(18,'Yes','Yes','Yes',4);
INSERT INTO attributes VALUES(19,'No','No','No',4);
INSERT INTO attributes VALUES(20,'Yes','Yes','Yes',5);
INSERT INTO attributes VALUES(21,'No','No','No',5);
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL
);
INSERT INTO categories VALUES(1,'clothes');
INSERT INTO categories VALUES(2,'tech');
CREATE TABLE currencies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    label VARCHAR(255) NOT NULL,
    symbol VARCHAR(255) NOT NULL
);
INSERT INTO currencies VALUES(1,'USD','$');
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    query_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    inStock INTEGER NOT NULL,
    description VARCHAR(255) NOT NULL,
    brand VARCHAR(255) NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
INSERT INTO products VALUES(1,'huarache-x-stussy-le','Nike Air Huarache Le',1,'<p>Great sneakers for everyday use!</p>','Nike x Stussy',1);
INSERT INTO products VALUES(2,'jacket-canada-goosee','Jacket',1,'<p>Awesome winter jacket</p>','Canada Goose',1);
INSERT INTO products VALUES(3,'ps-5','PlayStation 5',0,'<p>A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha</p>','Sony',2);
INSERT INTO products VALUES(4,'xbox-series-s','Xbox Series S 512GB',0,replace('\n<div>\n    <ul>\n        <li><span>Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer</span></li>\n        <li><span>Spiele Games mit bis zu 120 Bilder pro Sekunde</span></li>\n        <li><span>Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen.</span></li>\n        <li><span>Xbox Smart Delivery stellt sicher, dass du die beste Version deines Spiels spielst, egal, auf welcher Konsole du spielst</span></li>\n        <li><span>Spiele deine Xbox One-Spiele auf deiner Xbox Series S weiter. Deine Fortschritte, Erfolge und Freundesliste werden automatisch auf das neue System Ã¼bertragen.</span></li>\n        <li><span>Erwecke deine Spiele und Filme mit innovativem 3D Raumklang zum Leben</span></li>\n        <li><span>Der brandneue Xbox Wireless Controller zeichnet sich durch hÃ¶chste PrÃ¤zision, eine neue Share-Taste und verbesserte Ergonomie aus</span></li>\n        <li><span>Ultra-niedrige Latenz verbessert die Reaktionszeit von Controller zum Fernseher</span></li>\n        <li><span>Verwende dein Xbox One-Gaming-ZubehÃ¶r -einschlieÃŸlich Controller, Headsets und mehr</span></li>\n        <li><span>Erweitere deinen Speicher mit der Seagate 1 TB-Erweiterungskarte fÃ¼r Xbox Series X (separat erhÃ¤ltlich) und streame 4K-Videos von Disney+, Netflix, Amazon, Microsoft Movies &amp; TV und mehr</span></li>\n    </ul>\n</div>','\n',char(10)),'Microsoft',2);
INSERT INTO products VALUES(5,'apple-imac-2021','iMac 2021',1,'The new iMac!','Apple',2);
INSERT INTO products VALUES(6,'apple-iphone-12-pro','iPhone 12 Pro',1,'This is iPhone 12. Nothing else to say.','Apple',2);
INSERT INTO products VALUES(7,'apple-airpods-pro','AirPods Pro',0,replace('\n<h3>Magic like youâ€™ve never heard</h3>\n<p>AirPods Pro have been designed to deliver Active Noise Cancellation for immersive sound, Transparency mode so you can hear your surroundings, and a customizable fit for all-day comfort. Just like AirPods, AirPods Pro connect magically to your iPhone or Apple Watch. And theyâ€™re ready to use right out of the case.\n\n<h3>Active Noise Cancellation</h3>\n<p>Incredibly light noise-cancelling headphones, AirPods Pro block out your environment so you can focus on what youâ€™re listening to. AirPods Pro use two microphones, an outward-facing microphone and an inward-facing microphone, to create superior noise cancellation. By continuously adapting to the geometry of your ear and the fit of the ear tips, Active Noise Cancellation silences the world to keep you fully tuned in to your music, podcasts, and calls.\n\n<h3>Transparency mode</h3>\n<p>Switch to Transparency mode and AirPods Pro let the outside sound in, allowing you to hear and connect to your surroundings. Outward- and inward-facing microphones enable AirPods Pro to undo the sound-isolating effect of the silicone tips so things sound and feel natural, like when youâ€™re talking to people around you.</p>\n\n<h3>All-new design</h3>\n<p>AirPods Pro offer a more customizable fit with three sizes of flexible silicone tips to choose from. With an internal taper, they conform to the shape of your ear, securing your AirPods Pro in place and creating an exceptional seal for superior noise cancellation.</p>\n\n<h3>Amazing audio quality</h3>\n<p>A custom-built high-excursion, low-distortion driver delivers powerful bass. A superefficient high dynamic range amplifier produces pure, incredibly clear sound while also extending battery life. And Adaptive EQ automatically tunes music to suit the shape of your ear for a rich, consistent listening experience.</p>\n\n<h3>Even more magical</h3>\n<p>The Apple-designed H1 chip delivers incredibly low audio latency. A force sensor on the stem makes it easy to control music and calls and switch between Active Noise Cancellation and Transparency mode. Announce Messages with Siri gives you the option to have Siri read your messages through your AirPods. And with Audio Sharing, you and a friend can share the same audio stream on two sets of AirPods â€” so you can play a game, watch a movie, or listen to a song together.</p>\n','\n',char(10)),'Apple',2);
INSERT INTO products VALUES(8,'apple-airtag','AirTag',1,replace('\n<h1>Lose your knack for losing things.</h1>\n<p>AirTag is an easy way to keep track of your stuff. Attach one to your keys, slip another one in your backpack. And just like that, theyâ€™re on your radar in the Find My app. AirTag has your back.</p>\n','\n',char(10)),'Apple',2);
CREATE TABLE product_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    attribute_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY (attribute_id) REFERENCES attributes(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO product_attributes VALUES(1,1,1);
INSERT INTO product_attributes VALUES(2,2,1);
INSERT INTO product_attributes VALUES(3,3,1);
INSERT INTO product_attributes VALUES(4,4,1);
INSERT INTO product_attributes VALUES(5,5,2);
INSERT INTO product_attributes VALUES(6,6,2);
INSERT INTO product_attributes VALUES(7,7,2);
INSERT INTO product_attributes VALUES(8,8,2);
INSERT INTO product_attributes VALUES(9,9,3);
INSERT INTO product_attributes VALUES(10,10,3);
INSERT INTO product_attributes VALUES(11,11,3);
INSERT INTO product_attributes VALUES(12,12,3);
INSERT INTO product_attributes VALUES(13,13,3);
INSERT INTO product_attributes VALUES(14,14,3);
INSERT INTO product_attributes VALUES(15,15,3);
INSERT INTO product_attributes VALUES(16,9,4);
INSERT INTO product_attributes VALUES(17,10,4);
INSERT INTO product_attributes VALUES(18,11,4);
INSERT INTO product_attributes VALUES(19,12,4);
INSERT INTO product_attributes VALUES(20,13,4);
INSERT INTO product_attributes VALUES(21,14,4);
INSERT INTO product_attributes VALUES(22,15,4);
INSERT INTO product_attributes VALUES(23,16,5);
INSERT INTO product_attributes VALUES(24,17,5);
INSERT INTO product_attributes VALUES(25,18,5);
INSERT INTO product_attributes VALUES(26,19,5);
INSERT INTO product_attributes VALUES(27,20,5);
INSERT INTO product_attributes VALUES(28,21,5);
INSERT INTO product_attributes VALUES(29,14,6);
INSERT INTO product_attributes VALUES(30,15,6);
INSERT INTO product_attributes VALUES(31,9,6);
INSERT INTO product_attributes VALUES(32,10,6);
INSERT INTO product_attributes VALUES(33,11,6);
INSERT INTO product_attributes VALUES(34,12,6);
INSERT INTO product_attributes VALUES(35,13,6);
CREATE TABLE images (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url VARCHAR(255) NOT NULL,
    alt VARCHAR(255) NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO images VALUES(1,'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087','Nike Air Huarache Le',1);
INSERT INTO images VALUES(2,'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087','Nike Air Huarache Le',1);
INSERT INTO images VALUES(3,'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087','Nike Air Huarache Le',1);
INSERT INTO images VALUES(4,'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087','Nike Air Huarache Le',1);
INSERT INTO images VALUES(5,'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087','Nike Air Huarache Le',1);
INSERT INTO images VALUES(6,'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg','Jacket',2);
INSERT INTO images VALUES(7,'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg','Jacket',2);
INSERT INTO images VALUES(8,'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg','Jacket',2);
INSERT INTO images VALUES(9,'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg','Jacket',2);
INSERT INTO images VALUES(10,'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg','Jacket',2);
INSERT INTO images VALUES(11,'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058169/product-image/2409L_61_o.png','Jacket',2);
INSERT INTO images VALUES(12,'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png','Jacket',2);
INSERT INTO images VALUES(13,'https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg','PlayStation 5',3);
INSERT INTO images VALUES(14,'https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg','PlayStation 5',3);
INSERT INTO images VALUES(15,'https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg','PlayStation 5',3);
INSERT INTO images VALUES(16,'https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg','PlayStation 5',3);
INSERT INTO images VALUES(17,'https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg','PlayStation 5',3);
INSERT INTO images VALUES(18,'https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg','Xbox Series S 512GB',4);
INSERT INTO images VALUES(19,'https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg','Xbox Series S 512GB',4);
INSERT INTO images VALUES(20,'https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg','Xbox Series S 512GB',4);
INSERT INTO images VALUES(21,'https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg','Xbox Series S 512GB',4);
INSERT INTO images VALUES(22,'https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg','Xbox Series S 512GB',4);
INSERT INTO images VALUES(23,'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000','iMac 2021',5);
INSERT INTO images VALUES(24,'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&amp;hei=1112&amp;fmt=jpeg&amp;qlt=80&amp;.v=1604021663000','iPhone 12 Pro',6);
INSERT INTO images VALUES(25,'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634795000','AirPods Pro',7);
INSERT INTO images VALUES(26,'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761672000','AirTag',8);
CREATE TABLE prices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    amount DECIMAL(10, 2) NOT NULL,
    currency_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO prices VALUES(1,144.68999999999999772,1,1);
INSERT INTO prices VALUES(2,518.47000000000002728,1,2);
INSERT INTO prices VALUES(3,844.01999999999998179,1,3);
INSERT INTO prices VALUES(4,333.99000000000000909,1,4);
INSERT INTO prices VALUES(5,1688.0299999999999727,1,5);
INSERT INTO prices VALUES(6,1000.7599999999999909,1,6);
INSERT INTO prices VALUES(7,300.23000000000001818,1,7);
INSERT INTO prices VALUES(8,120.56999999999999318,1,8);
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total INT
);
INSERT INTO orders VALUES(NULL,NULL);
INSERT INTO orders VALUES(NULL,289);
INSERT INTO orders VALUES(NULL,289);
INSERT INTO orders VALUES(NULL,518);
INSERT INTO orders VALUES(NULL,3002);
CREATE TABLE order_products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    order_id INT,
    quantity INT
);
INSERT INTO order_products VALUES(NULL,1,2,2);
INSERT INTO order_products VALUES(NULL,1,3,2);
INSERT INTO order_products VALUES(NULL,2,4,1);
INSERT INTO order_products VALUES(NULL,6,5,3);
CREATE TABLE order_product_attributes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_product_id INT,
    attribute_id INT
);
INSERT INTO order_product_attributes VALUES(NULL,1,1);
INSERT INTO order_product_attributes VALUES(NULL,2,1);
INSERT INTO order_product_attributes VALUES(NULL,3,5);
INSERT INTO order_product_attributes VALUES(NULL,4,9);
INSERT INTO order_product_attributes VALUES(NULL,4,14);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('currencies',1);
INSERT INTO sqlite_sequence VALUES('categories',2);
INSERT INTO sqlite_sequence VALUES('products',8);
INSERT INTO sqlite_sequence VALUES('images',26);
INSERT INTO sqlite_sequence VALUES('prices',8);
INSERT INTO sqlite_sequence VALUES('attribute_sets',5);
INSERT INTO sqlite_sequence VALUES('attributes',21);
INSERT INTO sqlite_sequence VALUES('product_attributes',35);
COMMIT;
