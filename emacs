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

(add-hook 'doc-view-mode-hook
  (lambda ()
    (linum-mode -1)
  ))
;; Highlight current line
(hl-line-mode 1)

(global-set-key (kbd "C-x g") 'magit-status)
(require 'evil-magit)

;;Eclim
(require 'eclim)
(global-eclim-mode 1)
(require 'eclimd)

(require 'company)
(require 'company-emacs-eclim)
(setq company-dabbrev-downcase nil) ;; Make company work nicely with caseSensitive words.
(company-emacs-eclim-setup)
(global-company-mode t)

(custom-set-variables
  '(eclim-executable "~/.eclipse/org.eclipse.platform_4.6.1_155965261_linux_gtk_x86_64/eclim"))
