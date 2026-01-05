SMODS.Joker
{
    key = "wild_draw_4",
    atlas = "jokers",
    pos = {
        x = 5,
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
            hand_size = 1,
            current_bonus = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        table.insert(info_queue, G.P_CENTERS.m_wild) -- Wildcard tooltip
        local config = card.ability.extra

        return {
            vars = {
                config.hand_size,
                config.current_bonus
            }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_wild") and not context.blueprint then

            config.current_bonus = config.current_bonus + config.hand_size
            G.hand:change_size(config.hand_size)

          return {
--            swap out above line for below similar line if we're okay with having the hand size calculations happening during scoring instead of before like everything else in the game
--            func = function()
--                G.E_MANAGER:add_event(Event {
--                    func = function()
--                        config.current_bonus = config.current_bonus + config.hand_size
--                        G.hand:change_size(config.hand_size)
--
--                        return true
--                    end
--                })
--            end,
              message = localize { type = "variable", key = "a_handsize", vars = { config.hand_size } },
              message_card = card
          }
        end

        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            local lost_size = config.current_bonus
            G.hand:change_size(-config.current_bonus)
            config.current_bonus = 0

            if lost_size > 0 then
                return { message = localize "k_reset" }
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        local config = card.ability.extra
        G.hand:change_size(-config.current_bonus)
    end,

    in_pool = function(self, args)
        local has_wild = false

        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, "m_wild") then
                has_wild = true
                break
            end
        end

        return has_wild
    end
}
