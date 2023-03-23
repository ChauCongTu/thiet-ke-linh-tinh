CREATE DATABASE real_estate_db;
USE real_estate_db;
-- Dự án bất động sản
CREATE TABLE collections (
    collections_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    head_bg VARCHAR(100) NOT NULL,
    collections_name VARCHAR(100) NOT NULL,
    collections_slug VARCHAR(100) NOT NULL,
    overview TEXT NOT NULL,
    video VARCHAR(100) NOT NULL,
    introduction TEXT NOT NULL,
    information TEXT NOT NULL,
    location VARCHAR(300) NOT NULL
);
CREATE TABLE collections_galery (
    collections_id INT NOT NULL,
    collections_galery_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    img VARCHAR(300) NOT NULL,
    
    FOREIGN KEY (collections_id) REFERENCES collections(collections_id)
);
-- Sản phẩm bất động sản
CREATE TABLE products (
    products_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    head_bg VARCHAR(100) NOT NULL,
    products_name VARCHAR(100) NOT NULL,
    products_slug VARCHAR(100) NOT NULL,
    area VARCHAR(400) NOT NULL,
    information TEXT NOT NULL,
    desciption TEXT NOT NULL,
    address VARCHAR(100) NOT NULL,
    price DECIMAL NOT NULL,
    type INT NOT NULL,
    collections_id INT NOT NULL, 
    
    FOREIGN KEY (collections_id) REFERENCES collections(collections_id)
);
CREATE TABLE products_galery (
    products_galery_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    products_id INT NOT NULL,
    img VARCHAR(100) NOT NULL,
    
    FOREIGN KEY (products_id) REFERENCES products(products_id)
);
-- Tin tức bất động sản
CREATE TABLE news(
    news_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    news_name VARCHAR(200) NOT NULL,
    news_slug VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    thumbnail VARCHAR(100) NOT NULL,
    postdate DATETIME NOT NULL,
    viewCount INT NOT NULL
);
CREATE TABLE news_comment(
    news_comment_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    news_id INT NOT NULL,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message VARCHAR(500) NOT NULL,
    
    FOREIGN KEY (news_id) REFERENCES news(news_id)
);
-- Liên hệ + đăng ký thông tin
CREATE TABLE contact(
    contact_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    conMessage VARCHAR(500) NOT NULL,
    isSeen INT NOT NULL,
	isSaved INT NOT NULL
);
CREATE TABLE subscribed(
    subscribed_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(100) NOT NULL
);
