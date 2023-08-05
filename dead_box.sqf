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
_itemsPlayer pushBack _currentMag;   
private _box = "Exile_Container_SupplyBox" createVehicle _position;  
  
_currentMag = primaryWeapon player;   
_box addWeaponCargoGlobal  [ _currentMag , 1 ] ; 
player removeWeaponGlobal _currentMag; 
_currentMag = backpack player;  
_box addBackpackCargoGlobal [_currentMag , 1];  
   
{    
 if ( (isClass (configFile >> "CfgWeapons" >> _x))  )then    
  { _box addItemCargoGlobal [ _x , 1] };    
} forEach _string;   
   
{    
 if ( (isClass (configFile >> "CfgMagazines" >> _x))  )then   
  { _box addItemCargoGlobal [ _x , 1] };    
} forEach _itemsPlayer;   
   
   
   
   
removeAllContainers player;   
removeAllWeapons player;   
removeGoggles player;   
removeHeadgear player;   
removeAllAssignedItems player;  
 
private _playerMoney = player getVariable ["ExileMoney", 0];  
_player setVariable ["ExileMoney",0,true];  
_box setVariable ["ExileMoney", _playerMoney ,true];  
"SmokeShellBlue" createVehicle _position;  
