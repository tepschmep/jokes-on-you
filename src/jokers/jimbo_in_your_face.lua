local jimbo_in_your_face = SMODS.Joker {
    key = "jimbo_in_your_face",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

jimbo_in_your_face.config = {
    extra = {
        mult = 40
    }
}

jimbo_in_your_face.loc_vars = function(self, info_queue, card)
    local config = card.ability.extra

    return {
        vars = { config.mult }
    }
end

jimbo_in_your_face.calculate = function(self, card, context)
    local config = card.ability.extra

	if context.joker_main then return { mult = config.mult } end
end
