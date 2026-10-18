cask "hiddenbar" do
  version "1.1.0"
  sha256 "bbb7d97f072c8e42650b9d537bdc9c7f08de7db8bd00d1ee474dff0517702c44"

  url "https://github.com/NoahSmo/HiddenBar/releases/download/v#{version}/HiddenBar-#{version}.zip"
  name "HiddenBar"
  desc "Hide menu bar icons, compatible with macOS 27"
  homepage "https://github.com/NoahSmo/HiddenBar"

  depends_on macos: :ventura

  app "HiddenBar.app"

  # L'app n'est pas notarisée : sans ça, Gatekeeper bloque le premier lancement.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/HiddenBar.app"]
  end

  uninstall quit: "com.noah.hiddenbar"

  zap trash: "~/Library/Preferences/com.noah.hiddenbar.plist"
end
