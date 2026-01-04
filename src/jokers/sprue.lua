local sprue = SMODS.Joker {
    key = "sprue",
    atlas = "jokers",
    pos = {
        x = 1,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 6,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true
}

sprue.config = {
    extra = {
        cards_left = 30,
        rank_increment = 1
    }
}

sprue.loc_vars = function(self, info_queue, card)
    local config = card.ability.extra

    return {
        vars = { config.cards_left, config.rank_increment }
    }
end

sprue.calculate = function(self, card, context)

    local config = card.ability.extra
    -- occurs after all cards scored
    if context.after and not context.blueprint then
        -- activates for numbered cards in scoring hand
        for k, v in pairs(context.scoring_hand) do
            if config.cards_left > 0 then
                        if v:get_id() < 11 and v:get_id() > 1 then

                            if not context.blueprint then
                                config.cards_left = config.cards_left - 1
                            end

                          -- separare event managers to group each set of animations
                            G.E_MANAGER:add_event(Event({
                                trigger = "after",
                                delay = 0.15,
                                func = function()
                                    play_sound('card1')
                                    v:flip()
                                    v:juice_up(0.3, 0.3)

                                    return true
                                end
                            }))

                            delay(0.2)

                            G.E_MANAGER:add_event(Event({
                                trigger = "after",
                                delay = 0.15,
                                func = function()
                                    assert(SMODS.modify_rank(v, config.rank_increment))
                                    play_sound('tarot2')
                                    v:flip()
                                    v:juice_up(0.3, 0.3)

                                    return true
                                end
                            }))

                            if config.cards_left > 0 and not context.blueprint then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                                    { message = localize {
                                        type = "variable",
                                        key = "a_remaining",
                                        vars = { config.cards_left }
                                    }
                                })
                            end

                            if config.cards_left < 1 and not context.blueprint then
                                SMODS.destroy_cards(card, nil, nil, true)
                                return {
                                    message = localize("j_o_y_used_up"),
                                    colour = G.C.FILTER
                                }
                            end

                        end

            end
        end
    end
end