params ["_targetUnit"];

_targetUnit setBehaviour "CARELESS";
_targetUnit setCaptive 1;
_targetUnit setVariable ["TYST_isCaptive", true, true];
sleep 0.1;
_targetUnit switchMove "Acts_AidlPsitMstpSsurWnonDnon_loop";