cask "armore-edge" do
  arch arm: "arm64", intel: "x64"

  version "1.0.12"
  sha256 arm:   "276cadecabd777ca4fdd15fb8b077428a56c362bc69df06c1290c0f53f8786fe",
         intel: "7e67273dc2a56f074b1a8f86282677085a47c61da21a1f3693210640e3a3f236"

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
