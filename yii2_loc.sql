-- Adminer 4.8.1 MySQL 5.5.62 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `category` (`id`, `parent_id`, `name`, `keywords`, `description`) VALUES
(1,	0,	'Sportswear',	NULL,	NULL),
(2,	0,	'Mens',	NULL,	NULL),
(3,	0,	'Womens',	NULL,	NULL),
(4,	1,	'Nike',	NULL,	NULL),
(5,	1,	'Under Armour',	NULL,	NULL),
(6,	1,	'Adidas',	NULL,	NULL),
(7,	1,	'Puma',	NULL,	NULL),
(8,	1,	'ASICS',	NULL,	NULL),
(9,	2,	'Fendi',	NULL,	NULL),
(10,	2,	'Guess',	NULL,	NULL),
(11,	2,	'Valentino',	NULL,	NULL),
(12,	2,	'Dior',	NULL,	NULL),
(13,	2,	'Versace',	NULL,	NULL),
(14,	2,	'Armani',	NULL,	NULL),
(15,	2,	'Prada',	NULL,	NULL),
(16,	2,	'Dolce and Gabbana',	NULL,	NULL),
(17,	2,	'Chanel',	NULL,	NULL),
(18,	2,	'Gucci',	NULL,	NULL),
(19,	3,	'Fendi',	NULL,	NULL),
(20,	3,	'Guess',	NULL,	NULL),
(21,	3,	'Valentino',	NULL,	NULL),
(22,	3,	'Dior',	NULL,	NULL),
(23,	3,	'Versace',	NULL,	NULL),
(24,	0,	'Kids',	NULL,	NULL),
(25,	0,	'Fashion',	NULL,	NULL),
(26,	0,	'Households',	NULL,	NULL),
(27,	0,	'Interiors',	NULL,	NULL),
(28,	0,	'Clothing',	NULL,	NULL),
(29,	0,	'Bags',	'сумки ключевики...',	'сумки описание...'),
(30,	0,	'Shoes',	NULL,	NULL);

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `qty` int(10) NOT NULL,
  `sum` float NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `order` (`id`, `created_at`, `updated_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `address`) VALUES
(1,	'2023-03-03 12:42:38',	'2023-03-03 12:42:38',	3,	240,	'1',	'roman',	'email@com.ru',	'12356778900',	'gbhjklmvczdzr'),
(2,	'2023-03-03 16:23:30',	'2023-03-03 16:23:30',	6,	380,	'0',	'elliot',	'email@email.com',	'1234567890',	'adress');

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty_item` int(11) NOT NULL,
  `sum_item` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `price`, `qty_item`, `sum_item`) VALUES
(1,	1,	4,	'Блуза Tom Tailor TT 20312490071 7610 M Зелёная',	70,	2,	140),
(2,	1,	6,	'Кардиган Levi\'s Icy Grey Heather M',	100,	1,	100),
(3,	2,	2,	'Джинсы MR520 MR 227 20002 0115 29-34 р Синие',	56,	5,	280),
(4,	2,	6,	'Кардиган Levi\'s Icy Grey Heather M',	100,	1,	100);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text,
  `price` float NOT NULL DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT 'no-image.png',
  `hit` enum('0','1') NOT NULL DEFAULT '0',
  `new` enum('0','1') NOT NULL DEFAULT '0',
  `sale` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `product` (`id`, `category_id`, `name`, `content`, `price`, `keywords`, `description`, `img`, `hit`, `new`, `sale`) VALUES
