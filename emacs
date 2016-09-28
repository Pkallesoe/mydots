(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'smart-compile)
(add-to-list 'smart-compile-alist
	     '("\\.c$" . "gcc -O2 -Wall -o %n %f")
	     '("\\.java$" . "javac %f")
	     )
;; Avy (Ace-jump improved)
(global-set-key (kbd "C-;") 'avy-goto-char)
