(setq auto-mode-alist (cons '("\\.ml[iylp]?\\'" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNUS MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;on charge automatiquement la autosave
(setq gnus-always-read-dribble-file t)

;;Bind de enlarge-window
(global-set-key (kbd "C-<up>") 'enlarge-window)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'shrink-window)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; append-tuareg.el - Tuareg quick installation: Append this file to .emacs.
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
  (add-to-list 'completion-ignored-extensions ext))

;;; Fin tuareg mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;on affiche le nombre de la ligne et colonnes (curseur)
(column-number-mode t)
(line-number-mode t)

(setq-default fill-column 80)
(auto-fill-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;text-mode-hook <- Autre que pour le C
;;(setq text-mode-hook
;;     '( lambda()
;;	 (setq fill-column 78)
;;	 (auto-fill-mode 1)
;;	 )
;;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;c-mode-hook <- pour le C\
(setq c-mode-hook
      '( lambda()
	 (setq c-auto-newline t)
	 (auto-fill-mode 1)
	 )
)


;;On affiche les espaces qui servent a rien
(setq-default show-trailing-whitespace 1)

;;On affiche la parenthese correspondante
(require 'paren)
(show-paren-mode 1)

;;On active la coloration syntaxique
(global-font-lock-mode t)

;; Affiche l'heure au format 24h
(display-time)
(setq display-time-24hr-format 1)

;;tab = 2 espaces
;;(setq tab-width 2)

;;identation sur 2 espaces
;;(setq standart-indent 2)

;; Don’t switch to GDB-mode buffers
(setq ido-ignore-buffers (quote ("\\‘\\*breakpoints of.*\\*\\’"
"\\‘\\*stack frames of.*\\*\\’" "\\‘\\*gud\\*\\’"
"\\‘\\*locals of.*\\*\\’" "\\‘ ")))
;; Better gdb
(setq-default gdb-many-windows t)
