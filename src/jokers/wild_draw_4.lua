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
    blueprint_compat = false,
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
        vars = { config.hand_size, config.current_bonus }
    }
end

wild_draw_4.calculate = function(self, card, context)
    local config = card.ability.extra

    if context.before and context.scoring_hand and not context.blueprint then
        local has_wildcard = false

        for _, scored_card in ipairs(context.scoring_hand) do
            if SMODS.has_enhancement(scored_card, 'm_wild') and not scored_card.debuff then
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

    if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
        local lost_size = config.current_bonus
        G.hand:change_size(-config.current_bonus)
        config.current_bonus = 0
        
        if lost_size > 0 then
            return { message = localize "k_reset" }
        end
    end
end

wild_draw_4.remove_from_deck = function(self, card, from_debuff)
  local config = card.ability.extra
    G.hand:change_size(-config.current_bonus)
end

wild_draw_4.in_pool = function(self, args)
    local has_wild = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(playing_card, 'm_wild') then
            has_wild = true
            break
        end
    end
    return has_wild
end
