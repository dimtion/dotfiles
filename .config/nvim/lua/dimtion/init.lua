-- Dimtion's nvim configuration
--
-- This is ported from my origin vimrc file, to take advantage of the lua
-- syntax and testing new nvim features such as lsp support and tree-sitter.
-- 2023-09-07: Trying out lazy.nvim

-- Setup lazy.nvim first, this will configure all the eager plugins
-- remaps and themes needs to be configured after
require "dimtion.lazy"
require "dimtion.ui"
require "dimtion.set"
require "dimtion.mappings"
require "dimtion.edit"