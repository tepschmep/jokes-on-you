SMODS.Joker
{
    key = "barbeque",
    atlas = "jokers",
    pos = {
        x = 3,
        y = 1
    },
    unlocked = true,
    discovered = false,
    rarity = 2, -- Uncommon
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    config = {
        extra = {
            numerator = 1,
            denominator = 4,
            xmult = 2,
            face_down_cards = {}
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra
        local num, denom = SMODS.get_probability_vars(card, config.numerator, config.denominator)

        return {
            vars = { num, denom, config.xmult }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra

        local is_drawing_card = context.stay_flipped and context.to_area == G.hand

        if not context.blueprint and is_drawing_card and SMODS.pseudorandom_probability(card, "j_o_y_barbeque", config.numerator, config.denominator) then
            return { stay_flipped = true }
        end

        if context.press_play then
            config.face_down_cards = {}

            for _, played_card in ipairs(G.hand.cards) do
                if played_card.facing == "back" then table.insert(config.face_down_cards, played_card) end
            end
        end

        if context.individual and context.cardarea == G.play then
            local is_facing_down = false

            for _, face_down_card in ipairs(config.face_down_cards) do
                if context.other_card == face_down_card then
                    is_facing_down = true
                    break
                end
            end

            if is_facing_down then return { xmult = config.xmult } end
        end
    end
}

