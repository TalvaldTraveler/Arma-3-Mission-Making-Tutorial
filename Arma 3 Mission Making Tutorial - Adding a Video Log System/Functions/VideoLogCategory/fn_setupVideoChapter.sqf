private _title = _this select 0;
private _video = _this select 1;
private _videoVariable = format [
	"<execute expression='[""%1""] spawn TYST_fnc_playVideoLog;'>Play Video</ execute>",
	_video
];
private _textVariable = [_title, _videoVariable];
player createDiaryRecord ["videoLogSubject",_textVariable,taskNull,"NONE",false];