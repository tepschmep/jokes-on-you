SMODS.Joker
{
    key = "sunday_comic",
    atlas = "jokers",
    pos = {
        x = 8,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            tag_amount = 2
      	}
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.tag_amount }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        local is_small_blind = context.setting_blind and G.GAME.blind:get_type() == "Small"

        if is_small_blind then
            J_O_Y.create_tag {
                amount = config.tag_amount,
                predicate = function(tag_key)
                    return tag_key ~= "tag_boss"
                end
			}

    		-- potential TODO: orbital tags can be added but it takes a fair bit to do
    		-- if you wanna go for it, reference Pity Prize from Cryptid

            return {
                message = localize { type = "variable", key = "v_j_o_y_plus_tag", vars = { config.tag_amount } },
                colour = G.C.FILTER
            }
        end
    end
}
