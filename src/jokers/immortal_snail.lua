local immortal_snail = SMODS.Joker {
    key = "immortal_snail",
    atlas = "jokers",
    pos = {
        x = 5,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false
}

immortal_snail.config = {
    eternal = true, -- Always eternal
    extra = {
        xmult = 1,
        xmult_per_hand = 0.25,
        hands_left = 30
    }
}

immortal_snail.loc_vars = function(self, info_queue, card)
    local config = card.ability.extra
    local counter = config.hands_left > 0 and config.hands_left or localize "k_unknown"

    return {
        vars = {
            config.xmult_per_hand,
            config.xmult,
            counter
        }
    }
end

immortal_snail.calculate = function(self, card, context)
    local config = card.ability.extra

    if context.joker_main then return { xmult = config.xmult } end

    if context.after and not context.blueprint then
        local ret = {}

        config.hands_left = config.hands_left - 1

        if config.hands_left > 0 then
            ret.message = localize { type = "variable", key = "a_remaining", vars = { config.hands_left } }
            ret.colour = G.C.RED

            ret.func = function()
                G.E_MANAGER:add_event(Event {   -- Adding the XMult increment into the event queue
                    trigger = "after",          -- This is so the increment only takes effect after all normal jokers have acted...
                    func = function()
                        config.xmult = config.xmult + config.xmult_per_hand
                        return true
                    end
                })
            end
        end

        if config.hands_left == 0 then
            ret.message = localize "j_o_y_you_lose"
            ret.colour = G.C.BLACK

            ret.effect = true
            ret.func = function()
                G.E_MANAGER:add_event(Event {
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then
                            G.STATE = G.STATES.GAME_OVER
                            G.STATE_COMPLETE = false
                        end
                    end
                })
            end
        end

        return ret
    end
end

immortal_snail.in_pool = function(self, args)
    local pull = args.source
    return args and (pull == "sho" or pull == "buf" or pull == "rta")
end
