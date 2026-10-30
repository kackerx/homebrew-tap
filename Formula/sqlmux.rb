class Sqlmux < Formula
  desc "Tmux-style terminal database client for PostgreSQL, MySQL, SQLite, SQL Server and Redis"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "44b4e1d599c25fbfcc0fb924869bf9fd0a07594c7b4ab4dc5ba4e7fb8579f659"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=v#{version} -X main.commit=db779de -X main.date=2026-10-30T22:57:26Z" # std_go_args(ldflags:) adds nothing of its own
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
