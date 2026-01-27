class IcpCli < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0-beta.4.tar.gz"
  sha256 "426126295bb7453edb1d3e4089892e7a9588c4e6baa6562516b0d946ebe324c1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-0.1.0-beta.4"
    sha256 cellar: :any,                 arm64_sequoia: "b5ebcb7f5ea73bed12d65a09ed1f3503a8054d7c0789225ab2c66664d668f155"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "38de098f1a36394e5ff530a931c40be53f2d44cd0642ade84402ee604678c9d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "10d893dbf3a5b2201ee892d7c1108f9a64bcaf90f4aa1df2a5d6045e21dd2d59"
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
