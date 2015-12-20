(defvar coq-packages
  '(
    company-coq
    ))

(defun coq/init-company-coq ()
  (use-package company-coq
    :defer t
    :config
    (add-hook 'coq-mode-hook #'company-coq-initialize)))
