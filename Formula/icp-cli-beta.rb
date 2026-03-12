class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.2.1-beta.0.tar.gz"
  sha256 "531ccbb038d5b5b40b59043a4754676924901f5945ac5d4e48388eb38c953456"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-beta-0.2.0-beta.0"
    sha256 cellar: :any,                 arm64_sequoia: "00a3ab671fd2be28dd8d2bbd1b9109dceef833c8b7e955292854e4f2e25a7cac"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "75d2a464329ede7f68411bda8cffd559dd92f0d293a5ac05d4a8ea995fef4d9e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e521b07e536894c02141d8ff5917f69d9f14e897d42f68e54572a50403f2fe47"
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
