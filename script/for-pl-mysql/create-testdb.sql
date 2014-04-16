-- 動作確認用テストテーブル作成スクリプト
CREATE DATABASE training_db CHARACTER SET utf8;
USE training_db;
CREATE TABLE `messages` (
  `id` int PRIMARY KEY, 
  `content` TEXT
);
INSERT INTO `messages`(`id`, `content`) 
  VALUES(1, 'おはよう！'), 
  VALUES(2, 'こんにちは！'), 
  VALUES(3, 'こんばんは！');

