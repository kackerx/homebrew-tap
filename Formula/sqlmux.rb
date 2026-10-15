class Sqlmux < Formula
  desc "Terminal database client organized like tmux, for PostgreSQL and MySQL"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "9789230a2072016991b1155befc3efc9946372bf7324aa88b53266cc9c31e66e"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=v#{version} -X main.commit=9e8438e -X main.date=2026-10-15T07:56:38Z" # std_go_args adds -s -w
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
