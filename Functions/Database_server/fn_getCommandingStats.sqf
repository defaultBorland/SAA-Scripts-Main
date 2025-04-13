// Server-side only
if (!isDedicated) exitWith {diag_log format["%1 | Server only function", __FILE_NAME__]; false};

params ["_uids", "_searchDepth"];

private _sql = format [
"
    SELECT 
        CONCAT ('""', s.uid_player, '""') com_uid
        , SUM(if(s.role = 'C', 1, 0)) com_cnt
    FROM (
        SELECT
            pmp.*
            , pmpr.code role
            , ROW_NUMBER() OVER (PARTITION BY uid_player ORDER BY uid_mission DESC) row_cnt
        FROM players_mission_participation pmp
        INNER JOIN players_mission_participation_roles pmpr
            ON pmp.id_role = pmpr.id
        WHERE uid_player IN (%1)
            AND pmpr.code <> 'Z'
    ) s
    WHERE s.row_cnt < %2
    GROUP BY uid_player
    ;
", _uids apply {"'" + _x + "'"} joinString ", ", _searchDepth + 1];

private _return = "Extdb3" callExtension format ["0:SQL:%1", _sql];
if (true) exitWith { [_return] call Shadec_db_server_fnc_processExtensionReturn };