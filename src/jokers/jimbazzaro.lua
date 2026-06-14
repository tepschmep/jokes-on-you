SMODS.Joker
{
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
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    calculate = function(self, card, context)
        if context.reroll_shop and J_O_Y.create_consumable { set = "Tarot" } then
            return {
                message = localize "k_plus_tarot",
                colour = G.C.PURPLE,
                card = card
            }
        end
    end
}
