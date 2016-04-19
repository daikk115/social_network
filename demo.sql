-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2015 at 07:07 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment_image`
--

CREATE TABLE IF NOT EXISTS `comment_image` (
  `comment_image_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `content` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='chỉ chứa các comment trên image';

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE IF NOT EXISTS `friend` (
  `user_id1` int(11) NOT NULL,
  `user_id2` int(11) NOT NULL,
  `relationship` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='lưu quan hệ bạn bè.';

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`user_id1`, `user_id2`, `relationship`, `time`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '0000-00-00 00:00:00', '2015-05-01 19:52:25', '2015-05-01 19:52:25'),
(1, 3, 1, '0000-00-00 00:00:00', '2015-05-01 19:52:55', '2015-05-11 17:20:05'),
(1, 5, 1, '0000-00-00 00:00:00', '2015-05-11 16:40:47', '2015-05-11 17:03:48'),
(2, 3, 0, '0000-00-00 00:00:00', '2015-05-01 19:53:09', '2015-05-01 19:53:09'),
(2, 4, 1, '0000-00-00 00:00:00', '2015-05-01 19:53:09', '2015-05-01 19:53:09'),
(4, 1, 1, '0000-00-00 00:00:00', '2015-05-01 19:52:55', '2015-05-01 19:52:55'),
(5, 2, 1, '0000-00-00 00:00:00', '2015-05-12 04:32:37', '2015-05-12 04:33:38');

-- --------------------------------------------------------

