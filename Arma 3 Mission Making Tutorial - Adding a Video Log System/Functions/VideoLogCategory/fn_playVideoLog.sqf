missionNamespace setVariable ["TYST_SkipVideoLog",true];  
uiSleep 0.1;
missionNamespace setVariable ["TYST_SkipVideoLog",nil];
private _video = _this select 0;
missionNamespace setVariable ["TYST_SavedVideo",_video];
private _videoStr = str _video;
private _videoVariable = ["image=",_videoStr] joinString "";
private _textVariable = format [
	"<img %1 width='370' height='185' />
	<br />
	<execute expression='missionNamespace setVariable [""TYST_SkipVideoLog"", true];'>
	Stop Video
	</execute>
	",
	_videoVariable
];
processDiaryLink createDiaryLink ["videoLogSubject", TYST_ViLogScreen,""];
uiSleep 0.5;
player setDiaryRecordText [
	["videoLogSubject",TYST_ViLogScreen],["Video Screen",_textVariable]
];
[_video, [0,0,0,0], [1,1,1,1], "TYST_SkipVideoLog"] call BIS_fnc_playVideo;
player setDiaryRecordText [
	["videoLogSubject",TYST_ViLogScreen],
	[
		"Video Screen",
		"<img image='Image\VideoScreen_Base.paa'
		width='370' height='185' />
		<br />
		<execute expression =
			'[missionNamespace getVariable ""TYST_SavedVideo""] spawn TYST_fnc_playVideoLog;'
		>
		Replay Video</execute>
		"
	]
];