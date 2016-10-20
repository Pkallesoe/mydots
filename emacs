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


;; Org-mode
(global-set-key "<F12>" 'org-agenda)
(global-set-key "<F9>" 'calendar)
-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/increase-gc-threshold)
(sensible-defaults/show-matching-parens)
(sensible-defaults/backup-to-temp-directory)
(sensible-defaults/delete-trailing-whitespace)
(sensible-defaults/treat-camelcase-as-separate-words)
(sensible-defaults/automatically-follow-symlinks)
(sensible-defaults/make-scripts-executable)
(sensible-defaults/offer-to-create-parent-directories-on-save)
(sensible-defaults/confirm-closing-emacs)
(sensible-defaults/make-dired-file-sizes-human-readable)
(sensible-defaults/shorten-yes-or-no)
(sensible-defaults/refresh-buffers-when-files-change)
(sensible-defaults/set-default-line-length-to 80)
;; Keybindings
;; M-; comment/uncomment region.
(sensible-defaults/bind-commenting-and-uncommenting)

;; C-+ C-- to increase/decrease font size.
(sensible-defaults/bind-keys-to-change-text-size)

