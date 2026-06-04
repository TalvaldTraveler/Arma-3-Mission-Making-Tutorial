_screen = _this select 0;

_video = "Video\videoception.ogv";
//_video = "\Travelers_Resources_Core\Video\ArmaShake.ogv";
_screen setObjectTexture [0, _video];
[_video, [1,1,0,0], [1,1,1,1], "TYST_StopFilm"] call BIS_fnc_playVideo;
_screen setObjectTexture [0, "Video\doItForHer.paa"];