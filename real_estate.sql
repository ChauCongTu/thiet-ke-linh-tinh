-- Dự án bất động sản
CREATE TABLE collections (
    collections_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    collections_name NVARCHAR(100) NOT NULL,
    collections_slug NVARCHAR(100) NOT NULL,
    overview NTEXT NOT NULL,
    video NVARCHAR(100) NOT NULL,
    introduction NTEXT NOT NULL,
    information NTEXT NOT NULL,
    location NTEXT NOT NULL
);
CREATE TABLE collections_galery (
    collections_id INT NOT NULL,
    collections_galery_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    img NVARCHAR(300) NOT NULL,
    
    FOREIGN KEY (collections_id) REFERENCES collections(collections_id)
);
-- Sản phẩm bất động sản
CREATE TABLE products (
    products_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    products_name NVARCHAR(100) NOT NULL,
    products_slug NVARCHAR(100) NOT NULL,
    area NVARCHAR(400) NOT NULL,
    information NTEXT NOT NULL,
    desciption NTEXT NOT NULL,
    address NVARCHAR(100) NOT NULL,
    price DECIMAL NOT NULL,
    type INT NOT NULL,
    viewCount INT NOT NULL,
    isHot BIT NOT NULL,
    collections_id INT NOT NULL, 
    
    FOREIGN KEY (collections_id) REFERENCES collections(collections_id)
);
CREATE TABLE products_galery (
    products_galery_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    products_id INT NOT NULL,
    img NVARCHAR(100) NOT NULL,
    
    FOREIGN KEY (products_id) REFERENCES products(products_id)
);
-- Tin tức bất động sản
CREATE TABLE news(
    news_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    news_name NVARCHAR(200) NOT NULL,
    news_slug NVARCHAR(200) NOT NULL,
    content NTEXT NOT NULL,
    thumbnail NVARCHAR(100) NOT NULL,
    postdate DATETIME NOT NULL,
    viewCount INT NOT NULL
);
CREATE TABLE news_comment(
    news_comment_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    news_id INT NOT NULL,
    username NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    message NVARCHAR(1500) NOT NULL,
    
    FOREIGN KEY (news_id) REFERENCES news(news_id)
);
-- Liên hệ + đăng ký thông tin
CREATE TABLE contact(
    contact_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    fullname NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    phone NVARCHAR(11) NOT NULL,
    conMessage NVARCHAR(500) NOT NULL,
    isSeen INT NOT NULL
);
CREATE TABLE subscribed(
    subscribed_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    email NVARCHAR(100) NOT NULL
);
