_video = "Video\VideoFile.ogv";
_suppressedEH = player addEventHandler ["Suppressed", {
	missionNamespace setVariable ["BIS_fnc_playVideo_skipVideo", true];
}];
_firedNearEH = player addEventHandler ["FiredNear", {
	missionNamespace setVariable ["BIS_fnc_playVideo_skipVideo", true];
}];
_hitEH = player addEventHandler ["Hit", {
	missionNamespace setVariable ["BIS_fnc_playVideo_skipVideo", true];
}];

[_video, _suppressedEH, _firedNearEH, _hitEH] spawn {
	params ["_video", "_suppressedEH", "_firedNearEH", "_hitEH"];
	[_video] call BIS_fnc_playVideo;
	player removeEventHandler ["Suppressed", _suppressedEH];
	player removeEventHandler ["FiredNear", _firedNearEH];
	player removeEventHandler ["Hit", _hitEH];
	missionNamespace setVariable ["BIS_fnc_playVideo_skipVideo", nil];
};
