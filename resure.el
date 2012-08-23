
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Command is Meta, Option is Command
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; C-x C-j as M-x
(global-set-key "\C-x\C-j" 'execute-extended-command)

;; Turn on shift select mode
(setq shift-select-mode t)

;; C-w as backward-kill-word
;; C-x(c) C-k as kill-region
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)


;; Rinari
(add-to-list 'load-path "~/.emacs.d/vendor/rinari")
(require 'rinari)

;; Evil mode
;; (add-to-list 'load-path "~/.emacs.d/vendor/evil")
;; (require 'evil)
;; (evil-mode 1)

;; Coffee-mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(custom-set-variables 
	'(default-frame-alist (quote(
			(tool-bar-lines . 0)
			(menu-bar-lines . 1)
                        ;; (font . "-apple-inconsolata-medium-r-normal--15-180-72-72-m-180-iso10646-1")
                        ;; (font . " -apple-Menlo-medium-normal-normal-*-15-*-*-*-m-0-iso10646-1")
                        ;; (font . "-apple-Terminus_(TTF)-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
                        ;; (font . "-apple-Anonymous_Pro-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
                        ;; (font . "-apple-Fixedsys_Excelsior_3.01-medium-normal-normal-*-16-*-*-*-p-0-iso10646-1")
                        ;; (font . "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-15-*-*-*-m-0-iso10646-1")
                        ;; (font . "-apple-Droid_Sans_Mono-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
                        (font . "-apple-DejaVu_Sans_Mono-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
)))
    '(ruby-deep-arglist nil)
    '(ruby-deep-indent-paren nil)
    '(ruby-deep-indent-paren-style nil)
    '(standard-indent 2)
    '(ns-antialias-text t))

(defvar eshell-path-env (getenv "PATH"))

(menu-bar-mode 0)


;; Org Mode Config

(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Agenda files
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/study.org"
                             "~/org/home.org"))

(setq browse-url-browser-function 'browse-default-macosx-browser)
(setq ispell-program-name "aspell")


(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'" str)
   (setq str (replace-match "" t t str))) str)

(defun env-var-from-login-shell (var)
  "Fetches a named variable from a login shell"
  (interactive "sENV variable: ")
  (let ((command-to-run (concat "$SHELL -l -c 'echo $" var "'")))
    (chomp (shell-command-to-string command-to-run))))

"Get PATH from the shell, as the OSX environment is broken and weird"
(let ((darwin-path (env-var-from-login-shell "PATH")))
  (setq exec-path (split-string darwin-path path-separator))
  (setenv "PATH" darwin-path))


;; Theme
(load-theme 'twilight)
