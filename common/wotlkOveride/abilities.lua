local activeModule = "Abilities (WotLK)";

-- This file contains overides for WotLK Beta DTM version.
-- It will not be run on live clients.

if ( not DTM_OnWotLK() ) then
    return;
end

-- --------------------------------------------------------------------
-- **                         Abilities table                        **
-- --------------------------------------------------------------------

local DTM_Abilities = {
    -- Druid abilities

    ["COWER"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 5,
                -- Confirmed
                [1] = -240,
                [2] = -390,
                [3] = -600,
                [4] = -800,
                [5] = -1170,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["GROWL"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "TAUNT",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["MAUL"] = {
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 8,
                -- Guessed
                [1] = 25,
                [2] = 55,
                [3] = 85,
                [4] = 115,
                [5] = 145,
                [6] = 175,
                -- Confirmed
                [7] = 205,
                [8] = 320,
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["SWIPE"] = {
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0 / 3,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["MANGLE_BEAR"] = {
        class = "DRUID",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 1.30,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["LACERATE"] = {
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 285,
            instantCoeff = 0.20,       -- This coeff is applied on damage done threat of the instant portion.
            overTimeCoeff = 0.20,      -- This coeff is applied on DoT done threat of the over time portion.
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["FAERIE_FIRE"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 5,
                -- Guessed
                [1] = 35,
                [2] = 60,
                [3] = 85,
                -- Confirmed
                [4] = 110,
                [5] = 130,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["FERAL_FAERIE_FIRE"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 5,
                -- Guessed
                [1] = 35,
                [2] = 60,
                [3] = 85,
                -- Confirmed
                [4] = 110,
                [5] = 130,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["IMPROVED_LEADER_OF_THE_PACK"] = { -- Since 2.1
        class = "DRUID",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["SOOTHE_ANIMAL"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "NULL",
            hasAmount = nil,
            detection = "LOCAL",
        },
    },
    ["CYCLONE"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 180,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "LOCAL",
        }
    },
    ["DEMORALIZING_ROAR"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 40,               -- The threat should be split among all targets that got hit with the effect. But it shouldn't be much of a concern,
            target = "THREAT_LEVEL",  -- as the threat this ability generates is very low.
            hasAmount = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            delay = 0.250, -- Delayed abilities create an event. During the delay, received MISS message will deduct the target that resisted
        }                  -- from the list of the entities that will get affected.
    },
    ["HIBERNATE"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 3,
                -- Unknown.
                [1] = 0,
                [2] = 0,
                [3] = 0,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "LOCAL",
        }
    },
    ["FERAL_CHARGE"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,                  -- Unknown.
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["BARKSKIN"] = {     -- Non damaging ability
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 100,                -- Unknown. Just put 100 because it looked nice.
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",  -- Or is it split ?
            detection = "UNIVERSAL",
        }
    },
    ["LIFEBLOOM"] = {
        class = "DRUID",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,
            instantCoeff = 0.00,       -- The final bloom causes null threat.
            overTimeCoeff = 0.47,      -- After doing testings, it seems like Life Bloom HoT portion benefits an unmentionned heal threat reduction coeff.
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET_GLOBAL_SPLIT",
        }
    },

    -- Hunter abilities

    ["DISTRACTING_SHOT"] = {     -- Non damaging ability
        class = "HUNTER",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 7,
                -- Confirmed
                [1] = 110,
                [2] = 160,
                [3] = 250,
                [4] = 350,
                [5] = 465,
                [6] = 600,
                [7] = 900,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["DISENGAGE"] = {     -- Non damaging ability
        class = "HUNTER",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 4,
                -- Confirmed
                [1] = -140,
                [2] = -280,
                [3] = -405,
                [4] = -545,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["MISDIRECTION"] = {     -- Non damaging ability
        class = "HUNTER",
        effect = {
            type = "THREAT_REDIRECTION",
            value = "MISDIRECTION",
            hasAmount = nil,
            detection = "UNIVERSAL", -- Since 2.4 it is possible to detect directly when one misdirects threat on another one. :)
        }
    },
    ["FEIGN_DEATH"] = {     -- Non damaging ability
        class = "HUNTER",
        effect = {
            type = "DROP",    -- I had made some wrong assumptions about this ability ! (duh !)
            hasAmount = nil,  -- There are no standard resist message for each target, but only one UI message which displays "Resist". If it apparears,
            owner = "ACTOR",  -- it means ALL mobs have resisted. If it doesn't, ALL mobs are dropped from the hunter's presence list.
            relative = "ACTOR_GLOBAL",
            detection = "FEIGN_DEATH",  -- Feign death has its own mechanic now.
        }
    },
    ["HUNTER_MARK"] = {     -- Non damaging ability
        class = "HUNTER",
        effect = {
            type = "NULL",
            hasAmount = nil,
            detection = "UNIVERSAL",
        },
    },
    ["VIPER_STING"] = {
        class = "HUNTER",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },

    -- Mage abilities

    ["COUNTERSPELL"] = {     -- Non damaging ability
        class = "MAGE",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 500,              -- I set 300 previously. Does it scale with LVups ?
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["POLYMORPH"] = {     -- Non damaging ability
        class = "MAGE",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 4,
                -- Unknown.
                [1] = 0,
                [2] = 0,
                [3] = 0,
                [4] = 0,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "LOCAL",
        }
    },

    -- Paladin abilities

    ["HOLY_SHIELD"] = {
        class = "PALADIN",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 1.35,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["HAMMER_OF_JUSTICE"] = {     -- Non damaging ability
        class = "PALADIN",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 3,
                -- Confirmed
                [1] = 15,
                [2] = 50,
                [3] = 80,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["RIGHTEOUS_DEFENSE"] = {     -- Non damaging ability
        class = "PALADIN",
        effect = {
            type = "DEFENSIVE_TAUNT",
            value = "RIGHTEOUS_DEFENSE",
            hasAmount = nil,
            checkMiss = nil,
            delay = 1.500, -- The use of delay here is special: it's the time "righteous defense debuff applied on X." combat events will have to apparear
        }                  -- in order to make DTM consider X was taunted by the paladin.
    },

    -- Priest abilities

    ["BINDING_HEAL"] = {
        class = "PRIEST",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 0.50,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET_GLOBAL_SPLIT",
        }
    },
    ["HOLY_NOVA"] = {
        class = "PRIEST",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["SHADOWGUARD"] = {
        class = "PRIEST",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["REFLECTIVE_SHIELD"] = {
        class = "PRIEST",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["CHASTISE"] = {
        class = "PRIEST",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 0.50,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["MIND_SOOTHE"] = {     -- Non damaging ability
        class = "PRIEST",
        effect = {
            type = "NULL",
            hasAmount = nil,
            detection = "UNIVERSAL",
        },
    },
    ["MIND_CONTROL"] = {     -- Non damaging ability
        class = "PRIEST",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 3,
                -- Guessed
                [1] = 1500,
                [2] = 3000,
                -- Confirmed
                [3] = 5500,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "LOCAL",
        }
    },
    ["POWER_WORD_SHIELD"] = {     -- Non damaging ability
        class = "PRIEST",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 12,
                -- Confirmed
                [1] = 20,
                [2] = 45,
                [3] = 80,
                [4] = 120,
                [5] = 150,
                [6] = 190,
                [7] = 240,
                [8] = 300,
                [9] = 380,
                [10] = 470,
                [11] = 575,
                [12] = 660,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "TARGET_GLOBAL_SPLIT",
            detection = "UNIVERSAL",
        }
    },
    ["MIND_VISION"] = {     -- Non damaging ability
        class = "PRIEST",
        effect = {
            type = "NULL",
            hasAmount = nil,
            detection = "UNIVERSAL",
        },
    },

    -- Rogue abilities

    ["FEINT"] = {     -- Non damaging ability
        class = "ROGUE",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 6,
                -- Confirmed
                [1] = -150,
                [2] = -240,
                [3] = -390,
                [4] = -600,
                [5] = -800,
                [6] = -1050,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["SAP"] = {     -- Non damaging ability
        class = "ROGUE",
        effect = {
            type = "NULL",
            hasAmount = nil,
            detection = "UNIVERSAL",
        },
    },
    ["BLIND"] = {     -- Non damaging ability
        class = "ROGUE",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,                  -- Unknown.
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["ANESTHETIC_POISON"] = {     -- Damaging ability that does not generate any threat
        class = "ROGUE",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 0.00,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },

    -- Shaman abilities

    ["FROST_SHOCK"] = {
        class = "SHAMAN",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 2.00,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["NATURE_GUARDIAN"] = {
        class = "SHAMAN",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 0.90,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            instantCoeff = 0.00,       -- The self heal causes no threat in itself.
            owner = "ACTOR", -- "TARGET" would be the same unit in this case, as it is a self-heal.
            relative = "ACTOR_GLOBAL", -- It's only on the attacking NPC, not ALL NPCs that have the shaman on their threat list. Oh well.
        }                              -- The extra coding isn't probably worth it, and it wouldn't be 100% accurate neverthelesS.
    },
    ["PURGE"] = {     -- Non damaging ability
        class = "SHAMAN",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,                  -- Unknown.
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    -- Note: Lightning Overload is handled in talents.lua.

    -- Warlock abilities

    ["SEARING_PAIN"] = {
        class = "WARLOCK",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 2.00,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["SOULSHATTER"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 0.50,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            delay = 0.250, -- Delayed abilities create an event. During the delay, received MISS message will deduct the target that resisted
        }                  -- from the list of the entities that will get affected.
    },
    ["CURSE_OF_SHADOW"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 3,
                -- Confirmed
                [1] = 45,
                [2] = 55,
                [3] = 65,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["CURSE_OF_ELEMENTS"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 4,
                -- Confirmed
                [1] = 30,
                [2] = 45,
                [3] = 60,
                [4] = 70,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["CURSE_OF_WEAKNESS"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 8,
                -- Confirmed
                [1] = 4,
                [2] = 12,
                [3] = 22,
                [4] = 32,
                [5] = 40,
                [6] = 50,
                [7] = 60,
                [8] = 70,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["CURSE_OF_RECKLESSNESS"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 5,
                -- Confirmed
                [1] = 15,
                [2] = 30,
                [3] = 40,
                [4] = 55,
                [5] = 70,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["CURSE_OF_TONGUES"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 2,
                -- Confirmed
                [1] = 25,
                [2] = 50,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["FEAR"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 3,
                -- Confirmed
                [1] = 8,
                [2] = 32,
                [3] = 55,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "LOCAL",
        }
    },
    ["BANISH"] = {     -- Non damaging ability
        class = "WARLOCK",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 2,
                -- Confirmed
                [1] = 55,
                [2] = 95,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "LOCAL",
        }
    },
    ["LIFE_TAP"] = {
        class = "WARLOCK",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["HEAL:SIPHON_LIFE"] = {     -- Healing portion doesn't cause threat.
        class = "WARLOCK",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["HEAL:DRAIN_LIFE"] = {     -- Healing portion doesn't cause threat.
        class = "WARLOCK",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["HEAL:DEATH_COIL"] = {     -- Healing portion doesn't cause threat.
        class = "WARLOCK",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },
    ["DRAIN_MANA"] = {
        class = "WARLOCK",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },

    -- Warrior abilities

    ["CLEAVE"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 6,
                -- Guessed
                [1] = 20 / 2,
                [2] = 40 / 2,
                [3] = 60 / 2,
                [4] = 80 / 2,
                -- Confirmed
                [5] = 100 / 2,
                [6] = 130 / 2,      -- It should be divided. We assume we've always 2 targets hit.
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["DEVASTATE"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = function(sourcePtr, targetPtr, abilityRank)     -- Hurrah for the first function ! =P
                        local value = 120;
                        local there, rank, count, timeLeft = DTM_Unit_SearchEffect(targetPtr, "SUNDER_ARMOR");
                        if ( there and count ) and ( count >= 1 ) then
                            value = 120 + (count-1)*15;
                            if ( sourcePtr and targetPtr ) then
                                -- DTM_Trace("THREAT_EVENT", "[%s] used Devastate on [%s]. Sunder armor stacked %d time(s) => Base threat value: %d", 1, UnitName(sourcePtr), UnitName(targetPtr), count, value); 
                            end
                        end
                        return value;
                    end,
            -- value = 180,            -- Old bad implementation x]
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["DISARM"] = {     -- Non damaging ability
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 105,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            checkMiss = 1,
            detection = "UNIVERSAL",
        }
    },
    ["HAMSTRING"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 4,
                -- Guessed
                [1] = 45,
                [2] = 85,
                [3] = 130,
                -- Confirmed
                [4] = 180,
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["HEROIC_STRIKE"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 10,
                -- Guessed
                [1] = 5,
                [2] = 25,
                [3] = 45,
                [4] = 65,
                [5] = 85,
                [6] = 105,
                [7] = 125,
                -- Confirmed
                [8] = 145,
                [9] = 175,
                [10] = 195,
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["REVENGE"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 8,
                -- Guessed
                [1] = 30,
                [2] = 50,
                [3] = 70,
                [4] = 90,
                [5] = 110,
                [6] = 130,
                [7] = 160,
                -- Confirmed
                [8] = 200,
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["SHIELD_BASH"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 4,
                -- Guessed
                [1] = 110,
                [2] = 140,
                -- Confirmed
                [3] = 180,
                [4] = 230,
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["SHIELD_SLAM"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 6,
                -- Guessed
                [1] = 160,
                [2] = 190,
                [3] = 220,
                -- Confirmed
                [4] = 250,
                [5] = 280,
                [6] = 310,
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["SUNDER_ARMOR"] = {     -- Non damaging ability
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 6,
                -- Confirmed
                [1] = 50,
                [2] = 105,
                [3] = 160,
                [4] = 210,
                [5] = 260,
                [6] = 300,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            checkMiss = 1,
            detection = "UNIVERSAL",
        }
    },
    ["THUNDER_CLAP"] = {
        class = "WARRIOR",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 1.75,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["EXECUTE"] = {
        class = "WARRIOR",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 1.25,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["TAUNT"] = {     -- Non damaging ability
        class = "WARRIOR",
        effect = {
            type = "TAUNT",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["MOCKING_BLOW"] = {
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 6,
                -- Guessed
                [1] = 60,
                [2] = 90,
                [3] = 130,
                [4] = 180,
                [5] = 230,
                -- Confirmed
                [6] = 290,
            },
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["DEMORALIZING_SHOUT"] = {     -- Non damaging ability
        class = "WARRIOR",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 55,               -- The threat should be split among all targets that got hit with the effect. But it shouldn't be much of a concern,
            target = "THREAT_LEVEL",  -- as the threat this ability generates is very low.
            hasAmount = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            delay = 0.250, -- Delayed abilities create an event. During the delay, received MISS message will deduct the target that resisted
        }                  -- from the list of the entities that will get affected.
    },

    -- Pets abilities

    ["PET_COWER"] = {     -- Non damaging ability
        class = "PET",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 7,
                -- Confirmed
                [1] = -30,
                [2] = -55,
                [3] = -85,
                [4] = -125,
                [5] = -175,
                [6] = -225,
                [7] = -260,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["PET_GROWL"] = {     -- Non damaging ability
        class = "PET",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {               -- Threat scales with pet's AP. Oh well...
                numRanks = 8,
                -- Minimal values
                [1] = 50,
                [2] = 65,
                [3] = 110,
                [4] = 170,
                [5] = 240,
                [6] = 320,
                [7] = 415,
                [8] = 665,
            },
            scaling = {
                minAPConstant = -1235.6,
                minAPGradient = 28.14,
                threatPerAP = 5.7,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["PET_ANGUISH"] = {     -- Non damaging ability
        class = "PET",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 3,
                -- Confirmed
                [1] = 300,
                [2] = 395,
                [3] = 630,
            },
            scaling = {
                minAPConstant = 109,
                minAPGradient = 0,
                threatPerAP = 0.698,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["PET_TORMENT"] = {     -- Non damaging ability
        class = "PET",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 7,
                -- Confirmed
                [1] = 45,
                [2] = 75,
                [3] = 125,
                [4] = 215,
                [5] = 300,
                [6] = 395,
                [7] = 630,
            },
            scaling = {
                minAPConstant = 123,
                minAPGradient = 0,
                threatPerAP = 0.385,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["PET_SUFFERING"] = {     -- Non damaging ability
        class = "PET",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 6,
                -- Confirmed
                [1] = 150,
                [2] = 300,
                [3] = 450,
                [4] = 600,
                [5] = 645,
                [6] = 885,
            },
            scaling = {
                minAPConstant = 124,
                minAPGradient = 0,
                threatPerAP = 0.547,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["PET_SOOTHING_KISS"] = {     -- Non damaging ability
        class = "PET",
        effect = {
            type = "ADDITIVE_THREAT",
            value = {
                numRanks = 5,
                -- Confirmed
                [1] = -45,
                [2] = -75,
                [3] = -125,
                [4] = -165,
                [5] = -275,
            },
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
        }
    },
    ["PET_IMPROVED_LEADER_OF_THE_PACK"] = { -- Can be triggered if a pet is buffed with a feral druid's aura.
        class = "PET",
        effect = {
            type = "NULL",
            hasAmount = 1,
        }
    },

    -- Items "On use" / "On hit" abilities. Most of which are non-damaging.

    ["BLACK_AMNESTY"] = {
        class = "ITEM",
        effect = {
            type = "ADDITIVE_THREAT",
            value = -540,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },
    ["GRACE_OF_EARTH"] = {
        class = "ITEM",
        effect = {
            type = "ADDITIVE_THREAT",
            value = -650,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            detection = "UNIVERSAL",
        }
    },
    ["HYPNOTIST_WATCH"] = {
        class = "ITEM",
        effect = {
            type = "ADDITIVE_THREAT",
            value = -720,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            detection = "UNIVERSAL",
        }
    },
    ["MUCK_COVERED_DRAPE"] = {
        class = "ITEM",
        effect = {
            type = "ADDITIVE_THREAT",
            value = -475,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            detection = "UNIVERSAL",
        }
    },
    ["JEWEL_OF_CHARISMATIC_MYSTIQUE"] = {
        class = "ITEM",
        effect = {
            type = "ADDITIVE_THREAT",
            value = -1075,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            detection = "UNIVERSAL",
        }
    },
    ["TIMELAPSE_SHARD"] = {
        class = "ITEM",
        effect = {
            type = "ADDITIVE_THREAT",
            value = -900,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            detection = "UNIVERSAL",
        }
    },
    ["SHROUDING_POTION"] = {
        class = "ITEM",
        effect = {
            type = "ADDITIVE_THREAT",
            value = -1500,
            target = "THREAT_LEVEL",
            hasAmount = nil,
            checkMiss = nil,
            owner = "ACTOR",
            relative = "ACTOR_GLOBAL",
            detection = "UNIVERSAL",
        }
    },

    ["LIGHTNING_CAPACITOR"] = { -- According to Omen. :)  Threat from the bolt is 0.5x damage.
        class = "ITEM",
        effect = {
            type = "MULTIPLY_THREAT",
            value = 0.5,
            target = "GLOBAL_THREAT",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
            detection = "UNIVERSAL",
        }
    },

    -- INTERNAL ABILITIES (no translation whatsoever, they get called as special cases by the engine)

    ["DEFAULT"] = {
        class = "INTERNAL",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },
    ["DEFAULT_NOAMOUNT"] = {
        class = "INTERNAL",
        effect = {      -- We don't know whether this ability targets an enemy or ally. So we don't take risks.
            type = "NULL",
            hasAmount = nil,
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },
    ["DEFAULT_HEAL"] = {
        class = "INTERNAL",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET_GLOBAL_SPLIT",
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },
    ["AUTOATTACK"] = {
        class = "INTERNAL",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },
    ["PET_DEFAULT"] = {
        class = "INTERNAL",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },
    ["PET_DEFAULT_NOAMOUNT"] = {
        class = "INTERNAL",
        effect = {      -- We don't know whether this ability targets an enemy or ally. So we don't take risks.
            type = "NULL",
            hasAmount = nil,
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },
    ["PET_DEFAULT_HEAL"] = {
        class = "INTERNAL",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET_GLOBAL_SPLIT",
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },
    ["PET_AUTOATTACK"] = {
        class = "INTERNAL",
        effect = {
            type = "ADDITIVE_THREAT",
            value = 0,
            target = "THREAT_LEVEL",
            hasAmount = 1,
            owner = "ACTOR",
            relative = "TARGET",
            checkMiss = nil,
            detection = "UNIVERSAL",
        }
    },

    -- Test/dummy abilities

    -- Removed for normal builds.
};

-- Multiple versions of Polymorph:
DTM_Abilities["POLYMORPH_PIG"] = DTM_Abilities["POLYMORPH"];
DTM_Abilities["POLYMORPH_TURTLE"] = DTM_Abilities["POLYMORPH"];

-- --------------------------------------------------------------------
-- **                        Abilities functions                     **
-- --------------------------------------------------------------------

-- ********************************************************************
-- * DTM_Abilities_GetData(internalName, isHeal)                      *
-- ********************************************************************
-- * Arguments:                                                       *
-- * >> internalName: the internal name of the ability.               *
-- * >> isHeal: flag whether you are interested in the healing        *
-- * portion of the ability or not.                                   *
-- ********************************************************************
-- * Get ability data.                                                *
-- * Returns:                                                         *
-- *   - Class it belongs to (internal name).                         *
-- *   - .effect field of the ability (a table). (See above)          *
-- ********************************************************************
function DTM_Abilities_GetData(internalName, isHeal)
    if ( isHeal ) then
        if ( internalName ) and ( DTM_Abilities["HEAL:"..internalName] ) then
            return DTM_Abilities["HEAL:"..internalName].class, DTM_Abilities["HEAL:"..internalName].effect;
        end
    end

    if ( internalName ) and ( DTM_Abilities[internalName] ) then
        return DTM_Abilities[internalName].class, DTM_Abilities[internalName].effect;
  else
        return "UNKNOWN", nil;
    end
end