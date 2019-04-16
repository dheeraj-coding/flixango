CREATE OR REPLACE FUNCTION get_genre_for_movie(ID movies.UMID%TYPE) RETURN genre_table PIPELINED AS
    CURSOR c IS SELECT G.GID AS GID, G.Name AS Name
                FROM Genre G,
                     GENRE_TYPE GT,
                     Movies M
                WHERE M.UMID = GT.UMID
                  and G.GID = GT.GID
                  and M.UMID = ID;
BEGIN
    for each in c
        LOOP
            PIPE ROW ( genre_object(each.GID, each.Name) );
        end loop;
end;
/

CREATE OR REPLACE FUNCTION get_reviews_for_movie(ID movies.UMID%TYPE) RETURN review_table PIPELINED AS
    CURSOR c IS SELECT R.RID        AS RID,
                       R.UserID     AS UserID,
                       R.UMID       AS UMID,
                       R.Review     AS Review,
                       R.Upvote     AS Upvote,
                       R.created_at AS created_at
                FROM Reviews R,
                     Movies M
                WHERE R.UMID = M.UMID
                  and M.UMID = ID;
BEGIN
    FOR each in c
        LOOP
            PIPE ROW ( review_object(each.RID, each.UserID, each.UMID, each.Review, each.Upvote, each.created_at) );
        end loop;
end;
/

CREATE OR REPLACE FUNCTION get_cast_for_movie(MovieID movies.UMID%TYPE) RETURN cast_table PIPELINED AS
    CURSOR c IS SELECT M.mid   AS MID,
                       M.name  AS Name,
                       M.bio   AS BIO,
                       M.bdate AS bdate,
                       R.Name  AS Role
                FROM Members M,
                     Cast C,
                     Roles R
                WHERE C.mid = M.mid
                  and C.UMID = MovieID
                  and C.roleID = R.ID;
BEGIN
    FOR each in c
        LOOP
            PIPE ROW ( cast_object(each.MID, each.Name, each.BIO, each.bdate, each.Role) );
        end loop;
end;
/
