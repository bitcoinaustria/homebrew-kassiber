class KassiberCli < Formula
  desc "Local-first Bitcoin accounting CLI"
  homepage "https://github.com/bitcoinaustria/kassiber"
  version "0.22.76"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-macos-arm64.tar.gz"
      sha256 "1e2c4875b61089aa026755b9bc58925b56b55b88bd9a30ad6445717a5f21b911"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-linux-x64.tar.gz"
      sha256 "f2b277c0f4009d1629223cdd4a1e173bcddab788067c167754a1fd6f55ecb704"
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
