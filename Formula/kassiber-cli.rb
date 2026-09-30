class KassiberCli < Formula
  desc "Local-first Bitcoin accounting CLI"
  homepage "https://github.com/bitcoinaustria/kassiber"
  version "0.22.78"
  license "AGPL-3.0-only"

  on_macos do
    # Homebrew must not rewrite the Developer ID-sealed runtime or metadata.
    preserve_rpath
    skip_clean "libexec/Kassiber.app"
    on_arm do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-macos-arm64.tar.gz"
      sha256 "083b9159a898956c8cf46734699254323c04b58a1081f6614d94612004aeec98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-cli-linux-x64.tar.gz"
      sha256 "d1e13dee1259327c3955bace5c3c8d6a57d4975f042f54d7ac3c98a5b76ab51c"
    end
  end

  def install
    if OS.mac?
      # Keep the notarized bundle intact; its launcher resolves symlinks.
      libexec.install "Kassiber.app"
      (bin/"kassiber").write_env_script libexec/"Kassiber.app/Contents/Resources/bin/kassiber",
                                       KASSIBER_HOMEBREW_PACKAGE: "formula"
    else
      bin.install "kassiber"
    end
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
