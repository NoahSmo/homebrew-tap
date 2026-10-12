cask "orchestraclaude" do
  version "0.1.0"
  sha256 "5bef5a5523e240dae17273c728e0a0953baa1687fd06163effcb664b670662f3"

  url "https://github.com/NoahSmo/OrchestraClaude/releases/download/v#{version}/OrchestraClaude-#{version}.zip"
  name "OrchestraClaude"
  desc "Feature-first orchestrator for Claude Code agents, with Linear integration"
  homepage "https://github.com/NoahSmo/OrchestraClaude"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "OrchestraClaude.app"

  # Build signé ad-hoc, non notarisé : sans ça Gatekeeper refuse le lancement.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/OrchestraClaude.app"]
  end

  uninstall quit: "com.noahsmo.orchestraclaude"

  # ~/.orchestra-claude contient aussi les worktrees des features : laissé en place volontairement.
  zap trash: [
    "~/Library/Application Support/OrchestraClaude",
    "~/Library/Preferences/com.noahsmo.orchestraclaude.plist",
    "~/Library/Saved Application State/com.noahsmo.orchestraclaude.savedState",
  ]
end
