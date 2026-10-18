# armore-ai/homebrew-edge

A Homebrew tap for [Armore Edge](https://edge.armore.ai/).

## Install

```sh
brew tap armore-ai/edge
brew trust armore-ai/edge
brew install --cask armore-edge
```

The `brew trust` step is required: Homebrew 7 refuses to load casks from a
third-party tap until you trust it explicitly. Without it, `brew install`
stops with `Refusing to load cask … from untrusted tap`.

## What it installs

The `armore-edge` cask installs the published macOS build from
[uniQ-Ventures/armore-edge-public](https://github.com/uniQ-Ventures/armore-edge-public/releases),
for Apple Silicon or Intel.

The build is signed and notarized with an Apple Developer ID, so Gatekeeper
accepts it without a quarantine prompt. Homebrew additionally checks the
download against the `sha256` pinned in the cask.

Verify either yourself:

```sh
spctl -a -t open --context context:primary-signature -v /Applications/Armore\ Edge.app
xcrun stapler validate /Applications/Armore\ Edge.app
```

## Updates

The app updates itself, so the cask is marked `auto_updates`. `brew upgrade`
will not normally move it; it tracks releases for discovery and reinstalls.

## Uninstall

```sh
brew uninstall --cask armore-edge          # removes the app
brew uninstall --zap --cask armore-edge    # also removes local app data
```

## Issues

Problems with the app itself belong in the product's own tracker, not here.
Open an issue here only for packaging problems — a wrong checksum, a broken
URL, a cask that will not install.
