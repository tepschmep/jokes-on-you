local sunday_comic = SMODS.Joker {
    key = "sunday_comic",
    atlas = "jokers",
    pos = {
        x = 8,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 1, --Common
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
		config = {
				extra = {
						tag_amount = 2
				}
		},
		loc_vars = function(self, info_queue, card)
				return {vars = {card.ability.extra.tag_amount}}
		end
}

sunday_comic.calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind:get_type() == 'Small' then
        local tag_key

				for i=1, card.ability.extra.tag_amount do
						repeat
								tag_key= get_next_tag_key()
						until tagkey ~= "tag_boss" and tag_key ~= "tag_orbital"

						-- poential TODO: orbital tags can be added but it takes a fair bit to do
						-- ifyou wanna go for it, reference Pity Prize from Cryptid
						add_tag(Tag(tag_key))
				end

        return {
            message = localize {type = "variable", key = "v_j_o_y_plus_tag", vars = {card.ability.extra.tag_amount}},
            colour = G.C.FILTER
        }
    end
end