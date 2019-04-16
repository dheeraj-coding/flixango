CREATE OR REPLACE TYPE genre_object as OBJECT
(
    GID  INTEGER,
    Name VARCHAR(10)
);
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

CREATE OR REPLACE TYPE cast_object as OBJECT
(
    mid   INTEGER,
    name  VARCHAR(20),
    bio   VARCHAR(500),
    bdate DATE,
    role  VARCHAR(20)
);
/

CREATE OR REPLACE TYPE cast_table AS TABLE OF cast_object;
/

CREATE OR REPLACE TYPE movie_object AS OBJECT
(
    UMID     INTEGER,
    Name     VARCHAR(50),
    Language VARCHAR(10),
    Duration VARCHAR(10),
    Rating   DECIMAL(3, 1),
    CCode    NUMBER
);
/

CREATE OR REPLACE TYPE movie_table AS TABLE OF movie_object;
/

CREATE OR REPLACE TYPE watchlist_object AS OBJECT
(
    WID        INTEGER,
    CreatorID  INTEGER,
    Name       VARCHAR(10),
    Created_at TIMESTAMP
);

CREATE OR REPLACE TYPE watchlist_table AS TABLE OF watchlist_object;