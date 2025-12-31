SMODS.Atlas {
    key = "jokers",
    path = "jokers.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "paddleball",
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 2,
    discovered = true,
    config = { extra = { xmult_per_reroll = 0.5, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_per_reroll, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        local ex = card.ability.extra

        if context.starting_shop then
            local lost_xmult = ex.xmult - 1
            ex.xmult = 1

            if lost_xmult > 0 then return { message = localize "k_reset" } end
        end

        if context.reroll_shop then
            ex.xmult = ex.xmult + ex.xmult_per_reroll

            return {
                message = localize { type = "variable", key = "a_xmult", vars = { ex.xmult_per_reroll } },
                colour = G.C.RED
            }
        end

        if context.joker_main then return { xmult = ex.xmult } end
    end
}

SMODS.Joker {
    key = "jimbazzaro",
    atlas = "jokers",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 3, y = 0 },
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.reroll_shop then
            -- TODO figure out how to generate a random Tarot card
        end
    end
}

SMODS.Joker {
    key = "macaroni_art",
    atlas = "jokers",
    pos = { x = 4, y = 0 },
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    config = { extra = { xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        local ex = card.ability.extra

        if context.joker_main and #context.scoring_hand == 1 then
            local played_card = context.scoring_hand[1].base

            if played_card.id < 11 and played_card.suit == "Diamonds" then return { xmult = ex.xmult } end
        end
    end
}
