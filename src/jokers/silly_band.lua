SMODS.Joker
{
    key = "silly_band",
    atlas = "jokers",
    pos = {
        x = 9,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            xmult = 1.5,
            xmult_per_copy = 1.5
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = {
                config.xmult_per_copy,
                config.xmult
            }
        }
    end,
    
    calculate = function(self, card, context)
        local config = card.ability.extra

        if G.jokers then
            local copy_count = 0

            for _, joker in ipairs(G.jokers.cards) do
                if joker.label == card.label then
                    copy_count = copy_count + 1
                end
            end

            config.xmult = config.xmult_per_copy * copy_count
        end

        if context.joker_main then return { xmult = config.xmult } end
    end,

    in_pool = function(self, args)
        return true, { allow_duplicates = next(SMODS.find_card("j_o_y_silly_band")) }
    end
}
