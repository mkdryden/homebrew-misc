class Namei < Formula
  desc "Tool to find terminal points in paths."
  homepage "http://namei.sourceforge.net"
  url "https://sourceforge.net/projects/namei/files/namei/Beta%201.0/namei.tgz"
  version "1.0"
  sha256 "7b0c661b97e0e62e648ec634eff74653734eb6355c6af7c3592387328bff6f56"

  patch :DATA # Removes include not present on OS X

  def install
    system "make", "stat"
    bin.install "namei"
  end

  test do
    system "#{bin}/namei", "."
  end
end

__END__
diff --git a/stat.c b/stat.c
index 37a49e2..b17e48f 100644
--- a/stat.c
+++ b/stat.c
@@ -32,7 +32,6 @@
 #include <strings.h>
 #include "getopt.h"
 #define _KERNEL
-#include <sys/sysmacros.h>
 
 #ifndef INDENT
 
