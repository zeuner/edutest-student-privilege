local S = minetest.get_translator(
    "edutest-student-privilege"
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
    name
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
    subject_name
)
    edutest.revoke_additional_teacher_privileges(
        self,
        subject_name
    )
    minetest.chatcommands[
        "revoke"
    ].func(
        self:get_player_name(
        ),
        subject_name .. " teacher"
    )
    minetest.chatcommands[
        "grant"
    ].func(
        self:get_player_name(
        ),
        subject_name .. " student"
    )
end

local student_to_teacher = function(
    self,
    subject_name
)
    minetest.chatcommands[
        "revoke"
    ].func(
        self:get_player_name(
        ),
        subject_name .. " student"
    )
    minetest.chatcommands[
        "grant"
    ].func(
        self:get_player_name(
        ),
        subject_name .. " teacher"
    )
    edutest.give_additional_teacher_privileges(
        self,
        subject_name
    )
end

edutest.is_student = is_student

edutest.student_to_teacher = student_to_teacher

edutest.teacher_to_student = teacher_to_student
