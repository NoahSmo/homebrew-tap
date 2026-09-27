cask "hiddenbar" do
  version "1.0.0"
  sha256 "a39486ee38d79dd3c00fe367fd0397ecb2b52dea3a5fe96f50b5a4b395803b26"

  url "https://github.com/NoahSmo/HiddenBar/releases/download/v#{version}/HiddenBar-#{version}.zip"
  name "HiddenBar"
  desc "Hide menu bar icons, compatible with macOS 27"
  homepage "https://github.com/NoahSmo/HiddenBar"

  depends_on macos: ">= :ventura"

  app "HiddenBar.app"

  # L'app n'est pas notarisée : sans ça, Gatekeeper bloque le premier lancement.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/HiddenBar.app"]
  end

  uninstall quit: "com.noah.hiddenbar"

  zap trash: "~/Library/Preferences/com.noah.hiddenbar.plist"
end
