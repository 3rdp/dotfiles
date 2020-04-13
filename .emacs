(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/wellbeing.org" "~/org/work.org" "~/org/health.org" "~/org/hobby-programming.org" "~/org/gaming.org" "~/org/hobby.org")))
 '(package-selected-packages
   (quote
    (evil-org evil-collection pomidor evil-tabs chocolate-theme use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(add-to-list 'org-modules (quote org-habit))
(setq org-habit-show-habits-only-for-today nil)
(setq org-habit-preceding-days 10)
;; (setq org-agenda-files '("~/org"))
;; (setq org-agenda-files (directory-files-recursively "~/org/" "\.org$"))
;; the above lines from stackoverflow make little sense since
;; custom-set-variables already does this

(use-package chocolate-theme
  :ensure t
  :config
  (load-theme 'chocolate t))

(use-package evil-tabs
  :ensure t
  :config
  (load-theme 'chocolate t))
(global-evil-tabs-mode t)
;; some alternatives https://www.reddit.com/r/emacs/comments/4kflrk/evil_tabbar_rearranging_tabs/
;; * eyebrowse
;; * helm-mini with buffers, forget tabs and be enlightened

;; https://www.reddit.com/r/emacs/comments/4echiv/evil_q_on_window_with_tabs_kills_whole_tab/
(evil-ex-define-cmd "q[uit]" 'evil-quit)

;; (use-package alert
;;   :ensure t)

(use-package pomidor
  :ensure t
  :bind (("<f12>" . pomidor))
  :config (setq pomidor-sound-tick nil
		pomidor-sound-tack nil)
  (defun pomidor-mute ()
    "Mute all sound button for pomidor"
    (interactive)
    (if (eq pomidor-play-sound-file nil)
	(setq pomidor-play-sound-file #'pomidor-play-sound-file-emacs)
      (setq pomidor-play-sound-file nil))
    (when (eq pomidor-play-sound-file nil)
      (alert "Sound muted."))
    (when pomidor-play-sound-file
      (alert "Sound is on.")))
  (define-key pomidor-mode-map (kbd "m") #'pomidor-mute)
  :hook (pomidor-mode . (lambda ()
                          (display-line-numbers-mode -1) ; Emacs 26.1+
                          (setq left-fringe-width 0 right-fringe-width 0)
                          (setq left-margin-width 2 right-margin-width 0)
                          ;; force fringe update
                          (set-window-buffer nil (current-buffer)))))

(setq-default fill-column 80)

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
