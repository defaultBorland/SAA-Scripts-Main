// Server-side only
if (!isDedicated) exitWith {diag_log "fnc_loadPlayer | Server only function"};

params ["_uids"];

private _sql = format [
"
    SELECT
        CONCAT ('""', S_PCS.uid, '""')
        , S_PCS.cnt
    FROM (
        SELECT 
            S_PP.mission mission
            , S_PP.name name
            , S_PP.uid uid
            , COUNT(uid) OVER (PARTITION BY uid) cnt
        FROM (
            SELECT
                M.id AS mission
                , P.name AS name
                , p.uid AS uid
                , SUM(TIMESTAMPDIFF(MINUTE, PC.connected, PC.disconnected)) AS PT_sum
                , (TIMESTAMPDIFF(MINUTE, M.`start`, M.`end`) - 45) AS M_time
                , RANK() OVER (PARTITION BY P.uid ORDER BY m.id DESC) AS RNK
            FROM players_connections PC
            JOIN missions M
                ON M.id = PC.mission
            JOIN players P
                ON P.uid = PC.uid
            WHERE P.uid IN (%1)
            GROUP BY P.name, M.id
        ) S_PP
        LEFT JOIN missions m
            ON S_PP.mission = m.id 
                AND m.commanders LIKE CONCAT('%2', S_PP.uid, '%2')
                AND m.zeuses NOT LIKE CONCAT('%2', S_PP.uid, '%2')
        WHERE ROUND(S_PP.PT_sum / S_PP.M_time, 2) * 100 > 40
            AND RNK > 1 AND RNK < 7
            AND m.id IS NOT NULL
        ORDER BY 2 ASC, 1 DESC
    ) S_PCS
    GROUP BY S_PCS.uid, S_PCS.cnt
    ;
", _uids apply {"'" + _x + "'"} joinString ", ", "%"];

private _return = "Extdb3" callExtension format ["0:SQL:%1", _sql];
if (true) exitWith { [_return] call Shadec_db_server_fnc_processExtensionReturn };