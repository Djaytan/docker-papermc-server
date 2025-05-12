// Global configuration for PaperMC.
// World-specific settings are defined in the corresponding paper-world*.yml files.
//
// Specifications: https://docs.papermc.io/paper/reference/global-configuration/
//
// All CUE structs are open to allow for additional fields, ensuring forward compatibility with future PaperMC configurations.
// Any new fields added in future PaperMC versions can be safely added without breaking the existing configuration.

// TODO: adjust formatting
// TODO: support environment variables

"_version": 29 // Not customizable - Internal value only

"block-updates": {
	"disable-chorus-plant-updates":   *false | bool
	"disable-mushroom-block-updates": *false | bool
	"disable-noteblock-updates":      *false | bool
	"disable-tripwire-updates":       *false | bool
	...
}

"chunk-loading": {
	"autoconfig-send-distance":      *true | bool
	"enable-frustum-priority":       *false | bool
	"global-max-chunk-load-rate":    *-1.0 | float
	"global-max-chunk-send-rate":    *-1.0 | float
	"global-max-concurrent-loads":   *500.0 | float
	"max-concurrent-sends":          *2 | int
	"min-load-radius":               *2 | int
	"player-max-chunk-load-rate":    *-1.0 | float
	"player-max-concurrent-loads":   *20.0 | float
	"target-player-chunk-send-rate": *100.0 | float
	...
}

"chunk-loading-advanced": {
	"auto-config-send-distance":             *true | bool
	"player-max-concurrent-chunk-generates": *0 | int
	"player-max-concurrent-chunk-loads":     *0 | int
	...
}

"chunk-loading-basic": {
	"player-max-chunk-generate-rate": *-1.0 | float
	"player-max-chunk-load-rate":     *100.0 | float
	"player-max-chunk-send-rate":     *75.0 | float
	...
}

"chunk-system": {
	"gen-parallelism": *"default" | string
	"io-threads":      *-1 | int
	"worker-threads":  *-1 | int
	...
}

collisions: {
	"enable-player-collisions":                  *true | bool
	"send-full-pos-for-hard-colliding-entities": *true | bool
	...
}

commands: {
	"fix-target-selector-tag-completion":             *true | bool
	"suggest-player-names-when-null-tab-completions": *true | bool
	"time-command-affects-all-worlds":                *false | bool
	...
}

console: {
	"enable-brigadier-completions":  *true | bool
	"enable-brigadier-highlighting": *true | bool
	"has-all-permissions":           *false | bool
	...
}

"item-validation": {
	book: {
		author: *8192 | int
		page:   *16384 | int
		title:  *8192 | int
		...
	}
	"book-size": {
		"page-max":         *2560 | int
		"total-multiplier": *0.98 | float
		...
	}
	"display-name":               *8192 | int
	"lore-line":                  *8192 | int
	"resolve-selectors-in-books": *false | bool
	...
}

logging: "deobfuscate-stacktraces": *true | bool

messages: {
	kick: {
		"authentication-servers-down": *"<lang:multiplayer.disconnect.authservers_down>" | string
		"connection-throttle":         *"Connection throttled! Please wait before reconnecting." | string
		"flying-player":               *"<lang:multiplayer.disconnect.flying>" | string
		"flying-vehicle":              *"<lang:multiplayer.disconnect.flying>" | string
		...
	}
	"no-permission":                    *"<red>I'm sorry, but you do not have permission to perform this command. Please contact the server administrators if you believe that this is in error." | string
	"use-display-name-in-quit-message": *false | bool
	...
}

misc: {
	"chat-threads": {
		"chat-executor-core-size": *-1 | int
		"chat-executor-max-size":  *-1 | int
		...
	}
	"compression-level":                      *"default" | string
	"fix-entity-position-desync":             *true | bool
	"lag-compensate-block-breaking":          *true | bool
	"load-permissions-yml-before-plugins":    *true | bool
	"max-joins-per-tick":                     *3 | int
	"region-file-cache-size":                 *256 | int
	"strict-advancement-dimension-check":     *false | bool
	"use-alternative-luck-formula":           *false | bool
	"use-dimension-type-for-custom-spawners": *false | bool
	...
}

"packet-limiter": {
	"all-packets": {
		action:            *"KICK" | string
		interval:          *7.0 | float
		"max-packet-rate": *500.0 | float
		...
	}
	"kick-message": *"<red><lang:disconnect.exceeded_packet_rate>" | string
	overrides: ServerboundPlaceRecipePacket: {
		action:            *"DROP" | string
		interval:          *4.0 | float
		"max-packet-rate": *5.0 | float
		...
	}
	...
}

"play-in-use-item-spam-threshold": *300 | int

"player-auto-save": {
	"max-per-tick": *-1 | int
	rate:           *-1 | int
	...
}

proxies: {
	"bungee-cord": "online-mode": *true | bool
	"proxy-protocol": *false | bool
	velocity: {
		enabled:       *false | bool
		"online-mode": *false | bool
		secret:        *"" | string
		...
	}
	...
}

scoreboards: {
	"save-empty-scoreboard-teams": *false | bool
	"track-plugin-scoreboards":    *false | bool
	...
}

"spam-limiter": {
	"incoming-packet-threshold": *300 | int
	"recipe-spam-increment":     *1 | int
	"recipe-spam-limit":         *20 | int
	"tab-spam-increment":        *1 | int
	"tab-spam-limit":            *500 | int
	...
}

timings: {
	enabled: *true | bool
	"hidden-config-entries": *["database", "settings.bungeecord-addresses", "settings.velocity-support.secret", "proxies.velocity.secret"] | [...string]
	"history-interval":    *300 | int
	"history-length":      *3600 | int
	"server-name":         *"Unknown Server" | string
	"server-name-privacy": *false | bool
	url:                   *"https://timings.aikar.co/" | string
	verbose:               *true | bool
	...
}

"unsupported-settings": {
	"allow-grindstone-overstacking":         *false | bool
	"allow-headless-pistons":                *false | bool
	"allow-permanent-block-break-exploits":  *false | bool
	"allow-piston-duplication":              *false | bool
	"allow-tripwire-disarming-exploits":     *false | bool
	"allow-unsafe-end-portal-teleportation": *false | bool
	"compression-format":                    *"ZLIB" | string
	"perform-username-validation":           *true | bool
	...
}

watchdog: {
	"early-warning-delay": *10000 | int
	"early-warning-every": *5000 | int
	...
}
