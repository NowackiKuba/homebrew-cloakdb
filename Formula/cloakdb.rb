class Cloakdb < Formula
  desc "GDPR-safe test data generation CLI"
  homepage "https://cloakdb.dev"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/NowackiKuba/cloakdb-cli/releases/download/v0.1.0/cloakdb-darwin-arm64.tar.gz"
      sha256 "b204b2ee10bbba9fe28509b7dc59e25da374bc3394942bd81cda833447a4cfba"
    else
      url "https://github.com/NowackiKuba/cloakdb-cli/releases/download/v0.1.0/cloakdb-darwin-amd64.tar.gz"
      sha256 "b4e08fef76693bf9aae9a28b21207728e933b27c85e6c97240ef743212fc0277"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/NowackiKuba/cloakdb-cli/releases/download/v0.1.0/cloakdb-linux-arm64.tar.gz"
      sha256 "fc6b3d6f53c9a0c64f1b30817446c6fd8eea4350af4578aa43dea1efc077be0b"
    else
      url "https://github.com/NowackiKuba/cloakdb-cli/releases/download/v0.1.0/cloakdb-linux-amd64.tar.gz"
      sha256 "1033fec78de4ec351a8aefebe9a31d541eecfd72aebed6557f738bbc9237d0bb"
    end
  end

  def install
    bin.install "cloakdb-darwin-arm64"  => "cloakdb" if Hardware::CPU.arm? && OS.mac?
    bin.install "cloakdb-darwin-amd64"  => "cloakdb" if Hardware::CPU.intel? && OS.mac?
    bin.install "cloakdb-linux-arm64"   => "cloakdb" if Hardware::CPU.arm? && OS.linux?
    bin.install "cloakdb-linux-amd64"   => "cloakdb" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    system "#{bin}/cloakdb", "version"
  end
end