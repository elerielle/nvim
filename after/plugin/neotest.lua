
local lib = require("neotest.lib")
require("neotest").setup({
    adapters = {
        require("neotest-gtest").setup({
            is_test_file = function(file)
                local valid_extensions = {".cpp", ".cppm", ".cc", ".cxx", ".c++"}
                -- Check if the file has a valid extension
                local has_valid_extension = false
                for _, ext in ipairs(valid_extensions) do
                    if file:sub(-#ext) == ext then
                        has_valid_extension = true
                        break
                    end
                end

                -- If the file does not have a valid extension, return false
                if not has_valid_extension then
                    return false
                end

                -- Get the file stem (name without extension)
                local stem = file:match("(.+)%..+$")
                if not stem then
                    stem = file -- If there's no extension, use the whole file name
                end

                -- Check if the stem starts with "test_", ends with "_test", or ends with "Test"
                return stem:sub(1, 5) == "test_" or stem:sub(-5) == "_test" or stem:sub(-4) == "Test"
                -- by default, returns true if the file stem starts with test_ or ends with _test
                -- the extension must be cpp/cppm/cc/cxx/c++
            end
            -- How many old test results to keep on disk (stored in stdpath('data')/neotest-gtest/runs)

        }),
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
        -- require("neotest-java"),
        require("rustaceanvim.neotest"),
    },
})
