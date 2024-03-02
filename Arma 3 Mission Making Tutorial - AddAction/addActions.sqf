[
	cage_door,
	[
		"Unlock Door",
		{
			params ["_target", "_caller", "_actionId"];
			_items = itemsWithMagazines _caller;
			if ("Keys" in _items) 
			then {
				_target setVariable["bis_disabled_Door_1",0,true];
				"You unlocked the door." remoteExec ["hintSilent", _caller];
			};
		},
		[nil],
		12,
		true,
		true,
		"",
		"((_target getVariable 'bis_disabled_Door_1')!=0)",
		2,
		false,
		"door_1",
		""
	]
] remoteExec ["addAction", 0, cage_door];

[
	cage_door,
	[
		"Lock Door",
		{
			params ["_target", "_caller", "_actionId"];
			_items = itemsWithMagazines _caller;
			if ("Keys" in _items) 
			then {
				_target setVariable["bis_disabled_Door_1",1,true];
				"You locked the door." remoteExec ["hintSilent", _caller];
			};
		},
		[nil],
		6,
		true,
		true,
		"",
		"((_target getVariable 'bis_disabled_Door_1')!=1)",
		2,
		false,
		"door_1",
		""
	]
] remoteExec ["addAction", 0, cage_door];
