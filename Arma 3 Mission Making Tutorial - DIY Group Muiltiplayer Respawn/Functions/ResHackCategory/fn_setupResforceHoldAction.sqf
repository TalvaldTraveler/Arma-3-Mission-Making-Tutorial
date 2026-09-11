params ["_targetUnit"];

[
	_targetUnit,
	"Rescue",
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa", 
	"a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
	"(_this distance _target < 3) && (_target getVariable ['TYST_isCaptive', false])", 
	"(_caller distance _target < 3) && (_target getVariable ['TYST_isCaptive', false])",
	{},
	{},
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target, "AmovPercMstpSlowWrflDnon_Salute"] remoteExec ["playMoveNow",_target];
		[_target, "AmovPercMstpSlowWrflDnon_SaluteOut"] remoteExec ["playMove",_target];
		_target setCaptive 0;
		_target setVariable ["TYST_isCaptive", false, true];
		[_target] join _caller;
		_deadplayers = [];
		{
			if (isPlayer _x && !(alive _x)) then
			{
				_deadplayers pushBack _x;
			};
		} forEach units _caller;
		_deadplayer = _deadplayers select 0;
		[5] remoteExec ["setPlayerRespawnTime", _deadplayer];
	},
	{},
	[], 
	10, 
	1.5, 
	true, 
	false
] call BIS_fnc_holdActionAdd;
