cask "brewau" do
  version "0.8.0"
  sha256 "c650287bcedfed71b8fad98692b49adb39abc83447ba2b57b625bb636514f607"

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
