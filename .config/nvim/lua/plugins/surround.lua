-- Example:
-- -- ysiw) -- surround the word in ()
-- -- cs'" - to change surroundings ' to "
-- -- ds' - delete surroundings '
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}

