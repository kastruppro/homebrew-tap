cask "brewau" do
  version "0.7.0"
  sha256 "c322ea97d6d8a9dfd57ddc4f16138cfd7c01a323e62b51d758b99c4aaf6ae2e5"

  url "https://github.com/kastruppro/brewau/releases/download/v#{version}/brewau-#{version}.pkg"
  name "brewau"
  desc "Unattended, isolated Homebrew"
  homepage "https://github.com/kastruppro/brewau"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  pkg "brewau-#{version}.pkg"

  # No uninstall stanza on purpose: Homebrew runs a cask's uninstall
  # directives (pkgutil, script, ...) on every upgrade, which would remove
  # brewau. Remove brewau with `sudo brewau uninstall`.

  caveats <<~EOS
    brewau now runs Homebrew as _brewau and updates itself from this tap.
    Remove it with:
      sudo brewau uninstall
  EOS
end
