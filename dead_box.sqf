private _player = player; 
private _position = getPos _player;
private _inventory = getUnitLoadout _player;
private  _string=  str _inventory;
copyToClipboard str _string;
_string = [ _string , '"', ""] call CBA_fnc_replace;
_string = [ _string , '[', ""] call CBA_fnc_replace;
_string = [ _string , ']', ""] call CBA_fnc_replace;
_string = [_string, ","] call CBA_fnc_split;
private _box = "Exile_Container_SupplyBox" createVehicle _position;

