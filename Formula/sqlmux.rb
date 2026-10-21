class Sqlmux < Formula
  desc "Tmux-style terminal database client for PostgreSQL, MySQL, SQLite and Redis"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "a33ab406500ab1eb6514b44ee033d2f67456eba633cb72f4aedc1bf7e0daea5a"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=v#{version} -X main.commit=45f2d8e -X main.date=2026-10-21T05:21:56Z" # std_go_args(ldflags:) adds nothing of its own
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
