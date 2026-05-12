local GP = GuidePostNS

function GP.GetTextureString(texture, dim)
    local size = 20
    if dim and type(dim) == "number" then
        size = dim
    end
    return "|T"..texture..":"..size..":"..size.."|t"
end

function GP.GetAtlasString(atlas, dim)
    local size = 15
    if dim and type(dim) == "number" then
        size = dim
    end
    return "|A:"..atlas..":"..size..":"..size.."|a"
end