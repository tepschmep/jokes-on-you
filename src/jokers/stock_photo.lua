SMODS.Joker
{
    key = "stock_photo",
    atlas = "jokers",
    pos = {
        x = 9,
        y = 2
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            chips = 30
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.chips }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.other_joker and (context.other_joker.config.center.rarity == 1 or context.other_joker.config.center.rarity == "Common") then
            return { chips = config.chips }
        end
    end
}