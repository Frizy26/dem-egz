-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 22 2024 г., 23:43
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `message` text NOT NULL,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `message`, `user_id`, `order_id`) VALUES
(1, 'Интересная поломка', 2, 1),
(2, 'Очень странно, будем разбираться!', 3, 2),
(3, 'Скорее всего потребуется мотор обдува!', 2, 7),
(4, 'Интересная поломка', 2, 1),
(5, 'Очень странно, будем разбираться!', 3, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `material`
--

CREATE TABLE `material` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `material`
--

INSERT INTO `material` (`id`, `name`, `price`, `amount`) VALUES
(1, 'Контроллер', '599.00', 3),
(2, 'Переключатель', '299.00', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `device_type` varchar(255) NOT NULL,
  `tech_model` varchar(255) NOT NULL,
  `problem_description` text NOT NULL,
  `status_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `priority_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `start_date`, `end_date`, `device_type`, `tech_model`, `problem_description`, `status_id`, `user_id`, `priority_id`) VALUES
(1, '2023-06-06', NULL, 'Фен', 'Ладомир ТА112 белый', 'Перестал работать', 2, 7, 1),
(2, '2023-05-05', NULL, 'Тостер', 'Redmond RT-437 черный', 'Перестал работать', 2, 7, 2),
(3, '2022-07-07', '2023-01-01', 'Холодильник', 'Indesit DS 316 W белый', 'Не морозит одна из камер холодильника', 3, 8, 3),
(4, '2023-08-02', NULL, 'Стиральная машина', 'DEXP WM-F610NTMA/WW белый', 'Перестали работать многие режимы стирки', 1, 8, 2),
(5, '2023-08-02', NULL, 'Мультиварка', 'Redmond RMC-M95 черный', 'Перестала включаться', 1, 9, 2),
(6, '2023-08-02', '2023-08-03', 'Фен', 'Ладомир ТА113 чёрный', 'Перестал работать', 3, 7, 3),
(7, '2023-07-09', '2023-08-03', 'Холодильник', 'Indesit DS 314 W серый', 'Гудит, но не замораживает', 3, 8, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `priority`
--

CREATE TABLE `priority` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `priority`
--

INSERT INTO `priority` (`id`, `name`) VALUES
(1, 'Высокий'),
(2, 'Средний'),
(3, 'Низкий');

-- --------------------------------------------------------

--
-- Структура таблицы `report_order`
--

CREATE TABLE `report_order` (
  `id` int NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `material_id` int NOT NULL,
  `order_id` int NOT NULL,
  `report_status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `report_order`
--

INSERT INTO `report_order` (`id`, `price`, `material_id`, `order_id`, `report_status_id`) VALUES
(1, '599.00', 1, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `report_status`
--

CREATE TABLE `report_status` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `report_status`
--

INSERT INTO `report_status` (`id`, `name`) VALUES
(1, 'Взято в работу'),
(2, 'Ожидание материалов'),
(3, 'Материалы доставлены'),
(4, 'Работа закончена');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`, `code`) VALUES
(1, 'Заказчик', 'client'),
(2, 'Оператор', 'admin'),
(3, 'Мастер', 'master'),
(4, 'Менеджер', 'meneger');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Новая заявка'),
(2, 'В процессе ремонта'),
(3, 'Готова к выдаче'),
(4, 'Ожидание комплектующих');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `patronymic`, `phone`, `login`, `password`, `role_id`) VALUES
(1, 'Никита', 'Трубин', 'Юрьевич', '89210563128', 'kasoo', 'root', 4),
(2, 'Андрей', 'Мурашов', 'Юрьевич', '89535078985', 'murashov123', 'qwerty', 3),
(3, 'Андрей', 'Степанов', 'Викторович', '89210673849', 'test1', 'test1', 3),
(4, 'Анастасия', 'Перина', 'Денисовна', '89990563748', 'perinaAD', '250519', 2),
(5, 'Ксения', 'Мажитова', 'Сергеевна', '89994563847', 'krutiha1234567', '1234567890', 2),
(6, 'Ясмина', 'Семенова', 'Марковна', '79994563847', 'login1', 'pass1', 3),
(7, 'Эмилия', 'Баранова', 'Марковна', '89994563841', 'login2', 'pass2', 1),
(8, 'Алиса', 'Егорова', 'Платоновна', '89994563842', 'login3', 'pass3', 1),
(9, 'Максим', 'Титов', 'Иванович', '89994563843', 'login4', 'pass4', 1),
(10, 'Марк', 'Иванов', 'Максимович', '89994563844', 'login5', 'pass5', 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `priority_id` (`priority_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `report_order`
--
ALTER TABLE `report_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `material_id` (`material_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD UNIQUE KEY `report_status_id` (`report_status_id`);

--
-- Индексы таблицы `report_status`
--
ALTER TABLE `report_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`role_id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `material`
--
ALTER TABLE `material`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `priority`
--
ALTER TABLE `priority`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `report_order`
--
ALTER TABLE `report_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `report_status`
--
ALTER TABLE `report_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`priority_id`) REFERENCES `priority` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `report_order`
--
ALTER TABLE `report_order`
  ADD CONSTRAINT `report_order_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_order_ibfk_3` FOREIGN KEY (`report_status_id`) REFERENCES `report_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
