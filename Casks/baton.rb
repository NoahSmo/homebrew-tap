cask "baton" do
  version "0.3.38"
  sha256 "546163eb9e0db2c003944be831fb3b81050f6ed8893ef63db3be0d1623581a6b"

  url "https://github.com/NoahSmo/Baton/releases/download/v#{version}/Baton-#{version}.zip"
  name "Baton"
  desc "Feature-first orchestrator for Claude Code agents, with Linear integration"
  homepage "https://github.com/NoahSmo/Baton"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Baton.app"

  # Build signé ad-hoc, non notarisé : sans ça Gatekeeper refuse le lancement.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Baton.app"]
  end

  uninstall quit: "com.noahsmo.baton"

  # ~/.baton (ou ~/.orchestra-claude, ancien nom) contient aussi les worktrees des features : laissé en place volontairement.
  zap trash: [
    "~/Library/Application Support/Baton",
    "~/Library/Preferences/com.noahsmo.baton.plist",
    "~/Library/Saved Application State/com.noahsmo.baton.savedState",
  ]
end
