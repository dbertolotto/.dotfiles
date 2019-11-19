;; init.el --- Emacs configuration


;; PROXY
;; --------------------------------------

;; use this if you are behind a proxy
;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\|127.*\\)")
;; 	("http" . "server:port")
;; 	("https" . "server:port")))


;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(material-theme ; nice color theme
    smex ; ;M-x enhancer
    magit ; git support
    yaml-mode ; yaml support
    markdown-mode ; markdown support
    matlab-mode ; matlab support
    neotree ; tree browser
    ;;projectile ; projects management
    auctex ; latex support
    ;; python support
    ein
    elpy ; python IDE
    flycheck
    py-autopep8
    ;; javascript
    js2-mode ; better javascript
    js2-refactor ; js refactoring
    xref-js2 ; js cross-references
    company-tern ; js autocompletion
    ;; clojure
    clojure-mode
    cider
    ;; generic lisp
    paredit
    rainbow-delimiters
    ))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      my-packages)


;; PATHS
;; --------------------------------------

;; temporary directory
(defvar my-emacs-temp-dir "~/.emacs.d/temp")
(unless (file-exists-p my-emacs-temp-dir)
  (make-directory my-emacs-temp-dir :parents))

;; define paths for programs
(defvar my-exec-path
  (cond
   ((or (equal system-type 'ms-dos)
        (equal system-type 'windows-nt))
    (cond
     ((string-equal (system-name) "DESKTOP-FUJ3JKA")
      (list
       ;; git
       "c:/programs/git/bin"
       ;; texlive
       "c:/programs/texlive/2015/bin/win32"
       ;; MinGW
       "c:/programs/MinGW/bin"
       "c:/programs/MinGW/msys/1.0/bin"
       ;; python (note that whitespaces in the path screw up the emacs mode)
       "d:/Programs/Miniconda3"
       "d:/Programs/Miniconda3/Scripts"
       "d:/Programs/Miniconda3/Library/bin"
       ))))
   ((equal system-type 'gnu/linux)
    (cond
     ((string-equal (system-name) "ThinkPad-X301")
      (list
       ;; user home bin folder
       "/home/davide/bin"
       ))))
   ))

;; set exec path
(when my-exec-path
  (mapc (apply-partially 'add-to-list 'exec-path)
        (mapcar 'expand-file-name my-exec-path)))

;; sync path and exec-path
(setenv "PATH" (mapconcat 'identity exec-path (cond ((or (equal system-type 'ms-dos)
                                                         (equal system-type 'windows-nt)) ";")
                                                    ((equal system-type 'gnu/linux) ":"))))


;; BASIC CUSTOMIZATION
;; --------------------------------------

;; load custom theme
(load-theme 'material t)

;; hide the startup message
(setq inhibit-startup-message t)

;; no tabs
(setq-default indent-tabs-mode nil)

;; remove trailing whitespaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; show menu bar
(menu-bar-mode 1)

;; no toolbar
(tool-bar-mode -1)

;; no scroll bars
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; enable line numbers globally
(global-linum-mode 1)

;; changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; enable disabled commands
(setq disabled-command-function nil)

;; date/time display
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode t)

;; column number display
(column-number-mode t)

;; highlight selected line
(global-hl-line-mode t)

;; mouse yanks at point, to at cursor
(setq mouse-yank-at-point t)

;; require newline at end of file
(setq require-final-newline t)

;; ido mode
(require 'ido)
(ido-mode t)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; uniquify buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;; side directory tree
(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'ascii 'arrow))
(setq neo-smart-open t)
(setq neo-autorefresh t)
(setq neo-window-fixed-size nil)
(setq neo-confirm-change-root 'off-p)
(global-set-key [f8] 'neotree-toggle)

;; show matching parentheses
(show-paren-mode t)

;; company - autocomplete framework
(add-hook 'after-init-hook 'global-company-mode)

;; desktop save between sessions
(desktop-save-mode 1) ; activate mode
(setq desktop-save t) ; always save
(setq desktop-path `(,my-emacs-temp-dir)) ; set save folder name
(setq desktop-dirname my-emacs-temp-dir) ; set save folder name
(setq desktop-base-file-name "emacs-desktop") ; set save file name
(setq auto-save-list-file-prefix (concat my-emacs-temp-dir "/auto-save-list/.saves-"))

;; ediff tweaks
(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally
      ediff-forward-word-function 'forward-char)


;; SMEX
;; --------------------------------------

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; PYTHON
;; --------------------------------------
;; for everything to work fine, do a:
;;   conda install jedi flake8 pep8 autopep8 yapf
;; in your python environment`

(elpy-enable)

;; environments
(setenv "WORKON_HOME" "d:/Programs/Miniconda3/envs")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


;; JAVASCRIPT
;; --------------------------------------

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;; add refactoring and cross-references
(require 'js2-refactor)
(require 'xref-js2)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; use tern for autocompletion (npm install -g tern)
(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook
	  (lambda ()
	    (tern-mode)
	    (company-mode)))

;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)


;; AUCTeX
;; --------------------------------------
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-PDF-mode t)))
(setq reftex-plug-into-AUCTeX t)


;; PROJECTS
;; --------------------------------------

;; (require 'projectile)
;; (setq projectile-switch-project-action 'neotree-projectile-action)


;; Clojure
;; --------------------------------------

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))


;; --------------------------------------

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-django-command "manage.py")
 '(elpy-test-django-runner-manage-command (quote ("manage.py" "test")))
 '(elpy-test-django-with-manage t)
 '(package-selected-packages
   (quote
    (company-tern xref-js2 js2-refactor py-autopep8 flycheck elpy ein auctex neotree matlab-mode markdown-mode yaml-mode magit smex material-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
