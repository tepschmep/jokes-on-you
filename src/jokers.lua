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
    cost = 8,
    blueprint_compat = true,
    config = { extra = { xmult_per_reroll = 0.5, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_per_reroll, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        local ex = card.ability.extra

        if context.starting_shop and not context.blueprint then
            local lost_xmult = ex.xmult - 1
            ex.xmult = 1

            if lost_xmult > 0 then return { message = localize "k_reset", colour = G.C.MULT } end
        end

        if context.reroll_shop and not context.blueprint then
            ex.xmult = ex.xmult + ex.xmult_per_reroll

            return {
                message = localize { type = "variable", key = "a_xmult", vars = { ex.xmult } },
                colour = G.C.MULT
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
    cost = 4,
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
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    config = { extra = { xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        local ex = card.ability.extra

        if context.individual and context.cardarea == G.play and #context.scoring_hand == 1 then
            if context.other_card:get_id() < 11 and context.other_card:is_suit("Diamonds") then return { xmult = ex.xmult } end
        end
    end
}

SMODS.Joker {
    key = "down_the_drain",
    atlas = "jokers",
    pos = {x = 11, y = 0},
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    config = {extra = {d_size = 1}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.d_size}}
    end,
    calculate = function(self, card, context)
        if context.pre_discard then
            local _, _, poker_hands = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            if next(poker_hands["Flush"]) then
                ease_discard(card.ability.extra.d_size)
                return {
                    message = "Flushed!",
                    colour = G.C.BLUE
                }
            end
        end
    end
}

SMODS.Joker {
    key = "command_tower",
    atlas = "jokers",
    pos = {x = 2, y = 1},
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    config = {extra = {payout = 4}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.payout}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and context.individual and context.cardarea == G.hand and SMODS.has_enhancement(context.other_card, 'm_wild') then
            return {dollars = card.ability.extra.payout}
        end
    end
}
