SMODS.Joker
{
    key = "search_and_find",
    atlas = "jokers",
    pos = {
        x = 5,
        y = 2
    },
    unlocked = true,
    discovered = false,
    rarity = 1, -- Common
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    -------------------------

    loc_vars = function(self, info_queue, card)
        local saf_card = G.GAME.current_round.j_o_y_search_and_find_card or { rank = "Ace", suit = "Spades" }

        return {
            vars = {
                localize( saf_card.rank, "ranks" ),
                localize( saf_card.suit, "suits_plural" ),
                colours = { G.C.SUITS[saf_card.suit] }
            }
        }
    end,

    calculate = function(self, card, context)
        local saf_card = G.GAME.current_round.j_o_y_search_and_find_card

        if context.individual and context.cardarea == G.play and context.other_card:get_id() == saf_card.id and context.other_card:is_suit(saf_card.suit) then

            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

                return {
                    message = localize "k_plus_tarot",
                    colour = G.C.PURPLE,
                    message_card = card,
                    func = function()
                        G.E_MANAGER:add_event(Event {
                            trigger = "before",
                            func = function()
                                SMODS.add_card { set = "Tarot" }
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        })
                    end
                }
            end

        end   
    end
}

local function reset_j_o_y_search_and_find_card()
    G.GAME.current_round.j_o_y_search_and_find_card = { rank = "Ace", suit = "Spades" }
    local valid_saf_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
            valid_saf_cards[#valid_saf_cards + 1] = playing_card
        end
    end
    local saf_card = pseudorandom_element(valid_saf_cards, "j_o_y_search_and_find" .. G.GAME.round_resets.ante)
    if saf_card then
        G.GAME.current_round.j_o_y_search_and_find_card.rank = saf_card.base.value
        G.GAME.current_round.j_o_y_search_and_find_card.suit = saf_card.base.suit
        G.GAME.current_round.j_o_y_search_and_find_card.id = saf_card.base.id
    end
end

function SMODS.current_mod.reset_game_globals(run_start)
    reset_j_o_y_search_and_find_card()
end