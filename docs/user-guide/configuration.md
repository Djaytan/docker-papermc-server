# Configuration

PaperMC server behavior can be tailored to fit a variety of needs. This image supports two complementary methods for applying configuration changes efficiently.

## 🛠️ Configuration Methods

You can configure the server using either method independently, or combine them for greater flexibility.

### 🌿 [Environment Variables](environment-variables.md)

Perfect for **quick overrides** and **container-friendly setups**. Environment variables let you adjust configuration properties **without modifying or mounting
files**.

### 📄 [Configuration Files](configuration-files.md)

Provide **full control** and **forward compatibility** by allowing you to supply complete or partial configuration files for precise customization.

### ⚠️ Important Limitation

Each configuration property can be defined **only once** across your entire setup — either as an environment variable **or** within configuration files.

This means:

* If you set a property as an environment variable, it **cannot appear** anywhere in the configuration files.
* Likewise, even within configuration files, a single property **must not be defined multiple times**.

Attempting to define the same property more than once, by any method, will cause the server to throw an error.

While both configuration methods can coexist, this strict uniqueness rule ensures clear, consistent, and conflict-free behavior.

💡 If this restriction impacts your use case, please consider [opening an issue](https://github.com/Djaytan/docker-papermc-server/issues).
We are eager to help find a solution!

## 🔧 Customizable Properties

Currently, this image supports customization of **PaperMC configuration properties** only. This includes all settings defined in supported configuration files
such as `paper-global.yml`, `bukkit.yml`, and `spigot.yml`.

More customization options are planned for future releases, including:

* `server.properties` settings
* JVM arguments
* Aikar's flags
* TimeZone configuration
* Presets
* World-specific configs (see [PaperMC World Configuration](https://docs.papermc.io/paper/reference/world-configuration/))
* ... and more!

Stay tuned for upcoming updates as we continue expanding the customization capabilities.

### PaperMC Properties

📘 For a complete reference, visit the [PaperMC Configuration Documentation](https://docs.papermc.io/paper/reference/configuration/).

#### 📊 Supported Properties

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

#### ✏️ Overridden Defaults

To promote the use of modern Paper features over legacy Bukkit/Spigot ones, this image assigns custom default values to some properties. These are intentionally
aligned with Bukkit/Spigot defaults to preserve familiar behavior.

Although they differ from the upstream Paper defaults, all values remain **fully user-configurable**, unless stated otherwise.

> ℹ️ These overrides are **temporary** and may be removed once the PaperMC team completes its configuration unification efforts.

> 🔒 Properties that are explicitly disabled or restricted are listed in the next section.

| 📄 Configuration File      | ⚙️ Property Name                                               | 🎛️ Default Value | 🔍 Notes                                                                                                                                  |
|----------------------------|:---------------------------------------------------------------|:------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `commands.yml`             | `aliases`                                                      | _Empty array_     | Removing example alias. Example and syntax are documented [here](https://docs.papermc.io/paper/reference/bukkit-commands-configuration/). |
| `paper-world-defaults.yml` | `chunks.auto-save-interval`                                    | `6000`            | `"default"` is invalid; use `-1` to disable auto-save entirely.                                                                           |
| `paper-world-defaults.yml` | `entities.spawning.ticks-per-spawn.ambient`                    | `1`               | `-1` now defers to [the Vanilla behavior](https://minecraft.wiki/w/Spawn_limit).                                                          |
| `paper-world-defaults.yml` | `entities.spawning.ticks-per-spawn.axolotls`                   | `1`               | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.ticks-per-spawn.creature`                   | `400`             | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.ticks-per-spawn.monster`                    | `1`               | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.ticks-per-spawn.underground_water_creature` | `1`               | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.ticks-per-spawn.water_ambient`              | `1`               | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.ticks-per-spawn.water_creature`             | `1`               | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.spawn-limits.ambient`                       | `15`              | `-1` now defers to [the Vanilla behavior](https://minecraft.wiki/w/Spawn_limit).                                                          |
| `paper-world-defaults.yml` | `entities.spawning.spawn-limits.axolotls`                      | `5`               | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.spawn-limits.creature`                      | `10`              | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.spawn-limits.monster`                       | `70`              | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.spawn-limits.underground_water_creature`    | `5`               | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.spawn-limits.water_ambient`                 | `20`              | Same as above.                                                                                                                            |
| `paper-world-defaults.yml` | `entities.spawning.spawn-limits.water_creature`                | `5`               | Same as above.                                                                                                                            |

### 🔒 Unmodifiable Properties

Some properties are **intentionally not customizable**:

* 🛠️ **System-managed** – Handled internally and not meant to be user-configured (e.g., `settings.permissions-file` in `bukkit.yml`).
* 🚫 **Disabled** – Deprecated or discouraged settings, often replaced by Paper alternatives (e.g., `settings.plugin-profiling` in `bukkit.yml`).

If you have a valid use case for customizing an unmodifiable property, please [open an issue](https://github.com/Djaytan/docker-papermc-server/issues) and
describe your motivation or technical need. Your feedback helps guide future improvements.

#### 🛠️ System-managed Properties

| 🗂️ Category | ⚙️ Property Name             | 📌 Fixed Value           | 🔍 Notes                                                                                                                    |
|:-------------|:-----------------------------|:-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Bukkit       | `settings.permissions-file`  | `config/permissions.yml` | System-managed.                                                                                                             |
| Bukkit       | `settings.world-container`   | `worlds`                 | System-managed.                                                                                                             |
| Spigot       | `config-version`             | _Generated_              | Metadata.                                                                                                                   |
| Spigot       | `settings.restart-on-crash`  | `false`                  | Instead, only rely on [Docker restart policies](https://docs.docker.com/engine/containers/start-containers-automatically/). |
| Spigot       | `settings.restart-on-script` | `disabled` (Dummy value) | Same as above.                                                                                                              |
| Paper        | `_version`                   | _Generated_              | Metadata.                                                                                                                   |

#### 🚫 Disabled Properties

| 🗂️ Category | ⚙️ Property Name            | 💡 Alternative                                                                                                                                                  |
|:-------------|:----------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bukkit       | `settings.plugin-profiling` | Use the [Spark Profiler](https://docs.papermc.io/paper/profiling/#spark).                                                                                       |
| Bukkit       | `aliases`                   | Define aliases in `commands.yml` instead.                                                                                                                       |
| Bukkit       | `spawn-limits.*`            | Use Paper's [entities.spawning.spawn-limits](https://docs.papermc.io/paper/reference/world-configuration/#entities_spawning_spawn_limits_ambient) config.       |
| Bukkit       | `ticks-per.*-spawns`        | Use Paper's [entities.spawning.ticks-per-spawn](https://docs.papermc.io/paper/reference/world-configuration/#entities_spawning_ticks_per_spawn_ambient) config. |
| Bukkit       | `ticks-per.autosave`        | Use Paper's [chunks.auto-save-interval](https://docs.papermc.io/paper/reference/world-configuration/#chunks_auto_save_interval) config.                         |

### ❌ Unsupported Properties

World-specific override properties (`<world_folder>/paper-world.yml`) are **currently not supported**, in line with the handling of most world-specific data.

These files remain under your control — you are responsible for managing their content and updates.

Support for them may be added in the future.
