class IcpCli < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "98e79229b3b89b77aaa6237a5540ca719586e17501c7886dbfd5faf0a32d2364"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-0.1.0-beta.5"
    sha256 cellar: :any,                 arm64_sequoia: "9180fac7a5be9d7d50aaa48119a3f4a76851b56d960c54d3c02f4826b4b9aa61"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "25b109fc06d6b2a005a2c56089262ca23284ca2acedc8fbe0ff1e6b0dab1f8d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d150f0c569e9bd25d775a047a4aa0dbfd5a7b962e88655602afc178dfabdd83c"
  end

  depends_on "rust" => :build
  depends_on "ic-wasm"
  depends_on "openssl@3"
  depends_on "zlib"

  on_linux do
    depends_on "dbus"
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/icp-cli")
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
