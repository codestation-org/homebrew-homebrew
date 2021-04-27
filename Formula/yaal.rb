class Yaal < Formula
	desc "`yaal` is a cross platform, general purpose C++ library."
	homepage "https://codestation.org/"
	license "CC-BY-NC-ND-4.0"
	url "/Users/amok/var/bb-slave/yaal/_deploy/darwin/../..", :using => :git
	version "0.0.44-2104270256"

  bottle do
    root_url "https://codestation.org/darwin/"
    sha256 big_sur: "2ae9c5c99f1be6db5411c7140576745c87eac12f568c4468f8ebd6331e33fe46"
  end

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
		system "make", "PREFIX=#{prefix}", "CONFIGURE=--enable-auto-sanity", "LOCALSTATEDIR=#{var}", "debug", "release"
		system "make", "doc"
		system "make", "install-debug", "install-release"
	end

	def post_install
		unless File.exist? "#{var}/lib/yaal/keys/key"
			system "#{share}/yaal/_aux/gen-keys" "#{var}/lib/yaal/keys"
		end
	end
end
