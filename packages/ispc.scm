(define-module (ispc)
  #:use-module (guix packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages python)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages ncurses)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public ispc
  (package
   (name "ispc")
   (version "1.18.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/ispc/ispc.git")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0wc73km5p3kcmi0ai9n7wd0d06wk7jxqwvari29dska32r9g73vq"))))
   (build-system cmake-build-system)
    (arguments
     `(#:configure-flags
       (list (string-append "-DCURSES_CURSES_LIBRARY=" "/gnu/store/zzkly5rbfvahwqgcs7crz0ilpi7x5g5p-ncurses-6.2/"))))
    ;; ^ this is far from perfect
    (native-inputs
     (list cmake python bison flex glibc m4 git clang-toolchain ncurses llvm))
    (home-page "https://www.openimagedenoise.org/")
   (synopsis "compiler for a variant of the C programming language")
   (description
    "ispc is a compiler for a variant of the C programming language, with extensions for single program, multiple data programming.")
   (license license:bsd-3)))
