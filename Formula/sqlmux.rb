class Sqlmux < Formula
  desc "Terminal database client organized like tmux, for PostgreSQL and MySQL"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "22ec4ebfed5e5ac3d2ea4745953511b3a7b29c514046812636fcce3d3b71640b"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=v#{version} -X main.commit=51481f4 -X main.date=2026-10-14T03:23:56Z" # std_go_args adds -s -w
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
