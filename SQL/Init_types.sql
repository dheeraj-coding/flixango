CREATE OR REPLACE TYPE genre_object as OBJECT
(
    GID  INTEGER,
    Name VARCHAR(10)
)
/

CREATE OR REPLACE TYPE genre_table AS TABLE OF genre_object;
/

CREATE OR REPLACE TYPE review_object as OBJECT
(
    RID        INTEGER,
    UserID     INTEGER,
    UMID       INTEGER,
    Review     VARCHAR(1000),
    Upvote     NUMBER,
    created_at TIMESTAMP
);
/

CREATE OR REPLACE TYPE review_table AS TABLE OF review_object;
/