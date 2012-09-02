(require 'whitespace)

(add-hook 'ruby-mode-hook 'whitespace-mode)
;;(add-hook 'ruby-mode-hook  (add-hook 'evil-insert-state-exit-hook 'ruby-indent-line))

(eval-after-load 'ruby-mode
  '(progn
     (require 'whitespace)
     (add-hook 'ruby-mode-hook 'whitespace-mode)
     (define-key ruby-mode-map "{" 'paredit-open-curly)
     (define-key ruby-mode-map "}" 'paredit-close-curly)
     (add-hook 'ruby-mode-hook 'esk-paredit-nonlisp)))
