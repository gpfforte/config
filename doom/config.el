(setq user-full-name "Gianpietro Forte"
      user-mail-address "gpf_forte@hotmail.com")
 
(setq doom-font (font-spec :family "InconsolataGo Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "InconsolataGo Nerd Font" :size 17)
      doom-big-font (font-spec :family "InconsolataGo Nerd Font" :size 20))

(setq doom-theme 'doom-1337)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/Documents/org/")
(setq org-log-done t)
(setq org-agenda-files '("~/Documents/org/" "~/Documents/org/roam/"))
(setq org-roam-directory "~/Documents/org/roam/")

(use-package! websocket
    :after org-roam)

(setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t)

;;
(setq org-support-shift-select t)
(setq select-enable-clipboard t)
(setq org-roam-completion-everywhere t)


(after! org
  (setq org-todo-keywords
      (quote ((sequence "TODO(t)" "INPROGRESS(t)" "|" "DONE(d)" "CANCELED(c)"))))
  (setq
    org-superstar-headline-bullets-list '("✿" "○" "◉")
    ))
;; ("▷" "⁖" "◉" "○" "✸" "✿")
(custom-set-faces
  ;;'(org-level-1 ((t (:family "Fira Code" :inherit outline-1 :height 2.2))))
  '(org-level-1 ((t (:inherit outline-1 :height 1.7 :foreground "#FF5E5E"))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.6 :foreground "#54aedb"))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.5 :foreground "#bac74d"))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.4 :foreground "orange"))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.3 :foreground "#6fc74d"))))
  '(org-level-6 ((t (:inherit outline-5 :height 1.2 :foreground "#e1408f"))))
  )
(setq org-roam-db-autosync-mode t)
(setq org-roam-mode-sections
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            ;; #'org-roam-unlinked-references-section
            ))
;; With the following lines when an org file is saved even tangled blocks of source code are saved
(add-hook 'org-mode-hook
          (lambda () (add-hook 'after-save-hook #'org-babel-tangle
                          :append :local)))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;;(package-refresh-contents)
;;(package-initialize)
(global-set-key (kbd "<mouse-3>") 'clipboard-yank)
;;(define-key current-global-map (kbd "M-<up>") 'drag-stuff-up)


(use-package emojify
  :hook (after-init . global-emojify-mode))
(setq minimap-window-location 'right)

;; Use SPC TAB TAB to comment/uncomment lines
(map! :leader
      :desc "Comment or uncomment lines"      "TAB TAB" #'comment-line
      )
;; Use SPC t m to toggle minimap
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap-mode" "m" #'minimap-mode))
(minimap-mode t)
(command-log-mode t)
(rainbow-mode t)

;; (clm/open-command-log-buffer)
