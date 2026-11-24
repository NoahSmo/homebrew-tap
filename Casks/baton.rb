cask "baton" do
  version "0.4.6"
  sha256 "6bee90aa3dce42ae3321037a1a2afc98079c3e98e943d0397d6bae03993da201"

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
