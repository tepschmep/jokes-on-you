SMODS.Joker
{
    key = "trivia_card",
    atlas = "jokers",
    pos = {
        x = 10,
        y = 0
    },
    pixel_size = { w = 65, h = 91 },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    loc_vars = function(self, info_queue, card)
        table.insert(info_queue, G.P_CENTERS.c_wheel_of_fortune) -- Wheel of Fortune tooltip
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        local is_boss_blind = context.setting_blind and G.GAME.blind:get_type() == "Boss"

        if is_boss_blind and J_O_Y.create_consumable { key = "c_wheel_of_fortune" } then
            G.E_MANAGER:add_event(Event {
                func = function()
                    SMODS.calculate_effect(
                        {
                            message = localize "j_o_y_wheel",
                            colour = G.C.PURPLE
                        },
                        context.blueprint_card or card
                    )

                    return true
                end
            })
        end
    end
}


-- old functionality

--trivia_card.add_to_deck = function(self, card, from_debuff)
--    G.E_MANAGER:add_event(Event({
--        func = function()
--            for k, v in pairs(G.I.CARD) do
--                if v.set_cost then v:set_cost() end
--            end
--            return true
--        end
--    }))
--end
--
--trivia_card.remove_from_deck = function(self, card, from_debuff)
--    G.E_MANAGER:add_event(Event({
--        func = function()
--            for k, v in pairs(G.I.CARD) do
--                if v.set_cost then v:set_cost() end
--            end
--            return true
--        end
--    }))
--end
--
--local original_cost = Card.set_cost
--function Card:set_cost()
--    original_cost(self)
--    if next(SMODS.find_card("j_o_y_trivia_card")) then
--        if (self.ability.name == "The Wheel of Fortune") then self.cost = 0 end
--    end
--    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
--    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
--end
