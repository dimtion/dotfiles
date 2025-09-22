return {
  "j-hui/fidget.nvim",
  lazy = true,
  -- enabled = false,
  opts = {
    progress = {
      ignore_done_already = true,
      suppress_on_insert = true,
      ignore_empty_message = true,
      ignore = {
        function(msg)
          return (
            string.find(msg.title, "Validate documents") ~= nil
            or string.find(msg.title, "Validate Document") ~= nil
            or string.find(msg.title, "Publish Diagnostic") ~= nil
          )
        end,
      },
    },
  },
}
