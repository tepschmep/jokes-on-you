local down_the_drain = SMODS.Joker {
    key = "down_the_drain",
    atlas = "jokers",
    pos = {
        x = 11,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

down_the_drain.config = {
    extra = {
        discards = 1
    }
}

down_the_drain.loc_vars = function(self, info_queue, card)
    local config = card.ability.extra

    return {
        vars = { config.discards }
    }
end

down_the_drain.calculate = function(self, card, context)
    if context.pre_discard then
        local _, _, poker_hands = G.FUNCS.get_poker_hand_info(G.hand.highlighted)

        if next(poker_hands["Flush"]) then
            ease_discard(card.ability.extra.discards)

            return {
                message = localize "j_o_y_flushed",
                colour = G.C.BLUE
            }
        end
    end
end
