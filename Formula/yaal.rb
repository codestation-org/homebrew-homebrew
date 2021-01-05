class Yaal < Formula
	desc "`yaal` is a cross platform, general purpose C++ library."
	homepage "https://codestation.org/"
	license "CC-BY-NC-ND-4.0"
	url "https://codestation.org/darwin/yaal-0.0.43-2101041739.catalina.bottle.tar.gz"
	version "0.0.43-2101041739"
	sha256 "a0a45faff8bde5e85374bef9a61b27163830d6305b5b194dbef4b41bb731f830"

	depends_on "pcre"
	depends_on "libxml2"
	depends_on "libxslt"
	depends_on "openssl"
	depends_on "gettext"
	depends_on "sqlite"
	depends_on "ncurses"
	depends_on "pkg-config"  => :build
	depends_on "autoconf"    => :build
	depends_on "automake"    => :build
	depends_on "libtool"     => :build
	depends_on "asciidoctor" => :build
	depends_on "doxygen"     => :build
	depends_on "make"        => :build
	depends_on "ccache"      => :build

	def install
		ENV.deparallelize
		system "make", "PREFIX=#{prefix}", "CONFIGURE=--enable-auto-sanity", "SYSCONFDIR=#{etc}", "LOCALSTATEDIR=#{var}", "debug", "release"
		system "make", "doc"
		system "make", "install-debug", "install-release"
	end
end
