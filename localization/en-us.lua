return {
    descriptions = {
        Back = {},
        Blind = {},
        Edition = {},
        Enhanced = {},
        Joker = {
            j_o_y_paddleball = {
                name = "Paddleball",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "per {C:green}Reroll{} in the last shop",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_o_y_jimbazzaro = {
                name = "Jimbazzaro",
                text = {
                    "Create a {C:tarot}Tarot{} card",
                    "when shop is {C:green}Rerolled{}",
                    "{C:inactive}(Must have room)"
                }
            },
            j_o_y_macaroni_art = {
                name = "Macaroni Art",
                text = {
                    "If scoring hand is a single",
                    "{C:attention}numbered{} {C:diamonds}Diamond{} card,",
                    "it gives {X:mult,C:white}X#1#{} Mult"
                }
            },
            j_o_y_down_the_drain = {
                name = "Down the Drain",
                text = {
                    "{C:red}+#1#{} discard this round",
                    "if discarded hand",
                    "contains a {C:attention}Flush{}"
                }
            },
            j_o_y_command_tower = {
                name = "Command Tower",
                text = {
                    "{C:attention}Wild Cards{} held in hand",
                    "give {C:money}$#1#{} at end of round"
                }
            },
            j_o_y_immortal_snail = {
                name = "Immortal Snail",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "per played hand",
                    "{C:red,E:2}Die{} in {C:attention,s:1.11}#3#{} hands",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_o_y_sprue = {
                name = "Sprue",
                text = {
                    "Increase the rank of the next",
                    "{C:attention}#1# numbered{} cards scored by {C:attention}#2#{}"
                }
            },
            j_o_y_crit_chance_item = {
                name = "Crit Chance Item",
                text = {
                    "{C:green}#2# in #3#{} chance for",
                    "played cards to give",
                    "{X:mult,C:white}X#1#{} Mult when scored"
                }
            },
            j_o_y_sunday_comic = {
                name = "Sunday Comic",
                text = {
                    "Create {C:attention}#1#{} random {C:attention}Tags{}",
                    "when {C:attention}Small Blind{} is selected"
                }
            },
            j_o_y_jimbo_in_your_face = {
                name = {
                    "Jimbo",
                    "{C:inactive,E:1}but no one has the heart to tell{}",
                    "{C:inactive,E:1}him he's too close to the camera{}"
                },
                text = {
                    "{C:mult}+#1#{} Mult"
                }
            },
            j_o_y_haunted_mirror = {
                name = "Haunted Mirror",
                text = {
                    "Acts as two copies",
                    "of last sold Joker",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive})"
                }
            },
            j_o_y_foam_finger = {
                name = "Foam Finger",
                text = {
                    "{C:blue}+#1#{} hand",
                    "each round"
                }
            },
            j_o_y_silly_band = {
                name = "Silly Band",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "per copy of itself",
                    "{s:0.8}Can appear multiple times",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_o_y_wild_draw_4 = {
                name = "Wild Draw 4",
                text = {
                    "This Joker gains {C:attention}+#1#{} hand size",
                    "per {C:attention}Wild Card{} scored this round",
                    "{C:inactive}(Currently {C:attention}+#2#{C:inactive} hand size)"
                }
            },
            j_o_y_trivia_card = {
                name = "Trivia Card",
                text = {
                    "Create a {C:tarot}Wheel of Fortune{}",
                    "when {C:attention}Boss Blind{} is selected",
                    "{C:inactive}(Must have room)"
                }
            },
            j_o_y_barbeque = {
                name = "Barbeque",
                text = {
                    "{C:green}#1# in #2#{} cards are",
                    "drawn {C:attention}face down{}",
                    "{C:attention}Face down{} cards give",
                    "{X:mult,C:white}X#3#{} Mult when scored"
                }
            },
            j_o_y_mini = {
                name = "Mini",
                text = {
                    "{C:chips}+#2#{} Chips per card discarded",
                    "{C:chips}-#3#{} Chips per card scored",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                }
            },
            j_o_y_trick_or_treater = {
                name = "Trick-or-Treater",
                text = {
                    "Gains {C:mult}+#1#{} Mult and",
                    "{C:attention}takes {C:money}$#2#{} when a",
                    "{C:attention}face{} card is scored",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)"
                }
            },
            j_o_y_jokerman = {
                name = "Jokerman",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "per card with an {C:attention}Edition{}",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                }
            },
            j_o_y_pngjoker = {
                name = "PNGJoker",
                text = {
                    "{C:mult}+#1#{} Mult if this is",
                    "your rightmost Joker"
                }
            },
            j_o_y_heads_or_tails = {
               name = "Heads or Tails",
               text = {
                  "Sets the {C:attention}denominator{} of",
                  "all {C:attention}listed {C:green}probabilities{} to {C:attention}#1#{}",
                  "{C:green}#2# in #3#{} chance to set money",
                  "to {C:money}$#4#{} at end of round",
                  "{C:inactive}(ex: {C:green}1 in 5{C:inactive} -> {C:green}1 in #1#{C:inactive})"
                }
            },
            j_o_y_green_glass_door = {
                name = "Green Glass Door",
                text = {
                    "Each played card gives",
                    "{C:chips}+#1#{} Chips if it shares",
                    "a {C:attention}rank{} with exactly",
                    "{C:attention}#2#{} other played card"
                }
            },
            j_o_y_search_and_find = {
                name = "Search & Find",
                text = {
                    "Create a {C:tarot}Tarot{} card more",
                    "per {C:attention}#1#{} of {V:1}#2#{} you score",
                    "The card you need to find",
                    "will change at end of {C:attention}Blind"
                }
            },
            j_o_y_scratch_art = {
                name = "Scratch Art",
                text = {
                    "{C:dark_edition}Negative{} Jokers",
                    "each give {X:mult,C:white}X#1#{} Mult"
                }
            },
            j_o_y_stock_photo = {
                name = "Stock Photo",
                text = {
                    "{C:common}Common{} Jokers",
                    "each give {C:chips}+#1#{} Chips"
                }
            },
            j_o_y_spectronomicon = {
                name = "Spectronomicon",
                text = {
                    "Create a {C:spectral}Spectral{} Card",
                    "when another non-{C:common}Common",
                    "Joker is {C:attention}sold",
                    "{C:inactive}(Must have room)"
                }
            },
            j_o_y_conspiracy_theorist = {
                name = "Conspiracy Theorist",
                text = {
                    "Create a {C:spectral}Spectral{} Card",
                    "for every {C:attention}#2#{} {C:planet}Planet{} cards used",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}/{C:attention}#2#{C:inactive}){}"
                }
            },
            j_o_y_imaginary_friend = {
                name = "Imaginary Friend",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "per {C:attention}empty Joker slot",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})"
                }
            },
            j_o_y_cosmic_brownie = {
                name = "Cosmic Brownie",
                text = {
                    "Sell this card to create",
                    "{C:attention}#1#{} copies of your",
                    "last used {C:planet}Planet{} card",
                    "{s:0.8,C:inactive}(Must have room)",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive})"
                }
            },
            j_o_y_whoopee_cushion = {
                name = "Whoopee Cushion",
                text = {
                    "If {C:attention}first hand{} of round",
                    "is a {C:attention}single #1#{},",
                    "{C:attention}destroy{} it and",
                    "create a {C:attention}#2# tag{}"
                }
            }
        },
        Other = {},
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {},
        Voucher = {}
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            j_o_y_you_lose = "You Lose!",
            j_o_y_flushed = "Flushed!",
            j_o_y_used_up = "Used Up!",
            j_o_y_wheel = "Wheel!",
            j_o_y_fart = "Pfft!"
        },
        high_scores = {},
        labels = {},
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            v_j_o_y_plus_tag = "+#1# Tags"
        },
        v_text = {}
    },
}
