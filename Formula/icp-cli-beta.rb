class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  license "Apache-2.0"

  depends_on "ic-wasm"
  depends_on "openssl@3"
  depends_on "zlib"

  ver = "1.2.0"
  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-apple-darwin.tar.xz"
      sha256 "d84e05c19ab7673364ee417275c5efb924f5b67d1e20c7c3e8e17b86d6b34e6e"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-apple-darwin.tar.xz"
      sha256 "e4fb4ca35b076f93887e3153bb5670d08e53cc67650a59eaee48fa63263e8036"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "873a1a5bacdd22a20bb4278f36911e5c2c6de86c2bcb7d3842292969fba0ac7d"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "df4ad7359ae397f540cbeccba501be5ba209ccaf3c219a05d7da77b0d8c67b91"
    end
  end

  conflicts_with "icp-cli", because: "both install an `icp` binary"

  def install
    libexec.install "icp"
    icp_env = { ICP_CLI_DIST: "homebrew-beta" }
    (bin/"icp").write_env_script libexec/"icp", icp_env

    generate_completions_from_executable(libexec/"icp", "completions", base_name: "icp")
  end

  test do
    system "#{bin}/icp", "--version"
  end
end
