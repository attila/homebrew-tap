# The release archives carry the version in their names, so Homebrew reads it
# from the URLs. Declaring it as well is redundant and `brew audit --strict`
# rejects it. Linux ships a glibc build here; the musl archive in the same
# release is not packaged.
class Lore < Formula
  desc "Local semantic search MCP server for software patterns"
  homepage "https://github.com/attila/lore"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/attila/lore/releases/download/v0.5.0/lore-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "ad0b5d777a92b9a6df5429d122a8e40481ed0cf5b89ffde1e2b7aa60324746a4"
    end

    on_intel do
      url "https://github.com/attila/lore/releases/download/v0.5.0/lore-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "dffb67cea348e026296ee1c0a1288efeb78ade5c31eff346c8503b7a951ffc55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/attila/lore/releases/download/v0.5.0/lore-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aff4db1dd630b88a4e0f9aa74ffeaf9657569b7eac606d11bea6d14aca425a1b"
    end
  end

  def install
    bin.install "lore"
  end

  test do
    assert_match "lore #{version}", shell_output("#{bin}/lore --version")
    assert_match "Search the knowledge", shell_output("#{bin}/lore help search")
  end
end
