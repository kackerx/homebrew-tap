class Hudiff < Formula
  desc "Diffs for humans: an agent explains a diff, you comment line by line in the browser"
  homepage "https://github.com/kackerx/hudiff"
  url "https://github.com/kackerx/hudiff/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "dfa4ca297161653434288bd8cc67aa7de0fd02b50aff6087cecbe51637b46653"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "."
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/hudiff version").strip
  end
end
