-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 20 2017 г., 09:53
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `категория`
--

CREATE TABLE `категория` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `категория`
--

INSERT INTO `категория` (`id`, `name`, `active`) VALUES
(1, 'Мобильные телефоны', 1),
(2, 'Ноутбуки', 1),
(3, 'Планшеты', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `покупатель`
--

CREATE TABLE `покупатель` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `покупатель`
--

INSERT INTO `покупатель` (`id`, `login`, `password`, `name`, `s_name`, `phone`, `email`) VALUES
(1, 'login1', 'password1', 'John', 'Doe', '123-45-67', 'some@email.com'),
(2, 'login2', 'password2', 'Jane', 'Doe', '987-65-43', 'some2@email.com');

-- --------------------------------------------------------

--
-- Структура таблицы `заказ`
--

CREATE TABLE `заказ` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `shopper_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `товар`
--

CREATE TABLE `товар` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `товар`
--

INSERT INTO `товар` (`id`, `category_id`, `title`, `description`, `image_url`, `price`, `active`) VALUES
(1, 1, 'Nokia Lumia 925', '', '', '100.00', 1),
(2, 1, 'Nokia 3310', '', '', '50.00', 1),
(3, 1, 'Samsung Galaxy S8', '', '', '1000.00', 1),
(4, 2, 'Acer Aspire', '', '', '400.00', 1),
(5, 2, 'Asus ZenBook', '', '', '1000.00', 1),
(6, 2, 'Apple MacBook', '', '', '2000.00', 1),
(7, 3, 'Samsung Galaxy Tab S3', '', '', '1000.00', 1),
(8, 3, 'Apple Ipad', '', '', '500.00', 1),
(9, 3, 'Lenovo Tab3', '', '', '100.00', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `категория`
--
ALTER TABLE `категория`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `покупатель`
--
ALTER TABLE `покупатель`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `заказ`
--
ALTER TABLE `заказ`
  ADD PRIMARY KEY (`id`),
  ADD KEY `заказ_ibfk_1` (`goods_id`),
  ADD KEY `shopper_id` (`shopper_id`);

--
-- Индексы таблицы `товар`
--
ALTER TABLE `товар`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `категория`
--
ALTER TABLE `категория`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `покупатель`
--
ALTER TABLE `покупатель`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `заказ`
--
ALTER TABLE `заказ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `товар`
--
ALTER TABLE `товар`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `заказ`
--
ALTER TABLE `заказ`
  ADD CONSTRAINT `заказ_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `товар` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `заказ_ibfk_2` FOREIGN KEY (`shopper_id`) REFERENCES `покупатель` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `товар`
--
ALTER TABLE `товар`
  ADD CONSTRAINT `товар_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `категория` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
