
(defun clear-shell (&rest junk)
  "Clear the eshell buffer"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(global-set-key "\C-x\C-l" 'clear-shell)
