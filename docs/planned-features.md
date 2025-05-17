# 🛠️ Planned Features

The image is under active development, with the following enhancements planned:

* ⚙️ **Unified configuration interface**: Centralized PaperMC tuning via a config file, with optional environment variable overrides (which will be the main difference with [itzg's solution](https://docker-minecraft-server.readthedocs.io/en/latest/configuration/interpolating/)).
  * **Customizable server startup options**: Ability to set JVM options and server properties via environment variables.
  * **Enable/Disable Aikar's flags**: Aikar's researches ([link](https://aikar.co/2018/07/02/tuning-the-jvm-g1gc-garbage-collector-flags-for-minecraft/)) and [PaperMC recommendations](https://docs.papermc.io/paper/aikars-flags/)
  * **Configurable TimeZone**
  * **Support JMX**: Java Management Extensions enabling for remote management and monitoring (e.g., with [VisualVM](https://visualvm.github.io/), [JMC](https://openjdk.org/projects/jmc/), ...).
  * **World specific configs**: https://docs.papermc.io/paper/reference/world-configuration/
  * **Presets**: with a recommended one pre-tuning the server (Aikar flags, Spark plugin preference, ...)
* ☸️ **Helm chart (Kubernetes)**
* 📚 **Documentation**: Comprehensive documentation for all features, configurations and examples with [AsciiDoc](https://asciidoc.org/).
