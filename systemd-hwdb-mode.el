;;; systemd-hwdb-mode.el --- Major mode for systemd hwdb file -*- lexical-binding: t -*-

;; Copyright (C) 2024 Guido Günther

;; Author: Guido Günther <agx@sigxcu.org>
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4"))
;; Keywords: tools, unix
;; Homepage: https://github.com/agx/systemd-hwdb-mode

;; This file is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Major mode for editing systemd hwdb files.

;;; Code:

(defvar systemd-hwdb-mode-font-lock-keywords
  '(
    ; The match pattern
    ("^[[:alnum:]]+:.*$" . font-lock-function-name-face)
    ; The key-value pairs
    ("^ \\([^=\s]+\\)=\\([[:print:]]+\\)" (1 font-lock-variable-name-face) (2 font-lock-string-face))
    ("^#.*$" . font-lock-comment-face))
  "Keyword highlighting for systemd hwdb files.")

(defvar systemd-hwdb-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; Comments

    ;; * and ? are allowed in matches
    (modify-syntax-entry ?*  "_" table)
    (modify-syntax-entry ??  "_" table)
    (modify-syntax-entry ?_  "w" table)

    table))

(define-derived-mode systemd-hwdb-mode prog-mode "Systemd hwdb"
  "Major mode for editing systemd hwdb files"
  :group 'systemd-hwdb-mode
  :syntax-table systemd-hwdb-mode-syntax-table

  ;; Fonts
  (set (make-local-variable 'font-lock-defaults) '(systemd-hwdb-mode-font-lock-keywords nil nil nil nil))
  (set (make-local-variable 'comment-start) "#")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'comment-multi-line) nil))

(add-to-list 'auto-mode-alist '("\\.hwdb\\'" . systemd-hwdb-mode))

(provide 'systemd-hwdb-mode)

;;; systemd-hwdb-mode.el ends here
