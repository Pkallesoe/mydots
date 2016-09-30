(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(eval-when-compile (require 'cl))
(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize)

(require 'evil)
(evil-mode 1)

(require 'smart-compile)
(add-to-list 'smart-compile-alist
	     '("\\.c$" . "gcc -O2 -Wall -o %n %f")
	     '("\\.java$" . "javac %f")
	     )
;; Avy (Ace-jump improved)
(global-set-key (kbd "C-;") 'avy-goto-char)

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
    (lambda ()
      (let ((color (cond ((minibufferp) default-color)
                         ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                         ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                         ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                         (t default-color))))
        (set-face-background 'mode-line (car color))
        (set-face-foreground 'mode-line (cdr color))))))

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
