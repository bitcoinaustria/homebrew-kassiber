class KassiberCli < Formula
  desc "Local-first Bitcoin accounting CLI"
  homepage "https://github.com/bitcoinaustria/kassiber"
  version "0.22.67"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-macos-arm64.tar.gz"
      sha256 "a93874d3919e044ec03589144ce5d2222dcf4f0794509567f6ce9759a48226b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-linux-x64.tar.gz"
      sha256 "9d4535e49c1fc347edfa940592cff5f5f08526f36dc43405e57f3d6ff7fd069f"
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
