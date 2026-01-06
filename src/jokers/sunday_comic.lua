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
        local tag_key = ""

        if context.setting_blind and G.GAME.blind:get_type() == "Small" then
	        for i = 1, config.tag_amount do
                repeat
                    tag_key = get_next_tag_key()
		        until tag_key ~= "tag_boss" and tag_key ~= "tag_orbital"
    
                add_tag(Tag(tag_key))
            end

		-- potential TODO: orbital tags can be added but it takes a fair bit to do
		-- if you wanna go for it, reference Pity Prize from Cryptid
        
        return {
            message = localize { type = "variable", key = "v_j_o_y_plus_tag", vars = { config.tag_amount } },
            colour = G.C.FILTER
        }
        end
    end
}
