class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  license "Apache-2.0"

  depends_on "ic-wasm"
  depends_on "openssl@3"
  depends_on "zlib"

  ver = "1.3.0"
  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-apple-darwin.tar.xz"
      sha256 "28612086748b8218af33ef77845da96550d69000cdda9a1f3eef4a13ba2779b1"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-apple-darwin.tar.xz"
      sha256 "220b8a4d23fec4ffd8efab01e725164f991e47945f1fb5dabc070e7d6c5019eb"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e8169b413335279990fe819384df6ae585db6b0d951f44c685cc4d7d88b8352e"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f0db04216a7efd6606908f6f48550f0ab3a702883661b1bb94a9082a846c73e1"
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
