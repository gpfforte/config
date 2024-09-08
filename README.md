# Descrizione
## Premessa
Questo repository contiene i file delle mie configurazioni, è decisamente
migliorata la gestione dopo avere scoperto stow, una utility per generare
symlinks. La cosa molto furba è che si può scegliere di che cosa generare
i symlink strutturando nel modo opportuno la directory.
## Struttura
### File in $HOME
La struttura in questo caso prevede che sotto config ci sia una serie di sub directory.
Il comando *stow* viene lanciato dentro la directory config e se ad esempio sotto config è presente la directory zsh con all'interno il file .zshrc, se si lancia **stow zsh**
viene creato un symlink nella directory superiore, in questo caso **$HOME** che punta a *.zshrc* nella directory *ZSH*.
### File non in $HOME
Allo stesso modo si possono creare simlink anche per tutti quei programmi la cui configurazione è in una struttura del tipo *$HOME/.config/nome_programma*. In questo caso nella directory *nome_programma* sotto *config* occorre replicare la struttura. Ad esempio per *alacritty* è stata creata la struttura *$HOME/config/alacritty/.config/alacritty/* nella quale è stato ad esempio creato **alacritty.toml** che è il file di configurazione.
Quando si lancia il comando *stow alacritty* da config, se non c'è già qualcosa sotto *$HOME/.config/alacritty*, viene creato un simlink sotto *.config* al posto della direcotry alacritty che punta a *$HOME/config/alacritty/.config/alacritty/* ed è fatto. Ovviamente la directory config viene messa sotto controllo di versionamento, e ogni volta che aggiorno quel repository, mi ritrovo aggiornati anche i file di configurazione che ho deciso di symlinkare su quella macchina.
## Contenuto di config
Le directory sotto config non hanno un vero e proprio significato, sono solo dei contenitori, ma servono per organizzare il contenuto. Di quello che è all'interno viene creato un symlink.
