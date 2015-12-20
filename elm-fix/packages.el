;;; packages.el --- elm-fix Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq elm-fix-packages
    '(
      ;; package names go here
      elm-mode
      ))

;; List of packages to exclude.
(setq elm-fix-excluded-packages '())

;; For each package, define a function elm-fix/init-<package-name>
;;
;; (defun elm-fix/init-my-package ()
;;   "Initialize my package"
;;   )

(defun elm-fix/post-init-elm-mode ()
  (eval-after-load 'elm-mode
    '(add-hook 'elm-mode-hook (lambda ()
                             (setq default-directory (elm--find-dependency-file-path))))))


;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
