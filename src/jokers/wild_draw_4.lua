local wild_draw_4 = SMODS.Joker {
    key = "wild_draw_4",
    atlas = "jokers",
    pos = {
        x = 5,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

wild_draw_4.config = {
    extra = {
        hand_size = 1,
        current_bonus = 0
    }
}

wild_draw_4.loc_vars = function(self, info_queue, card)
    table.insert(info_queue, G.P_CENTERS.m_wild) -- Wildcard tooltip
    local config = card.ability.extra

    return {
        vars = { config.hand_size }
    }
end

wild_draw_4.calculate = function(self, card, context)
    local config = card.ability.extra

    if context.after and context.scoring_hand then
        local has_wildcard = false

        for _, scored_card in ipairs(context.scoring_hand) do
            if SMODS.has_enhancement(scored_card, 'm_wild') then
                has_wildcard = true
                break
            end
        end

        if has_wildcard then
            config.current_bonus = config.current_bonus + config.hand_size
            G.hand:change_size(config.hand_size)

            return {
                message = localize { type = "variable", key = "a_handsize", vars = { config.hand_size } }
            }
        end
    end

    if context.end_of_round and not context.game_over and context.main_eval then
        G.hand:change_size(-config.current_bonus)
    end
end

wild_draw_4.remove_from_deck = function(self, card, from_debuff)
    G.hand:change_size(-config.current_bonus)
end
