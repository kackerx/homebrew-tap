class Agmux < Formula
  desc "Card board for the coding agents in tmux, in a popup"
  homepage "https://github.com/kackerx/agmux"
  url "https://github.com/kackerx/agmux/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4542b6a17b87301b46461ce9b6a2be4e039a7fe7c6c62c5328cd21acda06097b"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=v#{version} -X main.commit=7b1b625 -X main.date=2026-10-17T12:17:27Z"
    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    assert_match "agmux v#{version}", shell_output("#{bin}/agmux --version")
  end
end
