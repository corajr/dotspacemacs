;;; packages.el --- php-dev Layer packages File for Spacemacs
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
(setq php-dev-packages
    '(
      php-mode
      web-mode
      flycheck
      ))

;; List of packages to exclude.
(setq php-dev-excluded-packages '())


;; For each package, define a function php-dev/init-<package-name>
;;
;; (defun php-dev/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun php-dev/init-web-mode ()
  (use-package web-mode
    :defer t
    :mode
    (("\\.php\\'" . web-mode))
    ))

(defun php-dev/init-flycheck ()
  (use-package flycheck
    :defer t
    :config
    (progn
      (flycheck-mode 1)
      (flycheck-add-mode 'php 'web-mode))))
