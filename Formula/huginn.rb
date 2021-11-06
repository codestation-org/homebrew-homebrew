class Huginn < Formula
	desc "`huginn` A programming language with no quirks, so simple every child can master it."
	homepage "https://huginn.org/"
	license "CC-BY-NC-ND-4.0"
	url "/Users/amok/var/bb-slave/huginn/_deploy/darwin/../..", :using => :git
	version "0.0.6-2111061505"

  bottle do
    root_url "https://codestation.org/darwin/"
    sha256 big_sur: "0299a9affe7334cfaf9c2a4e4ffa5896d961e6a1c7c682ad8ee0da4d30fb9f92"
  end

	depends_on "yaal"
	depends_on "pkg-config"  => :build
	depends_on "autoconf"    => :build
	depends_on "automake"    => :build
	depends_on "libtool"     => :build
	depends_on "asciidoctor" => :build
	depends_on "make"        => :build
	depends_on "replxx"      => :build
	depends_on "ccache"      => :build
	depends_on "coreutils"   => :build # for tests
	depends_on "bash"        => :build # for tests
	depends_on "grc"         => :recommended
	depends_on "tmux"        => :recommended
	depends_on "fzf"         => :recommended
	depends_on "fd"          => :recommended
	depends_on "bat"         => :recommended
	depends_on "pv"          => :recommended
	depends_on "htop"        => :recommended
	depends_on "pinfo"       => :recommended
	depends_on "rlwrap"      => :recommended

	def install
		ENV.deparallelize
		system "./setup.sh"
		system "make", "PREFIX=#{prefix}", "release", "doc", "install-release"
		system "env", "HUGINNPATH=./packages", "./build/release/huginn/1exec", "Testing", "tests"
		system "env", "TARGET=release", "./tests/shell-tests.sh"
	end
end
