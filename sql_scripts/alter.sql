-- Create / Insert TEST DATA
INSERT INTO youth (name, youth_email, birth_date, parent_email) VALUES ('Luke', 'luke@gmail.com', '1972-01-02', null);
INSERT INTO parent (name, parent_email) VALUES ('YoMama', 'yomama@gmail.com');
INSERT INTO youth (name, youth_email, birth_date, parent_email) VALUES ('Not-an-orphan', 'no-orphan@gmail.com', '1971-01-02', 'yomama@gmail.com');
INSERT INTO goalcategory (categorytype, youth_email) VALUES ('Spiritual','no-orphan@gmail.com');
INSERT INTO goalcategory (categorytype, youth_email) VALUES ('Physical','no-orphan@gmail.com');
INSERT INTO goalcategory (categorytype, youth_email) VALUES ('Intellectual','no-orphan@gmail.com');
INSERT INTO goalcategory (categorytype, youth_email) VALUES ('Social','no-orphan@gmail.com');
INSERT INTO goal (goalcontent, status, completiondate, searchable, privacy, category_id) VALUES ('Read Scriptures', 'f', null, 'f', 't', 1);
INSERT INTO goal (goalcontent, status, completiondate, searchable, privacy, category_id) VALUES ('Walk 1 mile', 'f', null, 't', 't', 2);
INSERT INTO goal (goalcontent, status, completiondate, searchable, privacy, category_id) VALUES ('Read a book', 't', '1981-04-07', 'f', 't', 3);
INSERT INTO goal (goalcontent, status, completiondate, searchable, privacy, category_id) VALUES ('Send letter to Grandma', 'f', null, 't', 't', 4);
INSERT INTO comment (date, content, parent_email, youth_email, goal_id) VALUES ('2020-04-23', 'Good goal!!', 'yomama@gmail.com', 'no-orphan@gmail.com', 3);