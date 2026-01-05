SMODS.Joker
{
    key = "trick_or_treater",
    atlas = "jokers",
    pos = {
        x = 0,
        y = 2
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            mult = 0,
						mult_plus = 1,
						money_loss = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.mult_plus, config.money_loss, config.mult }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

				if context.individual and context.cardarea == G.play and context.other_card:is_face() and not context.blueprint then
						config.mult = config.mult + config.mult_plus

						return {
								extra = {
										message = localize { type = "variable", key = "a_mult", vars = { config.mult_plus } },
										colour = G.C.MULT,
										message_card = card
								},
								dollars = -config.money_loss,
								message_card = card
						}

				end

				if context.joker_main then return { mult = config.mult } end

    end
}