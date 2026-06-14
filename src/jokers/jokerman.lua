SMODS.Joker
{
    key = "jokerman",
    atlas = "jokers",
    pos = {
        x = 9,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            xmult_per_edition = 0.4,
            xmult = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        local edition_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.edition then edition_tally = edition_tally + 1 end
            end
        end

        return {
            vars = {
                config.xmult_per_edition,
                config.xmult + config.xmult_per_edition * edition_tally
            }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra
        if context.joker_main then
            local edition_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.edition then edition_tally = edition_tally + 1 end
            end
            return { 
                xmult = config.xmult + config.xmult_per_edition * edition_tally
            }
        end
    end,

    in_pool = function(self, args)
        local has_edition = false

        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card.edition then
                has_edition = true
                break
            end
        end

        return has_edition
    end
}