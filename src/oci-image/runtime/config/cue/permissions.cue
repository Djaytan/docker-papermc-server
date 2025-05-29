// Specifications: https://docs.papermc.io/paper/reference/bukkit-permissions-configuration/
// TODO: implement

package paper

bukkit: {
	permissions: {
		[string]: {
			default: *"op" | "isop" | "operator" | "isoperator" | "admin" | "isadmin" | "!op" | "notop" | "!operator" | "notoperator" | "!admin" | "notadmin" | "true" | "false"
			children: *[] | {[string]: string} | [...string]
			description: *"" | string
		}
	}
}
