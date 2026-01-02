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

load {
    type = "jokers",
    atlas = {
        key = "jokers",
        path = "jokers.png",
        px = 71,
        py = 95
    },
    filenames = {
        -- Common Jokers
        "command_tower",
        "jimbazzaro",

        -- Uncommon Jokers
        "down_the_drain",
        "macaroni_art",

        -- Rare Jokers
        "immortal_snail",
        "paddleball"
    }
}
