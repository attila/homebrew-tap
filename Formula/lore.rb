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
      url "https://github.com/attila/lore/releases/download/v0.6.0/lore-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "14154569e82d59e89d61ae5d7c08d1ecb16d63af449b30a6066c097c35c4ac78"
    end

    on_intel do
      url "https://github.com/attila/lore/releases/download/v0.6.0/lore-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "2bb892270e8ff69cbabb62987588406e90917bc442420b5cc66fafb5f5990c9a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/attila/lore/releases/download/v0.6.0/lore-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9bf84425ebd5e32190a33104efb2ab4e9718bff036f2ab74cf3c6e7f4316c1e5"
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
