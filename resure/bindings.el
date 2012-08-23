(defun resure-new-line-after-current ()
  "Insert new line after current"
  (interactive)
  (end-of-line)
  (insert "\n"))

(defun resure-new-line-before-current ()
  "Insert new line before current"
  (interactive)
  (previous-line)
  (end-of-line)
  (insert "\n"))

(defun defunkt-zap-to-char (arg char)
  "Kill up to but excluding ARG'th occurence of CHAR"
  (interactive "p\ncZap to char: ")
  (if (char-table-p translation-table-for-input)
      (setq char (or (aref translation-table-for-input char) char)))
  (kill-region (point)
               (progn
                 (search-forward (char-to-string char) nil nil arg)
                 (- (point) 1)))
  (backward-char 1))

(defun defunkt-backward-kill-line ()
  (interactive)
  (kill line 0))

(defun resure-select-buffer ()
  (interactive)
  (beginning-of-buffer)
  (set-mark (point))
  (end-of-buffer))

(global-set-key [C-return] 'resure-new-line-after-current)
(global-set-key [M-return] 'resure-new-line-before-current)
(global-set-key "\C-R" 'replace-string)
(global-set-key "\M-z" 'defunkt-zap-to-char)
(global-set-key [C-tab] 'switch-to-buffer)
(global-set-key "\C-x\C-l" 'resure-select-buffer)
