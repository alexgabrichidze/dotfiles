local variables = require("config.variables")

assert(type(variables) == "table")
assert(type(variables.main_mod) == "string")
assert(type(variables.apps) == "table")
assert(type(variables.apps.terminal) == "string")

require("config.monitors")

require("config.environment")

require("config.layout")
require("config.appearance")
require("config.animations")

require("config.input")

require("config.permissions")

require("config.windows")

require("config.bindings")

require("config.autostart")
