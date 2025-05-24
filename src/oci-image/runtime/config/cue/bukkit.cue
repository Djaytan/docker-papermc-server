// This is the main configuration file for Bukkit.
// Specifications: https://docs.papermc.io/paper/reference/bukkit-configuration/

// TODO: try to define a kind of "var" field containing envvars, and try dynamic mapping?

package paper

bukkit: {
	global: {
		settings: {
			"allow-end":           *true | _                @tag(BUKKIT_GLOBAL_SETTINGS_ALLOW_END)
			"warn-on-overload":    *true | _                @tag(BUKKIT_GLOBAL_SETTINGS_WARN_ON_OVERLOAD)
			"permissions-file":    "config/permissions.yml" // System-managed property
			"update-folder":       *"update" | _            @tag(BUKKIT_GLOBAL_SETTINGS_UPDATE_FOLDER)
			"plugin-profiling":    false                    // Disabled on PaperMC
			"connection-throttle": *4000 | _                @tag(BUKKIT_GLOBAL_SETTINGS_CONNECTION_THROTTLE)
			"query-plugins":       *true | _                @tag(BUKKIT_GLOBAL_SETTINGS_QUERY_PLUGINS)
			"deprecated-verbose":  *"default" | _           @tag(BUKKIT_GLOBAL_SETTINGS_DEPRECATED_VERBOSE)
			"shutdown-message":    *"Server closed" | _     @tag(BUKKIT_GLOBAL_SETTINGS_SHUTDOWN_MESSAGE)
			"minimum-api":         *"none" | _              @tag(BUKKIT_GLOBAL_SETTINGS_MINIMUM_API)
			"use-map-color-cache": *true | _                @tag(BUKKIT_GLOBAL_SETTINGS_USE_MAP_COLOR_CACHE)
			"world-container":     "worlds"                 // System-managed property
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
			"period-in-ticks": *600 | _ @tag(BUKKIT_GLOBAL_CHUNK_GC_PERIOD_IN_TICKS)
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
