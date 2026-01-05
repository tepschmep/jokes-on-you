SMODS.Joker
{
    key = "down_the_drain",
    atlas = "jokers",
    pos = {
        x = 11,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            discards = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.discards }
        }
    end,

    calculate = function(self, card, context)
        if context.pre_discard then
            local _, _, poker_hands = G.FUNCS.get_poker_hand_info(G.hand.highlighted)

            if next(poker_hands["Flush"]) then
                ease_discard(card.ability.extra.discards)

                return {
                    message = localize "j_o_y_flushed",
                    colour = G.C.BLUE
                }
            end
        end
    end
}
