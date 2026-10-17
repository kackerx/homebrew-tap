class Sqlmux < Formula
  desc "Terminal database client organized like tmux, for PostgreSQL and MySQL"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "25902c7b8f3103bb05765a5cc6d17dc874502ef07be2ee64f0fd9aa836fbae0f"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=v#{version} -X main.commit=a39fed9 -X main.date=2026-10-17T15:35:40Z" # std_go_args adds -s -w
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
