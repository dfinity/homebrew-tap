class IcpCliBeta < Formula
  desc "Development tool for building and deploying canisters on ICP"
  homepage "https://github.com/dfinity/icp-cli"
  license "Apache-2.0"

  depends_on "ic-wasm"
  depends_on "openssl@3"
  depends_on "zlib"

  ver = "1.1.0"
  on_macos do
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-apple-darwin.tar.xz"
      sha256 "e65f280ca3874592bb48e8f02965bb5be66c7f606f717e891a5405150ba28b3a"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-apple-darwin.tar.xz"
      sha256 "6dda3ac9bb5dbcd20135f84f506512a62245a654bc29f233ed652febd45b1ac4"
    end
  end

  on_linux do
    depends_on "dbus"
    on_arm do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a7210b4e67447f41f3418e70bcd8e8cd5861f8db3e0f5426585a5ee38528b3b9"
    end
    on_intel do
      url "https://github.com/dfinity/icp-cli/releases/download/v#{ver}/icp-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "727388f049ddc132c49520b88c51c550be97fc951d711c73e1c70531ad7032b4"
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
