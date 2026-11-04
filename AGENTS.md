# kastruppro/tap

Homebrew tap for brewau. Casks here run as root on every Mac that has brewau,
because brewau trusts this tap (ALLOWED_TAPS) and its service account may use sudo.

- `Casks/brewau.rb` is updated by `make tap` in the brewau repo (version and sha256);
  do not edit those two lines by hand.
- Never add an `uninstall` stanza to the brewau cask: Homebrew runs uninstall
  directives on every upgrade, which would remove brewau. `sudo brewau uninstall`
  removes it.
- Keep the tap to brewau's own casks.
