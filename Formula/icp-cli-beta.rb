class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  version "0.2.1-beta.0"
  license "Apache-2.0"

  depends_on "ic-wasm"
  depends_on "openssl@3"
  depends_on "zlib"

  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{version}/icp-cli-aarch64-apple-darwin.tar.xz"
      sha256 "4ada89a33c232618fd69ea3f5822c4eb5bb3f8e315d9234aad235f027b05ff36"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{version}/icp-cli-x86_64-apple-darwin.tar.xz"
      sha256 "56ba7ece1ac14bd08dbc28c09d9b12d0a02a8cc1512ead73789332637c3fa3e5"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{version}/icp-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6f86d9c05b419a4739111e462bf37540f0ea9b77485491a3bf9dbc3586ee84ed"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{version}/icp-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6610d02c0f6138ca1fb11d42167d20ae86d14f6b3beff8a2023a962cd4ee73f0"
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
