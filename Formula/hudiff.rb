class Hudiff < Formula
  desc "Diffs for humans: an agent explains a diff, you comment line by line in the browser"
  homepage "https://github.com/kackerx/hudiff"
  url "https://github.com/kackerx/hudiff/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4baff938df170382da509e46b7921a8cc39e11d4a6bbe7507df91d25150a1371"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "."
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/hudiff version").strip
  end
end
