# EDUtest student privilege

This is an optional module for the EDUtest project which adds a "student"
privilege to distinguish players affected by teacher bulk commands from
those who aren't.

## setup

The teacher commands then expect the students to be marked with the "student"
privilege.

A common way to set this up would be to add "student" to the default_privs
server configuration option, and to revoke it manually from the teacher(s),
while granting them the "teacher" privilege.

When doing so, be sure to keep other relevant default_privs entries. For
example, for an otherwise standard minetest setup, default_privs should be
set to "student, shout, interact".

In order to be able to revoke privileges from the teacher, the teacher may
not be configured as the server owner ("name" setting in minetest.conf).
