 
private _player = player;    
private _position = getPos _player;   
private _box= cursorTarget;
private _box = "Exile_Container_SupplyBox" createVehicle _position; 
_fnc_add_cargo = {  
params ["_item","_i","_unit", "_box"];
 

	if ( (isClass (configFile >> "CfgWeapons" >> _item))  )then{ 
	    _box addItemCargoGlobal [ _item , _i];
		_player removeItem  _item;	
		for "_j" from 0 to (_i)  do { _player removeItem  _item; };
		};    
		
if ( isClass (configFile >> "CfgMagazines" >> _item)  )then { 
	_box addMagazineCargoGlobal [  _item , _i ];
	if (_i>1) then {
	for "_j" from 0 to (_i)  do { _player removeItem  _item; };
	}else { _player removeItem  _item; };
};  

				
	if ( (isClass (configFile >> "CfgVehicles" >> _item))  )then { 
		_box addBackpackCargoGlobal [ _item , _i];
		_player removeItem  _item;		
	};
}; 


  
_1wp = assignedItems _player;
		for "_i" from 0 to (count _1wp) -1 do { 
			_item = _1wp select _i;
			 _box addItemCargoGlobal [ _item , 1];
			_player unassignItem _item;
			_player removeItem _item;
		};	
removeAllAssignedItems player; 

		
_1wp = backpackItems _player;
		for "_i" from 0 to (count _1wp) -1 do { 
			_item = _1wp select _i;
			_box addItemCargoGlobal [ _item , 1];
			_player removeItem _item ;
		};	
_forma = backpack _player;     
_box addBackpackCargoGlobal [_forma , 1]; 
removeBackpackGlobal _player;    

_1wp = headgear _player;
_box addItemCargoGlobal [ _1wp , 1];
_player unassignItem _1wp;
_player removeItem _1wp;

_1wp = goggles _player;
_box addItemCargoGlobal [ _1wp , 1];
_player unassignItem _1wp;
_player removeItem _1wp;


		
_1wp = uniformItems _player;
		for "_i" from 0 to (count _1wp) -1 do { 
			_item = _1wp select _i;
			_box addItemCargoGlobal [ _item , 1];
			_player removeItem _item ;
		};	
 _forma = uniform _player;
_box addItemCargoGlobal [ _forma , 1];
removeUniform _player;

 
_1wp = vestItems _player;
		for "_i" from 0 to (count _1wp) -1 do { 
			_item = _1wp select _i;
			_box addItemCargoGlobal [ _item , 1];
			_player removeItem _item ;
		};	
_forma = vest _player;
_box addItemCargoGlobal [ _forma , 1];
removeVest _player;

		

		
_UnitLoadout = getUnitLoadout _player;
 _1wp = [_UnitLoadout  select 0, 1];
  if (  (count (_1wp select 0) )>0)then { _box addWeaponWithAttachmentsCargo _1wp ; };
  
  _1wp = [_UnitLoadout  select 1, 1];
   if (  (count (_1wp select 0) )>0)then {  _box addWeaponWithAttachmentsCargo _1wp ; };
   
  _1wp = [_UnitLoadout  select 2, 1];
   if (  (count (_1wp select 0) )>0)then { _box addWeaponWithAttachmentsCargo _1wp ; };
 removeAllWeapons _player; 

 private _playerMoney = player getVariable ["ExileMoney", 0];     
_player setVariable ["ExileMoney",0,true];      
_box setVariable ["ExileMoney", _playerMoney ,true];   
 
removeAllContainers player;  

 
 
_object = nearestObjects [player,[], 1 ];
{   
	 if  (_x isKindOf "WeaponHolderSimulated")  then {
		_www =  weaponsItemsCargo _x;
		_www = _www select 0; 
        _box addWeaponWithAttachmentsCargo [_www ,1];
	 deleteVehicle _x; 
	};
	  
}forEach _object;   
["SuccessTitleAndText", [ "Вы сыграли в ящик, заберите вещи с ящика" ]] call ExileClient_gui_toaster_addTemplateToast; 
"SmokeShellBlue" createVehicle _position;  
