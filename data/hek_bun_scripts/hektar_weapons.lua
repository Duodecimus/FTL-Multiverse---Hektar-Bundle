mods.hte = {}

-- Magnifier code taken from TRC


-- example use of calc
--local function addStatCapped(boost, damage)
--  return math.min(10, boost + damage)
--end
--local statCharges = mods.trc.statChargers
--statCharges["NEW_GUN"] = {{stat = breachChance, calc = addStatCapped}}

-- if you want to make a scaling only hull damage, you need to do something like
--statCharges["LIGHT_LASER"] = {{stat = iDamage},{stat = iSystemDamage,  calc = lowerSysDamage}}
--local function lowerSysDamage(boost, damage)
--  return (boost * -1)
--end

mods.hte.statChargers = {}
local statChargers = mods.hte.statChargers
statChargers["MODULAR_MISSILE_CHARGE"] = {{stat = "iDamage"}}
statChargers["MODULAR_MISSILE_CHARGE_ADAPT"] = {{stat = "iDamage"}}
statChargers["MODULAR_MISSILE_CHARGE_BIO"] = {{stat = "iPersDamage"}} -- only does crewdamage
statChargers["MODULAR_MISSILE_CHARGE_CHAIN"] = {{stat = "iDamage"}}
statChargers["MODULAR_MISSILE_CHARGE_COOLDOWN"] = {{stat = "iDamage"}}
statChargers["MODULAR_MISSILE_CHARGE_LOCKDOWN"] = {{stat = "iDamage"}}
statChargers["MODULAR_MISSILE_CHARGE_STUN"] = {{stat = "iDamage"},{stat = "iStun"}}

statChargers["MODULAR_BOMB_CHARGE"] = {{stat = "iSystemDamage"}, {stat = "iPersDamage"}}
statChargers["MODULAR_BOMB_CHARGE_ADAPT"] = {{stat = "iSystemDamage"}, {stat = "iPersDamage"}}
statChargers["MODULAR_BOMB_CHARGE_BIO"] = {{stat = "iSystemDamage"}, {stat = "iPersDamage"}}
statChargers["MODULAR_BOMB_CHARGE_CHAIN"] = {{stat = "iSystemDamage"}, {stat = "iPersDamage"}}
statChargers["MODULAR_BOMB_CHARGE_COOLDOWN"] = {{stat = "iSystemDamage"}, {stat = "iPersDamage"}}
statChargers["MODULAR_BOMB_CHARGE_LOCKDOWN"] = {{stat = "iSystemDamage"}, {stat = "iPersDamage"}}
statChargers["MODULAR_BOMB_CHARGE_STUN"] = {{stat = "iSystemDamage"}, {stat = "iPersDamage"},{stat = "iStun"}}

statChargers["MODULAR_ION_CHARGE"] = {{stat = "iIonDamage"}}
statChargers["MODULAR_ION_CHARGE_ADAPT"] = {{stat = "iIonDamage"}}
statChargers["MODULAR_ION_CHARGE_BIO"] = {{stat = "iIonDamage"},{stat = "iPersDamage"}} --todo should have 4 crew damage, but caps at 3
statChargers["MODULAR_ION_CHARGE_CHAIN"] = {{stat = "iIonDamage"}}
statChargers["MODULAR_ION_CHARGE_COOLDOWN"] = {{stat = "iIonDamage"}}
statChargers["MODULAR_ION_CHARGE_LOCKDOWN"] = {{stat = "iIonDamage"}} --TODO implement lockdown timer?
statChargers["MODULAR_ION_CHARGE_PIERCE"] = {{stat = "iIonDamage"}}
statChargers["MODULAR_ION_CHARGE_STUN"] = {{stat = "iIonDamage"},{stat = "iStun"}}
script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, weapon)
    local statBoosts = statChargers[weapon and weapon.blueprint and weapon.blueprint.name]
    if statBoosts then
        local boost = weapon.queuedProjectiles:size() -- Gets how many projectiles are charged up (doesn't include the one that was already shot)
        weapon.queuedProjectiles:clear() -- Delete all other projectiles
        for _, statBoost in ipairs(statBoosts) do -- Apply all stat boosts
            if statBoost.calc then
                projectile.damage[statBoost.stat] = statBoost.calc(boost, projectile.damage[statBoost.stat])
            else
                projectile.damage[statBoost.stat] = boost + projectile.damage[statBoost.stat]
            end
        end
    end
end)

