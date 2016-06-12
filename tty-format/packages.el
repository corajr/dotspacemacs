;;; packages.el --- tty-format layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Cora Johnson-Roberson <corajr@mono.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `tty-format-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `tty-format/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `tty-format/pre-init-PACKAGE' and/or
;;   `tty-format/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst tty-format-packages
  '((tty-format :location local)
    ansi-color)
  "The list of Lisp packages required by the tty-format layer.")

(defun tty-format/init-tty-format ()
  (use-package tty-format
    :config
    (defun display-ansi-colors ()
      (interactive)
      (format-decode-buffer 'ansi-colors))
    (add-hook 'find-file-hooks 'tty-format-guess)
    :mode
    (("\\.log\\'" . display-ansi-colors))
    ))

(defun tty-format/init-ansi-color ()
  (use-package ansi-color
    :config
    (defun my-colorize-compilation-buffer ()
      (when (eq major-mode 'compilation-mode)
        (ansi-color-apply-on-region compilation-filter-start (point-max))))
    (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer)))




;;; packages.el ends here
