class Sqlmux < Formula
  desc "Tmux-style terminal database client for PostgreSQL, MySQL, SQLite and Redis"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "7dfa7991f4c1b1beee7a5ba852cb541f7a2dbb8b6d1fa57d0004a0885de10e5b"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=v#{version} -X main.commit=dbfed2b -X main.date=2026-10-26T15:17:31Z" # std_go_args(ldflags:) adds nothing of its own
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
