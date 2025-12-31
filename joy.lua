local function load(path)
    assert(SMODS.load_file(path))()
end

load "src/jokers.lua"
