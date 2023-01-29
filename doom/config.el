;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;(setq doom-font (font-spec :family "InconsolataGo Nerd Font" :size 16 :weight 'semi-light)
(setq doom-font (font-spec :family "InconsolataGo Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "InconsolataGo Nerd Font" :size 17)
      doom-big-font (font-spec :family "InconsolataGo Nerd Font" :size 20))
;;

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-1337)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

(setq org-support-shift-select t)

(setq x-select-enable-clipboard t)

;;(after! org
;;  (setq org-bullets-mode t))


;; Impostazione CTRL-C e CTRL-V per copiare e incollare e altre amenità con i comandi seguenti
;; CUA-MODE BEGIN
;;(cua-mode t)
;;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;;(transient-mark-mode 1) ;; No region when it is not highlighted
;;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
;; CUA-MODE END


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;; (add-to-list 'load-path "/gpf/home/.doom.d")


;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;;(package-refresh-contents)
;;(package-initialize)
(global-set-key (kbd "<mouse-3>") 'clipboard-yank)
;;(define-key current-global-map (kbd "M-<up>") 'drag-stuff-up)
(after! org
  (setq
;; Sembra che siano ammessi solo singoli caratteri e non sequenze
;;    org-superstar-headline-bullets-list '("○" "○○" "○○○" "○○○◉" "○○○◉◉" "○○○◉◉◉")
    org-superstar-headline-bullets-list '("▷" "○" "◉")
    ))
;; ("▷" "⁖" "◉" "○" "✸" "✿")
;; (after! org
;;   (setq
;;     org-bullets-mode 1
;; ))
(custom-set-faces
  ;;'(org-level-1 ((t (:family "Fira Code" :inherit outline-1 :height 2.2))))
  '(org-level-1 ((t (:inherit outline-1 :height 1.7 :foreground "#FF5E5E"))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.6 :foreground "blue"))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.5 :foreground "yellow"))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.4 :foreground "orange"))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.3 :foreground "cyan"))))
  '(org-level-6 ((t (:inherit outline-5 :height 1.2 :foreground "purple"))))
)
;; With the following lines when an org file is saved even tangled blocks of source code are saved
(add-hook 'org-mode-hook
          (lambda () (add-hook 'after-save-hook #'org-babel-tangle
                          :append :local)))
(use-package emojify
  :hook (after-init . global-emojify-mode))
;; Use SPC TAB TAB to comment/uncomment lines
(map! :leader
      :desc "Comment or uncomment lines"      "TAB TAB" #'comment-line
      )
(setq minimap-window-location 'right)
;; Use SPC t m to toggle minimap
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "m" #'minimap-mode))
(minimap-mode t)
(command-log-mode t)
;; (clm/open-command-log-buffer)
