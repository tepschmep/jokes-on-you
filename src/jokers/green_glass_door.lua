SMODS.Joker
{
    key = "green_glass_door",
    atlas = "jokers",
    pos = {
        x = 7,
        y = 1
    },
    pixel_size = { w = 57 },
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
            chips = 75,
            rank_share = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.chips, config.rank_share }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.individual and context.cardarea == G.play and not context.other_card.has_no_rank then
            local current_rank = context.other_card:get_id()
            local share_count = 0

            for _, played_card in pairs(context.scoring_hand) do
                
                if played_card:get_id() == current_rank and played_card ~= context.other_card then
                    share_count = share_count + 1
                end
                
            end

            if share_count == 1 then return { chips = config.chips } end

        end
    end
}