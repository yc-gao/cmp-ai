local provider = {}

function provider:complete(before, after, cb)
    cb({
        { label = 'demo', },
        { label = 'asd', },
    })
end

local M = {}

function M:setup(opts)
    M.provider = provider
end

return M
