local vter = mods.multiverse.vter

function remove_items()
  local shipManager = Hyperspace.ships.player
  if shipManager:HasSystem(3) then
    local weaponList = {}
    for weapon in vter(shipManager.weaponSystem.weapons) do --the vter automatically changes length when items are removed from it, so get the list first, then remove
      local id = weapon.blueprint.name
      table.insert(weaponList, id)
    end
    for _, weaponID in ipairs(weaponList) do
      shipManager:RemoveItem(weaponID, true)
    end
  end
  if shipManager:HasSystem(4) then
    local droneList = {}
    for drone in vter(shipManager.droneSystem.drones) do
      local id = drone.blueprint.name
    end
    for _, droneID in ipairs(droneList) do
      shipManager:RemoveItem(droneID, true)
    end
  end
  local itemList = {}
  for item in vter(Hyperspace.App.gui.equipScreen:GetCargoHold()) do
      local id = item.blueprint.name
      table.insert(itemList, id)
  end
  for _, itemID in ipairs(itemList) do
    shipManager:RemoveItem(item, true)
  end
end
--RICH -gives max resources
--DELETE kills enemy ship
--
-- you can trigger a script in FTL by doing 'LUA hek1()' in the console
-- Forgotten diamonds metal pyramid cruiser has 6 weapon slots
function give_hektar_weapons(hektarWeapons)
  remove_items()
  for _, id in ipairs(hektarWeapons) do
    local weaponBlueprint = Hyperspace.Blueprints:GetWeaponBlueprint(id)
    Hyperspace.App.gui.equipScreen:AddWeapon(weaponBlueprint, true, false)
  end
end

function give_hektar_drones(hektarDrones)
  remove_items()
  for _, id in ipairs(hektarDrones) do
    local droneBlueprint = Hyperspace.Blueprints:GetDroneBlueprint(id)
    Hyperspace.App.gui.equipScreen:AddDrone(droneBlueprint, true, false)
  end
end

-- 1 to 22 are charge, adaptive and chain - hektar expansion
-- 23 to 41 are bombs, flak, pinpoint and mines - hektar collection
-- 24 to 55 are attack drones laser/beam/ion- hektar collection
local minelauncheradapt = {
  "MODULAR_MINELAUNCHER_BASE_ADAPT",
  "MODULAR_MINELAUNCHER_ACCURACY_ADAPT",
  "MODULAR_MINELAUNCHER_CHARGE_ADAPT",
  "MODULAR_MINELAUNCHER_FIRE_ADAPT",
  "MODULAR_MINELAUNCHER_HULL_ADAPT",
  "MODULAR_MINELAUNCHER_POWER_ADAPT",
}
function hek1()
  give_hektar_weapons(minelauncheradapt)
end


local mminelauncherchain = {
  "MODULAR_MINELAUNCHER_BASE_CHAIN",
  "MODULAR_MINELAUNCHER_ACCURACY_CHAIN",
  "MODULAR_MINELAUNCHER_CHARGE_CHAIN",
  "MODULAR_MINELAUNCHER_FIRE_CHAIN",
  "MODULAR_MINELAUNCHER_HULL_CHAIN",
  "MODULAR_MINELAUNCHER_POWER_CHAIN",
}
function hek2()
  give_hektar_weapons(mminelauncherchain)
end


local minelaunchercharge = {
  "MODULAR_MINELAUNCHER_CHARGE",
  "MODULAR_MINELAUNCHER_CHARGE_BIO",
  "MODULAR_MINELAUNCHER_CHARGE_COOLDOWN",
  "MODULAR_MINELAUNCHER_CHARGE_LOCKDOWN",
  "MODULAR_MINELAUNCHER_CHARGE_PIERCE",
  "MODULAR_MINELAUNCHER_CHARGE_STUN",
}
function hek3()
  give_hektar_weapons(minelaunchercharge)
end


