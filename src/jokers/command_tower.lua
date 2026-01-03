local command_tower = SMODS.Joker {
    key = "command_tower",
    atlas = "jokers",
    pos = {
        x = 2,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

command_tower.config = {
    extra = {
        payout = 4
    }
}

command_tower.loc_vars = function(self, info_queue, card)
    table.insert(info_queue, G.P_CENTERS.m_wild) -- Wildcard tooltip
    local config = card.ability.extra

    return {
        vars = { config.payout }
    }
end

command_tower.calculate = function(self, card, context)
    local config = card.ability.extra

    local valid_round_end = context.end_of_round and not context.game_over
    local at_each_wilcard = context.individual and context.cardarea == G.hand and SMODS.has_enhancement(context.other_card, 'm_wild')

    if valid_round_end and at_each_wilcard then return { dollars = config.payout } end
end

command_tower.in_pool = function(self, args)
    local has_wild = false
    for _, playing_card in ipairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(playing_card, 'm_wild') then
            has_wild = true
            break
        end
    end
    return has_wild
end
