local function switch_c_header()
    local current = vim.api.nvim_buf_get_name(0)
    local ext = vim.fn.fnamemodify(current, ":e")

    local target_ext
    if ext == "c" then
        target_ext = "h"
    elseif ext == "h" then
        target_ext = "c"
    else
        return
    end

    -- Find project root.
    local markers = {
        ".git",
        "CMakeLists.txt",
        "Makefile",
        "compile_commands.json",
        "meson.build",
    }

    local dir = vim.fn.fnamemodify(current, ":p:h")
    local root

    while true do
        for _, marker in ipairs(markers) do
            local p = dir .. "/" .. marker
            if vim.fn.isdirectory(p) == 1 or vim.fn.filereadable(p) == 1 then
                root = dir
                break
            end
        end
        if root then break end

        local parent = vim.fn.fnamemodify(dir, ":h")
        if parent == dir then break end
        dir = parent
    end

    root = root or vim.fn.fnamemodify(current, ":p:h")

    local rel = vim.fs.relpath(root, current)
    if not rel then return end

    local has_src = vim.fn.isdirectory(root .. "/src") == 1
    local has_include = vim.fn.isdirectory(root .. "/include") == 1

    local target
    local candidates = {}

    if has_src and has_include then
        if rel:match("^src/") then
            local sub = rel:gsub("^src/", "")
            target = root .. "/include/" ..
                vim.fn.fnamemodify(sub, ":r") .. "." .. target_ext
            table.insert(candidates, target)
            table.insert(candidates, root .. "/" ..
                vim.fn.fnamemodify(sub, ":r") .. "." .. target_ext)
        elseif rel:match("^include/") then
            local sub = rel:gsub("^include/", "")
            target = root .. "/src/" ..
                vim.fn.fnamemodify(sub, ":r") .. "." .. target_ext
            table.insert(candidates, target)
            table.insert(candidates, root .. "/" ..
                vim.fn.fnamemodify(sub, ":r") .. "." .. target_ext)
        else
            local sub = vim.fn.fnamemodify(rel, ":r") .. "." .. target_ext
            target = root .. "/" .. sub
            table.insert(candidates, target)
            table.insert(candidates, root .. "/include/" .. sub)
            table.insert(candidates, root .. "/src/" .. sub)
        end
    else
        target = vim.fn.fnamemodify(current, ":p:h") .. "/" ..
            vim.fn.fnamemodify(current, ":t:r") .. "." .. target_ext
        table.insert(candidates, target)
    end

    -- Open first existing file.
    for _, path in ipairs(candidates) do
        if vim.fn.filereadable(path) == 1 then
            vim.cmd.edit(vim.fn.fnameescape(path))
            return
        end
    end

    -- Create the preferred location.
    vim.fn.mkdir(vim.fn.fnamemodify(target, ":h"), "p")

    local f = io.open(target, "w")
    if not f then
        vim.notify("Failed to create " .. target, vim.log.levels.ERROR)
        return
    end
    f:close()

    vim.cmd.edit(vim.fn.fnameescape(target))
    vim.notify(
        "Created counterpart: " .. (vim.fs.relpath(root, target) or target),
        vim.log.levels.INFO
    )
end

vim.api.nvim_create_user_command("SwitchCHeader", switch_c_header, { desc = "Switch between C source and header"})
vim.keymap.set("n", "<leader><leader>o", switch_c_header)
