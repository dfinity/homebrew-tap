class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.2.0-beta.0.tar.gz"
  sha256 "6e0feff2db5e78891150928e896f4312cf7f4e03c6a38d111d8ddd12ca0f4ec4"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-beta-0.1.0"
    sha256 cellar: :any,                 arm64_sequoia: "87c5e37a17f0363b2ed97b639db875540c921a156a661d4234c14d335f7b7750"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "31a49400b4a560b2f469f60c49daf1e2c20345d67bb5ca8a0eb29f995d5eeac3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4c22222ae4d177c60f11bb22499627b166d8c418931e37de125e2f04a97acbe3"
  end

  depends_on "rust" => :build
  depends_on "ic-wasm"
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
