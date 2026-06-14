SMODS.Joker
{
    key = "bermuda_triangle",
    atlas = "jokers",
    pos = {
        x = 10,
        y = 2
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    calculate = function(self, card, context)
        -- TODO: add more effects to card, like a juice up on destroy
        if context.destroy_card and context.scoring_name == "Three of a Kind" and context.cardarea == "unscored" then
            return {
                remove = true
            }
        end
    end
}