cask "clawdio" do
  version "0.2.2"
  sha256 "4bb999ed23ab6bb3fb9b6c62145900cb0aec025d07da1abafd4ae5bd31e700a5"

  url "https://github.com/NoahSmo/clawdio/releases/download/v#{version}/Clawdio-#{version}.zip"
  name "Clawdio"
  desc "Claude Code quota and agent status in the notch, with a pixel art mascot"
  homepage "https://github.com/NoahSmo/clawdio"

  depends_on macos: :sonoma

  app "Clawdio.app"

  # Build signé ad-hoc, non notarisé : sans ça Gatekeeper refuse le lancement depuis Launchpad.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Clawdio.app"]
  end

  uninstall quit: "dev.clawdio.notch"

  zap trash: "~/Library/Preferences/dev.clawdio.notch.plist"
end
