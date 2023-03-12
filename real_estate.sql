-- Dự án bất động sản
CREATE TABLE collections (
    collections_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    head_bg VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL,
    Overview TEXT NOT NULL,
    Video VARCHAR(100) NOT NULL,
    Introduction TEXT NOT NULL,
    Information TEXT NOT NULL,
    Location VARCHAR(300) NOT NULL
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
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL,
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
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL,
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
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    message VARCHAR(500) NOT NULL,
    isSeen INT NOT NULL
);
CREATE TABLE subscribed(
    subscribed_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(100) NOT NULL
);
-- Người dùng
CREATE TABLE users(
    user_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100) NOT NULL,
    password VARCHAR(64) NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    gender INT NOT NULL,
    address VARCHAR(100) NOT NULL,
    avatar VARCHAR(100) NOT NULL
);