// This is the main configuration file for Spigot.
// Specifications: https://docs.papermc.io/paper/reference/spigot-configuration/

package paper

spigot: {
	"config-version": 12 // Not customizable - Internal value only

	messages: {
		whitelist:         *"You are not whitelisted on this server!" | _   @tag(SPIGOT_MESSAGES_WHITELIST)
		"unknown-command": *"Unknown command. Type \"/help\" for help." | _ @tag(SPIGOT_MESSAGES_UNKNOWN_COMMAND)
		"server-full":     *"The server is full!" | _                       @tag(SPIGOT_MESSAGES_SERVER_FULL)
		"outdated-client": *"Outdated client! Please use {0}" | _           @tag(SPIGOT_MESSAGES_OUTDATED_CLIENT)
		"outdated-server": *"Outdated server! I'm still on {0}" | _         @tag(SPIGOT_MESSAGES_OUTDATED_SERVER)
		restart:           *"Server is restarting" | _                      @tag(SPIGOT_MESSAGES_RESTART)
	}

	commands: {
		"tab-complete":    *0 | _    @tag(SPIGOT_COMMANDS_TAB_COMPLETE)
		"send-namespaced": *true | _ @tag(SPIGOT_COMMANDS_SEND_NAMESPACED)
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		"spam-exclusions": *["/skill"] | _
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		"replace-commands": *[
			"setblock",
			"summon",
			"testforblock",
			"tellraw",
		] | _
		log:                           *true | _  @tag(SPIGOT_COMMANDS_LOG)
		"silent-commandblock-console": *false | _ @tag(SPIGOT_COMMANDS_SILENT_COMMANDBLOCK_CONSOLE)
	}

	settings: {
		bungeecord: *false | _ @tag(SPIGOT_SETTINGS_BUNGEECORD)
		attribute: {
			maxAbsorption: {
				max: *2048.0 | _ @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_ABSORPTION)
			}
			maxHealth: {
				max: *1024.0 | _ @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_HEALTH)
			}
			movementSpeed: {
				max: *1024.0 | _ @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_MOVEMENT_SPEED)
			}
			attackDamage: {
				max: *2048.0 | _ @tag(SPIGOT_SETTINGS_ATTRIBUTE_MAX_ATTACK_DAMAGE)
			}
		}
		"user-cache-size":              *1000 | _   @tag(SPIGOT_SETTINGS_USER_CACHE_SIZE)
		"netty-threads":                *4 | _      @tag(SPIGOT_SETTINGS_NETTY_THREADS)
		"player-shuffle":               *0 | _      @tag(SPIGOT_SETTINGS_PLAYER_SHUFFLE)
		"moved-wrongly-threshold":      *0.0625 | _ @tag(SPIGOT_SETTINGS_MOVED_WRONGLY_THRESHOLD)
		"moved-too-quickly-multiplier": *10.0 | _   @tag(SPIGOT_SETTINGS_MOVED_TOO_QUICKLY_MULTIPLIER)
		"log-villager-deaths":          *true | _   @tag(SPIGOT_SETTINGS_LOG_VILLAGER_DEATHS)
		"log-named-deaths":             *true | _   @tag(SPIGOT_SETTINGS_LOG_NAMED_DEATHS)
		"timeout-time":                 *30 | _     @tag(SPIGOT_SETTINGS_TIMEOUT_TIME)
		// TODO: check https://gist.github.com/Prof-Bloodstone/6367eb4016eaf9d1646a88772cdbbac5
		"restart-on-crash":             false         // System-managed property (only rely on Docker restart policy)
		"restart-script":               "unsupported" // System-managed property (only rely on Docker restart policy)
		"save-user-cache-on-stop-only": *false | _    @tag(SPIGOT_SETTINGS_SAVE_USER_CACHE_ON_STOP_ONLY)
		"sample-count":                 *12 | _       @tag(SPIGOT_SETTINGS_SAMPLE_COUNT)
		debug:                          *false | _    @tag(SPIGOT_SETTINGS_DEBUG)
	}

	players: {
		"disable-saving": *false | _ @tag(SPIGOT_PLAYERS_DISABLE_SAVING)
	}

	advancements: {
		"disable-saving": *false | _ @tag(SPIGOT_ADVANCEMENTS_DISABLE_SAVING)
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		disabled: *["minecraft:story/disabled"] | _
	}

	// No mapping to any environment variable for world-specific settings (only default settings are mapped).
	// TODO: support world-specific settings
	// TODO: move into separate file (e.g., spigot-world-defaults.cue)
	"world-settings": default: {
		"below-zero-generation-in-existing-chunks": *true | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_BELOW_ZERO_GENERATION_IN_EXISTING_CHUNKS)
		"mob-spawn-range":                          *8 | _         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MOB_SPAWN_RANGE)
		"item-despawn-rate":                        *6000 | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ITEM_DESPAWN_RATE)
		"thunder-chance":                           *100000 | _    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_THUNDER_CHANCE)
		"simulation-distance":                      *"default" | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SIMULATION_DISTANCE)
		"view-distance":                            *"default" | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_VIEW_DISTANCE)
		"zombie-aggressive-towards-villager":       *true | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ZOMBIE_AGGRESSIVE_TOWARDS_VILLAGER)
		"enable-zombie-pigmen-portal-spawns":       *true | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENABLE_ZOMBIE_PIGMEN_PORTAL_SPAWNS)
		"dragon-death-sound-radius":                *0 | _         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_DRAGON_DEATH_SOUND_RADIUS)
		"wither-spawn-sound-radius":                *0 | _         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_WITHER_SPAWN_SOUND_RADIUS)
		"end-portal-sound-radius":                  *0 | _         @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_END_PORTAL_SOUND_RADIUS)
		"hanging-tick-frequency":                   *100 | _       @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HANGING_TICK_FREQUENCY)
		"entity-tracking-range": {
			players:  *128 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_PLAYERS)
			animals:  *96 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_ANIMALS)
			monsters: *96 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_MONSTERS)
			misc:     *96 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_MISC)
			display:  *128 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_DISPLAY)
			other:    *64 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_TRACKING_RANGE_OTHER)
		}
		"nerf-spawner-mobs":    *false | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_NERF_SPAWNER_MOBS)
		"arrow-despawn-rate":   *1200 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ARROW_DESPAWN_RATE)
		"trident-despawn-rate": *1200 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_TRIDENT_DESPAWN_RATE)
		"entity-activation-range": {
			animals:           *32 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_ANIMALS)
			monsters:          *32 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_MONSTERS)
			raiders:           *64 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_RAIDERS)
			misc:              *16 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_MISC)
			water:             *16 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WATER)
			villagers:         *32 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS)
			"flying-monsters": *32 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_FLYING_MONSTERS)
			"wake-up-inactive": {
				"animals-max-per-tick":         *4 | _    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_ANIMALS_MAX_PER_TICK)
				"animals-every":                *1200 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_ANIMALS_EVERY)
				"animals-for":                  *100 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_ANIMALS_FOR)
				"monsters-max-per-tick":        *8 | _    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_MONSTERS_MAX_PER_TICK)
				"monsters-every":               *400 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_MONSTERS_EVERY)
				"monsters-for":                 *100 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_MONSTERS_FOR)
				"villagers-max-per-tick":       *4 | _    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_VILLAGERS_MAX_PER_TICK)
				"villagers-every":              *600 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_VILLAGERS_EVERY)
				"villagers-for":                *100 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_VILLAGERS_FOR)
				"flying-monsters-max-per-tick": *8 | _    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_FLYING_MONSTERS_MAX_PER_TICK)
				"flying-monsters-every":        *200 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_FLYING_MONSTERS_EVERY)
				"flying-monsters-for":          *100 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_WAKE_UP_INACTIVE_FLYING_MONSTERS_FOR)
			}
			"villagers-work-immunity-after": *100 | _   @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS_WORK_IMMUNITY_AFTER)
			"villagers-work-immunity-for":   *20 | _    @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS_WORK_IMMUNITY_FOR)
			"villagers-active-for-panic":    *true | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_VILLAGERS_ACTIVE_FOR_PANIC)
			"tick-inactive-villagers":       *true | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_TICK_INACTIVE_VILLAGERS)
			"ignore-spectators":             *false | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_ENTITY_ACTIVATION_RANGE_IGNORE_SPECTATORS)
		}
		"unload-frozen-chunks": *false | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_UNLOAD_FROZEN_CHUNKS)
		// Let seeds being randomly generated by default instead
		"seed-village":        *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_VILLAGE)
		"seed-desert":         *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_DESERT)
		"seed-igloo":          *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_IGLOO)
		"seed-jungle":         *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_JUNGLE)
		"seed-swamp":          *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_SWAMP)
		"seed-monument":       *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_MONUMENT)
		"seed-shipwreck":      *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_SHIPWRECK)
		"seed-ocean":          *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_OCEAN)
		"seed-outpost":        *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_OUTPOST)
		"seed-endcity":        *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_ENDCITY)
		"seed-slime":          *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_SLIME)
		"seed-nether":         *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_NETHER)
		"seed-mansion":        *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_MANSION)
		"seed-fossil":         *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_FOSSIL)
		"seed-portal":         *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_PORTAL)
		"seed-ancientcity":    *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_ANCIENTCITY)
		"seed-trailruins":     *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_TRAILRUINS)
		"seed-trialchambers":  *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_TRIALCHAMBERS)
		"seed-buriedtreasure": *null | _      @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_BURIEDTREASURE)
		"seed-mineshaft":      *"default" | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_MINESHAFT)
		"seed-stronghold":     *"default" | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_SEED_STRONGHOLD)
		growth: {
			"cactus-modifier":        *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CACTUS_MODIFIER)
			"cane-modifier":          *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CANE_MODIFIER)
			"melon-modifier":         *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_MELON_MODIFIER)
			"mushroom-modifier":      *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_MUSHROOM_MODIFIER)
			"pumpkin-modifier":       *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_PUMPKIN_MODIFIER)
			"sapling-modifier":       *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_SAPLING_MODIFIER)
			"beetroot-modifier":      *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_BEETROOT_MODIFIER)
			"carrot-modifier":        *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CARROT_MODIFIER)
			"potato-modifier":        *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_POTATO_MODIFIER)
			"torchflower-modifier":   *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_TORCHFLOWER_MODIFIER)
			"wheat-modifier":         *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_WHEAT_MODIFIER)
			"netherwart-modifier":    *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_NETHERWART_MODIFIER)
			"vine-modifier":          *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_VINE_MODIFIER)
			"cocoa-modifier":         *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_COCOA_MODIFIER)
			"bamboo-modifier":        *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_BAMBOO_MODIFIER)
			"sweetberry-modifier":    *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_SWEETBERRY_MODIFIER)
			"kelp-modifier":          *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_KELP_MODIFIER)
			"twistingvines-modifier": *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_TWISTINGVINES_MODIFIER)
			"weepingvines-modifier":  *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_WEEPINGVINES_MODIFIER)
			"cavevines-modifier":     *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_CAVEVINES_MODIFIER)
			"glowberry-modifier":     *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_GLOWBERRY_MODIFIER)
			"pitcherplant-modifier":  *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_GROWTH_PITCHERPLANT_MODIFIER)
		}
		"max-tnt-per-tick": *100 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MAX_TNT_PER_TICK)
		"max-tick-time": {
			tile:   *50 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MAX_TICK_TIME_TILE)
			entity: *50 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MAX_TICK_TIME_ENTITY)
		}
		"merge-radius": {
			exp:  *-1.0 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MERGE_RADIUS_EXP)
			item: *0.5 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_MERGE_RADIUS_ITEM)
		}
		hunger: {
			"jump-walk-exhaustion":   *0.05 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_JUMP_WALK_EXHAUSTION)
			"jump-sprint-exhaustion": *0.2 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_JUMP_SPRINT_EXHAUSTION)
			"combat-exhaustion":      *0.1 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_COMBAT_EXHAUSTION)
			"regen-exhaustion":       *6.0 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_REGEN_EXHAUSTION)
			"swim-multiplier":        *0.01 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_SWIM_MULTIPLIER)
			"sprint-multiplier":      *0.1 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_SPRINT_MULTIPLIER)
			"other-multiplier":       *0.0 | _  @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HUNGER_OTHER_MULTIPLIER)
		}
		"ticks-per": {
			"hopper-transfer": *8 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_TICKS_PER_HOPPER_TRANSFER)
			"hopper-check":    *1 | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_TICKS_PER_HOPPER_CHECK)
		}
		"hopper-amount":          *1 | _     @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HOPPER_AMOUNT)
		"hopper-can-load-chunks": *false | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_HOPPER_CAN_LOAD_CHUNKS)
		verbose:                  *false | _ @tag(SPIGOT_WORLD_SETTINGS_DEFAULT_VERBOSE)
	}

	stats: {
		"disable-saving": *false | _ @tag(SPIGOT_STATS_DISABLE_SAVING)
		// No mapping to any environment variable for this field since unsupported due to its complexity.
		"forced-stats": *{} | _
	}
}
