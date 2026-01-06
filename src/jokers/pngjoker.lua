SMODS.Joker
{
    key = "pngjoker",
    atlas = "jokers",
    pos = {
        x = 1,
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

    config = {
        extra = {
            mult = 15
        }
    },

    loc_vars = function(self, info_queue, card)
        local config = card.ability.extra

        return {
            vars = { config.mult }
        }
    end,

    calculate = function(self, card, context)
        local config = card.ability.extra
				local my_pos = nil

        if context.joker_main then

						for i = 1, #G.jokers.cards do
								if G.jokers.cards[i] == card then
										--print(i)
										my_pos = i
										break
								end
						end
	
						if my_pos == #G.jokers.cards then
								if not context.blueprint then
										G.E_MANAGER:add_event(Event {
												func = function()
														card.children.center:set_sprite_pos({ x = 2, y = 2 })
														--play_sound "voice1"
														return true
												end
										})
								end

								return { mult = config.mult }
						end

				end

				if context.final_scoring_step and not context.blueprint then 
						G.E_MANAGER:add_event(Event {
								trigger = "after",
								delay = 0.5,
								func = function()
										card.children.center:set_sprite_pos({ x = 1, y = 2 })
										return true
								end
						})
				end

    end
}