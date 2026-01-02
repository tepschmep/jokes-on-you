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
    blueprint_compat = true,
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
    -- TODO: add sound to accentuate the upgrade
    -- TODO: fix edge case 
    -- playing 10 with blueprint and sprue causes both 
    -- to show upgrade message when only one upgrade is done 

    local config = card.ability.extra
    local upgrade_num = 0
    -- occurs after all cards scored
    if context.after then
        -- activates for numbered cards in scoring hand
        for k, v in pairs(context.scoring_hand) do
            if config.cards_left ~= 0 then
                G.E_MANAGER:add_event(Event {
                trigger = "before", delay = 0.5,
                func = function()
                    if v:get_id() < 11 then
                        v:flip()
                        delay(0.2)
                        assert(SMODS.modify_rank(v, config.rank_increment))
                        delay(0.2)
                        v:flip()
                    end    
                    return true
                end
                })
                if not context.blueprint then
                    config.cards_left = config.cards_left - 1
                end
                upgrade_num = upgrade_num + 1
            end
        end
    end
    if config.cards_left == 0 then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
            message = localize("j_o_y_used_up"),
            colour = G.C.FILTER
        }
    elseif upgrade_num == 1 then
        return {
            message = localize("k_upgrade_ex"),
            colour = G.C.FILTER
        }
    elseif upgrade_num ~= 0 then
        return {
            message = localize("k_upgrade_ex") .. " x" .. upgrade_num,
            colour = G.C.FILTER
        }
    end
end