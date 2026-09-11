params ["_newUnit", "_oldUnit"];
_group = [];
{
if (!isPlayer _x) then
{
_group pushBack _x;
};
} forEach units group player;
if (({ alive _x } count _group) >= 1) then
{
_npc = selectRandom _group;
_newUnit setUnitLoadout getUnitLoadout _npc;
_respawnPos = getPosASL _npc;
_deletePos = getPosASL _newUnit;
_npc setPosASL _deletePos;
_newUnit setPosASL _respawnPos;
[_newUnit, _oldUnit] call BIS_fnc_respawnGroup;
_medic = _npc getUnitTrait "Medic";
player setUnitTrait ["Medic", _medic];
_engineer = _npc getUnitTrait "Engineer";
player setUnitTrait ["Engineer", _engineer];
_explosiveSpecialist = _npc getUnitTrait "ExplosiveSpecialist";
player setUnitTrait ["ExplosiveSpecialist", _explosiveSpecialist];
_uavHacker = _npc getUnitTrait "UavHacker";
player setUnitTrait ["UavHacker", _uavHacker];
_camouflageCoef = _npc getUnitTrait "CamouflageCoef";
player setUnitTrait ["CamouflageCoef", _camouflageCoef];
_audibleCoef = _npc getUnitTrait "AudibleCoef";
player setUnitTrait ["AudibleCoef", _audibleCoef];
_loadCoef = _npc getUnitTrait "LoadCoef";
player setUnitTrait ["LoadCoef", _loadCoef];
deleteVehicle _npc;
};