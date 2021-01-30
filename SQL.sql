CREATE TABLE Parent
(
  Name VARCHAR NOT NULL,
  Parent_Email VARCHAR NOT NULL,
  PRIMARY KEY (Parent_Email)
);

CREATE TABLE Youth
(
  Name VARCHAR NOT NULL,
  Youth_Email VARCHAR NOT NULL,
  Birth_Date DATE NOT NULL,
  Parent_Email VARCHAR,
  PRIMARY KEY (Youth_Email),
  FOREIGN KEY (Parent_Email) REFERENCES Parent(Parent_Email)
);

CREATE TABLE GoalCategory
(
  CategoryType VARCHAR NOT NULL,
  Category_ID SERIAL NOT NULL,
  Youth_Email VARCHAR NOT NULL,
  PRIMARY KEY (Category_ID),
  FOREIGN KEY (Youth_Email) REFERENCES Youth(Youth_Email)
);

CREATE TABLE Goal
(
  Goal_ID SERIAL NOT NULL,
  GoalContent VARCHAR NOT NULL,
  Status BOOLEAN NOT NULL,
  CompletionDate DATE,
  Searchable BOOLEAN,
  Privacy BOOLEAN NOT NULL,
  Category_ID INT NOT NULL,
  PRIMARY KEY (Goal_ID),
  FOREIGN KEY (Category_ID) REFERENCES GoalCategory(Category_ID)
);

CREATE TABLE Comment
(
  Comment_ID SERIAL NOT NULL,
  Date DATE NOT NULL,
  Content VARCHAR NOT NULL,
  Parent_Email VARCHAR NOT NULL,
  Youth_Email VARCHAR NOT NULL,
  Goal_ID INT NOT NULL,
  PRIMARY KEY (Comment_ID),
  FOREIGN KEY (Parent_Email) REFERENCES Parent(Parent_Email),
  FOREIGN KEY (Youth_Email) REFERENCES Youth(Youth_Email),
  FOREIGN KEY (Goal_ID) REFERENCES Goal(Goal_ID)
);