class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  license "Apache-2.0"

  depends_on "ic-wasm"
  depends_on "openssl@3"
  depends_on "zlib"

  ver = "0.2.3"
  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-apple-darwin.tar.xz"
      sha256 "5b5911d5d3f4e2abb96f0e1094a53f84a98742d7a90a68838d7cf0ea6a3480c4"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-apple-darwin.tar.xz"
      sha256 "fcd4035edab85100501d1d5ac6ed88cd52724b9ce7e1669bf10f0634b9a795b3"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4d16aad2336f1d19aab7aabdbea24aee1f365c3f1a52eaa2ad65a36c1c232d7e"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0deed04b32b40c80f450124e4e19db807abe95d7c966a5270c17e83722a5922f"
    end
  end

  conflicts_with "icp-cli", because: "both install an `icp` binary"

  def install
    libexec.install "icp"
    icp_env = { ICP_CLI_DIST: "homebrew-beta" }
    (bin/"icp").write_env_script libexec/"icp", icp_env
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
