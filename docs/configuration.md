# Configuration

PaperMC configuration properties can be customized via **environment variables**. Support for dedicated configuration files will be added in the future for more
advanced setups.

📘 Configuration reference: [PaperMC Docs](https://docs.papermc.io/paper/reference/configuration/).

## 🔧 Environment Variable Mapping

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

Environment variables are suitable for simple setups. Configuration files (once supported) will enable customization of properties that cannot be set via
environment variables (see details below) and will also simplify managing more complex configurations.

### ⚠️ Limitations

#### ⏳ Manual Mapping

The mapping is maintained manually, so newly introduced properties may not be available immediately after PaperMC updates, and changes to default values may not
be reflected right away. Some properties might also be accidentally overlooked.<br/>
If you notice any missing properties or outdated defaults, please [open an issue](https://github.com/Djaytan/docker-papermc-server/issues).

Automatic mapping may be implemented in the future.

#### ❌ Unsupported Mappings

Some properties cannot currently be mapped to environment variables due to their complexity. However, users will be able to customize these values in the future
through override configuration files once that support is implemented.

The following properties are currently unsupported:

| 📄 Configuration File      | ⚙️ Property Name                                                      |
|:---------------------------|:----------------------------------------------------------------------|
| `bukkit.yml`               | `worlds`                                                              |
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

## 📊 Supported Properties

|      🗂️ Category      | 🎯 Supported |
|:----------------------:|:------------:|
|         Bukkit         |  🟡 Partial  |
|         Spigot         | ✅ Supported  |
|     Paper (Global)     | ✅ Supported  |
| Paper (World Defaults) | ✅ Supported  |

✅ = Fully supported<br/>
🟡 = Partial support (some properties available)<br/>
❌ = Not yet supported

> 💡 More configuration options will be supported in future releases.

### ✏️ Overridden Defaults

To encourage the use of modern Paper features over legacy Bukkit and Spigot alternatives, some configuration properties are assigned **custom default values**.
These defaults intentionally aligned with Bukkit's and Spigot's behavior to ensure a smoother transition.

Although they differ from the upstream Paper defaults, all values remain **fully user-configurable**, unless stated otherwise.

> ℹ️ These overrides are **temporary** and may be removed once the PaperMC team completes its configuration unification efforts.

> 🔒 Properties that are explicitly disabled or restricted are listed in the next section.

| ⚙️ Paper Property Name                                         | 🎛️ Default Value | 🔍 Notes                                                                         |
|:---------------------------------------------------------------|:------------------|----------------------------------------------------------------------------------|
| `chunks.auto-save-interval`                                    | `6000`            | `"default"` is invalid; use `-1` to disable auto-save entirely.                  |
| `entities.spawning.ticks-per-spawn.ambient`                    | `1`               | `-1` now defers to [the Vanilla behavior](https://minecraft.wiki/w/Spawn_limit). |
| `entities.spawning.ticks-per-spawn.axolotls`                   | `1`               | Same as above.                                                                   |
| `entities.spawning.ticks-per-spawn.creature`                   | `400`             | Same as above.                                                                   |
| `entities.spawning.ticks-per-spawn.monster`                    | `1`               | Same as above.                                                                   |
| `entities.spawning.ticks-per-spawn.underground_water_creature` | `1`               | Same as above.                                                                   |
| `entities.spawning.ticks-per-spawn.water_ambient`              | `1`               | Same as above.                                                                   |
| `entities.spawning.ticks-per-spawn.water_creature`             | `1`               | Same as above.                                                                   |

## 🔒 Unmodifiable Properties

Certain properties are **intentionally not customizable**. These fall into two categories:

* 🛠️ **System-managed** – Handled internally and not meant to be user-configured (e.g., `settings.permissions-file` in `bukkit.yml`).
* 🚫 **Disabled** – Unsupported by PaperMC or explicitly disabled to encourage use of modern Paper alternatives. These are often deprecated, removed, or
  overridden (e.g., `settings.plugin-profiling` in `bukkit.yml`).

If you have a valid use case for customizing an unmodifiable property, please [open an issue](https://github.com/Djaytan/docker-papermc-server/issues) and
describe your motivation or technical need. Your feedback helps guide future improvements.

### 🛠️ System-managed Properties

| 🗂️ Category | ⚙️ Property Name             | 📌 Fixed Value           | 🔍 Notes                                                                                                                    |
|:-------------|:-----------------------------|:-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Bukkit       | `settings.permissions-file`  | `config/permissions.yml` |                                                                                                                             |
| Bukkit       | `settings.world-container`   | `worlds`                 |                                                                                                                             |
| Spigot       | `config-version`             | _Generated_              | Metadata.                                                                                                                   |
| Spigot       | `settings.restart-on-crash`  | `false`                  | Instead, only rely on [Docker restart policies](https://docs.docker.com/engine/containers/start-containers-automatically/). |
| Spigot       | `settings.restart-on-script` | `disabled` (Dummy value) | Same as above.                                                                                                              |
| Paper        | `_version`                   | _Generated_              | Metadata.                                                                                                                   |

### 🚫 Disabled Properties

| 🗂️ Category | ⚙️ Property Name            | 💡 Alternative                                                                                                                                                  |
|:-------------|:----------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bukkit       | `settings.plugin-profiling` | Use the [Spark Profiler](https://docs.papermc.io/paper/profiling/#spark).                                                                                       |
| Bukkit       | `aliases`                   | Define aliases in `commands.yml` instead.                                                                                                                       |
| Bukkit       | `ticks-per.*-spawns`        | Use Paper's [entities.spawning.ticks-per-spawn](https://docs.papermc.io/paper/reference/world-configuration/#entities_spawning_ticks_per_spawn_ambient) config. |
| Bukkit       | `ticks-per.autosave`        | Use Paper's [chunks.auto-save-interval](https://docs.papermc.io/paper/reference/world-configuration/#chunks_auto_save_interval) config.                         |

## ❌ Unsupported Properties

Paper world-specific override properties (`<world_folder>/paper-world.yml`) are not supported, consistent with all other world-specific data. These data are
fully under your control, so you are responsible for managing them.
