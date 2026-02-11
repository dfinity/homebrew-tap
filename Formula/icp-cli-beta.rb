class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "98e79229b3b89b77aaa6237a5540ca719586e17501c7886dbfd5faf0a32d2364"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-0.1.0"
    sha256 cellar: :any,                 arm64_sequoia: "69f63eef0fe2c858f65e6a0efc9e28ff2a6094c4e904040f06dfedb7826cb5ec"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "b62449bc9f9d61dce2a88a8aba75b775be429a9cf11cd2f9d7c02c8192c59159"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "88e95e06a46b2eb64df34c183a7471f2893d45367c1b4ddffcd573e7e1b2e8bf"
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
