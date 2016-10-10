;;; packages.el --- evil-multiedit layer packages file for Spacemacs.
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
;; added to `evil-multiedit-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `evil-multiedit/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `evil-multiedit/pre-init-PACKAGE' and/or
;;   `evil-multiedit/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst evil-multiedit-packages
  '(evil-multiedit)
  "The list of Lisp packages required by the evil-multiedit layer.

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


(defun evil-multiedit/init-evil-multiedit ()
  (use-package evil-multiedit
    :bind (:map evil-normal-state-map
             ("M-d" . evil-multiedit-match-and-next)
             ("M-D" . evil-multiedit-match-and-prev)
           :map evil-visual-state-map
             ("M-d" . evil-multiedit-match-and-next)
             ("M-D" . evil-multiedit-match-and-prev)
             ("R" . evil-multiedit-match-all)
             ("C-M-D" . evil-multedit-restore)
           :map evil-multiedit-state-map
             ("C-n" . evil-multiedit-next)
             ("C-p" . evil-multiedit-prev)
             ("RET" . evil-multiedit-toggle-or-restrict-region)
           :map evil-multiedit-insert-state-map
             ("C-n" . evil-multiedit-next)
             ("C-p" . evil-multiedit-prev)
            )
    ))

;;; packages.el ends here
