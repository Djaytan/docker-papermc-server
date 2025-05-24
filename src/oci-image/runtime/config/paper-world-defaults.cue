// Default configuration for PaperMC worlds.
//
// Configuration options here apply to all worlds, unless you specify overrides inside
// the world-specific config files located in each world folder.
//
// Specifications: https://docs.papermc.io/paper/reference/world-configuration/
//
// All CUE structs are open to allow for additional fields, ensuring forward compatibility with future PaperMC configurations.
// Any new fields added in future PaperMC versions can be safely added without breaking the existing configuration.
// CUE structs are open by default. More info: https://cuelang.org/docs/tour/types/closed/

package paper

paper: {
	"worlds-defaults": {
		// TODO: support version 31
		"_version": 30 // Not customizable - Internal value only

		"allow-leashing-undead-horse": *false | bool @tag(PAPER_WORLD_DEFAULTS_ALLOW_LEASHING_UNDEAD_HORSE, type=bool)

		anticheat: {
			"anti-xray": {
				"chunk-edge-mode": *1 | int      @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_CHUNK_EDGE_MODE, type=int)
				enabled:           *false | bool @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_ENABLED, type=bool)
				"engine-mode":     *1 | int      @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_ENGINE_MODE, type=int)
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
				] | [...string]
				"lava-obscures":           *false | bool @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_LAVA_OBSCURES, type=bool)
				"max-block-height":        *64 | int     @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_MAX_BLOCK_HEIGHT, type=int)
				"max-chunk-section-index": *3 | int      @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_MAX_CHUNK_SECTION_INDEX, type=int)
				// No mapping to any environment variable for this field since unsupported due to its complexity.
				"replacement-blocks": *[
					"stone",
					"oak_planks",
					"deepslate",
				] | [...string]
				"update-radius":  *2 | int      @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_UPDATE_RADIUS, type=int)
				"use-permission": *false | bool @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_ANTI_XRAY_USE_PERMISSION, type=bool)
			}
			obfuscation: items: {
				"hide-durability":                   *false | bool @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_OBFUSCATION_ITEMS_HIDE_DURABILITY, type=bool)
				"hide-itemmeta":                     *false | bool @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_OBFUSCATION_ITEMS_HIDE_ITEMMETA, type=bool)
				"hide-itemmeta-with-visual-effects": *false | bool @tag(PAPER_WORLD_DEFAULTS_ANTICHEAT_OBFUSCATION_ITEMS_HIDE_ITEMMETA_WITH_VISUAL_EFFECTS, type=bool)
			}
		}

		"baby-zombie-movement-speed": *0.5 | float @tag(PAPER_WORLD_DEFAULTS_BABY_ZOMBIE_MOVEMENT_SPEED, type=number)

		chunks: {
			"auto-save-interval":     *6000 | int     @tag(PAPER_WORLD_DEFAULTS_CHUNKS_AUTO_SAVE_INTERVAL, type=int)
			"delay-chunk-unloads-by": *"10s" | string @tag(PAPER_WORLD_DEFAULTS_CHUNKS_DELAY_CHUNK_UNLOADS_BY, type=string)
			"entity-per-chunk-save-limit": {
				arrow:          *-1 | int @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_ARROW, type=int)
				ender_pearl:    *-1 | int @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_ENDER_PEARL, type=int)
				experience_orb: *-1 | int @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_EXPERIENCE_ORB, type=int)
				fireball:       *-1 | int @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_FIREBALL, type=int)
				small_fireball: *-1 | int @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_SMALL_FIREBALL, type=int)
				snowball:       *-1 | int @tag(PAPER_WORLD_DEFAULTS_CHUNKS_ENTITY_PER_CHUNK_SAVE_LIMIT_SNOWBALL, type=int)
			}
			"fixed-chunk-inhabited-time":          *-1 | int     @tag(PAPER_WORLD_DEFAULTS_CHUNKS_FIXED_CHUNK_INHABITED_TIME, type=int)
			"flush-regions-on-save":               *false | bool @tag(PAPER_WORLD_DEFAULTS_CHUNKS_FLUSH_REGIONS_ON_SAVE, type=bool)
			"max-auto-save-chunks-per-tick":       *24 | int     @tag(PAPER_WORLD_DEFAULTS_CHUNKS_MAX_AUTO_SAVE_CHUNKS_PER_TICK, type=int)
			"prevent-moving-into-unloaded-chunks": *false | bool @tag(PAPER_WORLD_DEFAULTS_CHUNKS_PREVENT_MOVING_INTO_UNLOADED_CHUNKS, type=bool)
		}

		collisions: {
			"allow-player-cramming-damage":         *false | bool @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_ALLOW_PLAYER_CRAMMING_DAMAGE, type=bool)
			"allow-vehicle-collisions":             *true | bool  @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_ALLOW_VEHICLE_COLLISIONS, type=bool)
			"fix-climbing-bypassing-cramming-rule": *false | bool @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_FIX_CLIMBING_BYPASSING_CRAMMING_RULE, type=bool)
			"max-entity-collisions":                *8 | int      @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_MAX_ENTITY_COLLISIONS, type=int)
			"only-players-collide":                 *false | bool @tag(PAPER_WORLD_DEFAULTS_COLLISIONS_ONLY_PLAYERS_COLLIDE, type=bool)
		}

		"command-blocks": {
			"force-follow-perm-level": *true | bool @tag(PAPER_WORLD_DEFAULTS_COMMAND_BLOCKS_FORCE_FOLLOW_PERM_LEVEL, type=bool)
			"permissions-level":       *2 | int     @tag(PAPER_WORLD_DEFAULTS_COMMAND_BLOCKS_PERMISSIONS_LEVEL, type=int)
		}

		"enable-old-tnt-cannon-behaviors": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENABLE_OLD_TNT_CANNON_BEHAVIORS, type=bool)

		entities: {
			"armor-stands": {
				"do-collision-entity-lookups": *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_ARMOR_STANDS_DO_COLLISION_ENTITY_LOOKUPS, type=bool)
				tick:                          *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_ARMOR_STANDS_TICK, type=bool)
			}
			behavior: {
				"allow-spider-world-border-climbing": *true | bool  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ALLOW_SPIDER_WORLD_BORDER_CLIMBING, type=bool)
				"baby-zombie-movement-modifier":      *0.5 | float  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_BABY_ZOMBIE_MOVEMENT_MODIFIER, type=number)
				"disable-chest-cat-detection":        *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_DISABLE_CHEST_CAT_DETECTION, type=bool)
				"disable-creeper-lingering-effect":   *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_DISABLE_CREEPER_LINGERING_EFFECT, type=bool)
				"disable-player-crits":               *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_DISABLE_PLAYER_CRITS, type=bool)
				// No mapping to any environment variable for this field since unsupported due to its complexity.
				"door-breaking-difficulty": {
					husk: *["HARD"] | [...string]
					vindicator: *["NORMAL", "HARD"] | [...string]
					zombie: *["HARD"] | [...string]
					zombie_villager: *["HARD"] | [...string]
					zombified_piglin: *["HARD"] | [...string]
				}
				"ender-dragons-death-always-places-dragon-egg": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ENDER_DRAGONS_DEATH_ALWAYS_PLACES_DRAGON_EGG, type=bool)
				"experience-merge-max-value":                   *-1 | int     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_EXPERIENCE_MERGE_MAX_VALUE, type=int)
				"mobs-can-always-pick-up-loot": {
					skeletons: *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_MOBS_CAN_ALWAYS_PICK_UP_LOOT_SKELETONS, type=bool)
					zombies:   *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_MOBS_CAN_ALWAYS_PICK_UP_LOOT_ZOMBIES, type=bool)
				}
				"nerf-pigmen-from-nether-portals":           *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_NERF_PIGMEN_FROM_NETHER_PORTALS, type=bool)
				"parrots-are-unaffected-by-player-movement": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PARROTS_ARE_UNAFFECTED_BY_PLAYER_MOVEMENT, type=bool)
				"phantoms-do-not-spawn-on-creative-players": *true | bool  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_DO_NOT_SPAWN_ON_CREATIVE_PLAYERS, type=bool)
				"phantoms-only-attack-insomniacs":           *true | bool  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_ONLY_ATTACK_INSOMNIACS, type=bool)
				"phantoms-spawn-attempt-max-seconds":        *119 | int    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_SPAWN_ATTEMPT_MAX_SECONDS, type=int)
				"phantoms-spawn-attempt-min-seconds":        *60 | int     @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PHANTOMS_SPAWN_ATTEMPT_MIN_SECONDS, type=int)
				"piglins-guard-chests":                      *true | bool  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PIGLINS_GUARD_CHESTS, type=bool)
				"pillager-patrols": {
					disable:        *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_DISABLE, type=bool)
					"spawn-chance": *0.2 | float  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_SPAWN_CHANCE, type=number)
					"spawn-delay": {
						"per-player": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_SPAWN_DELAY_PER_PLAYER, type=bool)
						ticks:        *12000 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_SPAWN_DELAY_TICKS, type=int)
					}
					start: {
						day:          *5 | int      @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_START_DAY, type=int)
						"per-player": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PILLAGER_PATROLS_START_PER_PLAYER, type=bool)
					}
				}
				"player-insomnia-start-ticks":      *72000 | int                   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_PLAYER_INSOMNIA_START_TICKS, type=int)
				"should-remove-dragon":             *false | bool                  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_SHOULD_REMOVE_DRAGON, type=bool)
				"spawner-nerfed-mobs-should-jump":  *false | bool                  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_SPAWNER_NERFED_MOBS_SHOULD_JUMP, type=bool)
				"zombie-villager-infection-chance": *"default" | "default" | float @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ZOMBIE_VILLAGER_INFECTION_CHANCE, type=number)
				"zombies-target-turtle-eggs":       *true | bool                   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_BEHAVIOR_ZOMBIES_TARGET_TURTLE_EGGS, type=bool)
			}
			"entities-target-with-follow-range": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_ENTITIES_TARGET_WITH_FOLLOW_RANGE, type=bool)
			markers: {
				tick: *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MARKERS_TICK, type=bool)
			}
			"mob-effects": {
				"immune-to-wither-effect": {
					wither:            *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_IMMUNE_TO_WITHER_EFFECT_WITHER, type=bool)
					"wither-skeleton": *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_IMMUNE_TO_WITHER_EFFECT_WITHER_SKELETON, type=bool)
				}
				"spiders-immune-to-poison-effect":  *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_SPIDERS_IMMUNE_TO_POISON_EFFECT, type=bool)
				"undead-immune-to-certain-effects": *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_MOB_EFFECTS_UNDEAD_IMMUNE_TO_CERTAIN_EFFECTS, type=bool)
			}
			sniffer: {
				"boosted-hatch-time": *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SNIFFER_BOOSTED_HATCH_TIME, type=int)
				"hatch-time":         *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SNIFFER_HATCH_TIME, type=int)
			}
			spawning: {
				"all-chunks-are-slime-chunks": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_ALL_CHUNKS_ARE_SLIME_CHUNKS, type=bool)
				"alt-item-despawn-rate": {
					enabled: *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_ALT_ITEM_DESPAWN_RATE_ENABLED, type=bool)
					items: {
						cobblestone: *300 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_ALT_ITEM_DESPAWN_RATE_ITEMS_COBBLESTONE, type=int)
					}
				}
				"count-all-mobs-for-spawning": *false | bool                @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_COUNT_ALL_MOBS_FOR_SPAWNING, type=bool)
				"creative-arrow-despawn-rate": *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_CREATIVE_ARROW_DESPAWN_RATE, type=int)
				"despawn-ranges": {
					ambient: {
						hard: *128 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AMBIENT_HARD, type=int)
						soft: *32 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AMBIENT_SOFT, type=int)
					}
					axolotls: {
						hard: *128 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AXOLOTLS_HARD, type=int)
						soft: *32 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_AXOLOTLS_SOFT, type=int)
					}
					creature: {
						hard: *128 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_CREATURE_HARD, type=int)
						soft: *32 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_CREATURE_SOFT, type=int)
					}
					misc: {
						hard: *128 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MISC_HARD, type=int)
						soft: *32 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MISC_SOFT, type=int)
					}
					monster: {
						hard: *128 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MONSTER_HARD, type=int)
						soft: *32 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_MONSTER_SOFT, type=int)
					}
					underground_water_creature: {
						hard: *128 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_UNDERGROUND_WATER_CREATURE_HARD, type=int)
						soft: *32 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_UNDERGROUND_WATER_CREATURE_SOFT, type=int)
					}
					water_ambient: {
						hard: *64 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_AMBIENT_HARD, type=int)
						soft: *32 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_AMBIENT_SOFT, type=int)
					}
					water_creature: {
						hard: *128 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_CREATURE_HARD, type=int)
						soft: *32 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DESPAWN_RANGES_WATER_CREATURE_SOFT, type=int)
					}
				}
				"disable-mob-spawner-spawn-egg-transformation": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DISABLE_MOB_SPAWNER_SPAWN_EGG_TRANSFORMATION, type=bool)
				"duplicate-uuid": {
					mode:                      *"SAFE_REGEN" | string @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DUPLICATE_UUID_MODE, type=string)
					"safe-regen-delete-range": *32 | int              @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_DUPLICATE_UUID_SAFE_REGEN_DELETE_RANGE, type=int)
				}
				"filter-bad-tile-entity-nbt-from-falling-blocks": *true | bool @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_FILTER_BAD_TILE_ENTITY_NBT_FROM_FALLING_BLOCKS, type=bool)
				// No mapping to any environment variable for this field since unsupported due to its complexity.
				"filtered-entity-tag-nbt-paths": *["Pos", "Motion", "SleepingX", "SleepingY", "SleepingZ"] | [...string]
				"iron-golems-can-spawn-in-air":        *false | bool                @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_IRON_GOLEMS_CAN_SPAWN_IN_AIR, type=bool)
				"monster-spawn-max-light-level":       *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_MONSTER_SPAWN_MAX_LIGHT_LEVEL, type=int)
				"non-player-arrow-despawn-rate":       *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_NON_PLAYER_ARROW_DESPAWN_RATE, type=int)
				"per-player-mob-spawns":               *true | bool                 @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_PER_PLAYER_MOB_SPAWNS, type=bool)
				"scan-for-legacy-ender-dragon":        *true | bool                 @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SCAN_FOR_LEGACY_ENDER_DRAGON, type=bool)
				"skeleton-horse-thunder-spawn-chance": *0.01 | float                @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SKELETON_HORSE_THUNDER_SPAWN_CHANCE, type=number)
				"slime-spawn-height": {
					"slime-chunk": {
						maximum: *40.0 | float @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SLIME_SPAWN_HEIGHT_SLIME_CHUNK_MAXIMUM, type=number)
					}
					"surface-biome": {
						maximum: *70.0 | float @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SLIME_SPAWN_HEIGHT_SURFACE_BIOME_MAXIMUM, type=number)
						minimum: *50.0 | float @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SLIME_SPAWN_HEIGHT_SURFACE_BIOME_MINIMUM, type=number)
					}
				}
				"spawn-limits": {
					ambient:                    *15 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_AMBIENT, type=int)
					axolotls:                   *5 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_AXOLOTLS, type=int)
					creature:                   *10 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_CREATURE, type=int)
					monster:                    *70 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_MONSTER, type=int)
					underground_water_creature: *5 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_UNDERGROUND_WATER_CREATURE, type=int)
					water_ambient:              *20 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_WATER_AMBIENT, type=int)
					water_creature:             *5 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_SPAWN_LIMITS_WATER_CREATURE, type=int)
				}
				"ticks-per-spawn": {
					ambient:                    *1 | int   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_AMBIENT, type=int)
					axolotls:                   *1 | int   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_AXOLOTLS, type=int)
					creature:                   *400 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_CREATURE, type=int)
					monster:                    *1 | int   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_MONSTER, type=int)
					underground_water_creature: *1 | int   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_UNDERGROUND_WATER_CREATURE, type=int)
					water_ambient:              *1 | int   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_WATER_AMBIENT, type=int)
					water_creature:             *1 | int   @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_TICKS_PER_SPAWN_WATER_CREATURE, type=int)
				}
				"wandering-trader": {
					"spawn-chance-failure-increment": *25 | int    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_CHANCE_FAILURE_INCREMENT, type=int)
					"spawn-chance-max":               *75 | int    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_CHANCE_MAX, type=int)
					"spawn-chance-min":               *25 | int    @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_CHANCE_MIN, type=int)
					"spawn-day-length":               *24000 | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_DAY_LENGTH, type=int)
					"spawn-minute-length":            *1200 | int  @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WANDERING_TRADER_SPAWN_MINUTE_LENGTH, type=int)
				}
				"wateranimal-spawn-height": {
					maximum: *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WATERANIMAL_SPAWN_HEIGHT_MAXIMUM, type=int)
					minimum: *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_SPAWNING_WATERANIMAL_SPAWN_HEIGHT_MINIMUM, type=int)
				}
			}
			"tracking-range-y": {
				animal:  *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_ANIMAL, type=int)
				display: *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_DISPLAY, type=int)
				enabled: *false | bool                @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_ENABLED, type=bool)
				misc:    *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_MISC, type=int)
				monster: *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_MONSTER, type=int)
				other:   *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_OTHER, type=int)
				player:  *"default" | "default" | int @tag(PAPER_WORLD_DEFAULTS_ENTITIES_TRACKING_RANGE_Y_PLAYER, type=int)
			}
		}

		environment: {
			"disable-explosion-knockback":             *false | bool @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_EXPLOSION_KNOCKBACK, type=bool)
			"disable-ice-and-snow":                    *false | bool @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_ICE_AND_SNOW, type=bool)
			"disable-teleportation-suffocation-check": *false | bool @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_TELEPORTATION_SUFFOCATION_CHECK, type=bool)
			"disable-thunder":                         *false | bool @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_DISABLE_THUNDER, type=bool)
			"fire-tick-delay":                         *30 | int     @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FIRE_TICK_DELAY, type=int)
			"frosted-ice": {
				delay: {
					max: *40 | int @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FROSTED_ICE_DELAY_MAX, type=int)
					min: *20 | int @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FROSTED_ICE_DELAY_MIN, type=int)
				}
				enabled: *true | bool @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_FROSTED_ICE_ENABLED, type=bool)
			}
			"generate-flat-bedrock":                   *false | bool                  @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_GENERATE_FLAT_BEDROCK, type=bool)
			"max-block-ticks":                         *65536 | int                   @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_MAX_BLOCK_TICKS, type=int)
			"max-fluid-ticks":                         *65536 | int                   @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_MAX_FLUID_TICKS, type=int)
			"nether-ceiling-void-damage-height":       *"disabled" | "disabled" | int @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_NETHER_CEILING_VOID_DAMAGE_HEIGHT, type=int)
			"optimize-explosions":                     *false | bool                  @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_OPTIMIZE_EXPLOSIONS, type=bool)
			"portal-create-radius":                    *16 | int                      @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_PORTAL_CREATE_RADIUS, type=int)
			"portal-search-radius":                    *128 | int                     @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_PORTAL_SEARCH_RADIUS, type=int)
			"portal-search-vanilla-dimension-scaling": *true | bool                   @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_PORTAL_SEARCH_VANILLA_DIMENSION_SCALING, type=bool)
			"treasure-maps": {
				enabled: *true | bool @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_TREASURE_MAPS_ENABLED, type=bool)
				"find-already-discovered": {
					"loot-tables":    *"default" | "default" | bool @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_TREASURE_MAPS_FIND_ALREADY_DISCOVERED_LOOT_TABLES, type=bool)
					"villager-trade": *false | bool                 @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_TREASURE_MAPS_FIND_ALREADY_DISCOVERED_VILLAGER_TRADE, type=bool)
				}
			}
			"water-over-lava-flow-speed": *5 | int @tag(PAPER_WORLD_DEFAULTS_ENVIRONMENT_WATER_OVER_LAVA_FLOW_SPEED, type=int)
		}

		"feature-seeds": {
			"generate-random-seeds-for-all": *false | bool @tag(PAPER_WORLD_DEFAULTS_FEATURE_SEEDS_GENERATE_RANDOM_SEEDS_FOR_ALL, type=bool)
		}

		"fishing-time-range": {
			maximum: *600 | int @tag(PAPER_WORLD_DEFAULTS_FISHING_TIME_RANGE_MAXIMUM, type=int)
			minimum: *100 | int @tag(PAPER_WORLD_DEFAULTS_FISHING_TIME_RANGE_MINIMUM, type=int)
		}

		fixes: {
			"disable-unloaded-chunk-enderpearl-exploit": *true | bool                   @tag(PAPER_WORLD_DEFAULTS_FIXES_DISABLE_UNLOADED_CHUNK_ENDERPEARL_EXPLOIT, type=bool)
			"falling-block-height-nerf":                 *"disabled" | "disabled" | int @tag(PAPER_WORLD_DEFAULTS_FIXES_FALLING_BLOCK_HEIGHT_NERF, type=int)
			"fix-items-merging-through-walls":           *false | bool                  @tag(PAPER_WORLD_DEFAULTS_FIXES_FIX_ITEMS_MERGING_THROUGH_WALLS, type=bool)
			"prevent-tnt-from-moving-in-water":          *false | bool                  @tag(PAPER_WORLD_DEFAULTS_FIXES_PREVENT_TNT_FROM_MOVING_IN_WATER, type=bool)
			"remove-corrupt-tile-entities":              *false | bool                  @tag(PAPER_WORLD_DEFAULTS_FIXES_REMOVE_CORRUPT_TILE_ENTITIES, type=bool)
			"split-overstacked-loot":                    *true | bool                   @tag(PAPER_WORLD_DEFAULTS_FIXES_SPLIT_OVERSTACKED_LOOT, type=bool)
			"tnt-entity-height-nerf":                    *"disabled" | "disabled" | int @tag(PAPER_WORLD_DEFAULTS_FIXES_TNT_ENTITY_HEIGHT_NERF, type=int)
		}

		hopper: {
			"cooldown-when-full":      *true | bool  @tag(PAPER_WORLD_DEFAULTS_HOPPER_COOLDOWN_WHEN_FULL, type=bool)
			"disable-move-event":      *false | bool @tag(PAPER_WORLD_DEFAULTS_HOPPER_DISABLE_MOVE_EVENT, type=bool)
			"ignore-occluding-blocks": *false | bool @tag(PAPER_WORLD_DEFAULTS_HOPPER_IGNORE_OCCLUDING_BLOCKS, type=bool)
			"push-based":              *false | bool @tag(PAPER_WORLD_DEFAULTS_HOPPER_PUSH_BASED, type=bool)
		}

		lootables: {
			"auto-replenish": *false | bool  @tag(PAPER_WORLD_DEFAULTS_LOOTABLES_AUTO_REPLENISH, type=bool)
			"max-refills":    *-1 | int      @tag(PAPER_WORLD_DEFAULTS_LOOTABLES_MAX_REFILLS, type=int)
			"refresh-max":    *"2d" | string @tag(PAPER_WORLD_DEFAULTS_LOOTABLES_REFRESH_MAX, type=string)
		}
	}
}
