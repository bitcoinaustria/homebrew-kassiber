class KassiberCli < Formula
  desc "Local-first Bitcoin accounting CLI"
  homepage "https://github.com/bitcoinaustria/kassiber"
  version "0.22.75"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-macos-arm64.tar.gz"
      sha256 "62a4e925446142ecea268fd4c6af9d9241f2a3b4308188e399ecefe59db28633"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-linux-x64.tar.gz"
      sha256 "0040930be3b355f48544f170af40bb3eb678dc5dd79cb3f1cbc8afe4fd3f8d1b"
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
