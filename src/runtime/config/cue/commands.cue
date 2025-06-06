// Specifications: https://docs.papermc.io/paper/reference/bukkit-commands-configuration/

package paper

bukkit: {
	commands: {
		"command-block-overrides": *[] | [...string]
		"ignore-vanilla-permissions": *false | bool
		aliases: [string]: [...string]
	}
}
