cask "kassiber" do
  version "0.22.75"
  sha256 "b3fca1f2f6fe94d6a24adde4a2df86b69ceae64d800d0c35b7f9a6f4355cd100"

  url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-macos-arm64.dmg"
  name "Kassiber"
  desc "Local-first Bitcoin accounting suite"
  homepage "https://github.com/bitcoinaustria/kassiber"

  depends_on arch: :arm64

  app "Kassiber.app"
  binary "#{appdir}/Kassiber.app/Contents/Resources/bin/kassiber",
         target: "kassiber"

  zap trash: [
    "~/Library/Application Support/at.bitcoinaustria.kassiber",
    "~/Library/Preferences/at.bitcoinaustria.kassiber.plist",
    "~/Library/Saved Application State/at.bitcoinaustria.kassiber.savedState",
  ]

  # Homebrew has no cask<->formula conflict stanza (the cask one only accepts
  # cask:), so the overlap is surfaced as a caveat on both sides.
  caveats <<~EOS
    The bitcoinaustria/kassiber/kassiber-cli formula installs the same
    `kassiber` command. Install either this cask or the formula, not both.
  EOS
end
