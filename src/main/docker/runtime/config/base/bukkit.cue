// This is the main configuration file for Bukkit.
// Specifications: https://docs.papermc.io/paper/reference/bukkit-configuration/

// TODO: make stronger types (e.g., specifying boundaries for integers, etc.)
// TODO: document immutable/internal properties which can't be changed

settings: {
	"allow-end":           *true | bool              @tag(BUKKIT_SETTINGS_ALLOW_END, type=bool)
	"warn-on-overload":    *true | bool              @tag(BUKKIT_SETTINGS_WARN_ON_OVERLOAD, type=bool)
	"permissions-file":    "config/permissions.yml"  // Immutable
	"update-folder":       *"update" | string        @tag(BUKKIT_SETTINGS_UPDATE_FOLDER, type=string)
	"plugin-profiling":    *false | bool             @tag(BUKKIT_SETTINGS_PLUGIN_PROFILING, type=bool)
	"connection-throttle": *4000 | int               @tag(BUKKIT_SETTINGS_CONNECTION_THROTTLE, type=int)
	"query-plugins":       *true | bool              @tag(BUKKIT_SETTINGS_QUERY_PLUGINS, type=bool)
	"deprecated-verbose":  *"default" | string       @tag(BUKKIT_SETTINGS_DEPRECATED_VERBOSE, type=string)
	"shutdown-message":    *"Server closed" | string @tag(BUKKIT_SETTINGS_SHUTDOWN_MESSAGE, type=string)
	"minimum-api":         *"none" | string          @tag(BUKKIT_SETTINGS_MINIMUM_API, type=string)
	"use-map-color-cache": *true | bool              @tag(BUKKIT_SETTINGS_USE_MAP_COLOR_CACHE, type=bool)
	"world-container":     "worlds"                  // Immutable
}

"spawn-limits": {
	monsters:                     *70 | int @tag(BUKKIT_SPAWN_LIMITS_MONSTERS, type=int)
	animals:                      *10 | int @tag(BUKKIT_SPAWN_LIMITS_ANIMALS, type=int)
	"water-animals":              *5 | int  @tag(BUKKIT_SPAWN_LIMITS_WATER_ANIMALS, type=int)
	"water-ambient":              *20 | int @tag(BUKKIT_SPAWN_LIMITS_WATER_AMBIENT, type=int)
	"water-underground-creature": *5 | int  @tag(BUKKIT_SPAWN_LIMITS_WATER_UNDERGROUND_CREATURE, type=int)
	axolotls:                     *5 | int  @tag(BUKKIT_SPAWN_LIMITS_AXOLOTLS, type=int)
	ambient:                      *15 | int @tag(BUKKIT_SPAWN_LIMITS_AMBIENT, type=int)
}

"chunk-gc": {
	"period-in-ticks": *600 | int @tag(BUKKIT_CHUNK_GC_PERIOD_IN_TICKS, type=int)
}

"ticks-per": {
	"animal-spawns":                     *400 | int  @tag(BUKKIT_TICKS_PER_ANIMAL_SPAWNS, type=int)
	"monster-spawns":                    *1 | int    @tag(BUKKIT_TICKS_PER_MONSTER_SPAWNS, type=int)
	"water-spawns":                      *1 | int    @tag(BUKKIT_TICKS_PER_WATER_SPAWNS, type=int)
	"water-ambient-spawns":              *1 | int    @tag(BUKKIT_TICKS_PER_WATER_AMBIENT_SPAWNS, type=int)
	"water-underground-creature-spawns": *1 | int    @tag(BUKKIT_TICKS_PER_WATER_UNDERGROUND_CREATURE_SPAWNS, type=int)
	"axolotl-spawns":                    *1 | int    @tag(BUKKIT_TICKS_PER_AXOLOTL_SPAWNS, type=int)
	"ambient-spawns":                    *1 | int    @tag(BUKKIT_TICKS_PER_AMBIENT_SPAWNS, type=int)
	autosave:                            *6000 | int @tag(BUKKIT_TICKS_PER_AUTOSAVE, type=int)
}
