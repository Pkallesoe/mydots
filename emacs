(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;; packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require 'smart-compile)
(add-to-list 'smart-compile-alist
	     '("\\.c$" . "gcc -O2 -Wall -o %n %f")
	     '("\\.java$" . "javac %f")
	     )
;; Avy (Ace-jump improved)
(global-set-key (kbd "C-;") 'avy-goto-char)
