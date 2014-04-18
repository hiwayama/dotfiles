-- 動作確認用テストテーブル作成スクリプト
CREATE DATABASE IF NOT EXISTS training_db CHARACTER SET utf8;
USE training_db;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int PRIMARY KEY, 
  `content` TEXT
);
INSERT INTO `messages` (`id`, `content`) VALUES
(1, 'おはよう！'), 
(2, 'こんにちは！'), 
(3, 'こんばんは！');

