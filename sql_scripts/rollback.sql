-- Delete all data
DELETE FROM parent WHERE name = '*';
DELETE FROM comment WHERE comment_id = '*';
DELETE FROM youth WHERE name = '*';
DELETE FROM goal WHERE goal_id = '*';
DELETE FROM goalcategory WHERE goal_id = '*';