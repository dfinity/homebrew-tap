class IcpCli < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0-beta.4.tar.gz"
  sha256 "426126295bb7453edb1d3e4089892e7a9588c4e6baa6562516b0d946ebe324c1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-0.1.0-beta.3"
    sha256 cellar: :any,                 arm64_sequoia: "9b965964152aef33da94d8a9a07187bedb2a13885389c625ab747dd58cf6e255"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "3ed7db6facc02d7ad2a88ad2804bde985e250850028a1df0f42867bf5d143778"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3a3ccadddcb9adf26e14e4485954d3020a570f2fcfe90806492fde9c1bff69ab"
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
