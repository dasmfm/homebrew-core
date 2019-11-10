require "language/node"

class Jhipster < Formula
  desc "Generate, develop and deploy Spring Boot + Angular/React applications"
  homepage "https://www.jhipster.tech/"
  url "https://registry.npmjs.org/generator-jhipster/-/generator-jhipster-6.5.0.tgz"
  sha256 "5e1369e41c841ba66a24294e89d20962021b53c790f9d13125757ab6d3b94068"

  bottle do
    cellar :any_skip_relocation
    sha256 "7104971d2f73cdc26ae1ebfb4b27d69fcb1ba1759040b2c2371ff27599174e95" => :catalina
    sha256 "14138471da34ba66e090b5276ccb70d5456ad50a4d3f63def1bc3f45183a8bb0" => :mojave
    sha256 "279981d0114b2978d5c72b760864aebbc81ba85105abcaa8fd235d87fbc86d78" => :high_sierra
  end

  depends_on :java => "1.8+"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "execution is complete", shell_output("#{bin}/jhipster info")
  end
end
