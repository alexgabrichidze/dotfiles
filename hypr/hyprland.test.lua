local variables = require("config.variables")

assert(type(variables) == "table")
assert(type(variables.main_mod) == "string")
assert(type(variables.apps) == "table")
assert(type(variables.apps.terminal) == "string")