local focusother1 = {
  "MODULAR_FOCUS_BASE_ADAPT",
  "MODULAR_FOCUS_BASE_CHAIN",
  "MODULAR_FOCUS_FIRE_ADAPT",
  "MODULAR_FOCUS_FIRE_CHAIN",
  }
function hek4()
  give_hektar_weapons(focusother1)
end
  
local focusother2 = {
  "MODULAR_FOCUS_HULL_ADAPT",
  "MODULAR_FOCUS_HULL_CHAIN",
  "MODULAR_FOCUS_POWER_ADAPT",
  "MODULAR_FOCUS_POWER_CHAIN",
}
function hek5()
  give_hektar_weapons(focusother2)
end


local flakadapt = {
  "MODULAR_SHOTGUN_BASE_ADAPT",
  "MODULAR_SHOTGUN_ACCURACY_ADAPT",
  "MODULAR_SHOTGUN_CHARGE_ADAPT",
  "MODULAR_SHOTGUN_FIRE_ADAPT",
  "MODULAR_SHOTGUN_HULL_ADAPT",
  "MODULAR_SHOTGUN_POWER_ADAPT",
}
function hek6()
  give_hektar_weapons(flakadapt)
end


local flakchain = {
  "MODULAR_SHOTGUN_BASE_CHAIN",
  "MODULAR_SHOTGUN_FIRE_CHAIN",
  "MODULAR_SHOTGUN_ACCURACY_CHAIN",
  "MODULAR_SHOTGUN_CHARGE_CHAIN",
  "MODULAR_SHOTGUN_HULL_CHAIN",
  "MODULAR_SHOTGUN_POWER_CHAIN",
}
function hek7()
  give_hektar_weapons(flakchain)
end


local flakcharge = {
  "MODULAR_SHOTGUN_CHARGE",
  "MODULAR_SHOTGUN_CHARGE_BIO",
  "MODULAR_SHOTGUN_CHARGE_COOLDOWN",
  "MODULAR_SHOTGUN_CHARGE_LOCKDOWN",
  "MODULAR_SHOTGUN_CHARGE_PIERCE",
  "MODULAR_SHOTGUN_CHARGE_STUN",
}
function hek8()
  give_hektar_weapons(flakcharge)
end


local bomblauncheradapt = {
  "MODULAR_BOMB_BASE_ADAPT",
  "MODULAR_BOMB_ACCURACY_ADAPT",
  "MODULAR_BOMB_CHARGE_ADAPT",
  "MODULAR_BOMB_FIRE_ADAPT",
  "MODULAR_BOMB_HULL_ADAPT",
  "MODULAR_BOMB_POWER_ADAPT",
}
function hek9()
  give_hektar_weapons(bomblauncheradapt)
end


local bomblauncherchain = {
  "MODULAR_BOMB_BASE_CHAIN",
  "MODULAR_BOMB_ACCURACY_CHAIN",
  "MODULAR_BOMB_CHARGE_CHAIN",
  "MODULAR_BOMB_FIRE_CHAIN",
  "MODULAR_BOMB_HULL_CHAIN",
}
function hek10()
  give_hektar_weapons(bomblauncherchain)
end


local bomblaunchercharge = {
  "MODULAR_BOMB_CHARGE",
  "MODULAR_BOMB_CHARGE_BIO",
  "MODULAR_BOMB_CHARGE_COOLDOWN",
  "MODULAR_BOMB_CHARGE_LOCKDOWN",
  "MODULAR_BOMB_CHARGE_STUN",
}
function hek11()
  give_hektar_weapons(bomblaunchercharge)
end


local beamadaptchain1 = {
  "MODULAR_BEAM_BASE_ADAPT",
  "MODULAR_BEAM_BASE_CHAIN",
  "MODULAR_BEAM_FIRE_ADAPT",
  "MODULAR_BEAM_FIRE_CHAIN",
}
function hek12()
  give_hektar_weapons(beamadaptchain1)
end

