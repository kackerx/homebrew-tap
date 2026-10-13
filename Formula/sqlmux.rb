class Sqlmux < Formula
  desc "Terminal database client organized like tmux, for PostgreSQL and MySQL"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b07864d3ceebed7651ebe3f543a9d254e808eb2e72d5e19ec8b128489e5569d2"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X main.version=v#{version}" # std_go_args adds -s -w
    system "go", "build", *std_go_args(ldflags:), "./cmd/sqlmux"
  end

  test do
    assert_match "sqlmux v#{version}", shell_output("#{bin}/sqlmux --version")
  end
end
