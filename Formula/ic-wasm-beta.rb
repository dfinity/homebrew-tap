class IcWasmBeta < Formula
  desc "CLI tool for performing Wasm transformations specific to ICP canisters"
  homepage "https://github.com/dfinity/ic-wasm"
  url "https://github.com/dfinity/ic-wasm/archive/refs/tags/0.9.9.tar.gz"
  sha256 "43ca2645d6bdee3fd2090fa75520887e03568f5f34a6f74a8cf13e1b811d61df"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/ic-wasm-beta-0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "930a066c876fe942c7b460b27ba60b9700fccdeaf6c7adbfc642ed7179dea1f3"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "4b30d1e03299963e6fc6a5d4dbef9ce63dd8a51d8eb08cc603025a06ea664eda"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0aa10e057eba3b8e6dbe2def1d4f0b0802ba771bd940bf43636a0e131d4e6bd8"
  end

  depends_on "rust" => :build

  conflicts_with "ic-wasm", because: "both install an `ic-wasm` binary"

  def install
    system "cargo", "install", *std_cargo_args
  end
end