local beamadaptchain2 = {
  "MODULAR_BEAM_HULL_ADAPT",
  "MODULAR_BEAM_HULL_CHAIN",
  "MODULAR_BEAM_POWER_ADAPT",
  "MODULAR_BEAM_POWER_CHAIN",
}
function hek13()
  give_hektar_weapons(beamadaptchain2)
end


local missilesadapt = {
  "MODULAR_MISSILES_BASE_ADAPT",
  "MODULAR_MISSILES_ACCURACY_ADAPT",
  "MODULAR_MISSILES_CHARGE_ADAPT",
  "MODULAR_MISSILES_FIRE_ADAPT",
  "MODULAR_MISSILES_HULL_ADAPT",
  "MODULAR_MISSILES_POWER_ADAPT",
}
function hek14()
  give_hektar_weapons(missilesadapt)
end


local missileschain = {
  "MODULAR_MISSILES_BASE_CHAIN",
  "MODULAR_MISSILES_ACCURACY_CHAIN",
  "MODULAR_MISSILES_CHARGE_CHAIN",
  "MODULAR_MISSILES_FIRE_CHAIN",
  "MODULAR_MISSILES_HULL_CHAIN",
  "MODULAR_MISSILES_POWER_CHAIN",
}
function hek15()
  give_hektar_weapons(missileschain)
end


local missilescharge = {
  "MODULAR_MISSILES_CHARGE",
  "MODULAR_MISSILES_CHARGE_BIO",
  "MODULAR_MISSILES_CHARGE_COOLDOWN",
  "MODULAR_MISSILES_CHARGE_LOCKDOWN",
  "MODULAR_MISSILES_CHARGE_STUN",
}
function hek16()
  give_hektar_weapons(missilescharge)
end


local ionadapt = {
  "MODULAR_ION_BASE_ADAPT",
  "MODULAR_ION_ACCURACY_ADAPT",
  "MODULAR_ION_CHARGE_ADAPT",
  "MODULAR_ION_FIRE_ADAPT",
  "MODULAR_ION_HULL_ADAPT",
  "MODULAR_ION_POWER_ADAPT",
}
function hek17()
  give_hektar_weapons(ionadapt)
end


local ionchain = {
  "MODULAR_ION_BASE_CHAIN",
  "MODULAR_ION_ACCURACY_CHAIN",
  "MODULAR_ION_CHARGE_CHAIN",
  "MODULAR_ION_FIRE_CHAIN",
  "MODULAR_ION_HULL_CHAIN",
  "MODULAR_ION_POWER_CHAIN",
}
function hek18()
  give_hektar_weapons(ionchain)
end


local ioncharge = {
  "MODULAR_ION_CHARGE",
  "MODULAR_ION_CHARGE_BIO",
  "MODULAR_ION_CHARGE_COOLDOWN",
  "MODULAR_ION_CHARGE_LOCKDOWN",
  "MODULAR_ION_CHARGE_PIERCE",
  "MODULAR_ION_CHARGE_STUN",
}
function hek19()
  give_hektar_weapons(ioncharge)
end


local laseradapt = {
  "MODULAR_LASER_BASE_ADAPT",
  "MODULAR_LASER_ACCURACY_ADAPT",
  "MODULAR_LASER_CHARGE_ADAPT",
  "MODULAR_LASER_FIRE_ADAPT",
  "MODULAR_LASER_HULL_ADAPT",
  "MODULAR_LASER_POWER_ADAPT",
}
function hek20()
  give_hektar_weapons(laseradapt)
end


local laserchain = {
  "MODULAR_LASER_BASE_CHAIN",
  "MODULAR_LASER_ACCURACY_CHAIN",
  "MODULAR_LASER_CHARGE_CHAIN",
  "MODULAR_LASER_FIRE_CHAIN",
  "MODULAR_LASER_HULL_CHAIN",
  "MODULAR_LASER_POWER_CHAIN",
}
function hek21()
  give_hektar_weapons(laserchain)
end


