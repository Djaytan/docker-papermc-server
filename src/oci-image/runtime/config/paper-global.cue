// Global configuration for PaperMC.
// World-specific settings are defined in the corresponding paper-world*.yml files.
//
// Specifications: https://docs.papermc.io/paper/reference/global-configuration/
//
// All CUE structs are open to allow for additional fields, ensuring forward compatibility with future PaperMC configurations.
// Any new fields added in future PaperMC versions can be safely added without breaking the existing configuration.

// TODO: ellipsis are unecessary

package paper

paper: {
	global: {
		"_version": 29 // Not customizable - Internal value only

		"block-updates": {
			"disable-chorus-plant-updates":   *false | bool @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_CHORUS_PLANT_UPDATES, type=bool)
			"disable-mushroom-block-updates": *false | bool @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_MUSHROOM_BLOCK_UPDATES, type=bool)
			"disable-noteblock-updates":      *false | bool @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_NOTEBLOCK_UPDATES, type=bool)
			"disable-tripwire-updates":       *false | bool @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_TRIPWIRE_UPDATES, type=bool)
			... // Enable forward-compatibility
		}

		"chunk-loading": {
			"autoconfig-send-distance":      *true | bool   @tag(PAPER_GLOBAL_CHUNK_LOADING_AUTOCONFIG_SEND_DISTANCE, type=bool)
			"enable-frustum-priority":       *false | bool  @tag(PAPER_GLOBAL_CHUNK_LOADING_ENABLE_FRUSTUM_PRIORITY, type=bool)
			"global-max-chunk-load-rate":    *-1.0 | float  @tag(PAPER_GLOBAL_CHUNK_LOADING_GLOBAL_MAX_CHUNK_LOAD_RATE, type=number)
			"global-max-chunk-send-rate":    *-1.0 | float  @tag(PAPER_GLOBAL_CHUNK_LOADING_GLOBAL_MAX_CHUNK_SEND_RATE, type=number)
			"global-max-concurrent-loads":   *500.0 | float @tag(PAPER_GLOBAL_CHUNK_LOADING_GLOBAL_MAX_CONCURRENT_LOADS, type=number)
			"max-concurrent-sends":          *2 | int       @tag(PAPER_GLOBAL_CHUNK_LOADING_MAX_CONCURRENT_SENDS, type=int)
			"min-load-radius":               *2 | int       @tag(PAPER_GLOBAL_CHUNK_LOADING_MIN_LOAD_RADIUS, type=int)
			"player-max-chunk-load-rate":    *-1.0 | float  @tag(PAPER_GLOBAL_CHUNK_LOADING_PLAYER_MAX_CHUNK_LOAD_RATE, type=number)
			"player-max-concurrent-loads":   *20.0 | float  @tag(PAPER_GLOBAL_CHUNK_LOADING_PLAYER_MAX_CONCURRENT_LOADS, type=number)
			"target-player-chunk-send-rate": *100.0 | float @tag(PAPER_GLOBAL_CHUNK_LOADING_TARGET_PLAYER_CHUNK_SEND_RATE, type=number)
			... // Enable forward-compatibility
		}

		"chunk-loading-basic": {
			"player-max-chunk-generate-rate": *-1.0 | float  @tag(PAPER_GLOBAL_CHUNK_LOADING_BASIC_PLAYER_MAX_CHUNK_GENERATE_RATE, type=number)
			"player-max-chunk-load-rate":     *100.0 | float @tag(PAPER_GLOBAL_CHUNK_LOADING_BASIC_PLAYER_MAX_CHUNK_LOAD_RATE, type=number)
			"player-max-chunk-send-rate":     *75.0 | float  @tag(PAPER_GLOBAL_CHUNK_LOADING_BASIC_PLAYER_MAX_CHUNK_SEND_RATE, type=number)
			... // Enable forward-compatibility
		}

		"chunk-loading-advanced": {
			"auto-config-send-distance":             *true | bool @tag(PAPER_GLOBAL_CHUNK_LOADING_ADVANCED_AUTO_CONFIG_SEND_DISTANCE, type=bool)
			"player-max-concurrent-chunk-generates": *0 | int     @tag(PAPER_GLOBAL_CHUNK_LOADING_ADVANCED_PLAYER_MAX_CONCURRENT_CHUNK_GENERATES, type=int)
			"player-max-concurrent-chunk-loads":     *0 | int     @tag(PAPER_GLOBAL_CHUNK_LOADING_ADVANCED_PLAYER_MAX_CONCURRENT_CHUNK_LOADS, type=int)
			... // Enable forward-compatibility
		}

		"chunk-system": {
			"gen-parallelism": *"default" | string @tag(PAPER_GLOBAL_CHUNK_SYSTEM_GEN_PARALLELISM, type=string)
			"io-threads":      *-1 | int           @tag(PAPER_GLOBAL_CHUNK_SYSTEM_IO_THREADS, type=int)
			"worker-threads":  *-1 | int           @tag(PAPER_GLOBAL_CHUNK_SYSTEM_WORKER_THREADS, type=int)
			... // Enable forward-compatibility
		}

		collisions: {
			"enable-player-collisions":                  *true | bool @tag(PAPER_GLOBAL_COLLISIONS_ENABLE_PLAYER_COLLISIONS, type=bool)
			"send-full-pos-for-hard-colliding-entities": *true | bool @tag(PAPER_GLOBAL_COLLISIONS_SEND_FULL_POS_FOR_HARD_COLLIDING_ENTITIES, type=bool)
			... // Enable forward-compatibility
		}

		commands: {
			"fix-target-selector-tag-completion":             *true | bool  @tag(PAPER_GLOBAL_COMMANDS_FIX_TARGET_SELECTOR_TAG_COMPLETION, type=bool)
			"suggest-player-names-when-null-tab-completions": *true | bool  @tag(PAPER_GLOBAL_COMMANDS_SUGGEST_PLAYER_NAMES_WHEN_NULL_TAB_COMPLETIONS, type=bool)
			"time-command-affects-all-worlds":                *false | bool @tag(PAPER_GLOBAL_COMMANDS_TIME_COMMAND_AFFECTS_ALL_WORLDS, type=bool)
			... // Enable forward-compatibility
		}

		console: {
			"enable-brigadier-completions":  *true | bool  @tag(PAPER_GLOBAL_CONSOLE_ENABLE_BRIGADIER_COMPLETIONS, type=bool)
			"enable-brigadier-highlighting": *true | bool  @tag(PAPER_GLOBAL_CONSOLE_ENABLE_BRIGADIER_HIGHLIGHTING, type=bool)
			"has-all-permissions":           *false | bool @tag(PAPER_GLOBAL_CONSOLE_HAS_ALL_PERMISSIONS, type=bool)
			... // Enable forward-compatibility
		}

		"item-validation": {
			book: {
				author: *8192 | int  @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_AUTHOR, type=int)
				page:   *16384 | int @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_PAGE, type=int)
				title:  *8192 | int  @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_TITLE, type=int)
				... // Enable forward-compatibility
			}
			"book-size": {
				"page-max":         *2560 | int   @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_SIZE_PAGE_MAX, type=int)
				"total-multiplier": *0.98 | float @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_SIZE_TOTAL_MULTIPLIER, type=number)
				... // Enable forward-compatibility
			}
			"display-name":               *8192 | int   @tag(PAPER_GLOBAL_ITEM_VALIDATION_DISPLAY_NAME, type=int)
			"lore-line":                  *8192 | int   @tag(PAPER_GLOBAL_ITEM_VALIDATION_LORE_LINE, type=int)
			"resolve-selectors-in-books": *false | bool @tag(PAPER_GLOBAL_ITEM_VALIDATION_RESOLVE_SELECTORS_IN_BOOKS, type=bool)
			... // Enable forward-compatibility
		}

		logging: {
			"deobfuscate-stacktraces": *true | bool @tag(PAPER_GLOBAL_LOGGING_DEOBFUSCATE_STACKTRACES, type=bool)
		}

		messages: {
			kick: {
				"authentication-servers-down": *"<lang:multiplayer.disconnect.authservers_down>" | string         @tag(PAPER_GLOBAL_MESSAGES_KICK_AUTHENTICATION_SERVERS_DOWN, type=string)
				"connection-throttle":         *"Connection throttled! Please wait before reconnecting." | string @tag(PAPER_GLOBAL_MESSAGES_KICK_CONNECTION_THROTTLE, type=string)
				"flying-player":               *"<lang:multiplayer.disconnect.flying>" | string                   @tag(PAPER_GLOBAL_MESSAGES_KICK_FLYING_PLAYER, type=string)
				"flying-vehicle":              *"<lang:multiplayer.disconnect.flying>" | string                   @tag(PAPER_GLOBAL_MESSAGES_KICK_FLYING_VEHICLE, type=string)
				... // Enable forward-compatibility
			}
			"no-permission":                    *"<red>I'm sorry, but you do not have permission to perform this command. Please contact the server administrators if you believe that this is in error." | string @tag(PAPER_GLOBAL_MESSAGES_NO_PERMISSION, type=string)
			"use-display-name-in-quit-message": *false | bool                                                                                                                                                      @tag(PAPER_GLOBAL_MESSAGES_USE_DISPLAY_NAME_IN_QUIT_MESSAGE, type=bool)
			... // Enable forward-compatibility
		}

		misc: {
			"chat-threads": {
				"chat-executor-core-size": *-1 | int @tag(PAPER_GLOBAL_MISC_CHAT_THREADS_CHAT_EXECUTOR_CORE_SIZE, type=int)
				"chat-executor-max-size":  *-1 | int @tag(PAPER_GLOBAL_MISC_CHAT_THREADS_CHAT_EXECUTOR_MAX_SIZE, type=int)
				... // Enable forward-compatibility
			}
			"compression-level":                      *"default" | _ @tag(PAPER_GLOBAL_MISC_COMPRESSION_LEVEL, type=string)
			"fix-entity-position-desync":             *true | bool   @tag(PAPER_GLOBAL_MISC_FIX_ENTITY_POSITION_DESYNC, type=bool)
			"lag-compensate-block-breaking":          *true | bool   @tag(PAPER_GLOBAL_MISC_LAG_COMPENSATE_BLOCK_BREAKING, type=bool)
			"load-permissions-yml-before-plugins":    *true | bool   @tag(PAPER_GLOBAL_MISC_LOAD_PERMISSIONS_YML_BEFORE_PLUGINS, type=bool)
			"max-joins-per-tick":                     *3 | int       @tag(PAPER_GLOBAL_MISC_MAX_JOINS_PER_TICK, type=int)
			"region-file-cache-size":                 *256 | int     @tag(PAPER_GLOBAL_MISC_REGION_FILE_CACHE_SIZE, type=int)
			"strict-advancement-dimension-check":     *false | bool  @tag(PAPER_GLOBAL_MISC_STRICT_ADVANCEMENT_DIMENSION_CHECK, type=bool)
			"use-alternative-luck-formula":           *false | bool  @tag(PAPER_GLOBAL_MISC_USE_ALTERNATIVE_LUCK_FORMULA, type=bool)
			"use-dimension-type-for-custom-spawners": *false | bool  @tag(PAPER_GLOBAL_MISC_USE_DIMENSION_TYPE_FOR_CUSTOM_SPAWNERS, type=bool)
			... // Enable forward-compatibility
		}

		// Note: Mapping of the field "packet-limiter.override" to an environment variable is unsupported due to its complexity.
		"packet-limiter": {
			"all-packets": {
				action:            *"KICK" | string @tag(PAPER_GLOBAL_PACKET_LIMITER_ALL_PACKETS_ACTION, type=string)
				interval:          *7.0 | float     @tag(PAPER_GLOBAL_PACKET_LIMITER_ALL_PACKETS_INTERVAL, type=number)
				"max-packet-rate": *500.0 | float   @tag(PAPER_GLOBAL_PACKET_LIMITER_ALL_PACKETS_MAX_PACKET_RATE, type=number)
				... // Enable forward-compatibility
			}
			"kick-message": *"<red><lang:disconnect.exceeded_packet_rate>" | string @tag(PAPER_GLOBAL_PACKET_LIMITER_KICK_MESSAGE, type=string)
			... // Enable forward-compatibility
		}

		"play-in-use-item-spam-threshold": *300 | int @tag(PAPER_GLOBAL_PLAY_IN_USE_ITEM_SPAM_THRESHOLD, type=int)

		"player-auto-save": {
			"max-per-tick": *-1 | int @tag(PAPER_GLOBAL_PLAYER_AUTO_SAVE_MAX_PER_TICK, type=int)
			rate:           *-1 | int @tag(PAPER_GLOBAL_PLAYER_AUTO_SAVE_RATE, type=int)
			... // Enable forward-compatibility
		}

		proxies: {
			"bungee-cord": {
				"online-mode": *true | bool @tag(PAPER_GLOBAL_PROXIES_BUNGEE_CORD_ONLINE_MODE, type=bool)
			}
			"proxy-protocol": *false | bool @tag(PAPER_GLOBAL_PROXIES_PROXY_PROTOCOL, type=bool)
			velocity: {
				enabled:       *false | bool @tag(PAPER_GLOBAL_PROXIES_VELOCITY_ENABLED, type=bool)
				"online-mode": *false | bool @tag(PAPER_GLOBAL_PROXIES_VELOCITY_ONLINE_MODE, type=bool)
				secret:        *"" | string  @tag(PAPER_GLOBAL_PROXIES_VELOCITY_SECRET, type=string)
				... // Enable forward-compatibility
			}
			... // Enable forward-compatibility
		}

		scoreboards: {
			"save-empty-scoreboard-teams": *false | bool @tag(PAPER_GLOBAL_SCOREBOARDS_SAVE_EMPTY_SCOREBOARD_TEAMS, type=bool)
			"track-plugin-scoreboards":    *false | bool @tag(PAPER_GLOBAL_SCOREBOARDS_TRACK_PLUGIN_SCOREBOARDS, type=bool)
			... // Enable forward-compatibility
		}

		"spam-limiter": {
			"incoming-packet-threshold": *300 | int @tag(PAPER_GLOBAL_SPAM_LIMITER_INCOMING_PACKET_THRESHOLD, type=int)
			"recipe-spam-increment":     *1 | int   @tag(PAPER_GLOBAL_SPAM_LIMITER_RECIPE_SPAM_INCREMENT, type=int)
			"recipe-spam-limit":         *20 | int  @tag(PAPER_GLOBAL_SPAM_LIMITER_RECIPE_SPAM_LIMIT, type=int)
			"tab-spam-increment":        *1 | int   @tag(PAPER_GLOBAL_SPAM_LIMITER_TAB_SPAM_INCREMENT, type=int)
			"tab-spam-limit":            *500 | int @tag(PAPER_GLOBAL_SPAM_LIMITER_TAB_SPAM_LIMIT, type=int)
			... // Enable forward-compatibility
		}

		"unsupported-settings": {
			"allow-grindstone-overstacking":         *false | bool    @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_GRINDSTONE_OVERSTACKING, type=bool)
			"allow-headless-pistons":                *false | bool    @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_HEADLESS_PISTONS, type=bool)
			"allow-permanent-block-break-exploits":  *false | bool    @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_PERMANENT_BLOCK_BREAK_EXPLOITS, type=bool)
			"allow-piston-duplication":              *false | bool    @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_PISTON_DUPLICATION, type=bool)
			"allow-tripwire-disarming-exploits":     *false | bool    @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_TRIPWIRE_DISARMING_EXPLOITS, type=bool)
			"allow-unsafe-end-portal-teleportation": *false | bool    @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_UNSAFE_END_PORTAL_TELEPORTATION, type=bool)
			"compression-format":                    *"ZLIB" | string @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_COMPRESSION_FORMAT, type=string)
			"perform-username-validation":           *true | bool     @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_PERFORM_USERNAME_VALIDATION, type=bool)
			... // Enable forward-compatibility
		}

		watchdog: {
			"early-warning-delay": *10000 | int @tag(PAPER_GLOBAL_WATCHDOG_EARLY_WARNING_DELAY, type=int)
			"early-warning-every": *5000 | int  @tag(PAPER_GLOBAL_WATCHDOG_EARLY_WARNING_EVERY, type=int)
			... // Enable forward-compatibility
		}
	}
}
