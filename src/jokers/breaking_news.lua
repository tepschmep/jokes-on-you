SMODS.Joker
{
    key = "breaking_news",
    atlas = "jokers",
    pos = {
        x = 11,
        y = 2
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    calculate = function(self, card, context)
        -- TODO: cards scoring show "Extra!" on played bonus / mult cards
        -- TODO: fix timing of tag appearing

        local has_bonus = false 
        local has_mult = false


        if context.joker_main then
            for _, played_card in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(played_card, "m_bonus") then
                    has_bonus = true
                end
                if SMODS.has_enhancement(played_card, "m_mult") then
                    has_mult = true
                end
            end

            if has_bonus and has_mult then
                J_O_Y.create_tag {
                    amount = 1,
                    predicate = function(tag_key)
                        return tag_key ~= "tag_boss"
                    end
			    }
                return {
                    message = localize { type = "variable", key = "v_j_o_y_plus_tag", vars = {1} },
                    colour = G.C.FILTER
                }
            end
        end
    end

}