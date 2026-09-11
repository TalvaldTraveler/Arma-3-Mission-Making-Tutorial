params ["_oldUnit"];
_group = [];
{
if (!isPlayer _x) then
{
_group pushBack _x;
};
} forEach units group player;
if (({ alive _x } count _group) < 1) then
{
setPlayerRespawnTime 7200;
};