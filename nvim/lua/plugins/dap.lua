---@type (string|vim.pack.Spec)[]

local dap_plugins = {
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/nvim-neotest/nvim-nio",
    "https://github.com/theHamsta/nvim-dap-virtual-text",
}

vim.pack.add(dap_plugins)

local dap = require "dap"
local ui = require "dapui"

require("dapui").setup()

require("nvim-dap-virtual-text").setup {
    -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
    display_callback = function(variable)
        local name = string.lower(variable.name)
        local value = string.lower(variable.value)
        if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
            return "*****"
        end

        if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
        end

        return " " .. variable.value
    end,
}

local mason_registry = require("mason-registry")
local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
local codelldb = codelldb_root .. "adapter/codelldb"
local liblldb = codelldb_root .. "lldb/lib/liblldb.so"

if codelldb ~= "" then
    dap.adapters.codelldb = {
        type = "executable",
        command = codelldb
    }

    dap.configurations.c = {
        {
            type = "codelldb",
            name = "Launch codelldb server",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            projectDir = "${workspaceFolder}",
        },
    }
end

vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>dgb", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<space>?", function()
    require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dsi", dap.step_into)
vim.keymap.set("n", "<leader>dso", dap.step_over)
vim.keymap.set("n", "<leader>dst", dap.step_out)
vim.keymap.set("n", "<leader>dsb", dap.step_back)
vim.keymap.set("n", "<leader>dr", dap.restart)

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end
