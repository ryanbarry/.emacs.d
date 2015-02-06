;; marmalade - http://marmalade-repo.org/
;; melpa - http://melpa.milkbox.net/
(require 'package)
(package-initialize)

;; (load-file "~/projects/espotify/demo.el")

;; use solarized theme
(load-theme 'solarized-dark t)

;; save sessions
(desktop-save-mode 1)

;; from https://github.com/purcell/emacs.d/blob/master/lisp/init-sessions.el
(setq desktop-globals-to-save
      (append '(desktop-missing-file-warning
                (dired-regexp-history . 20)
                (extended-command-history . 30)
                (face-name-history . 20)
                (file-name-history . 100)
                (grep-find-history . 30)
                (grep-history . 30)
                (ido-buffer-history . 100)
                (ido-last-directory-list . 100)
                (ido-work-directory-list . 100)
                (ido-work-file-list . 100)
                (magit-read-rev-history . 50)
                (minibuffer-history . 50)
                (org-clock-history . 50)
                (org-refile-history . 50)
                (org-tags-history . 50)
                (query-replace-history . 60)
                (read-expression-history . 60)
                (regexp-history . 60)
                (regexp-search-ring . 20)
                register-alist
                (search-ring . 20)
                (shell-command-history . 50)
                tags-file-name
                tags-table-list)))

;; turn off toolbar
(tool-bar-mode -1)

;; turn off scrollbars
(scroll-bar-mode -1)

;; don't blink the cursor (by keeping this commented)
;;(blink-cursor-mode t)

;; visual bell > OS X's funk sound
(setq visible-bell t)

;; don't rm files
(setq delete-by-moving-to-trash t)

;; turn on ido-mode by default
(ido-mode t)

;; winner mode enable
;; this is a global minor mode for undo/redo on window adjustments
(winner-mode 1)

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "~/android-sdk")
 '(background-color "#042028")
 '(background-mode dark)
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.saves"))))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-default-style
   (quote
    ((c-mode . "k&r")
     (c++-mode . "k&r")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(cursor-color "#708183")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(foreground-color "#708183")
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(magit-diff-use-overlays nil)
 '(magit-git-executable "/usr/local/bin/git")
 '(magit-use-overlays nil)
 '(package-archive-enable-alist (quote (("gnu") ("melpa") ("marmalade" scad-mode))))
 '(package-archives
   (quote
    (("melpa" . "http://melpa.milkbox.net/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(tramp-default-method "ssh"))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region) ;; remap since C-w was formerly kill-region

(global-set-key (kbd "C-c p s") 'espotify)
(global-set-key (kbd "C-c p p") 'espotify-playpause)
(global-set-key (kbd "C-c p t") 'espotify-current-track)
(global-set-key (kbd "C-c p f") 'espotify-next-track)
(global-set-key (kbd "C-c p b") 'espotify-previous-track)

;; use ibuffer instead of list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; use switch-window instead of other-window
(global-set-key (kbd "C-x o") 'switch-window)

(defun coffee-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("CoffeeScript" "Lo-Dash")))

(add-hook 'coffee-mode-hook 'coffee-doc)

(put 'dired-find-alternate-file 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;(setq inferior-lisp-program "/usr/local/bin/clisp")

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    ;; use spaces, not tabs
	    (setq indent-tabs-mode nil)))
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-strucutural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
(setq common-lisp-hyperspec-root "file:/Users/rbarry/.emacs.d/hyperspec/HyperSpec/")

;; tramp stuff
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
(require 'tramp)
(defun sudo-edit-current-file ()
  (interactive)
  (let ((position (point)))
    (find-alternate-file
     (if (file-remote-p (buffer-file-name))
         (let ((vec (tramp-dissect-file-name (buffer-file-name))))
           (tramp-make-tramp-file-name
            "sudo"
            (tramp-file-name-user vec)
            (tramp-file-name-host vec)
            (tramp-file-name-localname vec)))
       (concat "/sudo:root@localhost:" (buffer-file-name))))
    (goto-char position)))
