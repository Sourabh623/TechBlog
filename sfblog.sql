-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2021 at 07:24 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sfblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `userType` varchar(100) DEFAULT 'admin',
  `pic` varchar(100) NOT NULL DEFAULT 'default.png',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `userType`, `pic`, `rdate`) VALUES
('shivam', 'shivam@123', 'admin', 'p.png', '2020-12-18 10:04:12'),
('sourabh', 's123', 'admin', 't.jpg', '2020-12-18 10:56:31'),
('swati', 'swati@123', 'admin', '', '2020-12-18 11:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(12) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `name`, `description`) VALUES
(1, 'Java', 'Java is a programing language'),
(2, 'Python', 'Python is a programing language'),
(3, 'HTML', 'Hypertext Markup Language is the standard markup language for documents designed to be displayed in a web browser.'),
(4, 'Web Technology', 'Web Technology is the web development or website technics.'),
(5, 'JavaScipt', 'JavaScript, often abbreviated as JS, is a programming language that conforms to the ECMAScript specification. JavaScript is high-level, often just-in-time compiled, and multi-paradigm. It has curly-br'),
(12, 'Bootstrap', 'This category contain bootstrap.'),
(13, 'PHP', 'Php is programing language');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(12) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `number` int(15) DEFAULT NULL,
  `message` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `surname`, `email`, `number`, `message`) VALUES
(1, 'Sourabh', 'Fulmali', 'sourabhfulmali623@gmail.com', 89622, 'abc'),
(2, 'Sourabh', 'Fulmali', 'sourabhfulmali623@gmail.com', 5, 'z'),
(3, 'Sourabh', 'Fulmali', 'sourabhfulmali623@gmail.com', 798888888, 'g'),
(4, 'Sourabh', 'Fulmali', 'abhi@gmail.com', 4455445, 'aq');

-- --------------------------------------------------------

--
-- Table structure for table `liked`
--

CREATE TABLE `liked` (
  `lid` int(20) NOT NULL,
  `pid` int(20) NOT NULL,
  `uid` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`lid`, `pid`, `uid`) VALUES
(71, 11, 25),
(72, 11, 25),
(73, 11, 25),
(74, 29, 1),
(75, 29, 1),
(76, 29, 1),
(77, 29, 1),
(78, 29, 1),
(79, 29, 1),
(80, 29, 1),
(81, 29, 1),
(82, 18, 1),
(83, 10, 1),
(84, 10, 1),
(85, 10, 1),
(86, 10, 1),
(87, 9, 1),
(88, 8, 1),
(89, 1, 1),
(90, 18, 1),
(91, 12, 1),
(92, 29, 1),
(93, 18, 1),
(94, 18, 1),
(95, 29, 1),
(96, 29, 1),
(97, 18, 1),
(98, 12, 1),
(99, 12, 1),
(100, 29, 1),
(101, 29, 1),
(102, 18, 1),
(103, 18, 1),
(104, 11, 1),
(105, 29, 1),
(106, 29, 1),
(107, 18, 1),
(108, 29, 1),
(109, 18, 1),
(110, 12, 1),
(111, 11, 1),
(112, 11, 1),
(113, 12, 1),
(114, 9, 1),
(115, 8, 1),
(116, 18, 1),
(117, 29, 1),
(118, 29, 1),
(119, 29, 1),
(120, 29, 1),
(122, 9, 29),
(123, 30, 1),
(124, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `pid` int(12) NOT NULL,
  `pTitle` varchar(150) DEFAULT NULL,
  `pContent` longtext NOT NULL,
  `pCode` longtext NOT NULL,
  `pPic` varchar(100) NOT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `catId` int(12) NOT NULL,
  `userid` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`pid`, `pTitle`, `pContent`, `pCode`, `pPic`, `pDate`, `catId`, `userid`) VALUES
