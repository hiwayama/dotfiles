-- vim: filetype=mysql :

-- show table size list
-- http://d.hatena.ne.jp/sho-yamasaki/20120405/1333640589
DROP PROCEDURE IF EXISTS show_table_size;
delimiter //
CREATE PROCEDURE show_table_size()
begin
SELECT table_name,  engine, table_rows as tbl_rows,
  avg_row_length as avg_row_len,   
  floor((data_length+index_length)/1024/1024) as allMB,   #総容量
  floor((data_length)/1024/1024) as data_MB,   #データ容量
  floor((index_length)/1024/1024) as index_MB   #インデックス容量
  FROM information_schema.tables 
  WHERE table_schema=DATABASE() 
  ORDER BY ( data_length+index_length ) DESC; 
end;
//
delimiter ;
