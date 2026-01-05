local macaroni_art = SMODS.Joker {
    key = "macaroni_art",
    atlas = "jokers",
    pos = {
        x = 4,
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

macaroni_art.config = {
    extra = {
        xmult = 3
    }
}

macaroni_art.loc_vars = function(self, info_queue, card)
    local config = card.ability.extra

    return {
        vars = { config.xmult }
    }
end

macaroni_art.calculate = function(self, card, context)
    local config = card.ability.extra

    local at_single_played_card = context.individual and context.cardarea == G.play and #context.scoring_hand == 1

    if at_single_played_card then
        local is_numbered_diamond = context.other_card:get_id() < 11 and context.other_card:get_id() > 1 and context.other_card:is_suit("Diamonds")

        if is_numbered_diamond then return { xmult = config.xmult } end
    end
end
