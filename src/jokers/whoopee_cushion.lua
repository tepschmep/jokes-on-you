SMODS.Joker
{
    key = "whoopee_cushion",
    atlas = "jokers",
    pos = {
        x = 8,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            triggering_rank = "Ace",
            tag = "double"
        }
    },

    loc_vars = function(self, info_queue, card)
        table.insert(info_queue, { key = 'tag_double', set = 'Tag' } )
        local config = card.ability.extra

        return {
            vars = {
                config.triggering_rank,
                config.tag:gsub("^%l", string.upper) -- capitalized tag name
            }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.destroy_card and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then

            if context.destroying_card.base.value == config.triggering_rank then

                J_O_Y.create_tag {
                    predicate = function(tag_key)
                        return tag_key == "tag_" .. config.tag
                    end
                }

                return {
                    message = localize "j_o_y_fart",
                    remove = true
                }
            end
        end
    end
}
