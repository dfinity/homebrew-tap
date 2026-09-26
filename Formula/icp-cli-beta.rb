class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  license "Apache-2.0"

  depends_on "ic-wasm"
  depends_on "openssl@3"
  depends_on "zlib"

  ver = "1.5.0"
  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-apple-darwin.tar.xz"
      sha256 "a5379d5716890350dd0ab7a07ef9f40843500ecbf994bee797a4fb189a4445bf"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-apple-darwin.tar.xz"
      sha256 "95ca22c575ac6e2924e5735f55b21592616bcbb1734c08f2d8240262a98fa9f8"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8dc266d1b5b93b80e8bca2025a7268329e5b0d9a0b74f21bba4dad59267a363a"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a6ffbc61ca728ce13492493b828f4cfd8aa9c953384e56e46fa6f2d86284d9bd"
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
