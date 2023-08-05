private _player = player;  
private _position = getPos _player; 
private _inventory = getUnitLoadout _player; 
private  _string =  str _inventory; 
_string = [ _string , '"', ""] call CBA_fnc_replace; 
_string = [ _string , '[', ""] call CBA_fnc_replace; 
_string = [ _string , ']', ""] call CBA_fnc_replace; 
_string = [_string, ","] call CBA_fnc_split; 
private _itemsPlayer = magazines player; 
private _currentMag = currentMagazine player; 
_itemsPlayer pushBack currentMag; 
private _box = "Exile_Container_SupplyBox" createVehicle _position; 
 
{  
 if ( (isClass (configFile >> "CfgWeapons" >> _x))  )then  
  { _box addItemCargo [ _x , 1] };  
} forEach _string; 
 
{  
 if ( (isClass (configFile >> "CfgMagazines" >> _x))  )then 
  { _box addItemCargo [ _x , 1] };  
} forEach _itemsPlayer; 
 
removeAllContainers _player; 
removeAllWeapons _player; 
removeGoggles _player; 
removeHeadgear _player; 
removeAllAssignedItems player;

private _playerMoney = _player getVariable ["ExileMoney", 0];
_player setVariable ["ExileMoney",0,true];
_box setVariable ["ExileMoney", _playerMoney ,true];
