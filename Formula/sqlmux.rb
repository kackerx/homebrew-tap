class Sqlmux < Formula
  desc "Tmux-style terminal database client for PostgreSQL, MySQL, SQLite and Redis"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "c1158d21e75d82499edc06aa6aa1421a0c78d8b41b5595814555d032c30bf139"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=v#{version} -X main.commit=604aef6 -X main.date=2026-10-20T05:36:18Z" # std_go_args(ldflags:) adds nothing of its own
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
