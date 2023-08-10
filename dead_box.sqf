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
private _box = "Land_PlasticCase_01_small_gray_F" createVehicle _position;    
  
  
_currentMag = backpack player;   
if ( (isClass (configFile >> "CfgVehicles" >> _currentMag))  )then      
 {   
  _box addBackpackCargoGlobal [_currentMag , 1];  
  player removeItem _x;  
 };     
     
{      
 if ( (isClass (configFile >> "CfgWeapons" >> _x))  )then{ _box addItemCargoGlobal [ _x , 1] };      
} forEach _string;     
     
{      
 if ( (isClass (configFile >> "CfgMagazines" >> _x))  )then   { _box addItemCargoGlobal [ _x , 1] };      
} forEach _itemsPlayer;     
   
     _object = nearestObjects [player,[], 1 ];  
     {   if  (_x isKindOf "WeaponHolderSimulated")  then {  
        _item =  weaponCargo _x ;  
        _item =  ( _item select 0);  
        _box addItemCargoGlobal  [ _item , 1 ] ; 
        deleteVehicle _x;   
        sleep _pause; 
      };  
     }forEach _object;  

   
removeAllWeapons player;  
removeAllContainers player;     
removeAllWeapons player;     
removeGoggles player;     
removeHeadgear player;     
removeAllAssignedItems player;    
private _playerMoney = player getVariable ["ExileMoney", 0];    
_player setVariable ["ExileMoney",0,true];    
_box setVariable ["ExileMoney", _playerMoney ,true];    
"SmokeShellBlue" createVehicle _position; 
