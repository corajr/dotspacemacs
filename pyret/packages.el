;;; packages.el --- pyret Layer packages File for Spacemacs
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
(setq pyret-packages
    '(
      ;; (pyret :location local)
      ))

;; List of packages to exclude.
(setq pyret-excluded-packages '())

;; For each package, define a function pyret/init-<package-name>
;;
(defun pyret/init-pyret ()
  "Initialize my package"
  ;; (use-package pyret)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package