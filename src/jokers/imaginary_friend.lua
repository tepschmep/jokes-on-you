SMODS.Joker
{
    key = "imaginary_friend",
    atlas = "jokers",
    pos = {
        x = 7,
        y = 2
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            pay_per = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.pay_per, G.jokers and ((G.jokers.config.card_limit - #G.jokers.cards) * config.pay_per) or config.pay_per }
        }
    end,

    calc_dollar_bonus = function(self, card)
        local config = card.ability.extra
        local payout = G.jokers and ((G.jokers.config.card_limit - #G.jokers.cards) * config.pay_per) or config.pay_per

        return payout
    end
}