-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 19, 2022 lúc 04:30 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopdemo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'phone', 'https://img.icons8.com/emoji/344/mobile-phone.png'),
(2, 'laptop', 'https://img.icons8.com/fluency/344/laptop-metrics.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `question` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `password`, `phone`, `email`, `address`, `question`) VALUES
(1, 'trung', '123', 909123123, 'trung@gmail.com', '123 gò vấp', 'cau 1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detailorder`
--

CREATE TABLE `detailorder` (
  `id` int(3) NOT NULL,
  `idorder` int(3) NOT NULL,
  `idproduct` int(3) NOT NULL,
  `nameproduct` varchar(100) NOT NULL,
  `priceproduct` int(100) NOT NULL,
  `quantityproduct` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `detailorder`
--

INSERT INTO `detailorder` (`id`, `idorder`, `idproduct`, `nameproduct`, `priceproduct`, `quantityproduct`) VALUES
(1, 12, 5, 'Điện thoại iPhone 13 Pro Max 128GB', 32190000, 1),
(2, 13, 3, 'Laptop GIGABYTE G5 KC 5S11130SB', 27390000, 4),
(3, 13, 4, 'Laptop Gaming Asus ROG Zephyrus G15 ', 32790000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(3) NOT NULL,
  `namecustomer` varchar(1000) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phone` int(11) NOT NULL,
  `idcustomer` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `namecustomer`, `address`, `phone`, `idcustomer`) VALUES
(1, '0', '123', 1, 1),
(2, 'trung', '11 gò vấp', 123, 1),
(3, 'trung', '11 gò vấp', 123, 1),
(5, 'trung', '123 gò vấp', 909123123, 1),
(6, 'trung', '123 gò vấp', 909123123, 1),
(7, 'trung', '123 gò vấp', 909123123, 1),
(8, 'trung', '123 gò vấp', 909123123, 1),
(9, 'trung', '123 gò vấp', 909123123, 1),
(10, 'trung', '123 gò vấp', 909123123, 1),
(11, 'trung', '123 gò vấp', 909123123, 1),
(12, 'trung', '123 gò vấp', 909123123, 1),
(13, 'trung', '123 gò vấp', 909123123, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `idcategory` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `image`, `description`, `idcategory`) VALUES
(1, 'Laptop Gaming MSI Bravo 15 B5DD 276VN', 20990000, 'https://image.cellphones.com.vn/358x/media/catalog/product/3/2/32_6.jpg', 'Đánh giá chi tiết Laptop Gaming MSI Bravo 15 B5DD 276VN: \r\nPhục kích ở nơi hiểm yếu, quan sát kĩ càng kẻ địch trước khi xuất trận mạnh mẽ, Bravo 15 đã sẵn sàng cho chiến trường game rực lửa. Kết hợp giữa vi xử lí AMD Ryzen 5 5600H và card đồ họa AMD Radeon RX 5500M, Bravo 15 2021 sẽ làm thỏa mãn mọi game thủ. \r\n\r\nVới giải pháp tản nhiệt độc quyền của MSI – Cooler Boost 5, CPU và GPU sẽ thoải mái phát huy được tối đa hiệu năng. Tận dụng sức mạnh của Bravo 15 và tung hoành trên chiến trường ảo, giống như lôi điểu trong truyền thuyết!', 2),
(2, 'Laptop Gaming Acer Nitro 5 AN515 45 R6EV', 20990000, 'https://image.cellphones.com.vn/358x/media/catalog/product/1/_/1_69_23.jpg', 'Đánh giá chi tiết laptop gaming Acer Nitro 5 AN515-45 R6EV\r\nAcer vừa ra mắt phiên bản mới nhất của dòng máy gaming Nitro 5 - Nitro 5 AN515-45 R6EV được trang bị bộ vi xử lý AMD Ryzen 5 5600H, card đồ họa Geforce GTX 1650 4GB và tốc độ làm mới 144Hz cho hiệu năng xử lí mạnh mẽ cùng với hỗ trợ bàn phím RGB cá tính giúp mang lại trải nghiệm chơi game tốt nhất.\r\n\r\n', 2),
(3, 'Laptop GIGABYTE G5 KC 5S11130SB', 27390000, 'https://image.cellphones.com.vn/358x/media/catalog/product/l/a/laptop-gigabyte-g5-kc-5s11130sb-ksp.jpg', 'Thiết kế mạnh mẽ , màn hình đẹp cùng hiệu năng rất mạnh với RTX 3060 6GB\r\nChúng ta đã quen mặt với mainboard hay card màn hình với nhà sản xuất Gigabyte thì giờ đây, hệ sinh thái của hãng bổ sung một dòng sản phẩm laptop mới để phủ đầy phân khúc. Chiếc laptop G5 này mang trong mình sứ mệnh mở đường cho dòng laptop của hãng Gigabyte nên hãng đã chăm chút cho nó khá kĩ, từ sức mạnh về hiệu năng phần cứng với card màn hình RTX 3060 6GB cho đến con chip i5 6 nhân 12 luồng và đi kèm 16gb ram. Tự tin chinh phục mọi tác vụ công việc mà bạn cần.', 2),
(4, 'Laptop Gaming Asus ROG Zephyrus G15 ', 32790000, 'https://image.cellphones.com.vn/358x/media/catalog/product/_/0/_0004_20781_asus_rog_zephyrus__g15_ga5.jpg', 'Thông số kỹ thuật\r\nCPU	AMD Ryzen R9-5900HS (8 cores, up to 4.6GHz)\r\nRAM	16GB DDR4-3200Mhz SO-DIMM (8GB Onboard + 8GB Sodimm)\r\nỔ cứng	512GB M.2 NVMe™ PCIe® 3.0\r\nCard đồ họa	NVIDIA® GeForce RTX™ 3050 4GB GDDR6\r\nMàn hình	15.6 inch FHD (1920 x 1080), IPS,144Hz, AdaptiveSync, 45% NTSC\r\nCổng giao tiếp	2x Type C USB 3.2 Gen 2 with Power Delivery and Display Port\r\n2x USB 3.2 Gen 2 Type-A\r\n1x RJ45 LAN port\r\n1x card reader (microSD)\r\n1x 3.5mm Combo Audio Jack\r\n1x HDMI 2.0b\r\n1x Kensington Lock\r\nAudio	2x 2.5W speaker\r\nChuẩn WIFI	Wi-Fi 6 with Gig+ performance (802.11AX)\r\nBluetooth	Bluetooth 5.1 (Dual band) 2*2\r\nHệ điều hành	Windows 10 Home\r\nPin	90WHrs, 4S1P, 4-cell Li-ion\r\nTrọng lượng	1.9 kg\r\nMàu sắc	Eclipse Gray\r\nKích thước	35.5(W) x 24.3(D) x 1.99(H) cm', 2),
(5, 'Điện thoại iPhone 13 Pro Max 128GB', 32190000, 'https://cdn.tgdd.vn/Products/Images/42/230529/iphone-13-pro-max-1-2.jpg', 'Cấu hình Điện thoại iPhone 13 Pro Max 128GB\r\n\r\nMàn hình:\r\n\r\nOLED6.7\"Super Retina XDR\r\nHệ điều hành:\r\n\r\niOS 15\r\nCamera sau:\r\n\r\n3 camera 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A15 Bionic\r\nRAM:\r\n\r\n6 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4352 mAh20 W', 1),
(6, 'Điện thoại Samsung Galaxy Z Fold3', 41990000, 'https://cdn.tgdd.vn/Products/Images/42/226935/samsung-galaxy-z-fold-3-silver-gc-org.jpg', 'Màn hình:\r\n\r\nDynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\n3 camera 12 MP\r\nCamera trước:\r\n\r\n10 MP & 4 MP\r\nChip:\r\n\r\nSnapdragon 888\r\nRAM:\r\n\r\n12 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n2 Nano SIM + 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4400 mAh25 W', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idorder` (`idorder`),
  ADD KEY `idproduct` (`idproduct`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcustomer` (`idcustomer`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcategory` (`idcategory`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `detailorder_ibfk_1` FOREIGN KEY (`idorder`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `detailorder_ibfk_2` FOREIGN KEY (`idproduct`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`idcustomer`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
