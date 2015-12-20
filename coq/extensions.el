(defvar coq-pre-extensions
  '(
    proof-general
    ))

(defun coq/init-proof-general ()
  "Initialize Proof General"
  (use-package proof-site
    :defer t
    :mode ("\\.v\\'" . coq-mode)
    :load-path
    "/usr/local/share/emacs/site-lisp/proof-general/generic"))
