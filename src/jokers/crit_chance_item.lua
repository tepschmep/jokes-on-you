SMODS.Joker
{
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
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            xmult = 2,
						numerator = 1,
						denominator = 6
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra
				local num, denom = SMODS.get_probability_vars(card, config.numerator, config.denominator)

        return {
            vars = { config.xmult, num, denom }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.individual and context.cardarea == G.play and SMODS.pseudorandom_probability(card, "j_o_y_crit_chance_item", config.numerator, config.denominator) then
            return { xmult = config.xmult }
        end
    end
}
