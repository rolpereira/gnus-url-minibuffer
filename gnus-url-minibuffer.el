;;; gnus-url-minibuffer.el --- Show urls in a Gnus article in the minibuffer  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Rolando Pereira

;; Author: Rolando Pereira <rolando_pereira@sapo.pt>
;; Keywords: gnus, minibuffer, eldoc

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Display in the minibuffer the URL a link points to when inside a
;; Gnus article buffer.
;;
;; To install put this file somewhere in your load-path and add the
;; following lines to your .emacs:
;;
;;     (require 'gnus-url-minibuffer)
;;     (add-hook 'gnus-article-mode-hook 'gnus-url-minibuffer)
;;     


;;; Code:

(require 'gnus)
(require 'eldoc)



;;;###autoload
(defun gnus-url-minibuffer (&optional arg)
  "Display in the minibuffer the url of the link at point.

ARG is passed to function `eldoc-mode'."
  (interactive (list (or current-prefix-arg 'toggle)))
  (set (make-local-variable 'eldoc-documentation-function)
       '(lambda ()
          (let ((url-at-point (get-text-property (point) 'shr-url)))
            (when url-at-point
              (print url-at-point)))))
  (eldoc-mode arg))

;; It's a shame we can't use something similar to `define-derived-mode'
;; do define minor-modes :(

(provide 'gnus-url-minibuffer)
;;; gnus-url-minibuffer.el ends here
