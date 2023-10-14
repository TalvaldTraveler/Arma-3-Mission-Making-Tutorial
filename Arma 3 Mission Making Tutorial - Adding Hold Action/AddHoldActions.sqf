[
	plane1,
	"Plant Explosives",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"(_this distance _target < 5) && (_this getVariable ['isBomBSpecialistPA', false])",
	"_this distance _target < 5",
	{},
	{},													
	{_target setVariable ["BombPlanted", true, true];},
	{},
	[],
	10,
	0,
	true,
	false
] remoteExec ["BIS_fnc_holdActionAdd", 0, plane1];
