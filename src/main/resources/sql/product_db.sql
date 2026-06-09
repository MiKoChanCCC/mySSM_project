
CREATE DATABASE IF NOT EXISTS product_db
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

USE product_db;

DROP TABLE IF EXISTS product;
CREATE TABLE product (
    id          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '商品主键ID',
    goods_name  VARCHAR(100) NOT NULL                COMMENT '商品名称',
    price       DECIMAL(10,2) NOT NULL               COMMENT '商品价格',
    stock       INT          NOT NULL DEFAULT 0       COMMENT '库存数量',
    category    VARCHAR(50)  NOT NULL                COMMENT '商品分类',
    create_time DATETIME     NOT NULL                COMMENT '上架时间',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品信息表';

INSERT INTO product (goods_name, price, stock, category, create_time) VALUES
('iPhone 17 Pro',      8999.00,  120, '手机数码', '2025-01-15 10:00:00'),
('MacBook Pro 14寸',   14999.00,  50, '电脑办公', '2025-02-20 14:30:00'),
('AirPods Pro 2',       1899.00, 300, '手机数码', '2025-03-10 09:00:00'),
('iPad Air',            4799.00,  80, '平板电脑', '2025-04-05 16:00:00'),
('Apple Watch Series 9', 3299.00, 150, '智能穿戴', '2025-05-18 11:00:00');