(1,	4,	'Джинсы Garcia 244/32/856 28-32 р Серо-синие',	'Великолепные джинсы винтажно-голубого цвета. Настоящая находка для любителей качественного денима.\n\nОсобенности:\n\n    Зауженные к низу\n    Пять карманов\n    Высококачественный деним\n    Высокая посадка (high fit)\n    Выгодно подчеркивают фигуру',	10,	NULL,	NULL,	'product1.jpg',	'0',	'0',	'0'),
(2,	4,	'Джинсы MR520 MR 227 20002 0115 29-34 р Синие',	'\n\nMR520 – амбициозный восточноевропейский бренд, который предлагает качественную и стильную одежду, сделанную специально для молодых людей, следящих за своим внешним видом.\n\nЖенские джинсы фасона boyfriend fit (в переводе с англ. – \"джинсы моего парня\"). Модель с зауженными штанинами. Застегивается на пуговицы. Изделие с низкой посадкой. Джинсы дополнены прорезными карманами спереди и накладными карманами сзади.\n\nИзделие декорировано эффектом потертости, вареным эффектом и необычными швами.\n',	56,	NULL,	NULL,	'product2.jpg',	'1',	'0',	'0'),
(3,	9,	'Блуза Mango 53005681-05 M Бежевая',	'Испанский бренд модной одежды \"Mango\" родился в 1984 году в Барселоне, где и по сей день находится штаб-квартира компании. В том же городе появился и первый магазин — на улице Пасео де Грасия (Paseo de Gracia). Компания, основанная братьями Исааком и Нахманом Андиком (Isaac & Nahman Andic), очень быстро набрала популярность — всего лишь годом позднее был открыт магазин в другом городе, на этот раз в Валенсии. Одежда \"Mango\" отличается высоким качеством, приемлемой ценой, современным дизайном и неповторимым стилем.',	20,	NULL,	NULL,	'product3.jpg',	'1',	'1',	'0'),
(4,	21,	'Блуза Tom Tailor TT 20312490071 7610 M Зелёная',	'\r\n\r\nTom Tailor Group — один из ведущих и быстро развивающихся Fashion холдингов германии и европы, продукция которого ориентирована на целевую аудиторию в возрасте от 0 до 60 лет.\r\n\r\nTom Tailor известен на рынке текстиля с 1962 года и до сих пор сохраняет стандарты немецкого качества. Tom Tailor предлагает повседневную одежду и аксессуары высокого качества для женщин, мужчин и детей.\r\n\r\nОдежда от Tom Tailor поможет создать активный повседневный образ с нотками элегантности.',	70,	NULL,	NULL,	'product4.jpg',	'1',	'0',	'1'),
(5,	25,	'Блузка Kira Plastinina 17-16-17453-SM-29 S',	NULL,	0,	NULL,	NULL,	'product5.jpg',	'1',	'0',	'0'),
(6,	28,	'Кардиган Levi\'s Icy Grey Heather M',	NULL,	100,	NULL,	NULL,	'product6.jpg',	'1',	'0',	'0'),
(7,	28,	'Кардиган ONLY ON 15102048 M Black Tan/Partridg',	'\r\n\r\nCasual марка молодежной женской одежды ONLY является частью датской компании Bestseller AS. Изначально Bestseller занимался производством детской одежды, а в 1995 году появилась на свет марка ONLY. Популярность этой марки возрастала быстрыми темпами и теперь ONLY владеет 770 магазинами в более чем 40 странах мира.\r\n\r\nONLY — бренд стильной молодежной одежды. Это бренд для тех, кто любит добиваться успеха и быть не таким, как все. Демократичные цены, модные модели, экологически чистые ткани делают одежду от ONLY сверхпопулярной.',	0,	NULL,	NULL,	'no-image.png',	'1',	'1',	'0'),
(8,	26,	'Брюки SK House 2211-1972кор L Коричневые',	'\r\n\r\nКомпания SK House — это украинский производитель модной женской одежды с безупречной репутацией и тысячами поклонников по всему СНГ. SK House изготавливает качественный и долговечный товар, созданный из высококачественных тканей. Компания использует современные методы пошива и, изучая текущие мировые тенденции и локальные требования покупателей, создает модели, которые не задерживаются на полках длительное время и быстро раскупаются во всех странах.',	99,	NULL,	NULL,	'no-image.png',	'0',	'0',	'1'),
(9,	26,	'Брюки Kira Plastinina 17-07-17418-FL-58 L',	NULL,	0,	NULL,	NULL,	'product1.jpg',	'0',	'0',	'0'),
(10,	29,	'Сумка GUSSACI TUGUS13A060-3-10',	'Простота, инновационный стиль бренда, высококачественные требования к продукции, благодаря этому GUSSACI Italy пользуется высокой репутацией во многих странах Европы. Превосходное качество, отличный дизайн, соответствующие цены делают \"Гуссачи\" модным и популярным!\r\n\r\nОсобенности:\r\n\r\nКоличество основных отделений: 1. Сумка имеет прорезной карман на молнии, а также два небольших накладных кармана для хранения мобильного телефона, разных портативных гаджетов и мелочей. На лицевой стороне модели есть узкий прорезной карман на \"молнии\". На тыльной стороне модели есть прорезной карман на \"молнии\". Особенностью данной модели является возможность изменения ее формы при помощи дополнительной внешней застежки-молнии. Сумка имеет 2 ручки для переноса на локте или в руке. Их длина не регулируется и составляет 45 см, а высота от крайней точки ручки до сумки — 16 см. В комплект к изделию прилагается съемный плечевой ремень. Его длина может регулироваться при помощи металлической пряжки от 78 до 137.5 см. Сумка закрывается при помощи застежки-молнии.\r\n\r\nМатериал подкладки: плотная ткань.\r\nМатериал сумки: кожезаменитель.\r\nЦвет фурнитуры: золото.\r\nРазмеры сумки: 26 х 25 х 10.5 см',	15,	NULL,	NULL,	'product3.jpg',	'0',	'1',	'0'),
(11,	29,	'Cумка Michael Kors Jet Set Travel Нежно-розовая',	'\r\n\r\nОсобенность стиля Michael Kors заключается в том, что простота его коллекций гармонирует с роскошью. Этому дизайнеру под силу объединить американский утилитаризм в манере одеваться с европейской изысканностью и шармом. Все его работы отличает изящная утонченность, которая рождается из строгих, почти примитивных линий. Все аксессуары поддерживают общий стиль человека с безупречным вкусом.\r\n\r\nМодели Michael Kors могут оставаться оригинальными, стильными и неотразимыми в течение многих лет, что особо важно для покупательниц, не желающих постоянно обновлять свой гардероб.',	200,	NULL,	NULL,	'no-image.png',	'0',	'0',	'1'),
(12,	29,	'Cумка Michael Kors Selma Золотистая',	'\r\n\r\nОсобенность стиля Michael Kors заключается в том, что простота его коллекций гармонирует с роскошью. Этому дизайнеру под силу объединить американский утилитаризм в манере одеваться с европейской изысканностью и шармом. Все его работы отличает изящная утонченность, которая рождается из строгих, почти примитивных линий. Все аксессуары поддерживают общий стиль человека с безупречным вкусом.\r\n\r\nМодели Michael Kors могут оставаться оригинальными, стильными и неотразимыми в течение многих лет, что особо важно для покупательниц, не желающих постоянно обновлять свой гардероб.',	205,	NULL,	NULL,	'product5.jpg',	'0',	'0',	'0'),
(13,	29,	'Cумка Michael Kors Bedford Красная',	'\r\n\r\nОсобенность стиля Michael Kors заключается в том, что простота его коллекций гармонирует с роскошью. Этому дизайнеру под силу объединить американский утилитаризм в манере одеваться с европейской изысканностью и шармом. Все его работы отличает изящная утонченность, которая рождается из строгих, почти примитивных линий. Все аксессуары поддерживают общий стиль человека с безупречным вкусом.\r\n\r\nМодели Michael Kors могут оставаться оригинальными, стильными и неотразимыми в течение многих лет, что особо важно для покупательниц, не желающих постоянно обновлять свой гардероб.',	0,	NULL,	NULL,	'no-image.png',	'0',	'0',	'0'),
(14,	29,	'Cумка Michael Kors JS Travel Светло-розовая',	'\r\n\r\nОсобенность стиля Michael Kors заключается в том, что простота его коллекций гармонирует с роскошью. Этому дизайнеру под силу объединить американский утилитаризм в манере одеваться с европейской изысканностью и шармом. Все его работы отличает изящная утонченность, которая рождается из строгих, почти примитивных линий. Все аксессуары поддерживают общий стиль человека с безупречным вкусом.\r\n\r\nМодели Michael Kors могут оставаться оригинальными, стильными и неотразимыми в течение многих лет, что особо важно для покупательниц, не желающих постоянно обновлять свой гардероб.',	0,	NULL,	NULL,	'no-image.png',	'0',	'0',	'0');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1,	'admin',	'$2y$10$ucb0xN15rbxHLY9o5hXHceoHTHSCUqe3k3iThuC/QE7Rlt/BcYyHK',	'kE_f4fGyQ85Uu8kft5Mk0A7hPPkbcdvg');

-- 2023-03-06 07:14:44
