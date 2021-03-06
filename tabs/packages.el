;;; packages.el --- tabs Layer packages File for Spacemacs
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
(setq tabs-packages
    '(
      smart-tabs-mode
      guess-style
      ))

;; List of packages to exclude.
(setq tabs-excluded-packages '())

(defun tabs/init-smart-tabs-mode ()
  (use-package smart-tabs-mode
    :config
    (smart-tabs-insinuate 'javascript)
    (add-hook 'js-mode-hook
              (lambda () (setq indent-tabs-mode t)))))

(defun tabs/init-guess-style ()
  (use-package guess-style
    :config
    (autoload 'guess-style-set-variable "guess-style" nil t)
    (autoload 'guess-style-guess-variable "guess-style")
    (autoload 'guess-style-guess-all "guess-style" nil t)
    (add-hook 'css-mode-hook 'guess-style-guess-all)))
