SMODS.Joker
{
    key = "scratch_art",
    atlas = "jokers",
    pos = {
        x = 6,
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

    in_pool = function(self, args)
        if G.jokers and G.jokers.cards then
            for _, card in ipairs(G.jokers.cards) do
                if card.edition and card.edition.key == 'e_negative' then
                    return true
                end
            end
        end
    end,

    config = {
        extra = {
            x_mult = 1.5
        }
    },

    loc_vars = function(self, info_queue, card)
        table.insert(info_queue, { key = 'e_negative', set = 'Edition', config = { extra = 1 } })
        local config = card.ability.extra

        return {
            vars = { config.x_mult }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.other_joker and context.other_joker.edition and context.other_joker.edition.key == "e_negative" then
            return { xmult = config.x_mult }
        end
    end
}