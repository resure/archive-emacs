(require 'whitespace)

(add-hook 'ruby-mode-hook 'whitespace-mode)
;;(add-hook 'ruby-mode-hook  (add-hook 'evil-insert-state-exit-hook 'ruby-indent-line))

(defun ruby-reindent-then-previous-line ()
  "Reindents the current line and then goes to prevoius line."
  (interactive "*")
  (ruby-indent-line)
  (previous-line)
  (indent-according-to-mode))

;; (define-key ruby-mode-map "\C-p" 'ruby-reindent-then-previous-line)
