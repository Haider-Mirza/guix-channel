(define-module (btop)
  #:use-module (guix packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module ((guix licenses) #:prefix license:))

(define-public btop
  (package
   (name "btop")
   (version "1.2.5")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/aristocratos/btop.git")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1v0lj296bzwgs29hv9z3r82fwmibiqgsvsqqh2fimxs0jmld7c2v"))))
   (build-system gnu-build-system)
   (native-inputs
    (list sed gcc-11))
   (arguments
    '(#:make-flags (list (string-append "PREFIX=" %output))
      #:tests? #f
      #:phases (modify-phases %standard-phases (delete 'configure))))
   (home-page "https://github.com/aristocratos/btop")
   (synopsis "Linux/FreeBSD resource monitor")
   (description
    "Resource monitor that shows usage and stats for processor, memory, disks, network and processes.")
   (license license:asl2.0)))

btop
