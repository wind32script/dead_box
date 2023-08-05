private _player = player;    
private _position = getPos _player;   

private _box = "Exile_Container_SupplyBox" createVehicle _position;  
private _itemsPlayer = magazines player;      
private _currentMag = currentMagazine player;  
_itemsPlayer pushBack _currentMag;   
{
if ( (isClass (configFile >> "CfgMagazines" >> _x))  )then   {
		_box addItemCargoGlobal [ _x , 1];
		player removeMagazineGlobal _x;
	};    
} forEach _itemsPlayer;

//_currentMag = backpack player; 
//_box addBackpackCargoGlobal [_currentMag , 1];  


_currentMag = backpack player; 
if ( (isClass (configFile >> "CfgVehicles" >> _currentMag))  )then    
	{ 
		_box addBackpackCargoGlobal [_currentMag , 1];
		player removeItem _x;
	};   

private _inventory = getUnitLoadout _player;   
private  _string =  str _inventory;   
_string = [ _string , '"', ""] call CBA_fnc_replace;   
_string = [ _string , '[', ""] call CBA_fnc_replace;   
_string = [ _string , ']', ""] call CBA_fnc_replace;   
_string = [_string, ","] call CBA_fnc_split;   
 
//_currentMag = primaryWeapon player;   
//if ( (isClass (configFile >> "CfgWeapons" >> _currentMag))  ) then    
//  {
//	_box addWeaponCargoGlobal  [ _currentMag , 1 ] ; 
//	player removeWeaponGlobal _currentMag; 
//  };  
     
{    
 if ( (isClass (configFile >> "CfgWeapons" >> _x))  )then    
	{ 
		_box addItemCargoGlobal [ _x , 1];
		player removeItem _x;
	};    
} forEach _string;   
   
   
removeAllWeapons player; 
removeAllContainers player; 
removeAllAssignedItems player; 
removeGoggles player; 
removeHeadgear player; 

private _playerMoney = player getVariable ["ExileMoney", 0];  
_player setVariable ["ExileMoney",0,true];  
_box setVariable ["ExileMoney", _playerMoney ,true];  
"SmokeShellBlue" createVehicle _position;  
