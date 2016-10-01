(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(display-time-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(display-time-24hr-format t)
 '(global-linum-mode t)
 '(package-selected-packages (quote (magit minimap key-chord evil avy smart-compile))))
;; '(display-time-day-and-date t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default))))))
(display-battery-mode 1)
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)		       

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
