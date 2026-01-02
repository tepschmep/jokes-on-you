local paddleball = SMODS.Joker {
    key = "paddleball",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

paddleball.config = {
    extra = {
        xmult = 1,
        xmult_per_reroll = 0.5
    }
}

paddleball.loc_vars = function(self, info_queue, card)
    local config = card.ability.extra

    return {
        vars = {
            config.xmult_per_reroll,
            config.xmult
        }
    }
end

paddleball.calculate = function(self, card, context)
    local config = card.ability.extra

    if context.starting_shop and not context.blueprint then
        local lost_xmult = config.xmult - 1
        config.xmult = 1

        if lost_xmult > 0 then
            return {
                message = localize "k_reset",
                colour = G.C.MULT
            }
        end
    end

    if context.reroll_shop and not context.blueprint then
        config.xmult = config.xmult + config.xmult_per_reroll

        return {
            message = localize { type = "variable", key = "a_xmult", vars = { config.xmult } },
            colour = G.C.MULT
        }
    end

    if context.joker_main then return { xmult = config.xmult } end
end
