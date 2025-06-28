// This is the main configuration file for Bukkit.
// Specifications: https://docs.papermc.io/paper/reference/bukkit-configuration/

// TODO: try to define a kind of "var" field containing envvars, and try dynamic mapping?

package paper

bukkit: {
	global: {
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
			"world-container":     "/data/worlds"            // System-managed property
		}

		// These properties are overridden by PaperMC
		"spawn-limits": {
			monsters:                     -1
			animals:                      -1
			"water-animals":              -1
			"water-ambient":              -1
			"water-underground-creature": -1
			axolotls:                     -1
			ambient:                      -1
		}

		"chunk-gc": {
			"period-in-ticks": *600 | int @tag(BUKKIT_GLOBAL_CHUNK_GC_PERIOD_IN_TICKS, type=int)
		}

		// These properties are overridden by PaperMC
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
	}
}
