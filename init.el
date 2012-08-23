
;; ELPA
(require 'package)
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings
                      starter-kit-eshell starter-kit-js starter-kit-ruby
                      ruby-mode inf-ruby zenburn-theme markdown-mode
                      yaml-mode json erlang coffee-mode rspec-mode haskell-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
