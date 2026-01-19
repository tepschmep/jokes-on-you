SMODS.Joker
{
    key = "cosmic_brownie",
    atlas = "jokers",
    pos = {
        x = 6,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            tag_count = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        table.insert(info_queue, G.P_TAGS.tag_orbital )
        local config = card.ability.extra

        return {
            vars = { config.tag_count }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        if context.selling_self then
            -- i'm not using our function for this only because im making one type of tag
            -- some of this is repurposed from Paperback
            for i = 1, config.tag_count do
                local available_hands = {}
                local random_orbital = Tag("tag_orbital", false, "Small")

                for _, k in ipairs(G.handlist) do
                    local hand = G.GAME.hands[k]
                    if hand.visible then
                        available_hands[#available_hands + 1] = k
                    end
                end

                random_orbital.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed("j_o_y_cosmic_brownie"))
                add_tag(random_orbital)
            end
        end
    end
}