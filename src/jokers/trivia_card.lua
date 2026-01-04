local trivia_card = SMODS.Joker {
    key = "trivia_card",
    atlas = "jokers",
    pos = {
        x = 10,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true
}

trivia_card.loc_vars = function(self, info_queue, card)
    table.insert(info_queue, G.P_CENTERS.c_wheel_of_fortune) -- Wildcard tooltip
    return {vars = {} }
end

trivia_card.add_to_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
        func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true
        end
    }))
end

trivia_card.remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
        func = function()
            for k, v in pairs(G.I.CARD) do
                if v.set_cost then v:set_cost() end
            end
            return true
        end
    }))
end

local original_cost = Card.set_cost
function Card:set_cost()
    original_cost(self)
    if next(SMODS.find_card("j_o_y_trivia_card")) then
        if (self.ability.name == "The Wheel of Fortune") then self.cost = 0 end
    end
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end