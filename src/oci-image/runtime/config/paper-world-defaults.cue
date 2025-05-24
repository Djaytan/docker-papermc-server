// Default configuration for PaperMC worlds.
//
// Configuration options here apply to all worlds, unless you specify overrides inside
// the world-specific config files located in each world folder.
//
// Specifications: https://docs.papermc.io/paper/reference/world-configuration/

package paper

paper: {
	"worlds-defaults": {
		// TODO: support version 31
		"_version": 30 // Not customizable - Internal value only

		"allow-leashing-undead-horse": *false | _ @tag(PAPER_WORLD_DEFAULTS_ALLOW_LEASHING_UNDEAD_HORSE)

		anticheat: {
			"anti-xray": {
				"chunk-edge-mode": *1 | _     @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_CHUNK_EDGE_MODE)
				enabled:           *false | _ @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_ENABLED)
				"engine-mode":     *1 | _     @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_ENGINE_MODE)
				// No mapping to any environment variable for this field since unsupported due to its complexity.
				"hidden-blocks": *[
					"copper_ore",
					"deepslate_copper_ore",
					"gold_ore",
					"deepslate_gold_ore",
					"iron_ore",
					"deepslate_iron_ore",
					"coal_ore",
					"deepslate_coal_ore",
					"lapis_ore",
					"deepslate_lapis_ore",
					"mossy_cobblestone",
					"obsidian",
					"chest",
					"diamond_ore",
					"deepslate_diamond_ore",
					"redstone_ore",
					"deepslate_redstone_ore",
					"clay",
					"emerald_ore",
					"deepslate_emerald_ore",
					"ender_chest",
				] | _
				"lava-obscures":           *false | _ @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_LAVA_OBSCURES)
				"max-block-height":        *64 | _    @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_MAX_BLOCK_HEIGHT)
				"max-chunk-section-index": *3 | _     @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_MAX_CHUNK_SECTION_INDEX)
				// No mapping to any environment variable for this field since unsupported due to its complexity.
				"replacement-blocks": *[
					"stone",
					"oak_planks",
					"deepslate",
				] | _
				"update-radius":  *2 | _     @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_UPDATE_RADIUS)
				"use-permission": *false | _ @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_USE_PERMISSION)
			}
			obfuscation: items: {
				"hide-durability":                   *false | _ @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_OBFUSCATION_ITEMS_HIDE_DURABILITY)
				"hide-itemmeta":                     *false | _ @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_OBFUSCATION_ITEMS_HIDE_ITEMMETA)
				"hide-itemmeta-with-visual-effects": *false | _ @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_OBFUSCATION_ITEMS_HIDE_ITEMMETA_WITH_VISUAL_EFFECTS)
			}
		}

		"baby-zombie-movement-speed": *0.5 | _ @tag(PAPER_WORLD_DEFAULTS_BABY_ZOMBIE_MOVEMENT_SPEED)

		chunks: {
			"auto-save-interval":     *6000 | _  @tag(PAPER_WORLD_DEFAULTS_CHUNKS_AUTO_SAVE_INTERVAL)
			"delay-chunk-unloads-by": *"10s" | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_DELAY_CHUNK_UNLOADS_BY)
			"entity-per-chunk-save-limit": {
				arrow:          *-1 | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_ARROW)
				ender_pearl:    *-1 | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_ENDER_PEARL)
				experience_orb: *-1 | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_EXPERIENCE_ORB)
				fireball:       *-1 | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_FIREBALL)
				small_fireball: *-1 | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_SMALL_FIREBALL)
				snowball:       *-1 | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_SNOWBALL)
			}
			"fixed-chunk-inhabited-time":          *-1 | _    @tag(PAPER_WORLD_DEFAULTS_CHUNKS_FIXED_CHUNK_INHABITED_TIME)
			"flush-regions-on-save":               *false | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_FLUSH_REGIONS_ON_SAVE)
			"max-auto-save-chunks-per-tick":       *24 | _    @tag(PAPER_WORLD_DEFAULTS_CHUNKS_MAX_AUTO_SAVE_CHUNKS_PER_TICK)
			"prevent-moving-into-unloaded-chunks": *false | _ @tag(PAPER_WORLD_DEFAULTS_CHUNKS_PREVENT_MOVING_INTO_UNLOADED_CHUNKS)
		}

		collisions: {
			"allow-player-cramming-damage":         *false | _ @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_ALLOW_PLAYER_CRAMMING_DAMAGE)
			"allow-vehicle-collisions":             *true | _  @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_ALLOW_VEHICLE_COLLISIONS)
			"fix-climbing-bypassing-cramming-rule": *false | _ @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_FIX_CLIMBING_BYPASSING_CRAMMING_RULE)
			"max-entity-collisions":                *8 | _     @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_MAX_ENTITY_COLLISIONS)
			"only-players-collide":                 *false | _ @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_ONLY_PLAYERS_COLLIDE)
		}

		"command-blocks": {
			"force-follow-perm-level": *true | _ @tag(PAPER_WORLD_DEFAULTS_COMMAND_BLOCKS_FORCE_FOLLOW_PERM_LEVEL)
			"permissions-level":       *2 | _    @tag(PAPER_WORLD_DEFAULTS_COMMAND_BLOCKS_PERMISSIONS_LEVEL)
		}

		"enable-old-tnt-cannon-behaviors": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENABLE_OLD_TNT_CANNON_BEHAVIORS)

		entities: {
			"armor-stands": {
				"do-collision-entity-lookups": *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_ARMOR_STANDS_DO_COLLISION_ENTITY_LOOKUPS)
				tick:                          *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_ARMOR_STANDS_TICK)
			}
			behavior: {
				"allow-spider-world-border-climbing": *true | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ALLOW_SPIDER_WORLD_BORDER_CLIMBING)
				"baby-zombie-movement-modifier":      *0.5 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_BABY_ZOMBIE_MOVEMENT_MODIFIER)
				"disable-chest-cat-detection":        *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_DISABLE_CHEST_CAT_DETECTION)
				"disable-creeper-lingering-effect":   *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_DISABLE_CREEPER_LINGERING_EFFECT)
				"disable-player-crits":               *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_DISABLE_PLAYER_CRITS)
				// No mapping to any environment variable for this field since unsupported due to its complexity.
				"door-breaking-difficulty": {
					husk: *["HARD"] | _
					vindicator: *["NORMAL", "HARD"] | _
					zombie: *["HARD"] | _
					zombie_villager: *["HARD"] | _
					zombified_piglin: *["HARD"] | _
				}
				"ender-dragons-death-always-places-dragon-egg": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ENDER_DRAGONS_DEATH_ALWAYS_PLACES_DRAGON_EGG)
				"experience-merge-max-value":                   *-1 | _    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_EXPERIENCE_MERGE_MAX_VALUE)
				"mobs-can-always-pick-up-loot": {
					skeletons: *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_MOBS_CAN_ALWAYS_PICK_UP_LOOT_SKELETONS)
					zombies:   *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_MOBS_CAN_ALWAYS_PICK_UP_LOOT_ZOMBIES)
				}
				"nerf-pigmen-from-nether-portals":           *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_NERF_PIGMEN_FROM_NETHER_PORTALS)
				"parrots-are-unaffected-by-player-movement": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PARROTS_ARE_UNAFFECTED_BY_PLAYER_MOVEMENT)
				"phantoms-do-not-spawn-on-creative-players": *true | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_DO_NOT_SPAWN_ON_CREATIVE_PLAYERS)
				"phantoms-only-attack-insomniacs":           *true | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_ONLY_ATTACK_INSOMNIACS)
				"phantoms-spawn-attempt-max-seconds":        *119 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_SPAWN_ATTEMPT_MAX_SECONDS)
				"phantoms-spawn-attempt-min-seconds":        *60 | _    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_SPAWN_ATTEMPT_MIN_SECONDS)
				"piglins-guard-chests":                      *true | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PIGLINS_GUARD_CHESTS)
				"pillager-patrols": {
					disable:        *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_DISABLE)
					"spawn-chance": *0.2 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_SPAWN_CHANCE)
					"spawn-delay": {
						"per-player": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_SPAWN_DELAY_PER_PLAYER)
						ticks:        *12000 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_SPAWN_DELAY_TICKS)
					}
					start: {
						day:          *5 | _     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_START_DAY)
						"per-player": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_START_PER_PLAYER)
					}
				}
				"player-insomnia-start-ticks":      *72000 | _     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PLAYER_INSOMNIA_START_TICKS)
				"should-remove-dragon":             *false | _     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_SHOULD_REMOVE_DRAGON)
				"spawner-nerfed-mobs-should-jump":  *false | _     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_SPAWNER_NERFED_MOBS_SHOULD_JUMP)
				"zombie-villager-infection-chance": *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ZOMBIE_VILLAGER_INFECTION_CHANCE)
				"zombies-target-turtle-eggs":       *true | _      @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ZOMBIES_TARGET_TURTLE_EGGS)
			}
			"entities-target-with-follow-range": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_ENTITIES_TARGET_WITH_FOLLOW_RANGE)
			markers: {
				tick: *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MARKERS_TICK)
			}
			"mob-effects": {
				"immune-to-wither-effect": {
					wither:            *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_IMMUNE_TO_WITHER_EFFECT_WITHER)
					"wither-skeleton": *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_IMMUNE_TO_WITHER_EFFECT_WITHER_SKELETON)
				}
				"spiders-immune-to-poison-effect":  *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_SPIDERS_IMMUNE_TO_POISON_EFFECT)
				"undead-immune-to-certain-effects": *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_UNDEAD_IMMUNE_TO_CERTAIN_EFFECTS)
			}
			sniffer: {
				"boosted-hatch-time": *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SNIFFER_BOOSTED_HATCH_TIME)
				"hatch-time":         *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SNIFFER_HATCH_TIME)
			}
			spawning: {
				"all-chunks-are-slime-chunks": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_ALL_CHUNKS_ARE_SLIME_CHUNKS)
				"alt-item-despawn-rate": {
					enabled: *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_ALT_ITEM_DESPAWN_RATE_ENABLED)
					items: {
						cobblestone: *300 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_ALT_ITEM_DESPAWN_RATE_ITEMS_COBBLESTONE)
					}
				}
				"count-all-mobs-for-spawning": *false | _     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_COUNT_ALL_MOBS_FOR_SPAWNING)
				"creative-arrow-despawn-rate": *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_CREATIVE_ARROW_DESPAWN_RATE)
				"despawn-ranges": {
					ambient: {
						hard: *128 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AMBIENT_HARD)
						soft: *32 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AMBIENT_SOFT)
					}
					axolotls: {
						hard: *128 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AXOLOTLS_HARD)
						soft: *32 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AXOLOTLS_SOFT)
					}
					creature: {
						hard: *128 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_CREATURE_HARD)
						soft: *32 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_CREATURE_SOFT)
					}
					misc: {
						hard: *128 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MISC_HARD)
						soft: *32 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MISC_SOFT)
					}
					monster: {
						hard: *128 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MONSTER_HARD)
						soft: *32 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MONSTER_SOFT)
					}
					underground_water_creature: {
						hard: *128 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_UNDERGROUND_WATER_CREATURE_HARD)
						soft: *32 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_UNDERGROUND_WATER_CREATURE_SOFT)
					}
					water_ambient: {
						hard: *64 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_AMBIENT_HARD)
						soft: *32 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_AMBIENT_SOFT)
					}
					water_creature: {
						hard: *128 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_CREATURE_HARD)
						soft: *32 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_CREATURE_SOFT)
					}
				}
				"disable-mob-spawner-spawn-egg-transformation": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DISABLE_MOB_SPAWNER_SPAWN_EGG_TRANSFORMATION)
				"duplicate-uuid": {
					mode:                      *"SAFE_REGEN" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DUPLICATE_UUID_MODE)
					"safe-regen-delete-range": *32 | _           @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DUPLICATE_UUID_SAFE_REGEN_DELETE_RANGE)
				}
				"filter-bad-tile-entity-nbt-from-falling-blocks": *true | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_FILTER_BAD_TILE_ENTITY_NBT_FROM_FALLING_BLOCKS)
				// No mapping to any environment variable for this field since unsupported due to its complexity.
				"filtered-entity-tag-nbt-paths": *["Pos", "Motion", "SleepingX", "SleepingY", "SleepingZ"] | _
				"iron-golems-can-spawn-in-air":        *false | _     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_IRON_GOLEMS_CAN_SPAWN_IN_AIR)
				"monster-spawn-max-light-level":       *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_MONSTER_SPAWN_MAX_LIGHT_LEVEL)
				"non-player-arrow-despawn-rate":       *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_NON_PLAYER_ARROW_DESPAWN_RATE)
				"per-player-mob-spawns":               *true | _      @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_PER_PLAYER_MOB_SPAWNS)
				"scan-for-legacy-ender-dragon":        *true | _      @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SCAN_FOR_LEGACY_ENDER_DRAGON)
				"skeleton-horse-thunder-spawn-chance": *0.01 | _      @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SKELETON_HORSE_THUNDER_SPAWN_CHANCE)
				"slime-spawn-height": {
					"slime-chunk": {
						maximum: *40.0 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SLIME_SPAWN_HEIGHT_SLIME_CHUNK_MAXIMUM)
					}
					"surface-biome": {
						maximum: *70.0 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SLIME_SPAWN_HEIGHT_SURFACE_BIOME_MAXIMUM)
						minimum: *50.0 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SLIME_SPAWN_HEIGHT_SURFACE_BIOME_MINIMUM)
					}
				}
				"spawn-limits": {
					ambient:                    *15 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_AMBIENT)
					axolotls:                   *5 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_AXOLOTLS)
					creature:                   *10 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_CREATURE)
					monster:                    *70 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_MONSTER)
					underground_water_creature: *5 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_UNDERGROUND_WATER_CREATURE)
					water_ambient:              *20 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_WATER_AMBIENT)
					water_creature:             *5 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_WATER_CREATURE)
				}
				"ticks-per-spawn": {
					ambient:                    *1 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_AMBIENT)
					axolotls:                   *1 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_AXOLOTLS)
					creature:                   *400 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_CREATURE)
					monster:                    *1 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_MONSTER)
					underground_water_creature: *1 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_UNDERGROUND_WATER_CREATURE)
					water_ambient:              *1 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_WATER_AMBIENT)
					water_creature:             *1 | _   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_WATER_CREATURE)
				}
				"wandering-trader": {
					"spawn-chance-failure-increment": *25 | _    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_CHANCE_FAILURE_INCREMENT)
					"spawn-chance-max":               *75 | _    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_CHANCE_MAX)
					"spawn-chance-min":               *25 | _    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_CHANCE_MIN)
					"spawn-day-length":               *24000 | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_DAY_LENGTH)
					"spawn-minute-length":            *1200 | _  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_MINUTE_LENGTH)
				}
				"wateranimal-spawn-height": {
					maximum: *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WATERANIMAL_SPAWN_HEIGHT_MAXIMUM)
					minimum: *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WATERANIMAL_SPAWN_HEIGHT_MINIMUM)
				}
			}
			"tracking-range-y": {
				animal:  *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_ANIMAL)
				display: *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_DISPLAY)
				enabled: *false | _     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_ENABLED)
				misc:    *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_MISC)
				monster: *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_MONSTER)
				other:   *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_OTHER)
				player:  *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_PLAYER)
			}
		}

		environment: {
			"disable-explosion-knockback":             *false | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_EXPLOSION_KNOCKBACK)
			"disable-ice-and-snow":                    *false | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_ICE_AND_SNOW)
			"disable-teleportation-suffocation-check": *false | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_TELEPORTATION_SUFFOCATION_CHECK)
			"disable-thunder":                         *false | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_THUNDER)
			"fire-tick-delay":                         *30 | _    @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FIRE_TICK_DELAY)
			"frosted-ice": {
				delay: {
					max: *40 | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FROSTED_ICE_DELAY_MAX)
					min: *20 | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FROSTED_ICE_DELAY_MIN)
				}
				enabled: *true | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FROSTED_ICE_ENABLED)
			}
			"generate-flat-bedrock":                   *false | _      @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_GENERATE_FLAT_BEDROCK)
			"max-block-ticks":                         *65536 | _      @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_MAX_BLOCK_TICKS)
			"max-fluid-ticks":                         *65536 | _      @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_MAX_FLUID_TICKS)
			"nether-ceiling-void-damage-height":       *"disabled" | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_NETHER_CEILING_VOID_DAMAGE_HEIGHT)
			"optimize-explosions":                     *false | _      @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_OPTIMIZE_EXPLOSIONS)
			"portal-create-radius":                    *16 | _         @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_PORTAL_CREATE_RADIUS)
			"portal-search-radius":                    *128 | _        @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_PORTAL_SEARCH_RADIUS)
			"portal-search-vanilla-dimension-scaling": *true | _       @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_PORTAL_SEARCH_VANILLA_DIMENSION_SCALING)
			"treasure-maps": {
				enabled: *true | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_TREASURE_MAPS_ENABLED)
				"find-already-discovered": {
					"loot-tables":    *"default" | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_TREASURE_MAPS_FIND_ALREADY_DISCOVERED_LOOT_TABLES)
					"villager-trade": *false | _     @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_TREASURE_MAPS_FIND_ALREADY_DISCOVERED_VILLAGER_TRADE)
				}
			}
			"water-over-lava-flow-speed": *5 | _ @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_WATER_OVER_LAVA_FLOW_SPEED)
		}

		"feature-seeds": {
			"generate-random-seeds-for-all": *false | _ @tag(PAPER_WORLD_DEFAULTS_FEATURE_SEEDS_GENERATE_RANDOM_SEEDS_FOR_ALL)
		}

		"fishing-time-range": {
			maximum: *600 | _ @tag(PAPER_WORLD_DEFAULTS_FISHING_TIME_RANGE_MAXIMUM)
			minimum: *100 | _ @tag(PAPER_WORLD_DEFAULTS_FISHING_TIME_RANGE_MINIMUM)
		}

		fixes: {
			"disable-unloaded-chunk-enderpearl-exploit": *true | _       @tag(PAPER_WORLD_DEFAULTS_FIXES_DISABLE_UNLOADED_CHUNK_ENDERPEARL_EXPLOIT)
			"falling-block-height-nerf":                 *"disabled" | _ @tag(PAPER_WORLD_DEFAULTS_FIXES_FALLING_BLOCK_HEIGHT_NERF)
			"fix-items-merging-through-walls":           *false | _      @tag(PAPER_WORLD_DEFAULTS_FIXES_FIX_ITEMS_MERGING_THROUGH_WALLS)
			"prevent-tnt-from-moving-in-water":          *false | _      @tag(PAPER_WORLD_DEFAULTS_FIXES_PREVENT_TNT_FROM_MOVING_IN_WATER)
			"remove-corrupt-tile-entities":              *false | _      @tag(PAPER_WORLD_DEFAULTS_FIXES_REMOVE_CORRUPT_TILE_ENTITIES)
			"split-overstacked-loot":                    *true | _       @tag(PAPER_WORLD_DEFAULTS_FIXES_SPLIT_OVERSTACKED_LOOT)
			"tnt-entity-height-nerf":                    *"disabled" | _ @tag(PAPER_WORLD_DEFAULTS_FIXES_TNT_ENTITY_HEIGHT_NERF)
		}

		hopper: {
			"cooldown-when-full":      *true | _  @tag(PAPER_WORLD_DEFAULTS_HOPPER_COOLDOWN_WHEN_FULL)
			"disable-move-event":      *false | _ @tag(PAPER_WORLD_DEFAULTS_HOPPER_DISABLE_MOVE_EVENT)
			"ignore-occluding-blocks": *false | _ @tag(PAPER_WORLD_DEFAULTS_HOPPER_IGNORE_OCCLUDING_BLOCKS)
			"push-based":              *false | _ @tag(PAPER_WORLD_DEFAULTS_HOPPER_PUSH_BASED)
		}

		lootables: {
			"auto-replenish": *false | _ @tag(PAPER_WORLD_DEFAULTS_LOOTABLES_AUTO_REPLENISH)
			"max-refills":    *-1 | _    @tag(PAPER_WORLD_DEFAULTS_LOOTABLES_MAX_REFILLS)
			"refresh-max":    *"2d" | _  @tag(PAPER_WORLD_DEFAULTS_LOOTABLES_REFRESH_MAX)
		}
	}
}
