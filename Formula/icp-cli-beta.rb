class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.2.1-beta.0.tar.gz"
  sha256 "531ccbb038d5b5b40b59043a4754676924901f5945ac5d4e48388eb38c953456"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-beta-0.2.1-beta.0"
    sha256 cellar: :any,                 arm64_sequoia: "dc8213420cf19d779cbcb5c02dc31a4f6c7916477822b47d1d6f222b6ef162fe"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "a2fd2f44ce94524b575d4b86704e8531d36a1c24a7a4946eb32b3c376c4c0369"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2bd5f77af0004632d93beb1b759b9fde3d9251ad0bb25a21dc03d2e2e3833923"
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
