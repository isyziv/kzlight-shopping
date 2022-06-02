CREATE TABLE 顧客 (
  會員編號 VARCHAR(12) PRIMARY KEY,
  姓名    varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  電子信箱 varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  身分證字號 varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  住家地址 varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  性別    varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  連絡電話 varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  信用卡卡號 varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  出生年月日 date COLLATE utf8_unicode_ci NOT NULL
);
CREATE TABLE 物流廠商 (
  物流公司名稱 VARCHAR(12)  PRIMARY KEY,
  出貨地址 varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  電話 varchar(16) COLLATE utf8_unicode_ci NOT NULL
);
CREATE TABLE 出貨廠商 (
  出貨公司名稱 VARCHAR(12)  PRIMARY KEY,
  電子信箱 varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  公司地址 varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  連絡電話 varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  銀行帳戶 VARCHAR(16) COLLATE utf8_unicode_ci NOT NULL
);
CREATE TABLE 訂單 (
  訂單編號 VARCHAR(12) PRIMARY KEY,
  金額    INT(16) COLLATE utf8_unicode_ci NOT NULL,
  產品編號 varchar(9000) COLLATE utf8_unicode_ci NOT NULL,
  訂單狀態 varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  會員編號 VARCHAR(12) NOT NULL,
  數量 VARCHAR(9000) NOT NULL,
  出貨公司名稱 VARCHAR(12) NOT NULL,
FOREIGN KEY(會員編號) REFERENCES 顧客(會員編號),
FOREIGN KEY(出貨公司名稱) REFERENCES 出貨廠商(出貨公司名稱)
);
CREATE TABLE 購物車 (
	購物車編號 VARCHAR(12) PRIMARY KEY,
  金額    INT(16) COLLATE utf8_unicode_ci NOT NULL,
  產品編號 INT(16) COLLATE utf8_unicode_ci NOT NULL,
  產品名稱 varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  數量	INT(16)COLLATE utf8_unicode_ci NOT NULL,
  數量上限	INT(16)COLLATE utf8_unicode_ci NOT NULL,
  會員編號 VARCHAR(12) NOT NULL,
  出貨公司名稱 VARCHAR(12) NOT NULL,
FOREIGN KEY(會員編號) REFERENCES 顧客(會員編號),
FOREIGN KEY(出貨公司名稱) REFERENCES 出貨廠商(出貨公司名稱)
);
CREATE TABLE 商品  (
  產品編號 VARCHAR(12)  PRIMARY KEY,
  圖片    varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  產品名稱 varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  是否免費試用內容 int(1) COLLATE utf8_unicode_ci NOT NULL,
  是否獨佔    BOOL COLLATE utf8_unicode_ci NOT NULL,
  數量 int(16) COLLATE utf8_unicode_ci NOT NULL,
  價錢    int(16) COLLATE utf8_unicode_ci NOT NULL,
  規格 varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  商品簡介 varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  試用內容_1    varchar(800) COLLATE utf8_unicode_ci DEFAULT NULL,
  試用內容_2    varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  出貨公司名稱 varchar(12) NOT NULL,
  會員編號 VARCHAR(12) DEFAULT NULL,
  物流公司名稱 VARCHAR(12) DEFAULT NULL,
FOREIGN KEY(出貨公司名稱) REFERENCES 出貨廠商(出貨公司名稱),
FOREIGN KEY(會員編號) REFERENCES 顧客(會員編號),
FOREIGN KEY(物流公司名稱) REFERENCES 物流廠商(物流公司名稱)
);
