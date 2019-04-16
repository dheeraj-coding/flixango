CREATE OR REPLACE FUNCTION get_movies_for_watchlist(WID watchlist.wid%TYPE) RETURN movie_table PIPELINED AS
    CURSOR c IS SELECT M.UMID     AS UMID,
                       M.Name     AS Name,
                       M.Language AS Language,
                       M.Duration AS Duration,
                       M.Rating   AS Rating,
                       M.CCode    AS CCode
                FROM Movies M,
                     Contains C
                WHERE M.UMID = C.UMID
                  and C.WID = WID;
BEGIN
    FOR each in c
        LOOP
            PIPE ROW ( movie_object(each.UMID, each.Name, each.Language, each.Duration, each.Rating, each.CCode) );
        end loop;
end;
/