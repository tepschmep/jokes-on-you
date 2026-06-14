SMODS.Joker
{
    key = "spectronomicon",
    atlas = "jokers",
    pos = {
        x = 8,
        y = 2
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    --[[ config = {
        extra = {
            ...
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { ... }
        }
    end, ]]

    calculate = function(self, card, context)
        -- local config = card.ability.extra
        local other_joker_sold = context.selling_card and context.card.ability.set == "Joker" and context.card ~= card

                if other_joker_sold and not context.card:is_rarity(1) and J_O_Y.create_consumable{ set = "Spectral" } then
                    return {
                        message = localize "k_plus_spectral",
                        colour = G.C.SECONDARY_SET.Spectral,
                        message_card = card
                    }
                end
    end
}