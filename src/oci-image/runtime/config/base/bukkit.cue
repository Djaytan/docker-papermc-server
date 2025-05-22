// This is the main configuration file for Bukkit.
// Specifications: https://docs.papermc.io/paper/reference/bukkit-configuration/

// TODO: make stronger types (e.g., specifying boundaries for integers, etc.)
// TODO: try to define a kind of "var" field containing envvars, and try dynamic mapping?

settings: {
	"allow-end":           *true | bool              @tag(BUKKIT_GLOBAL_SETTINGS_ALLOW_END, type=bool)
	"warn-on-overload":    *true | bool              @tag(BUKKIT_GLOBAL_SETTINGS_WARN_ON_OVERLOAD, type=bool)
	"permissions-file":    "config/permissions.yml"  // System-managed property
	"update-folder":       *"update" | string        @tag(BUKKIT_GLOBAL_SETTINGS_UPDATE_FOLDER, type=string)
	"plugin-profiling":    false                     // Disabled on PaperMC
	"connection-throttle": *4000 | int               @tag(BUKKIT_GLOBAL_SETTINGS_CONNECTION_THROTTLE, type=int)
	"query-plugins":       *true | bool              @tag(BUKKIT_GLOBAL_SETTINGS_QUERY_PLUGINS, type=bool)
	"deprecated-verbose":  *"default" | string       @tag(BUKKIT_GLOBAL_SETTINGS_DEPRECATED_VERBOSE, type=string)
	"shutdown-message":    *"Server closed" | string @tag(BUKKIT_GLOBAL_SETTINGS_SHUTDOWN_MESSAGE, type=string)
	"minimum-api":         *"none" | string          @tag(BUKKIT_GLOBAL_SETTINGS_MINIMUM_API, type=string)
	"use-map-color-cache": *true | bool              @tag(BUKKIT_GLOBAL_SETTINGS_USE_MAP_COLOR_CACHE, type=bool)
	"world-container":     "worlds"                  // System-managed property
}

// TODO: drop support in favor of Paper world config
"spawn-limits": {
	monsters:                     *70 | int @tag(BUKKIT_GLOBAL_SPAWN_LIMITS_MONSTERS, type=int)
	animals:                      *10 | int @tag(BUKKIT_GLOBAL_SPAWN_LIMITS_ANIMALS, type=int)
	"water-animals":              *5 | int  @tag(BUKKIT_GLOBAL_SPAWN_LIMITS_WATER_ANIMALS, type=int)
	"water-ambient":              *20 | int @tag(BUKKIT_GLOBAL_SPAWN_LIMITS_WATER_AMBIENT, type=int)
	"water-underground-creature": *5 | int  @tag(BUKKIT_GLOBAL_SPAWN_LIMITS_WATER_UNDERGROUND_CREATURE, type=int)
	axolotls:                     *5 | int  @tag(BUKKIT_GLOBAL_SPAWN_LIMITS_AXOLOTLS, type=int)
	ambient:                      *15 | int @tag(BUKKIT_GLOBAL_SPAWN_LIMITS_AMBIENT, type=int)
}

// TODO: constrain properties (e.g. gc capped to 20 ticks by PaperMC) + document constraints
"chunk-gc": {
	"period-in-ticks": *600 | int @tag(BUKKIT_GLOBAL_CHUNK_GC_PERIOD_IN_TICKS, type=int)
}

"ticks-per": {
	"animal-spawns":                     -1
	"monster-spawns":                    -1
	"water-spawns":                      -1
	"water-ambient-spawns":              -1
	"water-underground-creature-spawns": -1
	"axolotl-spawns":                    -1
	"ambient-spawns":                    -1
	autosave:                            -1
}
