class Cloakdb < Formula
  desc "GDPR-safe test data generation CLI"
  homepage "https://cloakdb.dev"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yourusername/cloakdb/releases/download/v0.1.0/cloakdb-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_ARM64"
    else
      url "https://github.com/yourusername/cloakdb/releases/download/v0.1.0/cloakdb-darwin-amd64.tar.gz"
      sha256 "PLACEHOLDER_AMD64"
    end
  end

  on_linux do
    url "https://github.com/yourusername/cloakdb/releases/download/v0.1.0/cloakdb-linux-amd64.tar.gz"
    sha256 "PLACEHOLDER_LINUX"
  end

  def install
    bin.install "cloakdb-darwin-arm64"  => "cloakdb" if Hardware::CPU.arm? && OS.mac?
    bin.install "cloakdb-darwin-amd64"  => "cloakdb" if Hardware::CPU.intel? && OS.mac?
    bin.install "cloakdb-linux-amd64"   => "cloakdb" if OS.linux?
  end

  test do
    system "#{bin}/cloakdb", "version"
  end
end