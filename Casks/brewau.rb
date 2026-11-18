cask "brewau" do
  version "0.9.1"
  sha256 "fd84231220ab5e67d3e986491b9f7ab43cd3678fa86a30f4741ea683ed7fd6b9"

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
