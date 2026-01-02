local jimbazzaro = SMODS.Joker {
    key = "jimbazzaro",
    atlas = "jokers",
    pos = {
        x = 2,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

jimbazzaro.calculate = function(self, card, context)
    if context.reroll_shop then
        -- TODO figure out how to generate a random Tarot card
    end
end
