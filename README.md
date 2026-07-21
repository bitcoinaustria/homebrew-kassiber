# Kassiber Homebrew Tap

Homebrew packages for [Kassiber](https://github.com/bitcoinaustria/kassiber),
the open-source, local-first Bitcoin accounting suite.

## Desktop app (GUI + terminal command)

```bash
brew tap bitcoinaustria/kassiber
brew install --cask kassiber
```

Installs Kassiber.app and links its bundled `kassiber` terminal command.

## CLI only

```bash
brew tap bitcoinaustria/kassiber
brew install kassiber-cli
```

Installs the standalone frozen CLI with no desktop GUI dependencies
(macOS arm64/x86_64 and Homebrew on Linux x86_64).

The cask and the formula both provide the `kassiber` command — install one or
the other, not both.

## Maintenance

The files in `Casks/` and `Formula/` are generated. Release runs of
[`prerelease-binaries.yml`](https://github.com/bitcoinaustria/kassiber/blob/main/.github/workflows/prerelease-binaries.yml)
render them with `scripts/render_homebrew.py` and push updates automatically;
do not edit them by hand. See
[docs/reference/homebrew.md](https://github.com/bitcoinaustria/kassiber/blob/main/docs/reference/homebrew.md).