local lasercharge = {
  "MODULAR_LASER_CHARGE",
  "MODULAR_LASER_CHARGE_BIO",
  "MODULAR_LASER_CHARGE_COOLDOWN",
  "MODULAR_LASER_CHARGE_LOCKDOWN",
  "MODULAR_LASER_CHARGE_PIERCE",
  "MODULAR_LASER_CHARGE_STUN",
}
function hek22()
  give_hektar_weapons(lasercharge)
end

local bombbase = {
  "MODULAR_BOMB_BASE",
  "MODULAR_BOMB_BASE_BIO",
  "MODULAR_BOMB_BASE_COOLDOWN",
  "MODULAR_BOMB_BASE_LOCKDOWN",
  "MODULAR_BOMB_BASE_STUN",
}
function hek23()
  give_hektar_weapons(bombbase)
end

local bombacc = {
  "MODULAR_BOMB_ACCURACY",
  "MODULAR_BOMB_ACCURACY_BIO",
  "MODULAR_BOMB_ACCURACY_COOLDOWN",
  "MODULAR_BOMB_ACCURACY_LOCKDOWN",
  "MODULAR_BOMB_ACCURACY_STUN",
}
function hek24()
  give_hektar_weapons(bombacc)
end

local bombfire = {
  "MODULAR_BOMB_FIRE",
  "MODULAR_BOMB_FIRE_BIO",
  "MODULAR_BOMB_FIRE_COOLDOWN",
  "MODULAR_BOMB_FIRE_LOCKDOWN",
  "MODULAR_BOMB_FIRE_STUN",
}
function hek25()
  give_hektar_weapons(bombfire)
end

local bombhull = {
  "MODULAR_BOMB_HULL",
  "MODULAR_BOMB_HULL_BIO",
  "MODULAR_BOMB_HULL_COOLDOWN",
  "MODULAR_BOMB_HULL_LOCKDOWN",
  "MODULAR_BOMB_HULL_STUN",
}
function hek26()
  give_hektar_weapons(bombhull)
end

local bombpower = {
  "MODULAR_BOMB_POWER",
  "MODULAR_BOMB_POWER_BIO",
  "MODULAR_BOMB_POWER_COOLDOWN",
  "MODULAR_BOMB_POWER_LOCKDOWN",
  "MODULAR_BOMB_POWER_STUN",
}
function hek27()
  give_hektar_weapons(bombpower)
end

local flakbase = {
  "MODULAR_SHOTGUN_BASE",
  "MODULAR_SHOTGUN_BASE_BIO",
  "MODULAR_SHOTGUN_BASE_COOLDOWN",
  "MODULAR_SHOTGUN_BASE_LOCKDOWN",
  "MODULAR_SHOTGUN_BASE_PIERCE",
  "MODULAR_SHOTGUN_BASE_STUN",
}
function hek28()
  give_hektar_weapons(flakbase)
end

local flakacc = {
  "MODULAR_SHOTGUN_ACCURACY",
  "MODULAR_SHOTGUN_ACCURACY_BIO",
  "MODULAR_SHOTGUN_ACCURACY_COOLDOWN",
  "MODULAR_SHOTGUN_ACCURACY_LOCKDOWN",
  "MODULAR_SHOTGUN_ACCURACY_PIERCE",
  "MODULAR_SHOTGUN_ACCURACY_STUN",
}
function hek29()
  give_hektar_weapons(flakacc)
end

local flakfire = {
  "MODULAR_SHOTGUN_FIRE",
  "MODULAR_SHOTGUN_FIRE_BIO",
  "MODULAR_SHOTGUN_FIRE_COOLDOWN",
  "MODULAR_SHOTGUN_FIRE_LOCKDOWN",
  "MODULAR_SHOTGUN_FIRE_PIERCE",
  "MODULAR_SHOTGUN_FIRE_STUN",
}
function hek30()
  give_hektar_weapons(flakfire)
end

