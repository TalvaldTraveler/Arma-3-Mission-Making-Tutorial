if (!isServer) exitWith {};

private _handler = _this select 1;
private _hound = _this select 0;
private _grp = _this select 2;
private _players = _this select 3;

[_hound, _handler, _grp, _players] spawn {
params ["_hound", "_handler", "_grp", "_players"];  

	switch (true) do
	{	
		case ("LIMITED" == speedMode _grp): {
			[_hound, "Dog_Walk"] remoteExec ["playMove", 0]; 
		};
		case ("NORMAL" == speedMode _grp): { 
			[_hound, "Dog_Run"] remoteExec ["playMove", 0]; 
		};
		case ("FULL" == speedMode _grp): {
			[_hound, "Dog_Sprint"] remoteExec ["playMove", 0];
		};
		default { 
			[_hound, "Dog_Run"] remoteExec ["playMove", 0]; 
		};
	};
	_speed = speedMode _grp;
	
	while { alive _hound } do 
	{ 
		_enemy = [_players, _hound] call BIS_fnc_nearestPosition;
		
		if ( _speed != speedMode _grp) then {
			switch (true) do
			{
				case ("LIMITED" == speedMode _grp): {
					[_hound, "Dog_Walk"] remoteExec ["playMove", 0]; 
					_speed = speedMode _grp;
				};
				case ("NORMAL" == speedMode _grp): { 
					[_hound, "Dog_Run"] remoteExec ["playMove", 0]; 
					_speed = speedMode _grp;
				};
				case ("FULL" == speedMode _grp): {
					[_hound, "Dog_Sprint"] remoteExec ["playMove", 0];
					_speed = speedMode _grp;
				};
				default { 
					[_hound, "Dog_Run"] remoteExec ["playMove", 0]; 
					_speed = speedMode _grp;
				};
			};
		};
		if (("SAFE" == behaviour leader _grp) && (_enemy distance _hound < 50) ) exitWith { 
			_hound doWatch _enemy;
			_hound doMove getPosATL _enemy;
		};
		if (("AWARE" == behaviour leader _grp) && (_enemy distance _hound < 75) ) exitWith { 
			_hound doWatch _enemy;
			_hound doMove getPosATL _enemy;
		};	
		if (("COMBAT" == behaviour leader _grp) && (_enemy distance _hound < 150) ) exitWith { 
			_hound doWatch _enemy;
			_hound doMove getPosATL _enemy;
		};
		if (_enemy distance _hound < 15) 
		then {
			_wp = _grp addWaypoint [position _enemy, 15];
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointType "SAD";
			_grp setCurrentWaypoint _wp;
			_wp2 = _grp addWaypoint [position leader _grp, 0];
			_wp2 setWaypointBehaviour "SAFE";
			_wp2 setWaypointType "SAD";
		};
		sleep 5;
	};
	_grpleader = leader _grp;
	if ( alive _hound && alive _handler) 
	then {
		[_hound, _handler, _grp, _players] call DOG_fnc_hunt;
	};
	
	if ( alive _hound && !alive _handler) 
	then {
		[_hound, _grpleader, _grp, _players] call DOG_fnc_hunt;
	};
};