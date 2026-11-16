cask "notchi" do
  version "0.5.0-beta.10"
  sha256 "46e465f56c925090823c04c3cbb238039906fd2f957daa7537b20817c9af63fa"

  url "https://github.com/hardikdhingra150/Notchi/releases/download/v#{version}/Notchi-#{version}.dmg"
  name "Notchi"
  desc "Free, open-source notch island and theme suite"
  homepage "https://notchi-plum.vercel.app"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-[a-z]+\.\d+)?)$/i)
    strategy :github_latest
  end

  # Notchi updates itself (Sparkle), so brew doesn't need to.
  auto_updates true
  depends_on macos: :sonoma

  app "Notchi.app"
  binary "#{appdir}/Notchi.app/Contents/Helpers/notchi"

  uninstall quit: "app.notchi.Notchi",
            login_item: "Notchi"

  zap trash: [
    "~/Library/Application Support/Notchi",
    "~/Library/Preferences/app.notchi.Notchi.plist",
    "~/Library/Caches/app.notchi.Notchi",
  ]

  caveats <<~EOS
    Notchi isn't signed with a paid Apple certificate, so the first time you open it
    macOS asks: System Settings > Privacy & Security > Open Anyway. You do this once.
  EOS
end
