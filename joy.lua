J_O_Y = {}

local function load(arg)
    if type(arg) == "string" then
        assert(SMODS.load_file(arg))()
        return
    end

    if type(arg) == "table" then
        -- Load the atlas
        if arg.atlas then SMODS.Atlas(arg.atlas) end

        -- Load the files
        local dir = "src/" .. arg.type .. "/"
        for _, filename in ipairs(arg.filenames) do load(dir .. filename .. ".lua") end

        return
    end

    error("undefined call")
end

SMODS.Atlas {
    key = "modicon",
    path = "mod_icon.png",
    px = 32,
    py = 32
}

load {
    type = "utils",
    filenames = {
        "creation",
        "random",
        "money"
    }
}

load {
    type = "jokers",
    atlas = {
        key = "jokers",
        path = "jokers.png",
        px = 71,
        py = 95
    },
    filenames = {
        -- Page 1

        -- Common Jokers
        "command_tower",
        "foam_finger",
        "sprue",
        "crit_chance_item",
        "sunday_comic",
        "trivia_card",
        "down_the_drain",

        -- Uncommon Jokers
        "barbeque",
        "silly_band",
        "macaroni_art",
        "wild_draw_4",
        "jimbo_in_your_face",

        -- Rare Jokers
        "immortal_snail",
        "paddleball",
        "jimbazzaro",

        -- Page 2

        -- Common Jokers
        "mini",
        "pngjoker",
        "search_and_find",
        "stock_photo",
        "imaginary_friend",
        "cosmic_brownie",

        -- Uncommon Jokers
        "trick_or_treater",
        "green_glass_door",
        "scratch_art",
        "whoopee_cushion",

        -- Rare Jokers
        "jokerman",
        "heads_or_tails",
        "spectronomicon",

        -- Page 3
        -- "conspiracy_theorist",

        -- Disabled content
        -- "haunted_mirror", --> Temporarily disabled due to instability

    }
}
