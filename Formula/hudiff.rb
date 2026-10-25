class Hudiff < Formula
  desc "Diffs for humans: an agent explains a diff, you comment line by line in the browser"
  homepage "https://github.com/kackerx/hudiff"
  url "https://github.com/kackerx/hudiff/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f4c0b3bc555ec47e2384230af91ee4cc66e0a93f43fc244df2bd96e37e0f5103"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "."
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/hudiff version").strip
  end
end
