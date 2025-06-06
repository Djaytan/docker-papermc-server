# Environment Variables

PaperMC configuration properties can be customized via **environment variables**, offering a quick and convenient way to tailor your server without modifying or
mounting [configuration files](configuration-files.md).

## 🔧 Mapping Rules

To override a configuration property using an environment variable, apply the following rules:

1. Replace **dots (`.`)** and **dashes (`-`)** with **underscores (`_`)**.
2. Convert the entire property path to **UPPERCASE**.
3. Prepend a prefix based on the configuration file the property belongs to:

| 🔖 Prefix               | 📄 Mapped Configuration File |
|:------------------------|:-----------------------------|
| `BUKKIT_GLOBAL_`        | `bukkit.yml`                 |
| `BUKKIT_COMMANDS_`      | `commands.yml`               |
| `BUKKIT_PERMISSIONS_`   | `permissions.yml`            |
| `BUKKIT_HELP_`          | `help.yml`                   |
| `SPIGOT_`               | `spigot.yml`                 |
| `PAPER_GLOBAL_`         | `paper-global.yml`           |
| `PAPER_WORLD_DEFAULTS_` | `paper-world-defaults.yml`   |

🧪 **Example:** The `bukkit.yml` property `settings.allow-end` becomes `BUKKIT_GLOBAL_SETTINGS_ALLOW_END`.

## ⚠️ Limitations

### ⏳ Manual Mapping

Environment variable support is currently **maintained manually**, which means:

* Newly added PaperMC properties might **not be available immediately** after updates.
* Updates to existing **default values may be delayed**.
* Some properties might be **accidentally omitted**.

If you notice any missing properties or outdated defaults, please [open an issue](https://github.com/Djaytan/docker-papermc-server/issues) — community
feedback is always appreciated.

💡 For immediate support of newer properties, consider switching to [configuration files](configuration-files.md), which offer **forward compatibility** by
design.

🔭 **Looking ahead:** automatic mapping may be introduced in the future to improve coverage and reduce maintenance effort.

### ❌ Unsupported Mappings

Some properties are currently **too complex** to be mapped to environment variables—for example, those involving nested structures or world-specific entries.

You can still configure these properties using [configuration files](configuration-files.md), which offer full flexibility without these limitations.

The following properties are currently unsupported:

| 📄 Configuration File      | ⚙️ Property Name                                                      |
|:---------------------------|:----------------------------------------------------------------------|
| `bukkit.yml`               | `worlds`                                                              |
| `permissions.yml`          | _ALL_                                                                 |
| `commands.yml`             | _ALL_                                                                 |
| `help.yml`                 | _ALL_                                                                 |
| `spigot.yml`               | `commands.replace-commands`                                           |
| `spigot.yml`               | `commands.spam-exclusions`                                            |
| `spigot.yml`               | `advancements.disabled`                                               |
| `spigot.yml`               | `world-settings.<world>` (only `world-settings.default` is supported) |
| `spigot.yml`               | `stats.forced-stats`                                                  |
| `paper-global.yml`         | `packet-limiter.overrides`                                            |
| `paper-world-defaults.yml` | `anticheat.anti-xray.hidden-blocks`                                   |
| `paper-world-defaults.yml` | `anticheat.anti-xray.replacement-blocks`                              |
| `paper-world-defaults.yml` | `entities.behavior.door-breaking-difficulty`                          |
| `paper-world-defaults.yml` | `entities.spawning.filtered-entity-tag-nbt-paths`                     |
