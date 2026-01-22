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
    blueprint_compat = true,
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

        if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            local played_card = context.full_hand[1]

            if played_card.base.value == config.triggering_rank then
                SMODS.destroy_cards(context.full_hand)

                J_O_Y.create_tag {
                    predicate = function(tag_key)
                        return tag_key == "tag_" .. config.tag
                    end
                }

                return { message = localize "j_o_y_fart" }
            end
        end
    end
}
