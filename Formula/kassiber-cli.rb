class KassiberCli < Formula
  desc "Local-first Bitcoin accounting CLI"
  homepage "https://github.com/bitcoinaustria/kassiber"
  version "0.22.56"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-macos-arm64.tar.gz"
      sha256 "22072641dd2e6ad58d45b20bd45327b44e4e030f53aca2a01dce78bac1f5877f"
    end
    on_intel do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-macos-x64.tar.gz"
      sha256 "aa019b0f60896d1e42649626dbe55f27b0db4a85c4105e13fc8ea06a96bd218b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-linux-x64.tar.gz"
      sha256 "4254e025fac1c369ff69362e4d7510764a03f57b5e38a0499e51f55bd58afe49"
    end
  end

  def install
    bin.install "kassiber"
  end

  # Formulae cannot declare conflicts with casks, so the overlap is surfaced
  # as user guidance only, mirroring the cask-side caveat.
  def caveats
    <<~EOS
      The Kassiber desktop cask ("bitcoinaustria/kassiber/kassiber") links its own
      `kassiber` command. Install either kassiber-cli or the desktop cask,
      not both.
    EOS
  end

  test do
    assert_match "Kassiber", shell_output("#{bin}/kassiber --version")
  end
end
