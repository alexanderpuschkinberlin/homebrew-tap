cask "mac-monologue" do
  version "0.7.1"
  sha256 "ffd10f87b19095595bd76bf3ecaed50cade2fce16585e3dba5c57559ce85ca94"

  url "https://github.com/alexanderpuschkinberlin/Mac-Monologue/releases/download/v#{version}/Mac-Monologue.zip"
  name "Mac-Monologue"
  desc "Record yourself, or your screen with you in it"
  homepage "https://mac-monologue.puschkin.co/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Mac-Monologue.app"

  zap trash: [
    "~/Library/Caches/io.github.alexanderpuschkinberlin.mac-monologue",
    "~/Library/HTTPStorages/io.github.alexanderpuschkinberlin.mac-monologue",
    "~/Library/Preferences/io.github.alexanderpuschkinberlin.mac-monologue.plist",
    "~/Library/Saved Application State/io.github.alexanderpuschkinberlin.mac-monologue.savedState",
  ]

  caveats <<~EOS
    Mac-Monologue is free and not registered with Apple, so macOS stops it the
    first time you open it. Click Done, then open System Settings > Privacy &
    Security and click Open Anyway next to "Mac-Monologue.app" was blocked.
    You only do this once.
  EOS
end
