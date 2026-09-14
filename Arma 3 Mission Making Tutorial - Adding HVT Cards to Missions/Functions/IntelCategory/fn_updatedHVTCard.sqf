params ["_diaryRecordVar", "_title", "_image"];
private _imageStr = str _image;
private _imageVariable = ["image=",_imageStr] joinString "";
private _contentVariable = format ["<img %1 width='256' height='512' />",_imageVariable];
player setDiaryRecordText [["deckof52",_diaryRecordVar],[_title,_contentVariable]];