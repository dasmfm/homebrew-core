class Renovate < Formula
  desc "Automated dependency updates. Flexible so you don't need to be"
  homepage "https://github.com/renovatebot/renovate"
  url "https://registry.npmjs.org/renovate/-/renovate-39.178.0.tgz"
  sha256 "becd2991de5fda50c8287ffe768a7e6e3c1da2987e10bd091d668b71dc9970da"
  license "AGPL-3.0-only"

  # There are thousands of renovate releases on npm and the page the `Npm`
  # strategy checks is several MB in size and can time out before the request
  # resolves. This checks the first page of tags on GitHub (to minimize data
  # transfer).
  livecheck do
    url "https://github.com/renovatebot/renovate/tags"
    regex(%r{href=["']?[^"' >]*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
    strategy :page_match
    throttle 10
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78f79e12b3eb5792a375cc63e6de72dd56e3b047ae63b1ccd788115bfed82023"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "79cd33bf1f7b458edb46604d68916b225b43b3b1c4cb8a0dbabd6a7993c772ef"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "4b97bec0875dec61069b83aa38a9865fde2803f748c8e252cf3ba41963abc83b"
    sha256 cellar: :any_skip_relocation, sonoma:        "65fc7f52733a570e5947cf8f8655bbce2d227eb763f0020b93feefb289ea8b81"
    sha256 cellar: :any_skip_relocation, ventura:       "5f406d21e9292256470eca1a66b67c9c4b7f2395174bfbb84ef6d0ab67f4648c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8d7b7078db1c5b0df941448875c1b4fcd4d0b5325ebfbed9ffc71facfbdd8088"
  end

  depends_on "node@22"

  uses_from_macos "git", since: :monterey

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"renovate", "--platform=local", "--enabled=false"
  end
end
