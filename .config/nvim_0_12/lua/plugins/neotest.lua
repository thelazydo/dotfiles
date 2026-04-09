vim.pack.add({
    "https://github.com/leoluz/nvim-dap-go",

    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/nvim-neotest/neotest-jest",
    "https://github.com/marilari88/neotest-vitest",
    "https://github.com/nvim-neotest/neotest-python",
    "https://github.com/lawrence-laz/neotest-zig",
    "https://github.com/fredrikaverpil/neotest-golang",
    "https://github.com/mrcjkb/rustaceanvim",
    "https://github.com/nvim-neotest/neotest"
})
require("neotest").setup({
    adapters = {
        ["neotest-jest"] = {
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
                return vim.fn.getcwd()
            end,
        },
        ["neotest-zig"] = {},
        ["neotest-vitest"] = {},
        ["rustaceanvim.neotest"] = {},
        ["neotest-python"] = {},
        ["neotest-golang"] = {
            dap_go_enabled = true,         -- requires leoluz/nvim-dap-go
        },
    },
})
