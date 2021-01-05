class Replxx < Formula
	desc "`replxx` readline and libedit replacement that supports UTF-8, syntax highlighting, hints and Windows and is BSD licensed."
	homepage "https://github.com/AmokHuginnsson/replxx/"
	license "BSD"
	head "https://codestation.org/repo/replxx.git"

	depends_on "make" => :build
	depends_on "cmake" => :build
	depends_on "ccache" => :build

	def install
		system "./build-all.sh", "purge", "static-only", "#{prefix}"
	end

	test do
		system "make test"
	end
end
