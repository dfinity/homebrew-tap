class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "98e79229b3b89b77aaa6237a5540ca719586e17501c7886dbfd5faf0a32d2364"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-beta-0.1.0"
    sha256 cellar: :any,                 arm64_sequoia: "d525523575db53d1cca97b44a09f27f602cc1f12d2516d9377ca2ddba39714d6"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "10b5a6c06f78059bec675dfb02833f43c5be542681cf4502e126887ee1bd9d4f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ae25eb45fcf44bbe7c39d1cb6d7322eb397f91b58d5560df3bc12151fcff0c7a"
  end

  depends_on "rust" => :build
  depends_on "ic-wasm-beta"
  depends_on "openssl@3"
  depends_on "zlib"

  on_linux do
    depends_on "dbus"
  end

  conflicts_with "icp-cli", because: "both install an `icp` binary"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/icp-cli")
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
