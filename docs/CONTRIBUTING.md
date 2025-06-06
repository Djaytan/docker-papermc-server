# Contributing

When contributing to this repository, please first discuss the change you wish to make via issues,
discussions, or any other method with the owners of this repository before making a change.

Note that we have a [code of conduct](CODE_OF_CONDUCT.md), so please follow it in all your
interactions with the project.

## 🌱 How to Contribute

A contribution can be as simple as opening a discussion or reporting us an issue, an idea of
enhancement or a code improvement.

No matter of your capabilities or how important is your wish to contribute to this project, your
help will be welcome and very appreciated!

### 💭 Discussions

Discussions are where we have conversations.

If you'd like to help troubleshooting a PR you're working on, have a great new idea,
or want to share something amazing you've experimented with our product,
join us in [discussions](https://github.com/Djaytan/docker-papermc-server/discussions).

### 🐛 Issues

[Issues](https://docs.github.com/en/github/managing-your-work-on-github/about-issues) are used to
track tasks that contributors can help with.
If an issue doesn't have any label, this means we haven't reviewed it yet,
and you shouldn't begin to work on it.

If you've found a bug, a weird behavior or an exploit,
search open issues to see if someone else has reported the same thing.
If it's something new, open an issue using
a [template](https://github.com/Djaytan/docker-papermc-server/issues/new/choose).
We'll use the issue to have a conversation about the problem you want to be fixed.

### 🛠️ Pull Requests

A [pull request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests)
is a way to suggest changes in our repository.
When we merge those changes, they would be deployed in the next release by the maintainer. 🌍

If this is your first pull request (PR), we recommend you to get familiar with the process through
this [GitHub repository](https://github.com/firstcontributions/first-contributions).

When considering contributing to the project through PRs, please follow these guidelines:

1. Try to open several smaller PRs instead of only a big one, it will make the job of the reviewers
   easier.
2. Give a summary of the changes provided by your PR.
   Link any related issue, discussion or documentation that could help the reviewer understand your
   work, the impacts and the plus-value.
3. You will need at least one approval of a reviewer before being able to merge the PR.
4. All automatic jobs must pass (GitHub Actions, SonarQube analysis, security scans, formatting
   verification, ...) before merging.

### ❓ Support

Asking questions is a way for you to be unblocked, and by doing so,
this could help other people too if they are interested in the answer!
Thus, the best place for asking support is
under [discussions](https://github.com/Djaytan/docker-papermc-server/discussions).

Furthermore, rest assured that the community will try to find the best way to help you! ✨

## 🔰 Getting Started

These instructions will get you a copy of the project up and running on your local machine for
development and testing purposes.

### 📝 Prerequisites

To work on this project, you need to have **Docker** and **Docker Compose** installed on your machine.

The easiest way to get started is by installing [Docker Desktop](https://www.docker.com/products/docker-desktop), which includes both.

### 🏗️ Building and Running the Project

To build the project, use:

```bash
src/oci-image/build-dev.sh
```

For a more convenient option that also runs the OCI image, use:

```bash
src/oci-image/localdev.sh
```

### ⭕ Conventional Commits

Using a standardized commit message format offers several benefits:

* Improves the readability of commit history for both humans **and** machines
* Enables automatic version bumping
* Facilitates automatic creation and updating of release notes

For these reasons, we follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

Detailed guidelines are available [here](CONVENTIONAL_COMMITS.md).
