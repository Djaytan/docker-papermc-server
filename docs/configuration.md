# Configuration

PaperMC configuration properties can be customized via **environment variables**. Support for dedicated configuration files will be added in the future for more
advanced setups.

📘 Configuration reference: [PaperMC Docs](https://docs.papermc.io/paper/reference/configuration/).

## 🔧 Environment Variable Mapping

To override a configuration property using an environment variable, apply the following rules:

1. Replace **dots (`.`)** and **dashes (`-`)** with **underscores (`_`)**.
2. Convert the entire property path to **UPPERCASE**.
3. Prepend a prefix based on the configuration category:
   * `BUKKIT_` for Bukkit (`bukkit.yml`, `commands.yml`, `permissions.yml` & `help.yml`)
   * `SPIGOT_` for Spigot (`spigot.yml`)
   * `PAPER_` for Paper (`paper-global.yml`, `paper-world-defaults.yml`, etc.)

🧪 **Example:** The `bukkit.yml` property `settings.allow-end` becomes `BUKKIT_SETTINGS_ALLOW_END`.

Environment variables are ideal for simple setups. For larger or more complex ones, configuration files (once supported) will provide better structure and
flexibility.

## 📊 Supported Properties

_**WIP: More configuration options will be supported in future releases.**_

|  🗂️ Category  | 🎯 Supported |
|:--------------:|:------------:|
|     Bukkit     |  🟡 Partial  |
|     Spigot     |  ❌ Not yet   |
| Paper (Global) |  ❌ Not yet   |
| Paper (World)  |  ❌ Not yet   |

✅ = Fully supported<br/>
🟡 = Partial support (some properties available)<br/>
❌ = Not yet supported

> 💡 Missing a configuration property? [Open an issue](https://github.com/Djaytan/docker-papermc-server/issues).

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

### 🛠️ System-managed Properties

| 🗂️ Category | ⚙️ Property Name            | 📌 Fixed Value           |
|:-------------|:----------------------------|:-------------------------|
| Bukkit       | `settings.permissions-file` | `config/permissions.yml` |
| Bukkit       | `settings.world-container`  | `worlds`                 |
| Paper        | `_version`                  | _Generated_              |

### 🚫 Disabled Properties

| 🗂️ Category | ⚙️ Property Name            | 💡 Alternative                                                                                                                                                  |
|:-------------|:----------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bukkit       | `settings.plugin-profiling` | Use the [Spark Profiler](https://docs.papermc.io/paper/profiling/#spark).                                                                                       |
| Bukkit       | `aliases`                   | Define aliases in `commands.yml` instead.                                                                                                                       |
| Bukkit       | `ticks-per.*-spawns`        | Use Paper's [entities.spawning.ticks-per-spawn](https://docs.papermc.io/paper/reference/world-configuration/#entities_spawning_ticks_per_spawn_ambient) config. |
| Bukkit       | `ticks-per.autosave`        | Use Paper's [chunks.auto-save-interval](https://docs.papermc.io/paper/reference/world-configuration/#chunks_auto_save_interval) config.                         |
