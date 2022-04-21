(define-module (oidn)
  #:use-module (guix packages)
  ;; #:use-module (gnu packages base)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages cmake)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:))

(define-public oidn
  (package
   (name "oidn")
   (version "1.4.3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/OpenImageDenoise/oidn.git")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "14zga8xd7pxwhp50n36n0c8j12vdn92i90wf6nz868nlqvlpyakk"))))
   (build-system cmake-build-system)
   (inputs
    (list cmake gcc python tbb))
   (home-page "https://www.openimagedenoise.org/")
   (synopsis "A denoiser")
   (description
    "open source library of high-performance, high-quality denoising filters for images rendered with ray tracing.")
   (license license:asl2.0)))
