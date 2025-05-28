# Configuration Files

Configuration files offer a powerful and flexible way to customize your PaperMC server beyond the limitations
of [environment variables](environment-variables.md).
They provide a more maintainable and future-proof approach to configuring advanced options and world-specific settings.

## 🌟 Benefits

* 🛠️ **Deeper customization** — Support advanced options and world-specific settings that are difficult or impossible to configure with environment variables
  alone.
* 📄 **Clean and structured** — Written in YAML, configuration files keep your setup organized and easy to manage.
* 📁 **Flexible organization** — Split settings across multiple files or consolidate them into one, depending on your organizational preferences.
* 🚀 **Forward compatibility** — Define new PaperMC properties immediately as they are released, without waiting for image updates or explicit support.

## 📂 File Placement

All configuration files must be placed in:

    /opt/papermc/config/overrides

You are free to choose any file names that suit your organization.

## 📄 Format

Configuration files must use the **YAML** format.
Both `.yml` and `.yaml` extensions are supported.

## ⚙️ Rules and Constraints

Each property must be nested under the correct top-level key.
This mapping ensures your overrides are injected into the proper target configuration file before the server starts.

The table below shows the correspondence between top-level keys and the resolved configuration files inside the PaperMC server:

| 🔑 Top-level key        | 📄 Resolved File           |
|-------------------------|:---------------------------|
| `bukkit.global`         | `bukkit.yml`               |
| `bukkit.commands`       | `commands.yml`             |
| `bukkit.permissions`    | `permissions.yml`          |
| `spigot`                | `spigot.yml`               |
| `paper.global`          | `paper-global.yml`         |
| `paper.worlds-defaults` | `paper-world-defaults.yml` |

⚠️ It is important to **not** define the same property multiple times, whether within the same file or across several ones.
The system does not support merging or precedence between conflicting definitions, so defining the same property more than once will cause an error.

The same limitation applies when it comes to mix configuration files with environment variables.

💡 If the lack of flexibility is a concern, please consider [opening an issue](https://github.com/Djaytan/docker-papermc-server/issues).
We’ll do our best to find a solution!

### 🧪 Example

Suppose you want to disable the End dimension in your PaperMC server.
This would normally require setting the `settings.allow-end` property inside `bukkit.yml`.
Now, you can create any file inside `/opt/papermc/config/overrides` and define the property under the `bukkit.global.settings` key like this:

```yaml
bukkit:
  global:
    settings:
      allow-end: false
```

### 📑 Unified Configuration File

You can place multiple top-level keys in a single file to override settings across different categories, making it convenient for simpler
configurations.

For example:

```yaml
bukkit:
  global:
    settings:
      allow-end: false

spigot:
  commands:
    log: false
```

This configuration results in injecting the `settings.allow-end` property into `bukkit.yml` and the `commands.log` property into `spigot.yml` before the server
starts.

## 🚀 Forward Compatibility

This image is **forward-compatible** with configuration options introduced in future PaperMC versions.

Even if the image does not explicitly support a new setting, you can use it immediately by adding the corresponding property to a configuration file — no
image update required.
This is in contrast to environment variables, which must be explicitly supported to function.

Configuration files give you full access to new features as soon as they’re available in PaperMC itself, making them the preferred way to keep your server
configuration both flexible and future-ready.
