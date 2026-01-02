local sunday_comic = SMODS.Joker {
    key = "sunday_comic",
    atlas = "jokers",
    pos = {
        x = 8,
        y = 0
    },
    unlocked = true,
    discovered = false,
    rarity = 3, -- Rare
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

sunday_comic.calculate = function(self, card, context)
    if context.setting_blind and G.GAME.blind:get_type() == 'Small' then
        local tag_key
		repeat
			tag_key = get_next_tag_key()
		until tag_key ~= "tag_boss" and tag_key ~= "tag_orbital"

        -- potential TODO: orbital tags can be added but it takes a fair bit to do
        -- if you wanna go for it, reference Pity Prize from Cryptid

        add_tag(Tag(tag_key))

        return {
            message = localize("j_o_y_plus_tag"),
            colour = G.C.FILTER
        }
    end
end