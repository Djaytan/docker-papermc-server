// This is the main configuration file for Spigot.
// Specifications: https://docs.papermc.io/paper/reference/spigot-configuration/

package paper

spigot: {
	"config-version": 12 // Not customizable - Internal value only

	messages: {
		whitelist:         *"You are not whitelisted on this server!" | string   @tag(SPIGOT_MESSAGES_WHITELIST, type=string)
		"unknown-command": *"Unknown command. Type \"/help\" for help." | string @tag(SPIGOT_MESSAGES_UNKNOWN_COMMAND, type=string)
		"server-full":     *"The server is full!" | string                       @tag(SPIGOT_MESSAGES_SERVER_FULL, type=string)
		"outdated-client": *"Outdated client! Please use {0}" | string           @tag(SPIGOT_MESSAGES_OUTDATED_CLIENT, type=string)
		"outdated-server": *"Outdated server! I'm still on {0}" | string         @tag(SPIGOT_MESSAGES_OUTDATED_SERVER, type=string)
		restart:           *"Server is restarting" | string                      @tag(SPIGOT_MESSAGES_RESTART, type=string)
	}

	commands: {
		"tab-complete":    *0 | int     @tag(SPIGOT_COMMANDS_TAB_COMPLETE, type=int)
		"send-namespaced": *true | bool @tag(SPIGOT_COMMANDS_SEND_NAMESPACED, type=bool)
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		"spam-exclusions": *["/skill"] | [...string]
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		"replace-commands": *[
			"setblock",
			"summon",
			"testforblock",
			"tellraw",
		] | [...string]
		log:                           *true | bool  @tag(SPIGOT_COMMANDS_LOG, type=bool)
		"silent-commandblock-console": *false | bool @tag(SPIGOT_COMMANDS_SILENT_COMMANDBLOCK_CONSOLE, type=bool)
	}

	settings: {
		bungeecord: *false | bool @tag(SPIGOT_SETTINGS_BUNGEECORD, type=bool)
		attribute: {
			maxAbsorption: {
				max: *2048.0 | float @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_ABSORPTION, type=number)
			}
			maxHealth: {
				max: *1024.0 | float @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_HEALTH, type=number)
			}
			movementSpeed: {
				max: *1024.0 | float @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_MOVEMENT_SPEED, type=number)
			}
			attackDamage: {
				max: *2048.0 | float @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_ATTACK_DAMAGE, type=number)
			}
		}
		"user-cache-size":              *1000 | int     @tag(SPIGOT_SETTINGS_USER_CACHE_SIZE, type=int)
		"netty-threads":                *4 | int        @tag(SPIGOT_SETTINGS_NETTY_THREADS, type=int)
		"player-shuffle":               *0 | int        @tag(SPIGOT_SETTINGS_PLAYER_SHUFFLE, type=int)
		"moved-wrongly-threshold":      *0.0625 | float @tag(SPIGOT_SETTINGS_MOVED_WRONGLY_THRESHOLD, type=number)
		"moved-too-quickly-multiplier": *10.0 | int     @tag(SPIGOT_SETTINGS_MOVED_TOO_QUICKLY_MULTIPLIER, type=number)
		"log-villager-deaths":          *true | bool    @tag(SPIGOT_SETTINGS_LOG_VILLAGER_DEATHS, type=bool)
		"log-named-deaths":             *true | bool    @tag(SPIGOT_SETTINGS_LOG_NAMED_DEATHS, type=bool)
		"timeout-time":                 *30 | int       @tag(SPIGOT_SETTINGS_TIMEOUT_TIME, type=int)
		// TODO: check https://gist.github.com/Prof-Bloodstone/6367eb4016eaf9d1646a88772cdbbac5
		"restart-on-crash":             false         // System-managed property (only rely on Docker restart policy)
		"restart-script":               "unsupported" // System-managed property (only rely on Docker restart policy)
		"save-user-cache-on-stop-only": *false | bool @tag(SPIGOT_SETTINGS_SAVE_USER_CACHE_ON_STOP_ONLY, type=bool)
		"sample-count":                 *12 | int     @tag(SPIGOT_SETTINGS_SAMPLE_COUNT, type=int)
		debug:                          *false | bool @tag(SPIGOT_SETTINGS_DEBUG, type=bool)
	}

	players: {
		"disable-saving": *false | bool @tag(SPIGOT_PLAYERS_DISABLE_SAVING, type=bool)
	}

	advancements: {
		"disable-saving": *false | bool @tag(SPIGOT_ADVANCEMENTS_DISABLE_SAVING, type=bool)
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		disabled: *["minecraft:story/disabled"] | [...string]
	}

	// No mapping to any environment variable for world-specific settings (only default settings are mapped).
	// TODO: support world-specific settings
	// TODO: move into separate file (e.g., spigot-world-defaults.cue)
	"world-settings": default: {
		"below-zero-generation-in-existing-chunks": *true | bool     @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_BELOW_ZERO_GENERATION_IN_EXISTING_CHUNKS, type=bool)
		"mob-spawn-range":                          *8 | int         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MOB_SPAWN_RANGE, type=int)
		"item-despawn-rate":                        *6000 | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ITEM_DESPAWN_RATE, type=int)
		"thunder-chance":                           *100000 | int    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_THUNDER_CHANCE, type=int)
		"simulation-distance":                      *"default" | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SIMULATION_DISTANCE, type=int)
		"view-distance":                            *"default" | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_VIEW_DISTANCE, type=int)
		"zombie-aggressive-towards-villager":       *true | bool     @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ZOMBIE_AGGRESSIVE_TOWARDS_VILLAGER, type=bool)
		"enable-zombie-pigmen-portal-spawns":       *true | bool     @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENABLE_ZOMBIE_PIGMEN_PORTAL_SPAWNS, type=bool)
		"dragon-death-sound-radius":                *0 | int         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_DRAGON_DEATH_SOUND_RADIUS, type=int)
		"wither-spawn-sound-radius":                *0 | int         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_WITHER_SPAWN_SOUND_RADIUS, type=int)
		"end-portal-sound-radius":                  *0 | int         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_END_PORTAL_SOUND_RADIUS, type=int)
		"hanging-tick-frequency":                   *100 | int       @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HANGING_TICK_FREQUENCY, type=int)
		"entity-tracking-range": {
			players:  *128 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_PLAYERS, type=int)
			animals:  *96 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_ANIMALS, type=int)
			monsters: *96 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_MONSTERS, type=int)
			misc:     *96 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_MISC, type=int)
			display:  *128 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_DISPLAY, type=int)
			other:    *64 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_OTHER, type=int)
		}
		"nerf-spawner-mobs":    *false | bool @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_NERF_SPAWNER_MOBS, type=bool)
		"arrow-despawn-rate":   *1200 | int   @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ARROW_DESPAWN_RATE, type=int)
		"trident-despawn-rate": *1200 | int   @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_TRIDENT_DESPAWN_RATE, type=int)
		"entity-activation-range": {
			animals:           *32 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_ANIMALS, type=int)
			monsters:          *32 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_MONSTERS, type=int)
			raiders:           *64 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_RAIDERS, type=int)
			misc:              *16 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_MISC, type=int)
			water:             *16 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WATER, type=int)
			villagers:         *32 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS, type=int)
			"flying-monsters": *32 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_FLYING_MONSTERS, type=int)
			"wake-up-inactive": {
				"animals-max-per-tick":         *4 | int    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_ANIMALS_MAX_PER_TICK, type=int)
				"animals-every":                *1200 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_ANIMALS_EVERY, type=int)
				"animals-for":                  *100 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_ANIMALS_FOR, type=int)
				"monsters-max-per-tick":        *8 | int    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_MONSTERS_MAX_PER_TICK, type=int)
				"monsters-every":               *400 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_MONSTERS_EVERY, type=int)
				"monsters-for":                 *100 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_MONSTERS_FOR, type=int)
				"villagers-max-per-tick":       *4 | int    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_VILLAGERS_MAX_PER_TICK, type=int)
				"villagers-every":              *600 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_VILLAGERS_EVERY, type=int)
				"villagers-for":                *100 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_VILLAGERS_FOR, type=int)
				"flying-monsters-max-per-tick": *8 | int    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_FLYING_MONSTERS_MAX_PER_TICK, type=int)
				"flying-monsters-every":        *200 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_FLYING_MONSTERS_EVERY, type=int)
				"flying-monsters-for":          *100 | int  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_FLYING_MONSTERS_FOR, type=int)
			}
			"villagers-work-immunity-after": *100 | int    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS_WORK_IMMUNITY_AFTER, type=int)
			"villagers-work-immunity-for":   *20 | int     @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS_WORK_IMMUNITY_FOR, type=int)
			"villagers-active-for-panic":    *true | bool  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS_ACTIVE_FOR_PANIC, type=bool)
			"tick-inactive-villagers":       *true | bool  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_TICK_INACTIVE_VILLAGERS, type=bool)
			"ignore-spectators":             *false | bool @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_IGNORE_SPECTATORS, type=bool)
		}
		"unload-frozen-chunks": *false | bool @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_UNLOAD_FROZEN_CHUNKS, type=bool)
		// Let seeds being randomly generated by default instead
		"seed-village":        *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_VILLAGE, type=int)
		"seed-desert":         *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_DESERT, type=int)
		"seed-igloo":          *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_IGLOO, type=int)
		"seed-jungle":         *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_JUNGLE, type=int)
		"seed-swamp":          *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_SWAMP, type=int)
		"seed-monument":       *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_MONUMENT, type=int)
		"seed-shipwreck":      *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_SHIPWRECK, type=int)
		"seed-ocean":          *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_OCEAN, type=int)
		"seed-outpost":        *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_OUTPOST, type=int)
		"seed-endcity":        *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_ENDCITY, type=int)
		"seed-slime":          *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_SLIME, type=int)
		"seed-nether":         *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_NETHER, type=int)
		"seed-mansion":        *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_MANSION, type=int)
		"seed-fossil":         *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_FOSSIL, type=int)
		"seed-portal":         *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_PORTAL, type=int)
		"seed-ancientcity":    *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_ANCIENTCITY, type=int)
		"seed-trailruins":     *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_TRAILRUINS, type=int)
		"seed-trialchambers":  *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_TRIALCHAMBERS, type=int)
		"seed-buriedtreasure": *null | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_BURIEDTREASURE, type=int)
		"seed-mineshaft":      *"default" | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_MINESHAFT, type=int)
		"seed-stronghold":     *"default" | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_STRONGHOLD, type=int)
		growth: {
			"cactus-modifier":        *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CACTUS_MODIFIER, type=int)
			"cane-modifier":          *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CANE_MODIFIER, type=int)
			"melon-modifier":         *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_MELON_MODIFIER, type=int)
			"mushroom-modifier":      *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_MUSHROOM_MODIFIER, type=int)
			"pumpkin-modifier":       *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_PUMPKIN_MODIFIER, type=int)
			"sapling-modifier":       *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_SAPLING_MODIFIER, type=int)
			"beetroot-modifier":      *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_BEETROOT_MODIFIER, type=int)
			"carrot-modifier":        *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CARROT_MODIFIER, type=int)
			"potato-modifier":        *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_POTATO_MODIFIER, type=int)
			"torchflower-modifier":   *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_TORCHFLOWER_MODIFIER, type=int)
			"wheat-modifier":         *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_WHEAT_MODIFIER, type=int)
			"netherwart-modifier":    *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_NETHERWART_MODIFIER, type=int)
			"vine-modifier":          *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_VINE_MODIFIER, type=int)
			"cocoa-modifier":         *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_COCOA_MODIFIER, type=int)
			"bamboo-modifier":        *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_BAMBOO_MODIFIER, type=int)
			"sweetberry-modifier":    *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_SWEETBERRY_MODIFIER, type=int)
			"kelp-modifier":          *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_KELP_MODIFIER, type=int)
			"twistingvines-modifier": *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_TWISTINGVINES_MODIFIER, type=int)
			"weepingvines-modifier":  *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_WEEPINGVINES_MODIFIER, type=int)
			"cavevines-modifier":     *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CAVEVINES_MODIFIER, type=int)
			"glowberry-modifier":     *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_GLOWBERRY_MODIFIER, type=int)
			"pitcherplant-modifier":  *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_PITCHERPLANT_MODIFIER, type=int)
		}
		"max-tnt-per-tick": *100 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MAX_TNT_PER_TICK, type=int)
		"max-tick-time": {
			tile:   *50 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MAX_TICK_TIME_TILE, type=int)
			entity: *50 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MAX_TICK_TIME_ENTITY, type=int)
		}
		"merge-radius": {
			exp:  *-1.0 | float @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MERGE_RADIUS_EXP, type=number)
			item: *0.5 | float  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MERGE_RADIUS_ITEM, type=number)
		}
		hunger: {
			"jump-walk-exhaustion":   *0.05 | float @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_JUMP_WALK_EXHAUSTION, type=number)
			"jump-sprint-exhaustion": *0.2 | float  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_JUMP_SPRINT_EXHAUSTION, type=number)
			"combat-exhaustion":      *0.1 | float  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_COMBAT_EXHAUSTION, type=number)
			"regen-exhaustion":       *6.0 | float  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_REGEN_EXHAUSTION, type=number)
			"swim-multiplier":        *0.01 | float @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_SWIM_MULTIPLIER, type=number)
			"sprint-multiplier":      *0.1 | float  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_SPRINT_MULTIPLIER, type=number)
			"other-multiplier":       *0.0 | float  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_OTHER_MULTIPLIER, type=number)
		}
		"ticks-per": {
			"hopper-transfer": *8 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_TICKS_PER_HOPPER_TRANSFER, type=int)
			"hopper-check":    *1 | int @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_TICKS_PER_HOPPER_CHECK, type=int)
		}
		"hopper-amount":          *1 | int      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HOPPER_AMOUNT, type=int)
		"hopper-can-load-chunks": *false | bool @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HOPPER_CAN_LOAD_CHUNKS, type=bool)
		verbose:                  *false | bool @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_VERBOSE, type=bool)
	}

	stats: {
		"disable-saving": *false | bool @tag(SPIGOT_STATS_DISABLE_SAVING, type=bool)
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		"forced-stats": *{} | {[string]: int}
	}
}
