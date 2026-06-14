SMODS.Joker
{
    key = "conspiracy_theorist",
    atlas = "jokers",
    pos = {
        x = 11,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            planet_count = 0,
            planet_trigger = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.planet_count, config.planet_trigger }
        }
    end, 

    calculate = function(self, card, context)
        local config = card.ability.extra
        
        if context.using_consumeable and context.consumeable.ability.set == "Planet" then
            config.planet_count = config.planet_count + 1
            if config.planet_count == config.planet_trigger and J_O_Y.create_consumable{ set = "Spectral" } then
                config.planet_count = 0
                return {
                    message = localize "k_plus_spectral",
                    colour = G.C.SECONDARY_SET.Spectral,
                    message_card = card
                }
            elseif config.planet_count ~= config.planet_trigger then
                return {
                    message = config.planet_count .. "/" ..config.planet_trigger,
                    colour = G.C.FILTER
                }
            end
        end
    end
}