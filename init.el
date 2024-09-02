
;; Initial Housekeeping Set Up

(setq inhibit-startup-message t)	; Disable the splash screen

(scroll-bar-mode -1) 			; Disable the scroll bar
(tool-bar-mode -1)			; Disable the toolbar
(tooltip-mode -1)			; Disable tooltips
(set-fringe-mode 10)			; Add fringe
(menu-bar-mode -1)			; Disable menu bar

(column-number-mode)
(global-display-line-numbers-mode t)

;; note note

;; Display Settings

(setq visible-bell t)			; Set up the visible bell

(if (display-graphic-p)
    (progn
      (load-theme 'deeper-blue))
  (progn
    (load-theme 'wombat)))

;; Initialise package sources

(require 'package)
(require 'diminish)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
      ("org" . "https://orgmode.org/elpa/")
      ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
(package-refresh-contents))

;; Initialize use-package on non-Linux platforms

(unless (package-installed-p 'use-package)
(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Packages below

;; command-log-mode - lists input in a separate buffer

(use-package command-log-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(all-the-icons counsel which-key persist exercism diminish ivy command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ivy - autocomplete module

(use-package ivy
  :diminish)
(ivy-mode 1)

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; to allow persistence

(use-package persist)

;; doom-modeline

(if (display-graphic-p)
    (use-package all-the-icons))

(if (display-graphic-p)
  (use-package doom-modeline
       :init (doom-modeline-mode 1)
       :custom ((doom-modeline-height 20))))

;; exercism - intergrate with exercism.io

(use-package exercism)

;; which-key - displays tooltips when beginning to chord a command

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; counsel - provides tooltips when executing commands
;; already installed with ivy
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)))

;; keybindings

(global-set-key (kbd "C-M-]") 'restart-emacs)
