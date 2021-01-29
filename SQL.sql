CREATE TABLE Parent
(
  Name INT NOT NULL,
  Parent_Email INT NOT NULL,
  PRIMARY KEY (Parent_Email)
);

CREATE TABLE Youth
(
  Name INT NOT NULL,
  Youth_Email INT NOT NULL,
  Birth_Date INT NOT NULL,
  Parent_Email INT,
  PRIMARY KEY (Youth_Email),
  FOREIGN KEY (Parent_Email) REFERENCES Parent(Parent_Email)
);

CREATE TABLE GoalCategory
(
  CategoryType INT NOT NULL,
  Category_ID INT NOT NULL,
  Youth_Email INT NOT NULL,
  PRIMARY KEY (Category_ID),
  FOREIGN KEY (Youth_Email) REFERENCES Youth(Youth_Email)
);

CREATE TABLE Goal
(
  Goal_ID INT NOT NULL,
  GoalContent INT NOT NULL,
  Status INT NOT NULL,
  CompletionDate INT,
  Searchable INT,
  Privacy INT NOT NULL,
  Category_ID INT NOT NULL,
  PRIMARY KEY (Goal_ID),
  FOREIGN KEY (Category_ID) REFERENCES GoalCategory(Category_ID)
);

CREATE TABLE Comment
(
  Comment_ID INT NOT NULL,
  Date INT NOT NULL,
  Content INT NOT NULL,
  Parent_Email INT NOT NULL,
  Youth_Email INT NOT NULL,
  Goal_ID INT NOT NULL,
  PRIMARY KEY (Comment_ID),
  FOREIGN KEY (Parent_Email) REFERENCES Parent(Parent_Email),
  FOREIGN KEY (Youth_Email) REFERENCES Youth(Youth_Email),
  FOREIGN KEY (Goal_ID) REFERENCES Goal(Goal_ID)
);