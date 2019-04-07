CREATE TABLE movies
(
    UMID     INTEGER NOT NULL,
    Name     VARCHAR(50),
    Language VARCHAR(10),
    Duration VARCHAR(10),
    Rating   DECIMAL(3, 1),
    CCode    NUMBER,
    CONSTRAINT PK_Movie PRIMARY KEY (UMID)
);
CREATE SEQUENCE movies_sequence;

CREATE OR REPLACE TRIGGER movies_on_insert
    BEFORE INSERT
    ON movies
    FOR EACH ROW
BEGIN
    SELECT movies_sequence.nextval INTO :new.UMID
    FROM DUAL;
end;
/
CREATE TABLE users
(
    ID       INTEGER NOT NULL,
    Name     VARCHAR(100),
    Email    VARCHAR(100),
    Phone    INTEGER,
    Password VARCHAR(100),
    CONSTRAINT PK_Users PRIMARY KEY (ID)
);

CREATE SEQUENCE users_sequence;

CREATE OR REPLACE TRIGGER user_on_insert
    BEFORE INSERT
    ON users
    FOR EACH ROW
BEGIN
    SELECT users_sequence.nextval INTO :new.ID
    FROM DUAL;
end;
/

CREATE TABLE reviews
(
    RID        INTEGER NOT NULL,
    UserID     NUMBER,
    UMID       NUMBER,
    Review     VARCHAR(1000),
    Upvote     NUMBER,
    created_at TIMESTAMP,
    CONSTRAINT PK_Reviews PRIMARY KEY (RID, UserID, UMID),
    CONSTRAINT FK_Reviewer FOREIGN KEY (UserID) REFERENCES users (ID)
);

CREATE SEQUENCE reviews_sequence;

CREATE OR REPLACE TRIGGER reviews_on_insert
    BEFORE INSERT
    ON reviews
    FOR EACH ROW
BEGIN
    SELECT reviews_sequence.nextval,
           CURRENT_TIMESTAMP
           INTO :new.RID,:new.created_at
    FROM DUAL;
end;
/

CREATE TABLE watchlist
(
    WID        INTEGER NOT NULL,
    CreatorID  NUMBER,
    Name       VARCHAR(10),
    Created_at TIMESTAMP,
    CONSTRAINT PK_watchlist PRIMARY KEY (WID),
    CONSTRAINT FK_ListUser FOREIGN KEY (CreatorID) REFERENCES users (ID)
);

CREATE SEQUENCE watchlist_sequence;

CREATE OR REPLACE TRIGGER watchlist_on_insert
    BEFORE INSERT
    ON watchlist
    FOR EACH ROW
BEGIN
    SELECT watchlist_sequence.nextval,
           CURRENT_TIMESTAMP
           INTO :new.WID, :new.Created_at
    FROM DUAL;
end;
/

CREATE TABLE watches
(
    WID    NUMBER,
    UserID NUMBER,
    CONSTRAINT FK_WatchList FOREIGN KEY (WID) REFERENCES watchlist (WID),
    CONSTRAINT FK_WatchUser FOREIGN KEY (WID) REFERENCES users (ID),
    CONSTRAINT PK_watches PRIMARY KEY (WID, UserID)
);

CREATE TABLE contains
(
    UMID NUMBER,
    WID  NUMBER,
    CONSTRAINT PK_contains PRIMARY KEY (UMID, WID),
    CONSTRAINT FK_ContWatch FOREIGN KEY (WID) REFERENCES watchlist (WID),
    CONSTRAINT FK_ContMovie FOREIGN KEY (UMID) REFERENCES movies (UMID)
);

CREATE TABLE genre
(
    GID  INTEGER,
    Name VARCHAR(10),
    CONSTRAINT PK_Genre PRIMARY KEY (GID)
);

CREATE SEQUENCE genre_sequence;

CREATE OR REPLACE TRIGGER genre_on_insert
    BEFORE INSERT
    ON genre
    FOR EACH ROW
BEGIN
    SELECT genre_sequence.nextval INTO :new.GID
    FROM DUAL;
end;
/

CREATE TABLE genre_type
(
    GID  NUMBER,
    UMID NUMBER,
    CONSTRAINT PK_GenType PRIMARY KEY (GID, UMID),
    CONSTRAINT FK_TypeGen FOREIGN KEY (GID) REFERENCES genre (GID),
    CONSTRAINT FK_TypeMovie FOREIGN KEY (UMID) REFERENCES movies (UMID)
);

CREATE TABLE members
(
    mid   INTEGER,
    name  VARCHAR(20),
    bio   VARCHAR(500),
    bdate DATE,
    CONSTRAINT PK_Members PRIMARY KEY (mid)
);

CREATE SEQUENCE members_sequence;

CREATE OR REPLACE TRIGGER members_on_insert
    BEFORE INSERT
    ON members
    FOR EACH ROW
BEGIN
    SELECT members_sequence.nextval INTO :new.mid
    FROM DUAL;
end;
/

CREATE TABLE roles
(
    ID   INTEGER,
    name VARCHAR(20),
    CONSTRAINT PK_roles PRIMARY KEY (ID)
);

CREATE SEQUENCE roles_sequence;

CREATE OR REPLACE TRIGGER roles_on_insert
    BEFORE INSERT
    ON roles
    FOR EACH ROW
BEGIN
    SELECT roles_sequence.nextval INTO :new.ID
    FROM DUAL;
end;
/

CREATE TABLE cast
(
    UMID   NUMBER,
    mid    NUMBER,
    roleID NUMBER,
    CONSTRAINT PK_cast PRIMARY KEY (UMID, mid, roleID),
    CONSTRAINT FK_CastMovie FOREIGN KEY (UMID) REFERENCES movies (UMID),
    CONSTRAINT FK_CastMember FOREIGN KEY (mid) REFERENCES members (mid),
    CONSTRAINT FK_CastRole FOREIGN KEY (roleID) REFERENCES members (mid)
);

CREATE TABLE country
(
    CCode INTEGER,
    Name  VARCHAR(20),
    CONSTRAINT PK_Country PRIMARY KEY (CCode)
);

CREATE SEQUENCE country_sequence;

CREATE OR REPLACE TRIGGER country_on_insert
    BEFORE INSERT
    ON country
    FOR EACH ROW
BEGIN
    SELECT country_sequence.nextval INTO :new.CCode
    FROM DUAL;
end;
/