SMODS.Joker
{
    key = "cosmic_brownie",
    atlas = "jokers",
    pos = {
        x = 6,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            planet_count = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra
        local planet = G.GAME.j_o_y_last_planet
        local label

        if G.GAME.j_o_y_last_planet then
            table.insert(info_queue, planet)
            label = localize { type = "name_text", set = planet.set, key = planet.key }
        else
            label = localize "k_none"
        end

        return {
            vars = { config.planet_count, label }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra
        local planet = G.GAME.j_o_y_last_planet

        if context.selling_self and G.GAME.j_o_y_last_planet then
            for i = 1, config.planet_count do
                J_O_Y.create_consumable { key = planet.key }
            end
        end

    end
}

SMODS.current_mod.calculate = function(self, context)
    if context.using_consumeable and context.consumeable.ability.set == "Planet" then
         G.GAME.j_o_y_last_planet = context.consumeable.config.center
    end
end