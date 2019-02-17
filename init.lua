local MP = minetest.get_modpath(
    minetest.get_current_modname(
    )
)

local S, NS = dofile(
    MP .. "/intllib.lua"
)

minetest.register_privilege(
    'student',
    {
        description = S(
            "player is affected by bulk commands targeted at students"
        ),
        give_to_singleplayer = false,
    }
)

local is_student = function(
    player
)
    local name = player:get_player_name(
    )
    local privs = minetest.get_player_privs(
        name
    )
    return privs[
        "student"
    ]
end

edutest.is_student = is_student
