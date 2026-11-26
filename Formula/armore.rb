# The `armore` command-line tool (DRAFT, regdist 2026-11-26).
# Install:  brew tap armore-ai/edge && brew trust armore-ai/edge && brew install armore-ai/edge/armore
# Bump per release from the public release's SHA256SUMS (1.0.13+ ship one; 1.0.12 hashes below were
# computed from the published 1.0.12 assets on 2026-11-26).
class Armore < Formula
  desc "Command-line tool for Armore Edge, on-device AI on your own hardware"
  homepage "https://edge.armore.ai/"
  version "1.0.12"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/uniQ-Ventures/armore-edge-public/releases/download/v#{version}/armore-darwin-arm64"
      sha256 "b34fad8ed2b12409d38fdca5c8c7f441b50237515ff54bfc9504a7fd805453d6"
    end
    on_intel do
      url "https://github.com/uniQ-Ventures/armore-edge-public/releases/download/v#{version}/armore-darwin-x86_64"
      sha256 "0c0d2c38234005710807c864077409abdfdf44e321460eefe9e523633fa557e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uniQ-Ventures/armore-edge-public/releases/download/v#{version}/armore-linux-arm64"
      sha256 "4a42a5e4142da4de5051d7535af697c03b61a60e7655968e471fc7a04e022fae"
    end
    on_intel do
      url "https://github.com/uniQ-Ventures/armore-edge-public/releases/download/v#{version}/armore-linux-x86_64"
      sha256 "d9721d3f34681bb8a6ddb2f675afadfcac850a2379c54625a9a1425458506da7"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["armore-*"].first => "armore"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/armore --version")
  end
end
