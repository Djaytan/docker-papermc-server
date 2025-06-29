# 🎞️ Asciinema

For full documentation, visit [docs.asciinema.org](https://docs.asciinema.org/).

## ⚙️ Prerequisites

Make sure the following tools are installed:

- 📼 [asciinema CLI](https://asciinema.org/docs/installation) – used to record terminal sessions
- 🖼️ [agg CLI](https://docs.asciinema.org/manual/agg/installation/) – used to convert recordings into GIFs

## 📝 Format

Recordings use the [Asciicast v2 format](https://docs.asciinema.org/manual/asciicast/v2/).

## Publishing Recording

The recording must be published under [this profile](https://asciinema.org/~Djaytan).

This can be done by running the following commands:

```bash
$ asciinema auth
```

##  🧰 Generating a GIF

To generate a GIF from a recording, refer to the [official guide](https://docs.asciinema.org/getting-started/#generating-a-gif).

In short, run:

```bash
agg demo-gif.cast demo.gif
```
