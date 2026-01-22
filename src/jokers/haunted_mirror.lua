SMODS.Joker
{
    key = "haunted_mirror",
    atlas = "jokers",
    pos = {
        x = 6,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    loc_vars = function(self, info_queue, card)
        local label

        if G.j_o_y_last_sold_joker then
            local center = G.j_o_y_last_sold_joker.config.center

            table.insert(info_queue, center)                                            -- Copied joker tooltip
            label = localize { type = "name_text", set = center.set, key = center.key } -- Copied joker name
        else
            label = localize "k_none"
        end

        return {
            vars = { label }
        }
    end,

    calculate = function(self, card, context)
        local can_copy = function (c)
            return c.label ~= card.label and c.config.center.blueprint_compat
        end

        if context.check_eternal and not context.blueprint then
            local can_shake = false

            if G.jokers.highlighted then
           	local selected_card = G.jokers.highlighted[1]
                can_shake = selected_card and can_copy(selected_card)
            end

            if can_shake then card:juice_up(0.25, 0.25) end
        end

        if context.selling_card and can_copy(context.card) then
            G.GAME.j_o_y_last_sold_joker = context.card
        end

        if G.GAME.j_o_y_last_sold_joker then
            local joker = context.blueprint and context.blueprint_copiers_stack[1] or card
            local ret = SMODS.blueprint_effect(joker, G.j_o_y_last_sold_joker, context)
            local ret2 = SMODS.blueprint_effect(joker, G.j_o_y_last_sold_joker, context)

            if ret then
                return SMODS.merge_effects{ ret, ret2 }
            end
        end
    end
}
