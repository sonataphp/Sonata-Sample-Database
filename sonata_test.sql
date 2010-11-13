-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 13, 2010 at 11:23 PM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sonata_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE IF NOT EXISTS `blog_categories` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `description`, `default`) VALUES
(1, 'Uncategorized', 'uncategorized', '', 1),
(13, 'Doejo', 'doejo', '', 0),
(14, 'Code', 'code', '', 0),
(15, 'Content Management System', 'content-management-system', '', 0),
(16, 'Design', 'design', '', 0),
(17, 'Development', 'development', '', 0),
(18, 'E-Commerce', 'e-commerce', '', 0),
(19, 'iPhone/iPad', 'iphone-ipad', '', 0),
(20, 'Marketing', 'marketing', '', 0),
(21, 'PR', 'pr', '', 0),
(22, 'Search Engine Optimization', 'search-engine-optimization', '', 0),
(23, 'Social Media', 'social-media', '', 0),
(24, 'UI', 'ui', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories_rel`
--

CREATE TABLE IF NOT EXISTS `blog_categories_rel` (
  `post_id` mediumint(8) unsigned NOT NULL,
  `category_id` mediumint(8) unsigned NOT NULL,
  KEY `post_id` (`post_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_categories_rel`
--

INSERT INTO `blog_categories_rel` (`post_id`, `category_id`) VALUES
(32, 13),
(32, 14),
(32, 15),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE IF NOT EXISTS `blog_comments` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_approved` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_id` mediumint(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blog_comments`
--


-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE IF NOT EXISTS `blog_posts` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_count` mediumint(9) NOT NULL DEFAULT '0',
  `post_meta_description` text NOT NULL,
  `post_meta_keywords` text NOT NULL,
  `post_meta_title` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_status`,`post_date`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blog_posts`
--


-- --------------------------------------------------------

--
-- Table structure for table `blog_posts_tags`
--

CREATE TABLE IF NOT EXISTS `blog_posts_tags` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` mediumint(9) unsigned NOT NULL,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id_2` (`post_id`,`tag`),
  KEY `tag` (`tag`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blog_posts_tags`
--


-- --------------------------------------------------------

--
-- Table structure for table `content_pages`
--

CREATE TABLE IF NOT EXISTS `content_pages` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `page_author` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `page_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `page_content` longtext NOT NULL,
  `page_title` text NOT NULL,
  `page_status` varchar(20) NOT NULL DEFAULT 'publish',
  `page_name` varchar(200) NOT NULL,
  `page_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `page_meta_description` text NOT NULL,
  `page_meta_keywords` text NOT NULL,
  `page_meta_title` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_name` (`page_name`),
  KEY `type_status_date` (`page_status`,`page_date`,`id`),
  KEY `page_name` (`page_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `content_pages`
--


-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `file_path` varchar(100) CHARACTER SET latin1 NOT NULL,
  `file_type` varchar(30) CHARACTER SET latin1 NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `files`
--


-- --------------------------------------------------------

--
-- Table structure for table `gallery_albums`
--

CREATE TABLE IF NOT EXISTS `gallery_albums` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `user` mediumint(9) unsigned NOT NULL,
  `album_cover_id` mediumint(9) unsigned NOT NULL,
  `album_name` varchar(255) NOT NULL,
  `album_description` text NOT NULL,
  `album_date` datetime NOT NULL,
  `album_date_created` datetime NOT NULL,
  `album_date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gallery_albums`
--


-- --------------------------------------------------------

--
-- Table structure for table `gallery_photos`
--

CREATE TABLE IF NOT EXISTS `gallery_photos` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` mediumint(9) unsigned NOT NULL,
  `user` mediumint(9) unsigned NOT NULL,
  `photo_description` text NOT NULL,
  `photo_date` date NOT NULL,
  `photo_thumbnail` varchar(255) NOT NULL,
  `photo_link` varchar(255) NOT NULL,
  `photo_date_created` datetime NOT NULL,
  `photo_date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `uid` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gallery_photos`
--


-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `hash` char(32) NOT NULL,
  UNIQUE KEY `hash` (`hash`),
  UNIQUE KEY `user_id` (`user_id`,`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`user_id`, `hash`) VALUES
(1, 'b1faa446524e89c1d11d9a51e02ebeba'),
(2, '537d51f1fec4af8f03df0334f5946b46'),
(2, 'ccf0a1f70f94a1fa9c7037bc6805d894'),
(2, 'e9e55eeec7a9ed2c7e167b744ba1776b'),
(28, '7533ef68814ae7ca40aa84ead3e10ca8');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(100) NOT NULL,
  `option_value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `option_name`, `option_value`) VALUES
(1, 'site_name', '1'),
(2, 'mask', '2'),
(3, 'email_noreply', '3'),
(4, 'meta_description', '4'),
(5, 'meta_keywords', '5');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_list`
--

CREATE TABLE IF NOT EXISTS `subscribers_list` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `date_subscribed` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `subscribers_list`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(120) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT 'Unique Email',
  `activated` tinyint(1) unsigned NOT NULL,
  `date_registered` datetime NOT NULL,
  `date_accessed` datetime NOT NULL,
  `logincount` mediumint(8) unsigned NOT NULL,
  `failedlogincount` mediumint(8) unsigned NOT NULL,
  `role` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone` varchar(8) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '-05:00,1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `password` (`password`,`email`),
  KEY `authorize_id` (`username`),
  KEY `uid` (`id`,`date_registered`),
  KEY `role` (`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activated`, `date_registered`, `date_accessed`, `logincount`, `failedlogincount`, `role`, `timezone`) VALUES
(1, 'administrator', 'c1ce59f11957bcd850c590ccdff3eb1a', 'romefimov@gmail.com', 1, '0000-00-00 00:00:00', '2010-11-13 17:17:39', 38, 10, 1, '-05:00,1'),
(2, 'demouser', 'c1ce59f11957bcd850c590ccdff3eb1a', 'demouser@gmail.com', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59, 16, 1, '-05:00,1');