--
-- Stand-in structure for view `full_post`
--
CREATE TABLE IF NOT EXISTS `full_post` (
`user_id` int(11)
,`user_name` varchar(100)
,`updated_at` timestamp
,`content` text
,`list_like` text
,`comment` mediumtext
,`post_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
`image_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text CHARACTER SET utf8mb4 NOT NULL,
  `like` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='lưu ảnh, dưới dạng folder_id, thời gian đăng ảnh đó và link ảnh, có lưu comment tương tự status, có like , cả 2 đều dạng json';

-- --------------------------------------------------------

--
-- Stand-in structure for view `list_request`
--
CREATE TABLE IF NOT EXISTS `list_request` (
`user_id1` int(11)
,`user_name` varchar(100)
,`user_id2` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `session_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_login` datetime NOT NULL,
  `ip` int(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`session_id`, `user_id`, `time_login`, `ip`, `created_at`, `updated_at`) VALUES
('jakshkjah', 3, '0000-00-00 00:00:00', 0, '2015-05-01 18:53:02', '2015-05-01 19:00:58'),
('jakshkjahsjkdhkajsd', 1, '0000-00-00 00:00:00', 0, '2015-05-01 18:51:27', '2015-05-01 18:51:27'),
('jakshkjahsjkdhkajsde', 2, '0000-00-00 00:00:00', 0, '2015-05-01 18:52:23', '2015-05-01 18:52:23'),
('jakshkjaj', 5, '0000-00-00 00:00:00', 0, '2015-05-01 18:53:02', '2015-05-01 18:53:02'),
('jakshkjax', 4, '0000-00-00 00:00:00', 0, '2015-05-01 18:53:02', '2015-05-01 18:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `user_id_sent` int(11) NOT NULL,
  `user_id_recieve` int(11) NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='chứa nội dung tin nhắn giữa 2 người dưới dạng json';

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`user_id_sent`, `user_id_recieve`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '[{"user_id_send":1,"content":"h\\u00ed h\\u00ed ^^","time":"11:14:16 12-05-15"},{"user_id_send":1,"content":"kjsdbfkj","time":"04:02:11 12-05-15"}]', '-1', '2015-05-12 04:14:16', '2015-05-12 09:02:12'),
(1, 2, '[{"user_id_send":"2","content":"viet nam","time":"10:00:53 10-05-15"},{"user_id_send":"2","content":"viet nam dat nuoc","time":"10:01:12 10-05-15"},{"user_id_send":"2","content":"viet nam dat nuoc con nguoi","time":"10:01:19 10-05-15"},{"user_id_send":1,"content":"Nh\\u1eafn ti\\u1ebfp nh\\u00e9","time":"11:44:17 10-05-15"},{"user_id_send":1,"content":"nh\\u1eafn ti\\u1ebfp nh\\u00e9","time":"11:53:03 10-05-15"},{"user_id_send":1,"content":"\\u00e1kjdhkajshdk","time":"11:53:10 10-05-15"},{"user_id_send":1,"content":"Tao l\\u00e0 L\\u1ef1c","time":"12:00:15 10-05-15"},{"user_id_send":2,"content":"kajshdkjahsdkja","time":"12:13:50 10-05-15"},{"user_id_send":2,"content":"\\u00e1khdkajshd","time":"12:14:38 10-05-15"},{"user_id_send":2,"content":"kshdjakskjd","time":"12:15:04 10-05-15"},{"user_id_send":1,"content":"akjsdhkajsd","time":"12:16:39 10-05-15"},{"user_id_send":2,"content":"\\u00e1kjdhaksd","time":"12:20:46 10-05-15"},{"user_id_send":2,"content":"aksjdhkjasd","time":"12:21:20 10-05-15"},{"user_id_send":2,"content":"aksjdhkjasd","time":"12:21:29 10-05-15"},{"user_id_send":2,"content":"aksjdhkjasd","time":"12:21:40 10-05-15"},{"user_id_send":2,"content":"L\\u00e0m g\\u00ec \\u0111\\u1ea5y L\\u01b0c","time":"12:21:48 10-05-15"},{"user_id_send":1,"content":"\\u1eeam, t\\u1edb v\\u1eeba \\u0111i ch\\u1ee3 c\\u1eadu \\u00e0 h\\u00ed h\\u00ed ^^","time":"12:22:03 10-05-15"},{"user_id_send":2,"content":"akjsdhkajs","time":"12:22:41 10-05-15"},{"user_id_send":1,"content":"jkshdkjahskd","time":"12:22:57 10-05-15"},{"user_id_send":1,"content":"jsjhdjaskhkjdahskjd","time":"12:23:05 10-05-15"},{"user_id_send":2,"content":"\\u1ebe, sao n\\u00f3 l\\u1ea1i nh\\u01b0 th\\u1ebf nh\\u1ec9?","time":"07:20:54 10-05-15"},{"user_id_send":2,"content":"D\\u0110M","time":"09:09:42 11-05-15"},{"user_id_send":1,"content":"EEk ","time":"09:10:03 11-05-15"},{"user_id_send":2,"content":"\\u00ea cu","time":"10:35:33 12-05-15"},{"user_id_send":1,"content":"what the fuck?","time":"10:37:04 12-05-15"},{"user_id_send":1,"content":"dsfgdfhb","time":"10:38:00 12-05-15"},{"user_id_send":2,"content":"sdghchdwj","time":"10:38:27 12-05-15"},{"user_id_send":1,"content":"hello","time":"10:39:03 12-05-15"},{"user_id_send":1,"content":"e cu","time":"10:40:19 12-05-15"},{"user_id_send":2,"content":"dfkjhksjdfkhsifj","time":"11:13:47 12-05-15"}]', '-1', '2015-05-10 03:00:53', '2015-05-12 04:13:53'),
(1, 3, '[{"user_id_send":3,"content":"ch\\u00e1t v\\u1edbi m\\u00e0y t\\u00ed nh\\u1ec9","time":"09:24:08 10-05-15"},{"user_id_send":3,"content":"ti\\u1ebfp n\\u00e0o","time":"09:24:12 10-05-15"},{"user_id_send":3,"content":"htjh","time":"09:28:46 10-05-15"},{"user_id_send":3,"content":"kjashdkjahsd","time":"09:55:52 10-05-15"},{"user_id_send":3,"content":"kkhsakdfhlsdlf","time":"11:24:04 10-05-15"},{"user_id_send":1,"content":"\\u00ea cu a \\u0111o","time":"07:46:52 11-05-15"},{"user_id_send":3,"content":"t \\u0111\\u00e2y","time":"07:54:28 11-05-15"}]', '-1', '2015-05-10 14:24:08', '2015-05-11 12:54:39'),
(1, 5, '[{"user_id_send":1,"content":"cho a l\\u00e0m quen nh\\u00e9","time":"12:09:48 12-05-15"},{"user_id_send":1,"content":"em \\u00eay","time":"12:17:05 12-05-15"},{"user_id_send":1,"content":"sdkjgfjfj","time":"11:21:51 12-05-15"},{"user_id_send":1,"content":"what the hell?","time":"03:13:08 12-05-15"}]', '1', '2015-05-11 17:09:48', '2015-05-12 08:13:08'),
(1, 6, '[{"user_id_send":6,"content":"con ma sao di the","time":"05:10:12 11-05-15"}]', '-1', '2015-05-11 10:10:12', '2015-05-11 12:52:10'),
(2, 3, '[{"user_id_send":3,"content":"Nguy\\u1ec5n V\\u0103n A ch\\u00e1t v\\u1edbi \\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i","time":"09:45:14 10-05-15"},{"user_id_send":3,"content":"skjdhajksd","time":"09:55:49 10-05-15"}]', '-1', '2015-05-10 14:45:14', '2015-05-11 12:25:37'),
(2, 5, '[{"user_id_send":2,"content":"jbsdmfbkswhfk dskufs","time":"11:21:39 12-05-15"}]', '-1', '2015-05-12 04:21:39', '2015-05-12 04:23:42'),
(4, 3, '[{"user_id_send":3,"content":"eek anh ch\\u01b0\\u01a1ng","time":"09:55:22 10-05-15"},{"user_id_send":3,"content":"\\u1ea1hdaksd","time":"09:55:25 10-05-15"},{"user_id_send":3,"content":"akjshdasd","time":"09:55:29 10-05-15"},{"user_id_send":3,"content":"ksjhdkjfasdf","time":"09:55:38 10-05-15"},{"user_id_send":3,"content":"akjshdasd","time":"09:55:45 10-05-15"},{"user_id_send":3,"content":"akjshdasd","time":"09:55:46 10-05-15"}]', '-1', '2015-05-10 14:55:22', '2015-05-11 12:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
`post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `list_like` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='chứa bài đăng lên cần lưu, sẽ lưu status dưới dạng json. cấu trúc có thể là: user_id.user_name.content_status.user_id.user_name.content_comment....';

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `user_id`, `list_like`, `content`, `created_at`, `updated_at`, `comment`) VALUES
(1, 2, NULL, 'ok sửa User thành Post', '2015-05-01 08:39:24', '2015-05-10 17:26:59', '[{"user_id":"3","user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i","content":"hehe","time":"09:09:15 10-05-15"},{"user_id":"3","user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i","content":"hehe","time":"09:09:29 10-05-15"},{"user_id":"3","user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i","content":"hehe","time":"07:25:37 10-05-15"},{"user_id":"3","user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i","content":"l\\u00e0m g\\u00ec v\\u1eady","time":"07:26:21 10-05-15"},{"user_id":"3","user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i","content":"T\\u00f9 v\\u00e3i","time":"07:32:09 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"gi\\u1edd th\\u00ec cahwcs \\u0111\\u01b0\\u1ee3c n\\u00e0y","time":"08:43:51 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"gi\\u1edd th\\u00ec cahwcs \\u0111\\u01b0\\u1ee3c n\\u00e0y","time":"08:44:12 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"h\\u00eah","time":"08:48:49 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"L\\u00ean","time":"08:59:18 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"Ph\\u00e1 t\\u01b0\\u1eddng m\\u00e0y t\\u00ed ^","time":"09:03:51 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"Update th\\u1eddi gian l\\u00ean \\u0111\\u00e2y coi n\\u00e0o","time":"12:26:59 11-05-15"}]'),
(2, 2, NULL, 'kjashdjkahskdjfhkjsdhf', '2015-05-01 08:41:04', '2015-05-10 17:26:44', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"hehe \\u0111\\u01b0\\u1ee3c r\\u1ed3i, vui qu\\u00e1","time":"08:44:19 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"t kill m\\u00e0y gi\\u1edd","time":"09:04:01 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"kjahskdjasd","time":"09:16:46 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"Update th\\u1eddi gian \\u1edf \\u0111\\u00e2y","time":"12:26:44 11-05-15"}]'),
(3, 2, NULL, 'kjashdjkahskdjfhkjsdhf', '2015-05-01 08:41:23', '2015-05-11 02:18:05', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"tuy\\u1ec7t con m\\u1eb9 n\\u00f3 v\\u1eddi r\\u1ed3i, kaka","time":"08:44:31 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"\\u0110km, vl","time":"09:04:08 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"\\u0110\\u01b0a c\\u00e1i n\\u00e0y l\\u00ean \\u0111\\u1ea7u","time":"12:27:40 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"TOP \\u0110\\u00ca EM \\u01a0I","time":"09:08:56 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"L\\u00e0m g\\u00ec \\u0111\\u1ea5y","time":"09:17:46 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"L\\u00e0m g\\u00ec \\u0111\\u1ea5y L\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5yL\\u00e0m g\\u00ec \\u0111\\u1ea5y","time":"09:18:05 11-05-15"}]'),
(4, 3, NULL, 'Đặng Văn Đại đá post ài', '2015-05-06 09:42:04', '2015-05-10 15:33:14', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"Ngon","time":"08:59:24 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"hjj","time":"09:28:51 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"kasdka","time":"09:50:04 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"kjshdakjsd","time":"09:50:09 10-05-15"},{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n A","content":"\\u00e1kdhaksd","time":"10:33:14 10-05-15"}]'),
(5, 1, NULL, 'jhgjhhkhhj', '2015-05-09 08:16:18', '2015-05-10 13:59:10', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"t th\\u1eed commnetn l\\u00ean t\\u01b0\\u1eddng c\\u1ee7a m\\u00e0y xem n\\u00e0o","time":"08:49:13 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"\\u00e1kdlklaskd","time":"08:55:20 10-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"aksjdhkajsd","time":"08:59:10 10-05-15"}]'),
(6, 1, NULL, 'jhgjhhkhhj', '2015-05-09 08:16:18', '2015-05-10 13:55:29', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"tao th\\u00edch ph\\u00e1 t\\u01b0\\u1eddng m\\u00e0y \\u0111\\u1ea5y ^^","time":"08:55:29 10-05-15"}]'),
(7, 1, NULL, 'jhgjhhkhhj', '2015-05-09 08:16:18', '2015-05-09 08:16:18', ''),
(8, 1, NULL, 'Dang Van Dai', '2015-05-09 08:16:48', '2015-05-09 08:16:48', ''),
(9, 2, NULL, 'Nào đăng thử bài  post cho chỉ số ;ên 9\r\n', '2015-05-10 17:32:59', '2015-05-10 18:20:26', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"\\u00f4 vui qu\\u00e1 x\\u00e1 l\\u00e0 vui, \\u00f4 vui qu\\u00e1 x\\u00e1 b\\u00e0 con \\u01a1i","time":"12:36:06 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"jkahskdjh","time":"01:15:30 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"\\u00e1dasda","time":"01:15:39 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"Tao th\\u1eed comment l\\u00ean trag ch\\u1ee7 xem n\\u00e0o","time":"01:19:43 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"Ngonv  v\\u1ed3n","time":"01:20:07 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"haha, ngon rooif, gi\\u1edd ae c\\u00f3 trang ch\\u00e1t nh\\u1eefng l\\u00fac m\\u1ea1ng lag r\\u1ed3i, keke","time":"01:20:26 11-05-15"}]'),
(10, 3, NULL, 'Đăng cái ni coi hắn có lên top không nào', '2015-05-10 18:05:17', '2015-05-12 03:45:24', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"Like \\u0111\\u00e9o g\\u00ec","time":"05:07:40 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I R\\u1ea4T R\\u1ea4T \\u0110\\u1eb8P TRAI","content":"jagsdahd","time":"10:45:24 12-05-15"}]'),
(11, 3, NULL, 'Đăng cái ni coi hắn có lên top không nào', '2015-05-10 18:05:18', '2015-05-12 04:00:19', '[{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"b\\u00e0i \\u0111\\u0103ng c\\u1ee7a m\\u00e0y \\u00e0 con ch\\u00f3","time":"01:19:53 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"L\\u00e0m ti\\u1ebfp c\\u00e1i n\\u1eefa r\\u1ed3i ng\\u1ee7","time":"01:19:59 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"TOP ph\\u00e1t n\\u1eefa n\\u00e0o , s\\u01b0\\u1edbng qu\\u00e1, kk","time":"01:21:12 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"kjashdkjashd","time":"09:08:47 11-05-15"},{"user_id":1,"user_name":"Mada94","content":"hello","time":"10:57:54 12-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I R\\u1ea4T R\\u1ea4T \\u0110\\u1eb8P TRAI","content":"jhagdsjagsd","time":"11:00:19 12-05-15"}]'),
(12, 3, NULL, 'Đăng cái ni coi hắn có lên top không nào', '2015-05-10 18:05:20', '2015-05-10 18:10:22', '[{"user_id":3,"user_name":"Nguy\\u1ec5n V\\u0103n Anh","content":"L\\u00ean rooi, l\\u00ean r\\u1ed3i d\\u00ea d\\u00ea","time":"01:06:17 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"\\u0110M, sao m\\u00e0y d\\u00e1m l\\u00ean t\\u1ed1p h\\u1ea3 con ch\\u00f3 :v ","time":"01:10:06 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"jsjdgajshd","time":"01:10:22 11-05-15"}]'),
(13, 2, NULL, 'Đang hứng, hay là làm nốt phần kết bạn ta???', '2015-05-10 18:22:45', '2015-05-10 18:26:11', '[{"user_id":5,"user_name":"Ho\\u00e0ng Kim Ng\\u00e2n","content":"OK","time":"01:25:50 11-05-15"},{"user_id":5,"user_name":"Ho\\u00e0ng Kim Ng\\u00e2n","content":"Nogn","time":"01:25:54 11-05-15"},{"user_id":5,"user_name":"Ho\\u00e0ng Kim Ng\\u00e2n","content":"Ch\\u01b0a  \\u0111\\u1ebfm \\u0111\\u01b0\\u1ee3c s\\u1ed1 like nh\\u1ec9","time":"01:26:11 11-05-15"}]'),
(14, 5, NULL, 'Đăng cái STT xem nào :D keke\r\n', '2015-05-10 18:27:10', '2015-05-11 10:07:30', '[{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"kyadjaskh","time":"09:08:27 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"ashdkjash","time":"09:08:32 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1eb7ng V\\u0103n \\u0110\\u1ea1i\\r\\n","content":"s\\u1ea1hdksdkajsd","time":"05:07:30 11-05-15"}]'),
(15, 2, NULL, 'VUi quá ^^ hí hí\r\n', '2015-05-11 02:09:23', '2015-05-11 02:17:12', '[{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"jakhjdshj","time":"09:10:37 11-05-15"},{"user_id":2,"user_name":"\\u0110\\u1ea0I \\u0110\\u1eb8P TRAI","content":"S\\u01b0\\u1edbn","time":"09:17:12 11-05-15"}]'),
(16, 2, NULL, 'Đăn cái xem nào', '2015-05-11 10:07:22', '2015-05-12 03:34:29', '[{"user_id":2,"user_name":"\\u0110\\u1ea0I R\\u1ea4T R\\u1ea4T \\u0110\\u1eb8P TRAI","content":"ghfghfgfg","time":"10:34:08 12-05-15"},{"user_id":1,"user_name":"Mada94","content":"Mada conment","time":"10:34:29 12-05-15"}]'),
(17, 6, NULL, '1st stt', '2015-05-11 10:09:22', '2015-05-11 10:09:22', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brithday` date DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'http://localhost/index/demo/public/images/face.jpg',
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `hobby` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `age_interested` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intent` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='bảng chứa thông tin người sử dụng, account';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `user_name`, `brithday`, `address`, `job`, `profile_picture`, `height`, `weight`, `hobby`, `description`, `age_interested`, `intent`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'duongvanluc94@gmail.com', 'duong', 'Mada94', '2015-04-13', 'Hà Nam', 'Sinh Viên năm 3', 'http://localhost/index/demo/public/images/face.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-04-26 09:35:04', '2015-04-26 09:35:04'),
(2, 'daikk115@gmail.com', '123', 'Đại Đẹp Trai', '1994-05-11', 'Hà Tĩnh', 'Kỹ Sư WEB', 'http://localhost/index/demo/public/images/face1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-04-30 17:00:00', '2015-04-30 17:00:00'),
(3, 'ABC@GMAIL.COM', '123', 'Nguyễn Văn Anh', '1994-07-19', 'Hà Tây', 'Sinh Viên', 'http://localhost/index/demo/public/images/face2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-01 09:25:42', '2015-05-01 09:25:42'),
(4, 'chuong@gmail.com', '123', 'Nguyễn Viết CHương', '2015-05-14', 'Hà Tĩnh', 'Sắp ra trường', 'http://localhost/index/demo/public/images/face3.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-01 11:13:07', '2015-05-01 11:13:07'),
(5, 'ngan@gmail.com', '123', 'Kim Ngân', '1995-01-12', 'Hà Tĩnh', 'Sinh Viên năm 2', 'http://localhost/index/demo/public/images/face4.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-01 18:19:06', '2015-05-01 18:19:06'),
(6, 'kien@gmail.com', '123', 'Nguyễn Tuấn Kiên\r\n', '2015-05-09', 'Hà Nội', 'Sinh Viên năm 2', 'http://localhost:7070/social_network/public/images/face.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-04 07:53:03', '2015-05-04 07:53:03'),
(11, 'timelord@gmail.com', 'timelord', 'time lord', NULL, '', '', 'http://localhost:7070/social_network/public/images/face.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-12 09:40:49', '2015-05-12 09:40:49'),
(26, 'quach@gmail.com', 'quach', 'Quách Tỉnh', NULL, '', '', 'http://localhost/index/demo/public/images/face.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-05-12 11:50:22', '2015-05-12 11:50:22');

-- --------------------------------------------------------

--
-- Structure for view `full_post`
--
DROP TABLE IF EXISTS `full_post`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `full_post` AS select `user`.`user_id` AS `user_id`,`user`.`user_name` AS `user_name`,`post`.`updated_at` AS `updated_at`,`post`.`content` AS `content`,`post`.`list_like` AS `list_like`,`post`.`comment` AS `comment`,`post`.`post_id` AS `post_id` from (`user` join `post`) where (`user`.`user_id` = `post`.`user_id`) order by `post`.`updated_at` desc;

-- --------------------------------------------------------

--
-- Structure for view `list_request`
--
DROP TABLE IF EXISTS `list_request`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `list_request` AS select `friend`.`user_id1` AS `user_id1`,`user`.`user_name` AS `user_name`,`friend`.`user_id2` AS `user_id2` from (`friend` join `user`) where ((`friend`.`user_id1` = `user`.`user_id`) and (`friend`.`relationship` = 0));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
 ADD PRIMARY KEY (`comment_id`), ADD UNIQUE KEY `status_id_UNIQUE` (`post_id`);

--
-- Indexes for table `comment_image`
--
ALTER TABLE `comment_image`
 ADD PRIMARY KEY (`comment_image_id`), ADD UNIQUE KEY `image_id_UNIQUE` (`image_id`), ADD KEY `fk_userid_im_idx` (`user_id`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
 ADD PRIMARY KEY (`user_id1`,`user_id2`), ADD KEY `fk_userid2_idx` (`user_id2`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
 ADD PRIMARY KEY (`image_id`), ADD KEY `fk_userid_idx` (`user_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
 ADD PRIMARY KEY (`session_id`), ADD KEY `user_id` (`user_id`,`time_login`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
 ADD PRIMARY KEY (`user_id_sent`,`user_id_recieve`), ADD KEY `fk_userid2_idx` (`user_id_recieve`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
 ADD PRIMARY KEY (`post_id`), ADD KEY `fk_userid_st_idx` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
ADD CONSTRAINT `fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`);

--
-- Constraints for table `comment_image`
--
ALTER TABLE `comment_image`
ADD CONSTRAINT `fk_imageid_cm` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_userid_im` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
ADD CONSTRAINT `fk_userid1` FOREIGN KEY (`user_id1`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_userid2` FOREIGN KEY (`user_id2`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
ADD CONSTRAINT `fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
ADD CONSTRAINT `fk_userid1_ms` FOREIGN KEY (`user_id_sent`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_userid2_ms` FOREIGN KEY (`user_id_recieve`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
ADD CONSTRAINT `fk_userid_st` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
