-- Returns a random hand that satisfies the specified (optional) predicate.
--
-- predicate receives the hand name as an argument.
J_O_Y.get_random_hand = function(arg)
    local predicate = arg and arg.predicate or function(hand) return true end

    local hand
    repeat
        hand = pseudorandom_element(SMODS.PokerHands, "j_o_y_random_hand").key
    until predicate(hand)

    return hand
end

-- returns a table containing data related to the occurrences of a specified property in the deck
--
-- if weighted == true, returns a list with every occurrence, allowing duplicates
-- else, returns a set with each unique occurrence
local function _get_props_in_deck(arg)
    local props_in_deck = {}

    for _, card in ipairs(G.playing_cards) do
        if arg.weighted then
            if arg.prop_checker(card) then table.insert(props_in_deck, arg.prop_getter(card)) end
        else
            props_in_deck[arg.prop_getter(card)] = true
        end
    end

    return props_in_deck
end

-- (internal usage only) gets a random card property that abides by a specified predicate
--
-- weighted => should the quantity of occurrences of said property in deck to be accounted for?
-- prop_checker => check to see if the card can be counted as having that property
-- prop_getter => how to get that property from the card
-- prop_values => list of all values for said property
local function _get_random_prop(arg)
    local props_in_deck = _get_props_in_deck {
        weighted = arg.weighted,
        prop_checker = arg.prop_checker,
        prop_getter = arg.prop_getter
    }

    if arg.weighted and #props_in_deck == 0 then
        props_in_deck = _get_props_in_deck {
            weighted = false, -- disregard weighted
            prop_checker = arg.prop_checker,
            prop_getter = arg.prop_getter
        }

        arg.weighted = false
    end

    local prop
    repeat
        local in_deck
        if arg.weighted then
            prop = pseudorandom_element(props_in_deck, "j_o_y_random")
            in_deck = true
        else
            prop = pseudorandom_element(arg.prop_values, "j_o_y_random").key
            in_deck = props_in_deck[prop]
        end
    until arg.predicate(prop, in_deck)

    return prop
end

-- Returns a random rank that satisfies the specified (optional) predicate.
--
-- Set weighted = true to take into account the quantity of each rank in deck when generating a random one.
-- If there are no weights to account for (ie. the deck has no cards with ranks), this parameter is disregarded.
--
-- predicate receives the rank name and whether or not it is in the current deck as arguments.
-- When weighted == true, the ranks are always in deck.
J_O_Y.get_random_rank = function(arg)
    local weighted = arg and arg.weighted
    local predicate = arg and arg.predicate or function (rank, in_deck) return true end

    return _get_random_prop {
        prop_values = SMODS.Ranks,
        prop_checker = function (card)
            return not SMODS.has_no_rank(card)
        end,
        prop_getter = function(card)
            return card.base.value
        end,
        weighted = weighted,
        predicate = predicate
    }
end

-- Returns a random suit that satisfies the specified (optional) predicate.
--
-- Set weighted = true to take into account the quantity of each suit in deck when generating a random one.
-- If there are no weights to account for (ie. the deck has no cards with suits), this parameter is disregarded.
--
-- predicate receives the suit name and whether or not it is in the current deck as arguments.
-- When weighted == true, the suits are always in deck.
J_O_Y.get_random_suit = function(arg)
    local weighted = arg and arg.weighted
    local predicate = arg and arg.predicate or function(suit, in_deck) return true end

    return _get_random_prop {
        prop_values = SMODS.Suits,
        prop_checker = function (card)
            return not SMODS.has_no_suit(card)
        end,
        prop_getter = function(card)
            return card.base.suit
        end,
        weighted = weighted,
        predicate = predicate
    }
end
