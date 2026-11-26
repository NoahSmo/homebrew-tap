cask "baton" do
  version "0.4.10"
  sha256 "b013df5a062fd601c8ac245ecdde6ce332f5ec8ae98fcf44cda406394cddbb0f"

  url "https://github.com/NoahSmo/Baton/releases/download/v#{version}/Guru-#{version}.zip"
  name "Guru"
  desc "Feature-first orchestrator for Claude Code agents, with Linear integration"
  homepage "https://github.com/NoahSmo/Baton"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Guru.app"

  # Build signé ad-hoc, non notarisé : sans ça Gatekeeper refuse le lancement.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Guru.app"]
  end

  uninstall quit: "com.noahsmo.baton"

  # ~/.baton (ou ~/.orchestra-claude, ancien nom ; Guru s'appelait Baton) contient aussi les worktrees des features : laissé en place volontairement.
  zap trash: [
    "~/Library/Application Support/Baton",
    "~/Library/Application Support/Guru",
    "~/Library/Preferences/com.noahsmo.baton.plist",
    "~/Library/Saved Application State/com.noahsmo.baton.savedState",
  ]
end