local flakhull = {
  "MODULAR_SHOTGUN_HULL",
  "MODULAR_SHOTGUN_HULL_BIO",
  "MODULAR_SHOTGUN_HULL_COOLDOWN",
  "MODULAR_SHOTGUN_HULL_LOCKDOWN",
  "MODULAR_SHOTGUN_HULL_PIERCE",
  "MODULAR_SHOTGUN_HULL_STUN",
}
function hek31()
  give_hektar_weapons(flakhull)
end

local flakpower = {
  "MODULAR_SHOTGUN_POWER",
  "MODULAR_SHOTGUN_POWER_BIO",
  "MODULAR_SHOTGUN_POWER_COOLDOWN",
  "MODULAR_SHOTGUN_POWER_LOCKDOWN",
  "MODULAR_SHOTGUN_POWER_PIERCE",
  "MODULAR_SHOTGUN_POWER_STUN",
}
function hek32()
  give_hektar_weapons(flakpower)
end

local focusbase = {
  "MODULAR_FOCUS_BASE",
  "MODULAR_FOCUS_BASE_BIO",
  "MODULAR_FOCUS_BASE_COOLDOWN",
  "MODULAR_FOCUS_BASE_PIERCE",
  "MODULAR_FOCUS_BASE_STUN",
}
function hek33()
  give_hektar_weapons(focusbase)
end

local focusfire = {
  "MODULAR_FOCUS_FIRE",
  "MODULAR_FOCUS_FIRE_BIO",
  "MODULAR_FOCUS_FIRE_COOLDOWN",
  "MODULAR_FOCUS_FIRE_PIERCE",
  "MODULAR_FOCUS_FIRE_STUN",
}
function hek34()
  give_hektar_weapons(focusfire)
end

local focushull = {
  "MODULAR_FOCUS_HULL",
  "MODULAR_FOCUS_HULL_BIO",
  "MODULAR_FOCUS_HULL_COOLDOWN",
  "MODULAR_FOCUS_HULL_PIERCE",
  "MODULAR_FOCUS_HULL_STUN",
}
function hek35()
  give_hektar_weapons(focushull)
end

local focuspower = {
  "MODULAR_FOCUS_POWER",
  "MODULAR_FOCUS_POWER_BIO",
  "MODULAR_FOCUS_POWER_COOLDOWN",
  "MODULAR_FOCUS_POWER_PIERCE",
  "MODULAR_FOCUS_POWER_STUN",
}
function hek36()
  give_hektar_weapons(focuspower)
end

local minebase = {
  "MODULAR_MINELAUNCHER_BASE",
  "MODULAR_MINELAUNCHER_BASE_BIO",
  "MODULAR_MINELAUNCHER_BASE_COOLDOWN",
  "MODULAR_MINELAUNCHER_BASE_LOCKDOWN",
  "MODULAR_MINELAUNCHER_BASE_PIERCE",
  "MODULAR_MINELAUNCHER_BASE_STUN",
}
function hek37()
  give_hektar_weapons(minebase)
end

local mineacc = {
  "MODULAR_MINELAUNCHER_ACCURACY",
  "MODULAR_MINELAUNCHER_ACCURACY_BIO",
  "MODULAR_MINELAUNCHER_ACCURACY_COOLDOWN",
  "MODULAR_MINELAUNCHER_ACCURACY_LOCKDOWN",
  "MODULAR_MINELAUNCHER_ACCURACY_PIERCE",
  "MODULAR_MINELAUNCHER_ACCURACY_STUN",
}
function hek38()
  give_hektar_weapons(mineacc)
end

local minefire = {
  "MODULAR_MINELAUNCHER_FIRE",
  "MODULAR_MINELAUNCHER_FIRE_BIO",
  "MODULAR_MINELAUNCHER_FIRE_COOLDOWN",
  "MODULAR_MINELAUNCHER_FIRE_LOCKDOWN",
  "MODULAR_MINELAUNCHER_FIRE_PIERCE",
  "MODULAR_MINELAUNCHER_FIRE_STUN",
}
function hek39()
  give_hektar_weapons(minefire)
end