--mods.hte.cooldownChargers = {}
--local cooldownChargers = mods.hte.cooldownChargers
--cooldownChargers["MODULAR_MISSILE_CHARGE"] = 1.0
--cooldownChargers["MODULAR_MISSILE_CHARGE_ADAPT"] = 1.0
--cooldownChargers["MODULAR_MISSILE_CHARGE_BIO"] = 1.0
--cooldownChargers["MODULAR_MISSILE_CHARGE_CHAIN"] = 1.0
--cooldownChargers["MODULAR_MISSILE_CHARGE_COOLDOWN"] = 1.0
--cooldownChargers["MODULAR_MISSILE_CHARGE_LOCKDOWN"] = 1.0
--cooldownChargers["MODULAR_MISSILE_CHARGE_STUN"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE_ADAPT"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE_BIO"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE_CHAIN"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE_COOLDOWN"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE_LOCKDOWN"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE_PIERCE"] = 1.0
--cooldownChargers["MODULAR_ION_CHARGE_STUN"] = 1.0
--
--script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(ship)
--    local weapons = ship and ship.weaponSystem and ship.weaponSystem.weapons
--    if weapons then
--        for weapon in vter(weapons) do
--            if weapon.chargeLevel ~= 0 and weapon.chargeLevel < weapon.weaponVisual.iChargeLevels then
--                local cdBoost = cooldownChargers[weapon and weapon.blueprint and weapon.blueprint.name]
--                if cdBoost then
--                    local cdLast = userdata_table(weapon, "mods.hte.weaponStuff").cdLast
--                    if cdLast and weapon.cooldown.first > cdLast then
--                        -- Calculate the new charge level from number of charges and charge level from last frame
--                        local chargeUpdate = weapon.cooldown.first - cdLast
--                        local chargeNew = weapon.cooldown.first - chargeUpdate + cdBoost^weapon.chargeLevel*chargeUpdate
--                        
--                        -- Apply the new charge level
--                        if chargeNew >= weapon.cooldown.second then
--                            weapon.chargeLevel = weapon.chargeLevel + 1
--                            if weapon.chargeLevel == weapon.weaponVisual.iChargeLevels then
--                                weapon.cooldown.first = weapon.cooldown.second
--                            else
--                                weapon.cooldown.first = 0
--                            end
--                        else
--                            weapon.cooldown.first = chargeNew
--                        end
--                    end
--                    userdata_table(weapon, "mods.hte.weaponStuff").cdLast = weapon.cooldown.first
--                end
--            end
--        end
--    end
--end)

--script.on_internal_event(Defines.InternalEvents.WEAPON_RENDERBOX, function(weapon, cooldown, maxCooldown, chargeString, damageString, shotLimitString)
--    local chargerBoost = cooldownChargers[weapon and weapon.blueprint and weapon.blueprint.name]
--    if chargerBoost then
--        local first, second = chargeString:match("([%d%.]+)%s*/%s*([%d%.]+)")
--        local boostLevel = math.min(weapon.chargeLevel, weapon.weaponVisual.iChargeLevels - 1)
--        first = first / chargerBoost ^ boostLevel
--        second = second / chargerBoost ^ boostLevel
--        chargeString = string.format("%.1f / %.1f", first, second)
--    end
--    return Defines.Chain.CONTINUE, chargeString, damageString, shotLimitString
--end)