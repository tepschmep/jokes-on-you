-- Creates a consumable of the specified type. Receives the same argument that SMODS.add_card does.
--
-- Returns true if the consumable was created successfully and false otherwise.
J_O_Y.create_consumable = function(arg)
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

        G.E_MANAGER:add_event(Event {
            func = function()
                SMODS.add_card(arg)
                G.GAME.consumeable_buffer = 0
                return true
            end
        })

        return true
    end

    return false
end

-- Creates a specified amount of tags whose keys satisfies the provided predicate.
--
-- Receives one table argument with fields "amount" and "predicate", which receives the current tag key as an argument.
-- These are optional and default to 1 and () -> true, respectively.
--
-- Returns a list of all tags created.
J_O_Y.create_tag = function(arg)
    local amount = arg and arg.amount or 1
    local predicate = arg and arg.predicate or function () return true end

    local tags = {}
    local tag_key
    for i = 1, amount do
        repeat tag_key = get_next_tag_key() until predicate(tag_key)

        tags[i] = Tag(tag_key)
        add_tag(tags[i])
    end

    return tags
end
