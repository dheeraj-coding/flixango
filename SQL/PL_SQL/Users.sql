CREATE OR REPLACE FUNCTION get_watchlist_for_user(ID users.ID%TYPE) RETURN watchlist_table PIPELINED AS
    CURSOR c IS SELECT W.WID        AS WID,
                       W.CreatorID  AS CreatorID,
                       W.Name       AS Name,
                       W.created_at AS Created_at
                FROM watchlist w,
                     watches wt
                WHERE w.WID = wt.WID
                  and wt.UserID = ID;
BEGIN
    FOR each in c
        LOOP
            PIPE ROW ( watchlist_object(each.WID, each.CreatorID, each.Name, each.Created_at) );
        end loop;
end;