// Global configuration for PaperMC.
// World-specific settings are defined in the corresponding paper-world*.yml files.
//
// Specifications: https://docs.papermc.io/paper/reference/global-configuration/

package paper

paper: {
	global: {
		"_version": 29 // Not customizable - Internal value only

		"block-updates": {
			"disable-chorus-plant-updates":   *false | _ @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_CHORUS_PLANT_UPDATES)
			"disable-mushroom-block-updates": *false | _ @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_MUSHROOM_BLOCK_UPDATES)
			"disable-noteblock-updates":      *false | _ @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_NOTEBLOCK_UPDATES)
			"disable-tripwire-updates":       *false | _ @tag(PAPER_GLOBAL_BLOCK_UPDATES_DISABLE_TRIPWIRE_UPDATES)
		}

		"chunk-loading": {
			"autoconfig-send-distance":      *true | _  @tag(PAPER_GLOBAL_CHUNK_LOADING_AUTOCONFIG_SEND_DISTANCE)
			"enable-frustum-priority":       *false | _ @tag(PAPER_GLOBAL_CHUNK_LOADING_ENABLE_FRUSTUM_PRIORITY)
			"global-max-chunk-load-rate":    *-1.0 | _  @tag(PAPER_GLOBAL_CHUNK_LOADING_GLOBAL_MAX_CHUNK_LOAD_RATE)
			"global-max-chunk-send-rate":    *-1.0 | _  @tag(PAPER_GLOBAL_CHUNK_LOADING_GLOBAL_MAX_CHUNK_SEND_RATE)
			"global-max-concurrent-loads":   *500.0 | _ @tag(PAPER_GLOBAL_CHUNK_LOADING_GLOBAL_MAX_CONCURRENT_LOADS)
			"max-concurrent-sends":          *2 | _     @tag(PAPER_GLOBAL_CHUNK_LOADING_MAX_CONCURRENT_SENDS)
			"min-load-radius":               *2 | _     @tag(PAPER_GLOBAL_CHUNK_LOADING_MIN_LOAD_RADIUS)
			"player-max-chunk-load-rate":    *-1.0 | _  @tag(PAPER_GLOBAL_CHUNK_LOADING_PLAYER_MAX_CHUNK_LOAD_RATE)
			"player-max-concurrent-loads":   *20.0 | _  @tag(PAPER_GLOBAL_CHUNK_LOADING_PLAYER_MAX_CONCURRENT_LOADS)
			"target-player-chunk-send-rate": *100.0 | _ @tag(PAPER_GLOBAL_CHUNK_LOADING_TARGET_PLAYER_CHUNK_SEND_RATE)
		}

		"chunk-loading-basic": {
			"player-max-chunk-generate-rate": *-1.0 | _  @tag(PAPER_GLOBAL_CHUNK_LOADING_BASIC_PLAYER_MAX_CHUNK_GENERATE_RATE)
			"player-max-chunk-load-rate":     *100.0 | _ @tag(PAPER_GLOBAL_CHUNK_LOADING_BASIC_PLAYER_MAX_CHUNK_LOAD_RATE)
			"player-max-chunk-send-rate":     *75.0 | _  @tag(PAPER_GLOBAL_CHUNK_LOADING_BASIC_PLAYER_MAX_CHUNK_SEND_RATE)
		}

		"chunk-loading-advanced": {
			"auto-config-send-distance":             *true | _ @tag(PAPER_GLOBAL_CHUNK_LOADING_ADVANCED_AUTO_CONFIG_SEND_DISTANCE)
			"player-max-concurrent-chunk-generates": *0 | _    @tag(PAPER_GLOBAL_CHUNK_LOADING_ADVANCED_PLAYER_MAX_CONCURRENT_CHUNK_GENERATES)
			"player-max-concurrent-chunk-loads":     *0 | _    @tag(PAPER_GLOBAL_CHUNK_LOADING_ADVANCED_PLAYER_MAX_CONCURRENT_CHUNK_LOADS)
		}

		"chunk-system": {
			"gen-parallelism": *"default" | _ @tag(PAPER_GLOBAL_CHUNK_SYSTEM_GEN_PARALLELISM)
			"io-threads":      *-1 | _        @tag(PAPER_GLOBAL_CHUNK_SYSTEM_IO_THREADS)
			"worker-threads":  *-1 | _        @tag(PAPER_GLOBAL_CHUNK_SYSTEM_WORKER_THREADS)
		}

		collisions: {
			"enable-player-collisions":                  *true | _ @tag(PAPER_GLOBAL_COLLISIONS_ENABLE_PLAYER_COLLISIONS)
			"send-full-pos-for-hard-colliding-entities": *true | _ @tag(PAPER_GLOBAL_COLLISIONS_SEND_FULL_POS_FOR_HARD_COLLIDING_ENTITIES)
		}

		commands: {
			"fix-target-selector-tag-completion":             *true | _  @tag(PAPER_GLOBAL_COMMANDS_FIX_TARGET_SELECTOR_TAG_COMPLETION)
			"suggest-player-names-when-null-tab-completions": *true | _  @tag(PAPER_GLOBAL_COMMANDS_SUGGEST_PLAYER_NAMES_WHEN_NULL_TAB_COMPLETIONS)
			"time-command-affects-all-worlds":                *false | _ @tag(PAPER_GLOBAL_COMMANDS_TIME_COMMAND_AFFECTS_ALL_WORLDS)
		}

		console: {
			"enable-brigadier-completions":  *true | _  @tag(PAPER_GLOBAL_CONSOLE_ENABLE_BRIGADIER_COMPLETIONS)
			"enable-brigadier-highlighting": *true | _  @tag(PAPER_GLOBAL_CONSOLE_ENABLE_BRIGADIER_HIGHLIGHTING)
			"has-all-permissions":           *false | _ @tag(PAPER_GLOBAL_CONSOLE_HAS_ALL_PERMISSIONS)
		}

		"item-validation": {
			book: {
				author: *8192 | _  @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_AUTHOR)
				page:   *16384 | _ @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_PAGE)
				title:  *8192 | _  @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_TITLE)
			}
			"book-size": {
				"page-max":         *2560 | _ @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_SIZE_PAGE_MAX)
				"total-multiplier": *0.98 | _ @tag(PAPER_GLOBAL_ITEM_VALIDATION_BOOK_SIZE_TOTAL_MULTIPLIER)
			}
			"display-name":               *8192 | _  @tag(PAPER_GLOBAL_ITEM_VALIDATION_DISPLAY_NAME)
			"lore-line":                  *8192 | _  @tag(PAPER_GLOBAL_ITEM_VALIDATION_LORE_LINE)
			"resolve-selectors-in-books": *false | _ @tag(PAPER_GLOBAL_ITEM_VALIDATION_RESOLVE_SELECTORS_IN_BOOKS)
		}

		logging: {
			"deobfuscate-stacktraces": *true | _ @tag(PAPER_GLOBAL_LOGGING_DEOBFUSCATE_STACKTRACES)
		}

		messages: {
			kick: {
				"authentication-servers-down": *"<lang:multiplayer.disconnect.authservers_down>" | _         @tag(PAPER_GLOBAL_MESSAGES_KICK_AUTHENTICATION_SERVERS_DOWN)
				"connection-throttle":         *"Connection throttled! Please wait before reconnecting." | _ @tag(PAPER_GLOBAL_MESSAGES_KICK_CONNECTION_THROTTLE)
				"flying-player":               *"<lang:multiplayer.disconnect.flying>" | _                   @tag(PAPER_GLOBAL_MESSAGES_KICK_FLYING_PLAYER)
				"flying-vehicle":              *"<lang:multiplayer.disconnect.flying>" | _                   @tag(PAPER_GLOBAL_MESSAGES_KICK_FLYING_VEHICLE)
			}
			"no-permission":                    *"<red>I'm sorry, but you do not have permission to perform this command. Please contact the server administrators if you believe that this is in error." | _ @tag(PAPER_GLOBAL_MESSAGES_NO_PERMISSION)
			"use-display-name-in-quit-message": *false | _                                                                                                                                                    @tag(PAPER_GLOBAL_MESSAGES_USE_DISPLAY_NAME_IN_QUIT_MESSAGE)
		}

		misc: {
			"chat-threads": {
				"chat-executor-core-size": *-1 | _ @tag(PAPER_GLOBAL_MISC_CHAT_THREADS_CHAT_EXECUTOR_CORE_SIZE)
				"chat-executor-max-size":  *-1 | _ @tag(PAPER_GLOBAL_MISC_CHAT_THREADS_CHAT_EXECUTOR_MAX_SIZE)
			}
			"compression-level":                      *"default" | _ @tag(PAPER_GLOBAL_MISC_COMPRESSION_LEVEL)
			"fix-entity-position-desync":             *true | _      @tag(PAPER_GLOBAL_MISC_FIX_ENTITY_POSITION_DESYNC)
			"lag-compensate-block-breaking":          *true | _      @tag(PAPER_GLOBAL_MISC_LAG_COMPENSATE_BLOCK_BREAKING)
			"load-permissions-yml-before-plugins":    *true | _      @tag(PAPER_GLOBAL_MISC_LOAD_PERMISSIONS_YML_BEFORE_PLUGINS)
			"max-joins-per-tick":                     *3 | _         @tag(PAPER_GLOBAL_MISC_MAX_JOINS_PER_TICK)
			"region-file-cache-size":                 *256 | _       @tag(PAPER_GLOBAL_MISC_REGION_FILE_CACHE_SIZE)
			"strict-advancement-dimension-check":     *false | _     @tag(PAPER_GLOBAL_MISC_STRICT_ADVANCEMENT_DIMENSION_CHECK)
			"use-alternative-luck-formula":           *false | _     @tag(PAPER_GLOBAL_MISC_USE_ALTERNATIVE_LUCK_FORMULA)
			"use-dimension-type-for-custom-spawners": *false | _     @tag(PAPER_GLOBAL_MISC_USE_DIMENSION_TYPE_FOR_CUSTOM_SPAWNERS)
		}

		// Note: Mapping of the field "packet-limiter.override" to an environment variable is unsupported due to its complexity.
		"packet-limiter": {
			"all-packets": {
				action:            *"KICK" | _ @tag(PAPER_GLOBAL_PACKET_LIMITER_ALL_PACKETS_ACTION)
				interval:          *7.0 | _    @tag(PAPER_GLOBAL_PACKET_LIMITER_ALL_PACKETS_INTERVAL)
				"max-packet-rate": *500.0 | _  @tag(PAPER_GLOBAL_PACKET_LIMITER_ALL_PACKETS_MAX_PACKET_RATE)
			}
			"kick-message": *"<red><lang:disconnect.exceeded_packet_rate>" | _ @tag(PAPER_GLOBAL_PACKET_LIMITER_KICK_MESSAGE)
		}

		"play-in-use-item-spam-threshold": *300 | _ @tag(PAPER_GLOBAL_PLAY_IN_USE_ITEM_SPAM_THRESHOLD)

		"player-auto-save": {
			"max-per-tick": *-1 | _ @tag(PAPER_GLOBAL_PLAYER_AUTO_SAVE_MAX_PER_TICK)
			rate:           *-1 | _ @tag(PAPER_GLOBAL_PLAYER_AUTO_SAVE_RATE)
		}

		proxies: {
			"bungee-cord": {
				"online-mode": *true | _ @tag(PAPER_GLOBAL_PROXIES_BUNGEE_CORD_ONLINE_MODE)
			}
			"proxy-protocol": *false | _ @tag(PAPER_GLOBAL_PROXIES_PROXY_PROTOCOL)
			velocity: {
				enabled:       *false | _ @tag(PAPER_GLOBAL_PROXIES_VELOCITY_ENABLED)
				"online-mode": *false | _ @tag(PAPER_GLOBAL_PROXIES_VELOCITY_ONLINE_MODE)
				secret:        *"" | _    @tag(PAPER_GLOBAL_PROXIES_VELOCITY_SECRET)
			}
		}

		scoreboards: {
			"save-empty-scoreboard-teams": *false | _ @tag(PAPER_GLOBAL_SCOREBOARDS_SAVE_EMPTY_SCOREBOARD_TEAMS)
			"track-plugin-scoreboards":    *false | _ @tag(PAPER_GLOBAL_SCOREBOARDS_TRACK_PLUGIN_SCOREBOARDS)
		}

		"spam-limiter": {
			"incoming-packet-threshold": *300 | _ @tag(PAPER_GLOBAL_SPAM_LIMITER_INCOMING_PACKET_THRESHOLD)
			"recipe-spam-increment":     *1 | _   @tag(PAPER_GLOBAL_SPAM_LIMITER_RECIPE_SPAM_INCREMENT)
			"recipe-spam-limit":         *20 | _  @tag(PAPER_GLOBAL_SPAM_LIMITER_RECIPE_SPAM_LIMIT)
			"tab-spam-increment":        *1 | _   @tag(PAPER_GLOBAL_SPAM_LIMITER_TAB_SPAM_INCREMENT)
			"tab-spam-limit":            *500 | _ @tag(PAPER_GLOBAL_SPAM_LIMITER_TAB_SPAM_LIMIT)
		}

		"unsupported-settings": {
			"allow-grindstone-overstacking":         *false | _  @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_GRINDSTONE_OVERSTACKING)
			"allow-headless-pistons":                *false | _  @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_HEADLESS_PISTONS)
			"allow-permanent-block-break-exploits":  *false | _  @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_PERMANENT_BLOCK_BREAK_EXPLOITS)
			"allow-piston-duplication":              *false | _  @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_PISTON_DUPLICATION)
			"allow-tripwire-disarming-exploits":     *false | _  @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_TRIPWIRE_DISARMING_EXPLOITS)
			"allow-unsafe-end-portal-teleportation": *false | _  @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_ALLOW_UNSAFE_END_PORTAL_TELEPORTATION)
			"compression-format":                    *"ZLIB" | _ @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_COMPRESSION_FORMAT)
			"perform-username-validation":           *true | _   @tag(PAPER_GLOBAL_UNSUPPORTED_SETTINGS_PERFORM_USERNAME_VALIDATION)
		}

		watchdog: {
			"early-warning-delay": *10000 | _ @tag(PAPER_GLOBAL_WATCHDOG_EARLY_WARNING_DELAY)
			"early-warning-every": *5000 | _  @tag(PAPER_GLOBAL_WATCHDOG_EARLY_WARNING_EVERY)
		}
	}
}
