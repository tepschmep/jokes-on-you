SMODS.Joker
{
    key = "heads_or_tails",
    atlas = "jokers",
    pos = {
        x = 3,
        y = 2
    },
	soul_pos = {
		x = 4,
		y = 2
	},
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 9,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            denom_mod = 2,
			numerator = 1,
			denominator = 2,
			money_set = 25
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra
		local num, denom = SMODS.get_probability_vars(card, config.numerator, config.denominator)

        return {
            vars = { config.denom_mod, num, denom, config.money_set }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.mod_probability and not context.blueprint then
			return { denominator = config.denom_mod }
		end

		if context.end_of_round and not context.blueprint and not context.game_over and context.main_eval and SMODS.pseudorandom_probability(card, "j_o_y_heads_or_tails", config.numerator, config.denominator) then
			if G.GAME.dollars + (G.GAME.dollar_buffer or 0) ~= config.money_set then
				G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) - G.GAME.dollars + config.money_set
				return {
					dollars = -G.GAME.dollars + config.money_set,
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
							    G.GAME.dollar_buffer = 0
							    return true
							end
						}))
					end
				}
			end
		end
    end
}