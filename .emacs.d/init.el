;; If not explicitly defined otherwise, use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq inhibit-startup-message t)
(menu-bar-mode 0)

;; function to set tab-stops http://www.emacswiki.org/emacs/TabStopList
(defun set-tab-stop-width (width)
  "Set all tab stops to WIDTH in current buffer.

    This updates b-stop-list', but not b-width'.

    By default, ndent-for-tab-command' uses tabs to indent, see
    ndent-tabs-mode'."
  (interactive "nTab width: ")
  (let* ((max-col (car (last tab-stop-list)))
         ;; If width is not a factor of max-col,
         ;; then max-col could be reduced with each call.
         (n-tab-stops (/ max-col width)))
    (set (make-local-variable 'tab-stop-list)
         (mapcar (lambda (x) (* width x))
                 (number-sequence 1 n-tab-stops)))
    ;; So preserve max-col, by adding to end.
    (unless (zerop (% max-col width))
      (setcdr (last tab-stop-list)
                  (list max-col)))))

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;python
(add-hook 'python-mode-hook
  (lambda ()
    (setq tab-width 4)
))

;; C/C++

(setq c-default-style "k&r"
      c-basic-offset 4)

(add-hook 'c++-mode-hook
  (lambda ()
    (setq tab-width 4)
))

;; assembly
(add-hook 'asm-mode-hook
  (lambda ()
    (set-tab-stop-width 4)
))

;; elisp
(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq tab-width 2)
))

