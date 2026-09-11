params ["_targetUnit"];

_targetUnit addAction
[
	"Rescue",
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
	nil,
	1.5,
	true,
	true,
	"",
	"_originalTarget getVariable ['TYST_isCaptive', false]",
	50,
	false,
	"",
	""
];
