cask "armore-edge" do
  arch arm: "arm64", intel: "x64"

  version "1.0.11"
  sha256 arm:   "939202676dc530b7ca902673c225752f1bdd47f367beab2e840d71db080bae94",
         intel: "c95a676ff1142ac762ba11a3662d75d0aa03e6e9cf665b371333d092bb21e1f1"

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
