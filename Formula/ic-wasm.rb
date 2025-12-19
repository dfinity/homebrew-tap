class IcWasm < Formula
  desc "CLI tool for performing Wasm transformations specific to ICP canisters"
  homepage "https://github.com/dfinity/ic-wasm"
  url "https://github.com/dfinity/ic-wasm/archive/refs/tags/0.9.9.tar.gz"
  sha256 "43ca2645d6bdee3fd2090fa75520887e03568f5f34a6f74a8cf13e1b811d61df"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/ic-wasm-0.9.9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "385bffb18d2419b63445016f3d4e0cc44ca6e1691d1c533e8576e140089ed797"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "e9d2debe8fb02d3ae45f2766e0d935dc9a05573e730f438196db221b99cb65be"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "720add4e02008bc67f891f1c76e8b5b066f1202a9b80e2d6e93aca41729ff0b6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
