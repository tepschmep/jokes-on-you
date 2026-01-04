local mini = SMODS.Joker {
		key = "mini",
		atlas = "jokers",
		pos = {
				x = 10,
				y = 1
		},
		unlocked = true,
		discovered = false,
		rarity = 1, --Common
		cost = 4,
		blueprint_compat = true,
		eternal_compat = true,
		perishable_compat = true,

		config = {
				extra = {
						chips = 0,
						plus = 1,
						minus = 1
				}
		},

		loc_vars = function(self, info_queue, card)
				local ex = card.ability.extra
				return { vars = { ex.chips, ex.plus, ex.minus }}
		end,

		calculate = function(self, card, context)
				--TODO: up the speed of discarding to match Ramen

				local ex = card.ability.extra

				if context.discard and not context.blueprint then
						ex.chips = ex.chips + ex.plus
						return {
								message = localize { type = "variable", key = "a_chips", vars = { ex.plus } },
								colour = G.C.CHIPS,
						}
				end

				if context.individual and context.cardarea == G.play and not context.blueprint and ex.chips > 0 then
						ex.chips = ex.chips - ex.minus
						return {
								message = localize { type = "variable", key = "a_chips_minus", vars = { ex.minus } },
								colour = G.C.CHIPS,
								message_card = card
						}
				end

				if context.joker_main then return {chips = card.ability.extra.chips} end
		
		end
}