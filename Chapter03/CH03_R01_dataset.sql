
CREATE TABLE ch03_r01_bookings (
    booking_id INT PRIMARY KEY,
    region VARCHAR(10),
    booking_date VARCHAR(20),
    check_in_timestamp VARCHAR(30),
    check_out_timestamp VARCHAR(30)
);


INSERT INTO ch03_r01_bookings (booking_id, region, booking_date, check_in_timestamp, check_out_timestamp) VALUES
(1, 'APAC', '2024-07-27', '2024-12-06 21:21:02', '2024-12-19 02:03:58'),
(2, 'NA', '2024-10-07', '2024-12-09 16:32:53', '2024-12-13 07:29:29'),
(3, 'APAC', '2024-11-28', '2024-12-06 01:30:25', '2024-12-13 07:29:10'),
(4, 'APAC', '2024-02-20', '2024-12-06 18:05:34', '2024-12-15 15:21:39'),
(5, 'APAC', '2024-06-29', '2024-12-02 07:37:40', '2024-12-19 18:37:11'),
(6, 'EUROPE', '2024-07-01', '2024-12-07 09:55:39', '2024-12-14 00:38:41'),
(7, 'NA', '2024-05-07', '2024-12-05 11:43:54', '2024-12-12 22:44:39'),
(8, 'APAC', '2024-01-14', '2024-12-11 03:10:05', '2024-12-15 11:03:55'),
(9, 'LATAM', '2024-10-19', '2024-12-03 18:06:50', '2024-12-19 10:17:30'),
(10, 'EUROPE', '2024-03-22', '2024-12-12 04:40:39', '2024-12-15 23:17:06'),
(11, 'LATAM', '2024-07-22', '2024-12-09 07:53:43', '2024-12-20 03:10:44'),
(12, 'NA', '25/01/2024', '12/09/2024 03:53 AM', '12/18/2024 05:04 PM'),
(13, 'NA', '2024-11-24', '2024-12-10 03:17:36', '2024-12-20 16:33:50'),
(14, 'EUROPE', '04/07/2024', '04-12-2024 09:46:54', '12/21/2024 10:09 PM'),
(15, 'NA', '2024-05-02', '2024-12-05 10:54:58', '2024-12-21 04:16:02'),
(16, 'APAC', '2024-01-09', '2024-12-09 01:10:45', '2024-12-20 21:14:54'),
(17, 'NA', '25/02/2024', '12/05/2024 09:14 PM', '2024/12/22 01:57'),
(18, 'APAC', '2024-08-04', '2024-12-03 13:08:01', '2024-12-20 01:34:21'),
(19, 'EUROPE', '2024-01-31', '2024-12-03 02:29:22', '2024-12-17 01:17:11'),
(20, 'LATAM', '2024-02-07', '2024-12-10 21:53:38', '2024-12-15 08:59:39'),
(21, 'NA', '2024-01-18', '2024-12-09 12:22:03', '2024-12-18 14:55:10'),
(22, 'EUROPE', '2024-06-23', '2024-12-10 15:51:26', '2024-12-21 20:26:14'),
(23, 'LATAM', '2024-04-25', '2024-12-08 03:24:55', '2024-12-15 12:44:40'),
(24, 'LATAM', '2023-12-25', '2024-12-11 08:28:20', '2024-12-18 04:31:10'),
(25, 'LATAM', '2023-12-15', '2024-12-03 03:39:33', '2024-12-15 16:04:05'),
(26, 'NA', '2024-04-15', '2024-12-04 18:53:40', '2024-12-20 07:08:43'),
(27, 'LATAM', '2024-03-13', '2024-12-06 15:20:18', '2024-12-20 20:52:51'),
(28, 'APAC', '2024-08-26', '2024-12-10 08:04:09', '2024-12-14 22:10:03'),
(29, 'NA', '2024-01-27', '2024-12-10 02:02:51', '2024-12-20 05:41:33'),
(30, 'LATAM', '2024-10-04', '2024-12-05 18:06:21', '2024-12-14 22:48:40'),
(31, 'LATAM', '04/11/2024', '12/03/2024 10:56 AM', '18-12-2024 01:24:59'),
(32, 'NA', '2024-07-10', '2024-12-12 00:57:22', '2024-12-18 16:43:38'),
(33, 'APAC', '2023-12-13', '2024-12-03 07:17:56', '2024-12-18 03:32:31'),
(34, 'LATAM', '2024-06-02', '2024-12-03 19:08:01', '2024-12-18 14:26:48'),
(35, 'LATAM', '25-10-2024', '04-12-2024 04:53:17', '12/21/2024 06:23 AM'),
(36, 'EUROPE', '07/09/2024', '2024/12/06 07:50', '2024/12/14 13:26'),
(37, 'APAC', '2024-01-03', '2024-12-10 04:55:23', '2024-12-20 03:30:26'),
(38, 'EUROPE', '2024-06-24', '2024-12-09 03:34:46', '2024-12-21 20:18:03'),
(39, 'APAC', '2024-02-01', '2024-12-12 03:59:07', '2024-12-16 15:12:37'),
(40, 'NA', '12/08/2024', '2024/12/05 14:20', '14-12-2024 20:06:11'),
(41, 'NA', '2024-06-20', '2024-12-05 04:07:31', '2024-12-17 14:23:57'),
(42, 'EUROPE', '2023-12-18', '2024-12-06 04:59:04', '2024-12-13 20:50:49'),
(43, 'NA', '2024-10-06', '2024-12-08 15:03:25', '2024-12-21 23:04:09'),
(44, 'EUROPE', '2024-05-03', '2024-12-08 23:52:36', '2024-12-15 02:01:39'),
(45, 'NA', '24-09-2024', '2024/12/07 06:34', '2024/12/16 13:25'),
(46, 'APAC', '2024-03-14', '2024-12-04 08:45:11', '2024-12-15 07:55:09'),
(47, 'NA', '01/16/2024', '11-12-2024 03:49:43', '12/21/2024 11:30 AM'),
(48, 'EUROPE', '2024-08-14', '2024-12-05 07:03:19', '2024-12-16 17:21:45'),
(49, 'APAC', '2024-11-27', '2024-12-10 01:44:46', '2024-12-18 10:44:25'),
(50, 'EUROPE', '10/14/2024', '04-12-2024 17:59:27', '2024/12/17 07:59'),
(51, 'EUROPE', '2023-12-15', '2024-12-04 05:00:19', '2024-12-20 03:26:36'),
(52, 'NA', '2024-03-24', '2024-12-03 21:23:49', '2024-12-17 03:14:02'),
(53, 'LATAM', '2023-12-08', '2024-12-02 17:50:07', '2024-12-19 02:53:00'),
(54, 'EUROPE', '2024-06-03', '2024-12-07 09:38:02', '2024-12-16 16:05:12'),
(55, 'LATAM', '2024-03-25', '2024-12-04 21:47:18', '2024-12-16 10:49:59'),
(56, 'NA', '04/04/2024', '2024/12/05 13:55', '2024/12/20 21:34'),
(57, 'EUROPE', '2024-11-30', '2024-12-11 20:07:36', '2024-12-16 18:09:53'),
(58, 'LATAM', '2024-07-08', '2024-12-07 06:46:39', '2024-12-18 12:34:02'),
(59, 'EUROPE', '27-01-2024', '12/05/2024 08:09 PM', '21-12-2024 14:02:58'),
(60, 'APAC', '2024-02-09', '2024-12-11 09:01:02', '2024-12-16 20:34:58'),
(61, 'LATAM', '2024-07-16', '2024-12-06 01:29:18', '2024-12-14 04:37:56'),
(62, 'EUROPE', '2024-10-13', '2024-12-05 14:51:52', '2024-12-18 18:30:24'),
(63, 'LATAM', '2024-06-03', '2024-12-07 16:49:26', '2024-12-21 14:17:15'),
(64, 'NA', '2024-07-19', '2024-12-02 08:13:56', '2024-12-14 10:57:28'),
(65, 'NA', '2024-06-08', '2024-12-07 06:09:19', '2024-12-21 01:43:24'),
(66, 'EUROPE', '2024-01-17', '2024-12-07 08:16:24', '2024-12-12 12:15:27'),
(67, 'APAC', '2024-03-19', '2024-12-11 15:25:13', '2024-12-15 18:30:17'),
(68, 'NA', '2024-04-18', '2024-12-07 22:21:31', '2024-12-16 07:03:38'),
(69, 'EUROPE', '2024-09-02', '2024-12-05 03:12:10', '2024-12-20 23:17:02'),
(70, 'EUROPE', '2024-06-15', '2024-12-08 06:26:15', '2024-12-19 03:53:04'),
(71, 'EUROPE', '2024-03-03', '2024-12-12 04:27:28', '2024-12-22 00:26:48'),
(72, 'APAC', '2024-10-29', '2024-12-08 03:20:18', '2024-12-13 17:50:13'),
(73, 'APAC', '2024-04-19', '2024-12-09 08:01:01', '2024-12-21 07:45:30'),
(74, 'APAC', '2023-12-07', '2024-12-07 04:26:31', '2024-12-19 23:52:11'),
(75, 'APAC', '2023-12-14', '2024-12-07 10:14:52', '2024-12-16 15:24:09'),
(76, 'APAC', '2024-02-18', '2024-12-07 16:48:48', '2024-12-12 18:15:38'),
(77, 'NA', '2024-09-21', '2024-12-02 16:38:40', '2024-12-21 23:54:47'),
(78, 'NA', '15/02/2024', '2024/12/04 05:27', '12/16/2024 03:40 PM'),
(79, 'EUROPE', '2024-10-13', '2024-12-06 11:50:02', '2024-12-20 07:06:08'),
(80, 'NA', '2024-06-29', '2024-12-08 01:35:06', '2024-12-22 03:17:18'),
(81, 'EUROPE', '2024-02-04', '2024-12-02 21:25:10', '2024-12-12 08:26:09'),
(82, 'LATAM', '08-04-2024', '12/03/2024 12:16 AM', '22-12-2024 00:45:49'),
(83, 'APAC', '2024-10-07', '2024-12-05 02:36:21', '2024-12-13 22:45:36'),
(84, 'EUROPE', '2024-05-07', '2024-12-06 18:27:20', '2024-12-21 06:18:46'),
(85, 'LATAM', '2024-08-07', '2024-12-04 06:38:27', '2024-12-17 20:27:42'),
(86, 'LATAM', '2023-12-20', '2024-12-10 20:38:51', '2024-12-14 07:37:55'),
(87, 'EUROPE', '2023-12-28', '2024-12-04 02:52:04', '2024-12-17 11:55:11'),
(88, 'NA', '2024-02-23', '2024-12-10 00:24:00', '2024-12-18 00:44:21'),
(89, 'NA', '20-05-2024', '2024/12/07 10:52', '12/17/2024 07:58 PM'),
(90, 'APAC', '2024-08-04', '2024-12-11 20:39:34', '2024-12-16 04:50:11'),
(91, 'NA', '2024-02-10', '2024-12-11 04:39:10', '2024-12-18 05:17:48'),
(92, 'EUROPE', '2024-08-29', '2024-12-08 06:52:35', '2024-12-16 11:52:36'),
(93, 'APAC', '2024-02-28', '2024-12-06 15:18:28', '2024-12-15 18:42:59'),
(94, 'LATAM', '2024-02-08', '2024-12-09 03:08:48', '2024-12-12 06:11:33'),
(95, 'EUROPE', '03/06/2024', '12/02/2024 05:33 PM', '12/18/2024 09:34 PM'),
(96, 'EUROPE', '2024-03-25', '2024-12-05 13:29:09', '2024-12-13 09:50:20'),
(97, 'NA', '2024-08-07', '2024-12-05 23:01:58', '2024-12-12 21:13:22'),
(98, 'APAC', '2024-10-09', '2024-12-10 00:38:55', '2024-12-19 11:32:12'),
(99, 'NA', '2024-08-31', '2024-12-11 18:51:52', '2024-12-18 17:19:04'),
(100, 'LATAM', '15-01-2024', '08-12-2024 23:24:19', '12/16/2024 01:45 PM'),
(101, 'NA', '2024-08-24', '2024-12-09 03:19:22', '2024-12-19 19:18:28'),
(102, 'EUROPE', '2024-07-16', '2024-12-07 06:37:42', '2024-12-21 19:07:26'),
(103, 'NA', '2024-10-29', '2024-12-02 11:54:36', '2024-12-20 15:53:25'),
(104, 'APAC', '2024-09-21', '2024-12-07 05:17:03', '2024-12-16 05:32:57'),
(105, 'APAC', '2024-10-07', '2024-12-09 13:57:45', '2024-12-19 09:51:06'),
(106, 'NA', '2024-02-26', '2024-12-03 23:10:12', '2024-12-18 04:41:39'),
(107, 'EUROPE', '2024-07-02', '2024-12-10 23:13:10', '2024-12-12 12:14:49'),
(108, 'NA', '2024-09-24', '2024-12-10 12:37:09', '2024-12-17 07:07:16'),
(109, 'LATAM', '2024-11-17', '2024-12-04 13:14:55', '2024-12-12 20:42:35'),
(110, 'NA', '2024-07-04', '2024-12-11 22:10:37', '2024-12-21 00:13:56'),
(111, 'EUROPE', '30-09-2024', '12/02/2024 11:46 PM', '13-12-2024 07:19:15'),
(112, 'NA', '2024-03-07', '2024-12-11 04:43:40', '2024-12-14 17:09:59'),
(113, 'APAC', '2024-05-03', '2024-12-12 03:17:36', '2024-12-20 20:09:49'),
(114, 'EUROPE', '2024-02-21', '2024-12-10 21:04:26', '2024-12-21 17:09:37'),
(115, 'APAC', '2024-10-05', '2024-12-02 16:52:20', '2024-12-12 16:27:23'),
(116, 'EUROPE', '2024-03-17', '2024-12-05 08:29:34', '2024-12-18 18:33:18'),
(117, 'LATAM', '2024-03-09', '2024-12-10 19:09:07', '2024-12-15 20:00:40'),
(118, 'NA', '16/09/2024', '2024/12/07 05:30', '12/14/2024 05:40 AM'),
(119, 'NA', '2024/07/21', '12/03/2024 08:01 PM', '2024/12/20 05:37'),
(120, 'EUROPE', '2024-10-28', '2024-12-04 17:14:27', '2024-12-19 06:17:57'),
(121, 'NA', '2024-09-19', '2024-12-07 22:13:13', '2024-12-21 05:41:14'),
(122, 'APAC', '07-04-2024', '10-12-2024 08:05:53', '12/21/2024 09:17 AM'),
(123, 'APAC', '2023-12-18', '2024-12-05 22:59:22', '2024-12-12 21:58:47'),
(124, 'APAC', '2024-10-21', '2024-12-05 18:27:25', '2024-12-18 01:59:23'),
(125, 'NA', '2024-03-11', '2024-12-09 13:52:54', '2024-12-12 19:26:25'),
(126, 'EUROPE', '2024-04-28', '2024-12-08 08:27:39', '2024-12-13 08:52:29'),
(127, 'APAC', '2024-11-07', '2024-12-11 07:04:15', '2024-12-17 14:28:40'),
(128, 'NA', '2023-12-16', '2024-12-09 05:59:16', '2024-12-14 21:13:08'),
(129, 'NA', '2023-12-05', '2024-12-02 16:31:22', '2024-12-15 14:21:31'),
(130, 'EUROPE', '2024-10-30', '2024-12-07 13:55:54', '2024-12-14 00:35:36'),
(131, 'APAC', '2024-11-08', '2024-12-03 06:26:53', '2024-12-21 19:48:12'),
(132, 'APAC', '2024-05-05', '2024-12-09 22:09:28', '2024-12-18 01:00:56'),
(133, 'APAC', '2024-01-21', '2024-12-09 01:39:20', '2024-12-15 14:23:17'),
(134, 'NA', '2024-10-08', '2024-12-07 02:52:45', '2024-12-18 16:06:00'),
(135, 'APAC', '2024-08-16', '2024-12-08 10:08:22', '2024-12-20 19:01:36'),
(136, 'EUROPE', '2024-04-10', '2024-12-10 03:38:04', '2024-12-20 10:42:43'),
(137, 'APAC', '2024-02-20', '2024-12-05 23:22:34', '2024-12-13 05:39:03'),
(138, 'APAC', '2023-12-04', '2024-12-12 01:23:59', '2024-12-19 09:53:57'),
(139, 'LATAM', '2024-11-10', '2024-12-10 20:19:09', '2024-12-14 10:08:31'),
(140, 'EUROPE', '2024-10-31', '2024-12-03 16:41:58', '2024-12-13 22:01:52'),
(141, 'APAC', '2024-04-10', '2024-12-08 19:39:19', '2024-12-21 03:58:34'),
(142, 'LATAM', '02/16/2024', '10-12-2024 12:06:19', '18-12-2024 14:00:44'),
(143, 'LATAM', '2024-08-22', '2024-12-02 17:19:11', '2024-12-13 09:28:36'),
(144, 'EUROPE', '2024-05-16', '2024-12-09 17:14:53', '2024-12-17 18:53:44'),
(145, 'EUROPE', '2024/08/02', '07-12-2024 02:39:10', '2024/12/16 10:37'),
(146, 'NA', '2024-10-21', '2024-12-10 00:52:27', '2024-12-17 06:55:33'),
(147, 'LATAM', '2024-11-17', '2024-12-11 00:02:34', '2024-12-21 18:59:12'),
(148, 'EUROPE', '11/09/2024', '03-12-2024 20:49:04', '12-12-2024 18:06:03'),
(149, 'APAC', '06-09-2024', '12/03/2024 02:16 AM', '12/13/2024 06:10 PM'),
(150, 'NA', '06/29/2024', '2024/12/04 12:34', '19-12-2024 20:44:40'),
(151, 'EUROPE', '22/06/2024', '2024/12/03 11:34', '2024/12/17 19:10'),
(152, 'EUROPE', '2024-04-18', '2024-12-08 08:25:46', '2024-12-13 08:27:26'),
(153, 'LATAM', '2024-02-11', '2024-12-04 20:20:28', '2024-12-16 18:44:33'),
(154, 'EUROPE', '2024-04-20', '2024-12-09 01:13:24', '2024-12-20 05:05:41'),
(155, 'APAC', '03/12/2023', '12/06/2024 01:47 AM', '12/20/2024 09:20 PM'),
(156, 'LATAM', '2023-12-08', '2024-12-10 06:35:15', '2024-12-20 19:57:56'),
(157, 'APAC', '2024-10-08', '2024-12-06 23:05:44', '2024-12-17 16:25:54'),
(158, 'APAC', '2024-02-16', '2024-12-03 22:20:43', '2024-12-13 07:22:07'),
(159, 'LATAM', '01/06/2024', '2024/12/08 16:47', '2024/12/21 18:55'),
(160, 'APAC', '2024-01-12', '2024-12-11 22:49:42', '2024-12-22 00:13:58'),
(161, 'APAC', '10/02/2024', '06-12-2024 22:20:54', '2024/12/14 03:32'),
(162, 'APAC', '2024-05-09', '2024-12-02 18:09:32', '2024-12-18 21:06:16'),
(163, 'EUROPE', '2024-11-05', '2024-12-11 10:17:14', '2024-12-19 16:54:16'),
(164, 'NA', '2023-12-22', '2024-12-07 07:50:46', '2024-12-14 12:57:44'),
(165, 'EUROPE', '2024-07-13', '2024-12-03 12:10:50', '2024-12-16 08:41:31'),
(166, 'LATAM', '2024-08-31', '2024-12-07 00:09:34', '2024-12-12 11:43:43'),
(167, 'EUROPE', '08-09-2024', '12/09/2024 10:44 PM', '2024/12/19 12:05'),
(168, 'NA', '09/03/2024', '12/02/2024 05:33 PM', '21-12-2024 14:21:39'),
(169, 'NA', '07/26/2024', '12/06/2024 07:37 AM', '2024/12/19 05:32'),
(170, 'LATAM', '2024-08-11', '2024-12-04 23:11:39', '2024-12-13 20:31:50'),
(171, 'APAC', '2024-10-07', '2024-12-08 22:59:48', '2024-12-12 13:36:00'),
(172, 'EUROPE', '2023-12-12', '2024-12-05 06:21:08', '2024-12-20 16:56:37'),
(173, 'EUROPE', '2024-05-30', '2024-12-07 18:06:00', '2024-12-16 13:31:03'),
(174, 'LATAM', '2024-06-08', '2024-12-09 17:32:58', '2024-12-13 22:00:14'),
(175, 'LATAM', '2024-02-01', '2024-12-08 16:46:18', '2024-12-16 05:18:53'),
(176, 'APAC', '2024-08-02', '2024-12-04 05:48:58', '2024-12-13 15:44:33'),
(177, 'EUROPE', '2024-02-03', '2024-12-04 12:52:00', '2024-12-17 01:21:00'),
(178, 'LATAM', '2024/06/23', '2024/12/06 02:13', '18-12-2024 20:44:29'),
(179, 'LATAM', '2024-01-22', '2024-12-11 17:00:41', '2024-12-13 18:19:55'),
(180, 'EUROPE', '2023-12-03', '2024-12-11 16:07:46', '2024-12-15 05:58:46'),
(181, 'LATAM', '2024-10-29', '2024-12-03 14:19:06', '2024-12-16 06:50:06'),
(182, 'EUROPE', '2024-08-05', '2024-12-04 20:54:09', '2024-12-21 21:45:22'),
(183, 'NA', '2024-05-24', '2024-12-11 04:49:01', '2024-12-14 13:18:57'),
(184, 'NA', '2024-08-05', '2024-12-05 12:46:10', '2024-12-12 05:22:36'),
(185, 'NA', '2023-12-31', '2024-12-10 17:59:21', '2024-12-14 01:56:28'),
(186, 'NA', '2024-06-17', '2024-12-02 14:43:01', '2024-12-21 16:36:09'),
(187, 'NA', '2023-12-23', '2024-12-09 00:03:14', '2024-12-16 03:09:37'),
(188, 'NA', '17-11-2024', '12/04/2024 02:22 PM', '2024/12/17 03:23'),
(189, 'APAC', '2023-12-25', '2024-12-06 20:56:44', '2024-12-18 02:15:38'),
(190, 'LATAM', '2024-09-01', '2024-12-05 17:10:51', '2024-12-21 15:10:24'),
(191, 'EUROPE', '2024-09-28', '2024-12-10 09:26:56', '2024-12-13 03:45:00'),
(192, 'LATAM', '2024-10-27', '2024-12-10 20:49:27', '2024-12-14 19:52:23'),
(193, 'EUROPE', '2024-04-11', '2024-12-08 02:11:03', '2024-12-19 14:14:42'),
(194, 'APAC', '2024-02-06', '2024-12-10 22:59:16', '2024-12-16 18:22:18'),
(195, 'LATAM', '2024-07-17', '2024-12-04 04:41:02', '2024-12-21 21:34:52'),
(196, 'LATAM', '02-06-2024', '12/05/2024 12:00 AM', '12/17/2024 06:22 AM'),
(197, 'EUROPE', '2024-09-16', '2024-12-03 19:58:05', '2024-12-20 19:00:47'),
(198, 'LATAM', '2023-12-27', '2024-12-03 21:23:58', '2024-12-12 11:51:08'),
(199, 'LATAM', '16/09/2024', '2024/12/07 11:32', '12/15/2024 07:22 AM'),
(200, 'NA', '2024-10-14', '2024-12-10 20:12:53', '2024-12-21 18:08:56');