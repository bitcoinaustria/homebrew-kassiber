cask "kassiber" do
  version "0.22.56"
  sha256 "3334d987feb775a73c0efff27951d8c951f1a38a42025227a064ab9c1dd19e78"

  url "https://github.com/bitcoinaustria/kassiber/releases/download/v#{version}/kassiber-macos-universal.dmg"
  name "Kassiber"
  desc "Local-first Bitcoin accounting suite"
  homepage "https://github.com/bitcoinaustria/kassiber"

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
