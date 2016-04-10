(require 'package) 
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Package list
(defvar required-packages
  '(slime ;; Slime - IDE для Common Lisp, интегрированная с Emacs
    projectile ;; Удобный менеджер проектов
    auto-complete)) ;; Автодополнение

;; Require Common Lisp extensions
(require 'cl)

;; Функция реализет проверку факта установки перечисленных выше пакетов:
;; slime, projectile, auto-complete
(defun packages-installed-p ()
    "Packages availability checking."
    (interactive)
    (loop for package in required-packages
          unless (package-installed-p package)
            do (return nil)
          finally (return t)))

;; Автоматическая установка пакетов slime, projectile, auto-complete
;; при первом запуске Emacss
;; Auto-install packages
(unless (packages-installed-p)
    (message "%s" "Emacs is now refreshing it's package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (dolist (package required-packages)
        (unless (package-installed-p package)
            (package-install package))))

(when (packages-installed-p)

    ;; Auto-complete
    (require 'auto-complete)
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-auto-start        t)
    (setq ac-auto-show-manu    t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'lisp-mode)

    ;; SLIME
    (require 'slime)
    (require 'slime-autoloads)
    (setq slime-net-coding-system 'utf-8-unix)
    (slime-setup '(slime-fancy slime-asdf slime-indentation))
    (setq inferior-lisp-program "sbcl")
    (add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")

    ;; Projectile
    (require 'projectile)
    (projectile-global-mode))

(setq-default lisp-body-indent 4)
(setq lisp-indent-function 'common-lisp-indent-function)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-nick "sizaxyd"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
