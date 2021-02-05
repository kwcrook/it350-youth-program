-- Create Views
CREATE VIEW goalview AS SELECT gc.youth_email, gc.categorytype, g.goalcontent, g.status, g.completiondate FROM goalcategory as gc LEFT JOIN goal AS g ON gc.category_id = g.category_id;
CREATE VIEW publicgoalview AS SELECT gc.youth_email, gc.categorytype, g.goalcontent, g.status, g.completiondate FROM goalcategory as gc LEFT JOIN goal AS g ON gc.category_id = g.category_id WHERE g.searchable = 't';
CREATE VIEW parentgoalview AS SELECT gc.youth_email, gc.categorytype, g.goalcontent, g.status, g.completiondate FROM goalcategory as gc LEFT JOIN goal AS g ON gc.category_id = g.category_id WHERE g.privacy = 'f';
CREATE VIEW commentview AS SELECT c.date, c.content, p.name AS parent_name, y.name AS youth_name FROM comment AS c LEFT JOIN youth AS y ON c.youth_email = y.youth_email LEFT JOIN parent AS p ON c.parent_email = p.parent_email;

-- Complete View Creation