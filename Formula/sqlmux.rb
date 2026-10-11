class Sqlmux < Formula
  desc "Terminal database client organized like tmux, for PostgreSQL and MySQL"
  homepage "https://github.com/kackerx/sqlmux"
  url "https://github.com/kackerx/sqlmux/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "64b366a125e7505c4f17946da335f86f3076874c9abb88767db36619b7a98934"
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
