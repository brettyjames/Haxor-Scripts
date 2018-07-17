;; Author: James
;; Title: Apex
;; Version: 0.0.1
;; Description: No suckage here.

;; --------- ;;
;; Packages: ;;
;; --------- ;;
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	;("marmalade" . "http://marmalade-repo.org/packages/") ;; Fuck you SSL
        ("melpa" . "http://melpa.milkbox.net/packages/")))

;; ------------- ;;
;; Dependancies: ;;
;; ------------- ;;
(require 'dashboard)
(require 'doom-themes)
(require 'neotree)
(require 'all-the-icons)
(add-to-list 'load-path "~/.emacs.d/neotree/")
(load "~/.emacs.d/kerneldev.el")

;; ------- ;;
;; X-Mode: ;;
;; ------- ;;
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(when (display-graphic-p)
  (tool-bar-mode -1)      ; Disable toolbar
  (toggle-scroll-bar -1)) ; Disable scroll bar
(setq default-frame-alist ; Set default window size
      '((top . 10)
	(left . 50)
	(width . 160)
	(height . 48)))

;; Emacs settings:
;;(dashboard-setup-startup-hook) ; Display dashboard
(setq make-backup-files nil)   ; No more .*~ files
(setq auto-save-default nil)   ; No more #autosave# files
(setq tab-width 8)             ; Change tab width to 8 characters
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(menu-bar-mode -1) ; Disable menu bar

;; --------------;;
;; Key Bindings: ;;
;; --------------;;
(global-set-key (kbd "C-x") nil)                           ; Paranoia
(global-set-key (kbd "C-a") nil)                           ; Paranoia
(global-set-key "\C-a" ctl-x-map)                          ; Remap C-x to C-a
(global-set-key (kbd "C-a s") 'save-buffer)                ; Save
(global-set-key (kbd "C-a x") 'save-buffers-kill-terminal) ; Quit 
(global-set-key (kbd "C-a t") 'neotree-toggle)             ; Toggle Project Tree

;; ----------- ;;
;; Appearence: ;;
;; ----------- ;;

;; DOOM
(load-theme 'doom-dracula t)
(setq doom-themes-enable-bold t
      doom-themes-enable-italics t)
(doom-themes-visual-bell-config)
(doom-themes-neotree-config)	
(doom-themes-org-config)

;; Neotree
(setq neo-window-fixed-size nil)
(defun neotree-resize-window (&rest _args)
  (interactive)
  (neo-buffer--with-resizable-window
   (let ((fit-window-to-buffer-horizontally t))
     (fit-window-to-buffer))))

(add-hook 'neo-change-root-hook #'neotree-resize-window)
(add-hook 'neo-enter-hook #'neotree-resize-window)

;; Dashboard
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "A great day to rule the world.")
(setq dashboard-startup-banner 'official)
;;(setq dashboard-items '((recents . 5)
;;			(agenda . 5)
;;			(projects . 5)))

;; --------------------------------------------------------------- ;;

