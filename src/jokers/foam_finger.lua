SMODS.Joker
{
    key = "foam_finger",
    atlas = "jokers",
    pos = {
        x = 7,
        y = 0
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
            hands = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.hands }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        local config = card.ability.extra

        G.GAME.round_resets.hands = G.GAME.round_resets.hands + config.hands
    end,

    remove_from_deck = function(self, card, from_debuff)
        local config = card.ability.extra

        G.GAME.round_resets.hands = G.GAME.round_resets.hands - config.hands
    end
}
