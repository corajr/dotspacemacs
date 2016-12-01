;;; packages.el --- org-journal layer packages file for Spacemacs.
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
;; added to `org-journal-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-journal/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-journal/pre-init-PACKAGE' and/or
;;   `org-journal/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-journal-packages
  '(org
    org-journal)
  "The list of Lisp packages required by the org-journal layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun org-journal/post-init-org ()
  (unless (boundp 'org-modules)
    (setq org-modules nil))
  (add-to-list 'org-modules 'org-crypt)
  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.
  (setq org-crypt-key "E512368D")
  )

(defun org-journal/init-org-journal ()
  (use-package org-journal
    :defer t
    :commands org-journal-new-entry
    :init
    (require 'org-crypt)
    (unless (boundp 'org-crypt-tag-matcher)
      (error "org-crypt-tag-matcher must be defined"))
    (unless (boundp 'org-complex-heading-regexp)
      (error "org-complex-heading-regexp must be defined"))
    (evil-leader/set-key
      "jj" 'org-journal-new-entry)
    (evil-leader/set-key-for-mode 'org-journal-mode
      "mn" 'org-journal-open-next-entry
      "mp" 'org-journal-open-previous-entry)
    (setq org-journal-dir "~/Dropbox/misc/journal"
          org-journal-file-format "%Y%m%d.org"
          org-journal-enable-encryption t)
    (add-to-list 'org-agenda-files org-journal-dir)
    (add-hook 'org-journal-mode-hook 'turn-on-auto-fill)
    (add-hook 'org-journal-mode-hook 'flyspell-mode)
    )
  )


;;; packages.el ends here
