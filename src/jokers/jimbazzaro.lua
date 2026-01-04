local jimbazzaro = SMODS.Joker {
    key = "jimbazzaro",
    atlas = "jokers",
    pos = {
        x = 2,
        y = 0
    },
    soul_pos = {
        x = 3,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

jimbazzaro.calculate = function(self, card, context)
    if context.reroll_shop then

        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local new_card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'for')
                        new_card:add_to_deck()
                        G.consumeables:emplace(new_card)
                        G.GAME.consumeable_buffer = 0
                    return true
                end)}))

            return {message = localize('k_plus_tarot'), colour = G.C.PURPLE, card = card}
        end

    end
end
