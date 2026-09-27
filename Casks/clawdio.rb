cask "clawdio" do
  version "0.2.1"
  sha256 "28863de2b8ca4f76e383beac6455f973439fd263288db374863a7770bffcd35c"

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
