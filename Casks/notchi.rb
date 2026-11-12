cask "notchi" do
  version "0.5.0-beta.5"
  sha256 "5944492eb5c72c1c906d0f4126dec875de3e92b8c76996d470b5af667800be9a"

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
