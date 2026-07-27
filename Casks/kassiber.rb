cask "kassiber" do
  version "0.22.62"
  sha256 "f8b9435a87fb45bf50be2d92a47dfe610d6e607d16b25725022f98f641d318bf"

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
