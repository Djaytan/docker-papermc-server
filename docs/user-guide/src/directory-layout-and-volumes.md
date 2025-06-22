# Directory Layout and Volumes

One of the biggest advantages of this OCI image is its **clear and intentional directory layout**, designed from the ground up to make volume mounting flexible
and straightforward for you.

This isn’t just a minor detail — it’s a **core feature** of the image, just as important as the [fine-grained configuration options](configuration.md) you’ll
rely on every day.

Here’s how this layout benefits you:

- ⚙️ **Manage your server configurations your way.**<br/>
  Most needs are met with default settings or [environment variables](environment-variables.md). For advanced customization, simply mount override configuration
  files as explained in [the dedicated section](configuration-files.md).

- 🌍 **Keep your worlds safe and separate.**<br/>
  World saves are stored independently, making imports, backups, and migrations simple.

- 🔌 **Handle plugins and their data cleanly.**<br/>
  Whether adding or updating plugins, the directory layout lets you mount plugins and their data separately, keeping management natural and organized.

Because these important pieces — configurations, worlds, and plugins — are each neatly separated, you can choose exactly what you want to persist or modify.
This setup simplifies backups, migrations, and even automation, letting you keep control without extra hassle.

🧠 **In short:** the directory layout is designed with *you* in mind, to make managing your server easier, more predictable, and flexible as your needs evolve.

## 🗂️ Directory Layout

This image provides a clean, well-structured directory layout. You can mount volumes at specific paths depending on your needs.

The directory structure is as follows:

     /config/          → Override configuration files
     /data/            → Persistent server data
        ├── worlds/      → Saved Minecraft worlds (e.g., "world", "world_nether", "world_the_end")
        └── plugins/     → PaperMC plugins and their data (JAR files and plugin-specific folders)

### 📌 Directory Details

- **`/config/`**<br/>
  Place configuration override files here.<br/>
  This is useful for advanced customization when environment variables aren't enough.<br/>
  For best results, define these files statically in your own custom OCI image based on this one.<br/>
  More details available [here](configuration-files.md).

- **`/data/`**<br/>
  This is the root working directory — everything persistent lives under it.<br/>
  If you want to back up or inspect the full server state, this is the top-level directory to use.<br/>
  However, for most use cases, it's better to mount its subdirectories (`worlds/`, `plugins/`) individually and/or populate them statically by
  building your own OCI image based on this one. This keeps things modular, maintainable, and easier to manage.

- **`/data/worlds/`**<br/>
  This directory contains all world saves.<br/>
  By default, it includes `world`, `world_nether`, and `world_the_end`, but any custom worlds you configure will also appear here, either in addition to or in
  place of the defaults.<br/>
  Mount this directory to persist or import your game worlds.

- **`/data/plugins/`**<br/>
  Stores all plugin `.jar` files and their corresponding data folders.<br/>
  Mount this directory if you need to retain plugin state or manage updates dynamically.<br/>
  For greater control and reproducibility, it's recommended to include plugin JARs and configuration files directly in a custom OCI image.
  Use volume mounts when plugin data needs to persist across runs.

!!! note "🧩 Mixing Volumes and Static Files"

    You can mix and match volumes and statically defined files to tailor the server layout to your needs.
    For example, you can mount volumes for dynamic data like world saves, while embedding configuration files and plugins directly into
    a custom OCI image based on this one.
    This hybrid approach offers both flexibility and reproducibility.

## 💾 Anonymous Volumes

If you don’t specify volume mounts for `/data/worlds` or `/data/plugins`, the image will automatically create anonymous volumes for them.
This ensures your data persists across container restarts and can improve container performance.
However, these volumes won’t be easily accessible or manageable from outside the container.

!!! danger "⚠️ Risk of Data Loss"

    Running `docker run --rm ...` will **automatically remove the container and any anonymous volumes** it created.
    This can lead to **permanent data loss**, especially if important directories like `/data/worlds` or `/data/plugins` were stored in those volumes.

    To avoid this, it's essential to follow proper volume management practices — **see best practices below**.

## ✅ Best Practices

- **Explicitly mount `/data/worlds` and `/data/plugins`** using named volumes or bind mounts to ensure data persistence.
- Avoid relying on anonymous volumes when using `--rm`, as they are deleted along with the container.
- **Use a custom OCI image** based on this one to include static files such as default configurations or plugin JARs, while keeping dynamic data in volumes.
- **Implement regular backups** of your mounted data directories to safeguard against accidental loss or corruption.
