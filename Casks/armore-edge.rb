cask "armore-edge" do
  arch arm: "arm64", intel: "x64"

  version "1.0.10"
  sha256 arm:   "b105d15ff3206d072ecde9b7192ab971053ec122355336b4cf0cc6aeb08861c2",
         intel: "d2e669a9339a3dad80dd1fce74f5436241083a2cc6b8c6ffae1ab2b4c71e4af4"

  url "https://github.com/uniQ-Ventures/armore-edge-public/releases/download/v#{version}/Armore-Edge-#{version}-#{arch}.dmg"
  name "Armore Edge"
  desc "On-device AI that runs on your own hardware"
  homepage "https://edge.armore.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Armore Edge.app"

  zap trash: [
    "~/Library/Application Support/armore-edge",
    "~/Library/Logs/@armore-edge",
    "~/Library/Preferences/ai.armore.edge.plist",
    "~/Library/Saved Application State/ai.armore.edge.savedState",
  ]
end
