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

local teacher_to_student = function(
    self,
    subject
)
    minetest.chatcommands[
        "revoke"
    ].func(
        self:get_player_name(
        ),
        subject:get_player_name(
        ) .. " teacher"
    )
    minetest.chatcommands[
        "grant"
    ].func(
        self:get_player_name(
        ),
        subject:get_player_name(
        ) .. " student"
    )
end

local student_to_teacher = function(
    self,
    subject
)
    minetest.chatcommands[
        "revoke"
    ].func(
        self:get_player_name(
        ),
        subject:get_player_name(
        ) .. " student"
    )
    minetest.chatcommands[
        "grant"
    ].func(
        self:get_player_name(
        ),
        subject:get_player_name(
        ) .. " teacher"
    )
end

edutest.is_student = is_student

edutest.student_to_teacher = student_to_teacher

edutest.teacher_to_student = teacher_to_student
