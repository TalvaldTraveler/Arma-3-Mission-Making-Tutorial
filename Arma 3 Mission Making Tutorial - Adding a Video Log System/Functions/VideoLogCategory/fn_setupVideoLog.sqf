player createDiarySubject ["videoLogSubject","Video Log"];
TYST_ViLogScreen = player createDiaryRecord ["videoLogSubject",
	[
	"Video Screen",
	"<img image='\Travelers_Resources_Core\Image\VideoScreen_Base.paa'
	width='370' height='185' />
	<br />Replay Video
	"
	], 
	taskNull,
	"NONE",
	false
];