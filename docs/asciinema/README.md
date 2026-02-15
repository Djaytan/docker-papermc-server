# 🎞️ Asciinema

For full documentation, visit [docs.asciinema.org](https://docs.asciinema.org/).

## ⚙️ Prerequisites

Make sure the following tools are installed:

- 📼 [asciinema CLI](https://asciinema.org/docs/installation) – used to record terminal sessions
- 🖼️ [agg CLI](https://docs.asciinema.org/manual/agg/installation/) – used to convert recordings into GIFs

⚠️ `asciinema` cannot run in Git Bash on Windows it seems (missing POSIX dependencies such as fcntl). The CLI is therefore better executed via WSL.

## 📝 Format

Recordings use the [Asciicast v2 format](https://docs.asciinema.org/manual/asciicast/v2/).

## Publishing Recording

The recording must be published under [this profile](https://asciinema.org/~Djaytan).

This can be done by running the following commands:

```bash
$ asciinema auth
```

Then:

```bash
$ asciinema upload demo.cast
```

## 🧰 Generating a GIF

To generate a GIF from a recording, refer to the [official guide](https://docs.asciinema.org/getting-started/#generating-a-gif).

In short, run:

```bash
agg demo-gif.cast demo.gif
```
