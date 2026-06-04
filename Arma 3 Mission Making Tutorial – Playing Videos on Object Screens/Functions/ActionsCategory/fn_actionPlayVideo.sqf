_screen = _this select 0;

_screen addAction
[
	"Play Video",
	{
		_target = _this select 0;
		_nearbyPlayers = allPlayers select { _x inArea [_target, 15, 15]};
		[_target] remoteExec ["TYST_fnc_playFilm", _nearbyPlayers];
		_target setVariable ["TYST_nearbyPlayers", _nearbyPlayers, true];
		_target setVariable ["TYST_activationValue", time, true];
		_savedValue = _target getVariable "TYST_activationValue";
		sleep 60;
		if (_savedValue == (_target getVariable ["TYST_activationValue", 0]))  
		then {_target setVariable ["TYST_nearbyPlayers", nil, true];};
	},
	nil,		
	1.5,		
	true,		
	true,		
	"",			
	"0 == count (_target getVariable ['TYST_nearbyPlayers', []])",		
	1
];

_screen addAction
[
	"Like and Subscribe",
	{
		_target = _this select 0;
		_nearbyPlayers = _target getVariable ["TYST_nearbyPlayers", []];
		[missionNamespace, ["TYST_StopFilm", true]] remoteExec ["setVariable", _nearbyPlayers];
		_target setVariable ["TYST_activationValue", time, true];	
		sleep 1;
		[missionNamespace, ["TYST_StopFilm", nil]] remoteExec ["setVariable", _nearbyPlayers];
		_target setVariable ["TYST_nearbyPlayers", nil, true];
	},
	nil,		
	1.5,		
	true,		
	true,		
	"",			
	"0 != count (_target getVariable ['TYST_nearbyPlayers', []])",		
	1
];