local minehull = {
  "MODULAR_MINELAUNCHER_HULL",
  "MODULAR_MINELAUNCHER_HULL_BIO",
  "MODULAR_MINELAUNCHER_HULL_COOLDOWN",
  "MODULAR_MINELAUNCHER_HULL_LOCKDOWN",
  "MODULAR_MINELAUNCHER_HULL_PIERCE",
  "MODULAR_MINELAUNCHER_HULL_STUN",
}
function hek40()
  give_hektar_weapons(minehull)
end

local minepower = {
  "MODULAR_MINELAUNCHER_POWER",
  "MODULAR_MINELAUNCHER_POWER_BIO",
  "MODULAR_MINELAUNCHER_POWER_COOLDOWN",
  "MODULAR_MINELAUNCHER_POWER_LOCKDOWN",
  "MODULAR_MINELAUNCHER_POWER_PIERCE",
  "MODULAR_MINELAUNCHER_POWER_STUN",
}
function hek41()
  give_hektar_weapons(minepower)
end

local dlaserbase = {
  "MODULAR_DRONE_LASER_BASE",
  "MODULAR_DRONE_LASER_BASE_PIERCE",
  "MODULAR_DRONE_LASER_BASE_BIO",
  "MODULAR_DRONE_LASER_BASE_COOLDOWN",
  "MODULAR_DRONE_LASER_BASE_LOCKDOWN",
  "MODULAR_DRONE_LASER_BASE_STUN",
}
function hek42()
  give_hektar_drones(dlaserbase)
end

local dlaseracc = {
  "MODULAR_DRONE_LASER_ACCURACY",
  "MODULAR_DRONE_LASER_ACCURACY_PIERCE",
  "MODULAR_DRONE_LASER_ACCURACY_BIO",
  "MODULAR_DRONE_LASER_ACCURACY_COOLDOW",
  "MODULAR_DRONE_LASER_ACCURACY_LOCKDOW",
  "MODULAR_DRONE_LASER_ACCURACY_STUN",
}
function hek43()
  give_hektar_drones(dlaseracc)
end

local dlaserfire = {
  "MODULAR_DRONE_LASER_FIRE",
  "MODULAR_DRONE_LASER_FIRE_PIERCE",
  "MODULAR_DRONE_LASER_FIRE_BIO",
  "MODULAR_DRONE_LASER_FIRE_COOLDOWN",
  "MODULAR_DRONE_LASER_FIRE_LOCKDOWN",
  "MODULAR_DRONE_LASER_FIRE_STUN",
}
function hek44()
  give_hektar_drones(dlaserfire)
end

local dlaserhull = {
  "MODULAR_DRONE_LASER_HULL",
  "MODULAR_DRONE_LASER_HULL_PIERCE",
  "MODULAR_DRONE_LASER_HULL_BIO",
  "MODULAR_DRONE_LASER_HULL_COOLDOWN",
  "MODULAR_DRONE_LASER_HULL_LOCKDOWN",
  "MODULAR_DRONE_LASER_HULL_STUN",
}
function hek45()
  give_hektar_drones(dlaserhull)
end

local dlaserpower = {
  "MODULAR_DRONE_LASER_POWER",
  "MODULAR_DRONE_LASER_POWER_PIERCE",
  "MODULAR_DRONE_LASER_POWER_BIO",
  "MODULAR_DRONE_LASER_POWER_COOLDOWN",
  "MODULAR_DRONE_LASER_POWER_LOCKDOWN",
  "MODULAR_DRONE_LASER_POWER_STUN",
}
function hek46()
  give_hektar_drones(dlaserpower)
end

local dbeambase = {
  "MODULAR_DRONE_BEAM_BASE",
  "MODULAR_DRONE_BEAM_BASE_PIERCE",
  "MODULAR_DRONE_BEAM_BASE_BIO",
  "MODULAR_DRONE_BEAM_BASE_COOLDOWN",
  "MODULAR_DRONE_BEAM_BASE_STUN",
}
function hek47()
  give_hektar_drones(dbeambase)
