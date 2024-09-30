local cmp_cfg = require('cmp_ai.config')

local source = {}

function source:complete(params, callback)
    local cursor = params.context.cursor

    local lines_before = vim.api.nvim_buf_get_lines(0, math.max(0, cursor.line - 100), cursor.line, false)
    table.insert(lines_before, params.context.cursor_before_line)
    local before = table.concat(lines_before, '\n')

    local lines_after = vim.api.nvim_buf_get_lines(0, cursor.line + 1, math.max(0, cursor.line + 100), false)
    table.insert(lines_after, 1, params.context.cursor_after_line)
    local after = table.concat(lines_after, '\n')

    if cmp_cfg.provider then
        cmp_cfg.provider.complete(before, after, callback)
    else
        callback()
    end
end

return source
