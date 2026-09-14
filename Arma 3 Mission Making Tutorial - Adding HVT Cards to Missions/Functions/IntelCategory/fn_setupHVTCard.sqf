params ["_diaryRecordVar", "_title", "_image"];
private _imageStr = str _image;
private _imageVariable = ["image=",_imageStr] joinString "";
private _contentVariable = format ["<img %1 width='256' height='512' />",_imageVariable];
private _textVariable = [_title, _contentVariable];
private _diaryRecord = player createDiaryRecord ["deckof52",_textVariable,taskNull,"NONE",false];
missionNamespace setVariable [_diaryRecordVar,_diaryRecord];  