end

local dbeamfire = {
  "MODULAR_DRONE_BEAM_FIRE",
  "MODULAR_DRONE_BEAM_FIRE_PIERCE",
  "MODULAR_DRONE_BEAM_FIRE_BIO",
  "MODULAR_DRONE_BEAM_FIRE_COOLDOWN",
  "MODULAR_DRONE_BEAM_FIRE_STUN",
}
function hek48()
  give_hektar_drones(dbeamfire)
end

local dbeamhull = {
  "MODULAR_DRONE_BEAM_HULL",
  "MODULAR_DRONE_BEAM_HULL_PIERCE",
  "MODULAR_DRONE_BEAM_HULL_BIO",
  "MODULAR_DRONE_BEAM_HULL_COOLDOWN",
  "MODULAR_DRONE_BEAM_HULL_STUN",
}
function hek49()
  give_hektar_drones(dbeamhull)
end

local dbeampower = {
  "MODULAR_DRONE_BEAM_POWER",
  "MODULAR_DRONE_BEAM_POWER_PIERCE",
  "MODULAR_DRONE_BEAM_POWER_BIO",
  "MODULAR_DRONE_BEAM_POWER_COOLDOWN",
  "MODULAR_DRONE_BEAM_POWER_STUN",
}
function hek50()
  give_hektar_drones(dbeampower)
end

local dionbase = {
  "MODULAR_DRONE_ION_BASE",
  "MODULAR_DRONE_ION_BASE_PIERCE",
  "MODULAR_DRONE_ION_BASE_BIO",
  "MODULAR_DRONE_ION_BASE_COOLDOWN",
  "MODULAR_DRONE_ION_BASE_LOCKDOWN",
  "MODULAR_DRONE_ION_BASE_STUN",
}
function hek51()
  give_hektar_drones(dionbase)
end

local dionacc = {
  "MODULAR_DRONE_ION_ACCURACY",
  "MODULAR_DRONE_ION_ACCURACY_PIERCE",
  "MODULAR_DRONE_ION_ACCURACY_BIO",
  "MODULAR_DRONE_ION_ACCURACY_COOLDOWN",
  "MODULAR_DRONE_ION_ACCURACY_LOCKDOWN",
  "MODULAR_DRONE_ION_ACCURACY_STUN",
}
function hek52()
  give_hektar_drones(dionacc)
end

local dionfire = {
  "MODULAR_DRONE_ION_FIRE",
  "MODULAR_DRONE_ION_FIRE_PIERCE",
  "MODULAR_DRONE_ION_FIRE_BIO",
  "MODULAR_DRONE_ION_FIRE_COOLDOWN",
  "MODULAR_DRONE_ION_FIRE_LOCKDOWN",
  "MODULAR_DRONE_ION_FIRE_STUN",
}
function hek53()
  give_hektar_drones(dionfire)
end

local dionhull = {
  "MODULAR_DRONE_ION_HULL",
  "MODULAR_DRONE_ION_HULL_PIERCE",
  "MODULAR_DRONE_ION_HULL_BIO",
  "MODULAR_DRONE_ION_HULL_COOLDOWN",
  "MODULAR_DRONE_ION_HULL_LOCKDOWN",
  "MODULAR_DRONE_ION_HULL_STUN",
}
function hek54()
  give_hektar_drones(dionhull)
end

local dionpower = {
  "MODULAR_DRONE_ION_POWER",
  "MODULAR_DRONE_ION_POWER_PIERCE",
  "MODULAR_DRONE_ION_POWER_BIO",
  "MODULAR_DRONE_ION_POWER_COOLDOWN",
  "MODULAR_DRONE_ION_POWER_LOCKDOWN",
  "MODULAR_DRONE_ION_POWER_STUN",
}
function hek55()
  give_hektar_drones(dionpower)
end

--local  = {
--  "",
--  "",
--  "",
--  "",
--  "",
--  "",
--}
--function hek()
--  give_hektar_weapons()
--end
