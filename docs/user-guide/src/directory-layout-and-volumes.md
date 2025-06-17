# Directory Layout and Volumes

One of the biggest advantages of this OCI image is its **clear and intentional directory layout**, designed from the ground up to make volume mounting flexible
and straightforward for you.

This isn’t just a minor detail — it’s a **core feature** of the image, just as important as the [fine-grained configuration options](configuration.md) you’ll
rely on every day.

Here’s how this layout benefits you:

- ⚙️ **Manage your server configurations your way.**<br/>
  Most needs are met with default settings or environment variables. For advanced customization, simply mount override configuration files as explained
  in [the dedicated section](configuration-files.md).

- 🌍 **Keep your worlds safe and separate.**<br/>
  World saves are stored independently, making imports, backups, and migrations simple.

- 🔌 **Handle plugins and their data cleanly.**<br/>
  Whether adding or updating plugins, the directory layout lets you mount plugins and their data separately, keeping management natural and organized.

Because these important pieces—configurations, worlds, and plugins—are each neatly separated, you can choose exactly what you want to persist or modify. This
setup simplifies backups, migrations, and even automation, letting you keep control without extra hassle.

In short: the directory layout is designed with *you* in mind, to make managing your server easier, more predictable, and flexible as your needs evolve.
