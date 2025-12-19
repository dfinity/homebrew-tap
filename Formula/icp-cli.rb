class IcpCli < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  url "https://github.com/dfinity/icp-cli/archive/refs/tags/v0.1.0-beta.2.tar.gz"
  sha256 "e3ee62316142805aa5254c61cfb6bbb8aa6579c746538db7792d777edd62b576"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/dfinity/homebrew-tap/releases/download/icp-cli-0.1.0-beta.2"
    sha256 cellar: :any,                 arm64_sequoia: "3e5157dce96e5b8b75a373aac87ca035315f0af97bc34dc43167d41904439766"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "aafd9a9b4562b5750e31a2c06d92bf658076dbbcff17d2723b2ae4f922c7fb8a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e4ff65138f74564b0eac60466a0372b907159a85a95ff497d8e323eb1c74546a"
  end

  depends_on "rust" => :build
  depends_on "ic-wasm"
  depends_on "icp-cli-network-launcher"
  depends_on "openssl@3"
  depends_on "zlib"

  def install
    with_env(ICP_CLI_VERSION: version.to_s) do
      system "cargo", "install", *std_cargo_args(root: libexec, path: "crates/icp-cli")
    end

    keg_launcher = Formula["icp-cli-network-launcher"].opt_bin/"icp-cli-network-launcher"
    icp_env = {
      ICP_CLI_NETWORK_LAUNCHER_PATH: "${ICP_CLI_NETWORK_LAUNCHER_PATH:-#{keg_launcher}}",
    }
    (bin/"icp").write_env_script libexec/"bin/icp", icp_env
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
