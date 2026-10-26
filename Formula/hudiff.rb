class Hudiff < Formula
  desc "Diffs for humans: an agent explains a diff, you comment line by line in the browser"
  homepage "https://github.com/kackerx/hudiff"
  url "https://github.com/kackerx/hudiff/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "378bfb525cd20441ca643bf8bb5167d067feb3c68c847d3524e747c3ac8b4e59"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "."
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/hudiff version").strip
  end
end
