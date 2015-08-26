;;; packages.el --- haskell-stack Layer packages File for Spacemacs
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
(setq haskell-stack-packages
      '(
        haskell-mode
        haskell-cabal-mode
        ;; package names go here
        ))

;; List of packages to exclude.
(setq haskell-stack-excluded-packages '())

(when (configuration-layer/layer-usedp 'haskell)
  (defun haskell-stack/post-init-haskell-mode ()
      (setq-default haskell-process-type 'ghci
                    haskell-process-path-ghci "stack"
                    haskell-process-args-ghci '("ghci")))
  (defun haskell-stack/post-init-haskell-cabal-mode ()
      (setq-default haskell-process-type 'ghci
                    haskell-process-path-ghci "stack"
                    haskell-process-args-ghci '("ghci"))))