(1, 'What is html?', 'Hypertext Markup Language is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScript.', '<html>\r\n<body>Hello World\r\n</body>\r\n</html>\r\n', 'What is html.png', '2020-11-27 11:15:51', 3, 1),
(8, 'What is Python?', 'Python is a high-level, general-purpose and a very popular programming language. Python programming language (latest Python 3) is being used in web development, Machine Learning applications, along with all cutting edge technology in Software Industry. ', 'Print(\"Hello World!\")\r\nPrint(\"Goodbye, World!\")', 'Python-Programming-Language.png', '2020-11-30 06:24:37', 2, 4),
(9, 'What is java?', 'Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.', 'class Simple{  \r\n    public static void main(String args[]){  \r\n     System.out.println(\"Hello Java\");  \r\n    }  \r\n}  ', 'what-is-java-000.png', '2020-11-30 06:35:03', 1, 4),
(10, 'What is web technology?', 'Web technology refers to the means by which computers communicate with each other using markup languages and multimedia packages.', 'no code', 'Web-Technology.png', '2020-11-30 06:52:19', 4, 4),
(11, 'What is java?', 'Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.\r\n\r\nclass Simple{  \r\n    public static void main(String args[]){  \r\n     System.out.println(\"Hello Java\");  \r\n    }  \r\n}  ', '', 'what-is-python-programming.jpg', '2020-12-02 07:34:50', 1, 1),
(12, 'Table tag', 'Table tag is the ', 'dfefrw', 'How-to-install-mysql.jpg', '2020-12-07 07:26:03', 3, 1),
(18, 'What is java?', 'love', 'no', 'Database-Management-System.jpg', '2020-12-10 17:23:00', 1, 1),
(29, 'Data type', 'Data Types in Java\r\nData types specify the different sizes and values that can be stored in the variable. There are two types of data types in Java:\r\n\r\nPrimitive data types: The primitive data types include boolean, char, byte, short, int, long, float and double.\r\nNon-primitive data types: The non-primitive data types include Classes, Interfaces, and Arrays.\r\nJava Primitive Data Types\r\nIn Java language, primitive data types are the building blocks of data manipulation. These are the most basic data types available in Java language.', 'int a=10;', 'MySQL-Datatypes.png', '2020-12-11 06:32:27', 1, 25),
(30, 'Heading tag', 'this heading tag h1 to h6', '<h1>This is heading tag</h1>\r\n<h2>This is heading tag</h2>\r\n<h3>This is heading tag</h3>\r\n<h1>This is heading tag</h1>\r\n<h2>This is heading tag</h2>\r\n<h3>This is heading tag</h3>', 'Heading-tags-on-website-400x240.png', '2021-01-03 11:39:57', 3, 28);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(20) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `about` varchar(1000) NOT NULL DEFAULT '"hey! I am using Tech Blog"',
  `rdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(100) DEFAULT 'default.png',
  `userType` varchar(100) DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `gender`, `about`, `rdate`, `profile`, `userType`) VALUES
(1, 'sourabh fulmali', 'sourabhfulmali623@gmail.com', 's123', 'male', 'i am web developer', '2020-11-21 05:45:39', 'e.png', 'normal'),
(2, 'riya', 'riya@gmail.com', 'riya123', 'female', '', '2020-11-21 05:47:57', 'default.png', 'normal'),
(3, 'peter', 'peter@gmail.com', 'peter123', 'male', '', '2020-11-21 05:50:17', 'default.png', 'normal'),
(4, 'Abhishekh Dubey', 'abhi@gmail.com', 'abhi123', 'male', 'i am python programmer', '2020-11-21 05:54:04', 'j.png', 'normal'),
(5, 'rohit nariya', 'rohit@gmail.com', 'rohit123', 'male', '', '2020-11-21 05:55:49', 'default.png', 'normal'),
(6, 'admin', 'admin@gmail.com', 'admin121', 'male', '', '2020-11-21 06:02:44', 'default.png', 'normal'),
(7, 'Ajay', 'ajay@gmail.com', 'ajay123', 'male', 'yes, I am programmer', '2020-11-21 06:49:00', 'default.png', 'normal'),
(13, 'surbhi', 'surbhi@gmail.com', 's12345', 'female', 'I am designer', '2020-11-21 09:05:27', 'default.png', 'normal'),
(14, 'ritik', 'ritik@gmail.com', 'ritik1234', 'male', 'yes i am cool', '2020-11-21 09:09:49', 'default.png', 'normal'),
(15, 'Ramiz Raja khan', 'ramiz@gmail.com', 'ramiz123', 'male', 'i am pro dj', '2020-11-21 09:22:27', 'default.png', 'normal'),
(16, 'Pratik Shrimali', 'pratik@gmail.com', 'pratik@123', 'male', 'I am pro shopkeeper', '2020-11-21 09:45:25', 'default.png', 'normal'),
(18, 'Pragya', 'praygya@gmail.com', 'p123', 'female', 'i am team leader', '2020-11-21 11:56:06', 'default.png', 'normal'),
(19, 'Vijay', 'vijay@gmail.com', 'v123', 'male', 'vijay', '2020-11-23 05:24:42', 'default.png', 'normal'),
(20, 'Test', 'test@gmail.com', 't123', 'male', 'testing profile', '2020-11-24 13:16:03', 'default.png', 'normal'),
(21, 'Gopal', 'g@gmail.com', 'g123', 'male', '', '2020-11-24 13:46:25', 'default.png', 'normal'),
(22, 'user', 'user@gmail.com', 'u123', 'male', '', '2020-11-24 13:52:25', 'default.png', 'normal'),
(23, 'sachin', 'sachin@gmail.com', 'sachin123', 'male', 'i am developer', '2020-11-25 15:34:47', 'default.png', 'normal'),
(24, 'shivam', 'shivam@gmail.com', 'Shivam@2512', 'male', '', '2020-11-26 10:43:05', 'e.png', 'normal'),
(25, 'priya bakore', 'priyabakore99@gmail.com', 'p1234', 'female', 'programmer', '2020-12-11 06:26:37', 'j.png', 'normal'),
(26, 'swati', 'swati@gmail.com', 's1234', 'female', 'I am pro web designer', '2020-12-15 14:53:13', 'default.png', 'normal'),
(27, 'Rahul', 'rahul@gmail.com', 'rahul123', 'male', 'i am eng.', '2020-12-15 15:44:05', 'default.png', 'normal'),
(28, 'pragati bakore', 'pragatibakore2001@gmail.com', '1234', 'female', 'i\'m designer', '2021-01-03 11:14:23', 'dancing-cute-girl-with-music-multicolor-ps-aakriti-original.jpeg', 'normal'),
(29, 'navin', 'navipatel1205@gmail.com', 'navin17', 'male', 'hsiohdohyodqo', '2021-01-04 10:47:08', 'f.jpg', 'normal'),
(31, 'NAVIN', 'navi1205@gmail.com', 'NAVIN17@@', 'male', 'dghq', '2021-01-04 10:47:55', 'default.png', 'normal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liked`
--
ALTER TABLE `liked`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `likes_ibfk_2` (`uid`),
  ADD KEY `liked_ibfk_1` (`pid`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `test` (`catId`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `liked`
--
ALTER TABLE `liked`
  MODIFY `lid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `pid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
