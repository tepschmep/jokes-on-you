local crit_chance_item = SMODS.Joker {
    key = "crit_chance_item",
    atlas = "jokers",
    pos = {
        x = 4,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Uncommon
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

crit_chance_item.config = {
    extra = {
        xmult = 2,
				odds = 6
    }
}

crit_chance_item.loc_vars = function(self, info_queue, card)
    local config = card.ability.extra

    return {
        vars = { config.xmult, (G.GAME.probabilities.normal or 1), config.odds }
    }
end

crit_chance_item.calculate = function(self, card, context)
    local config = card.ability.extra
		
		if context.individual and context.cardarea == G.play and pseudorandom('crit_chance_upgrade') < G.GAME.probabilities.normal / config.odds then
				return {xmult = config.xmult}
		end
end
