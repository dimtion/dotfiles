-- Interface for Lazygit
return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    };
    lazy = true;
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    keys = {
        {
            "<leader>ggg",
            "<cmd>LazyGit<cr>",
            desc = "Show lazygit window",
        },
        {
            "<leader>ggf",
            "<cmd>LazyGitCurrentFile<cr>",
            desc = "Show Lazygit window on current file",
        },
        config = true,
    };
}
