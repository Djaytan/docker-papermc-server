# Configuration

PaperMC configuration properties can be customized via **environment variables**. Support for dedicated configuration files will be added in the future for more
advanced setups.

📘 Configuration reference: [PaperMC Docs](https://docs.papermc.io/paper/reference/configuration/).

## Environment Variable Mapping

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

## Supported Properties

_**WIP: More configuration options will be supported in future releases.**_

|    Category    | Supported |
|:--------------:|:---------:|
|     Bukkit     |    🟡     |
|     Spigot     |     ❌     |
| Paper (Global) |     ❌     |
| Paper (World)  |     ❌     |

✅ = Fully supported<br/>
🟡 = Partial support (some properties available)<br/>
❌ = Not yet supported

> 💡 Missing a configuration property? [Open an issue](https://github.com/Djaytan/docker-papermc-server/issues).
