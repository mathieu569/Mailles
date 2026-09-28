# Mailles — compiler en local

Ce dossier est le projet complet de l'application. Tu le gardes sur ton PC, tu le modifies
au fil de nos échanges, et tu compiles toi-même le `.exe` quand tu veux le distribuer.

## 1. Installer une fois pour toutes

- **Node.js** (version LTS) : https://nodejs.org — installe, puis vérifie dans un terminal
  avec `node -v`.
- **VS Code** : https://code.visualstudio.com

## 2. Ouvrir le projet

Dézippe l'archive, puis dans VS Code : `Fichier > Ouvrir un dossier...` et sélectionne
`mailles-project`.

Ouvre le terminal intégré : menu `Terminal > Nouveau terminal` (ou `` Ctrl+` ``).

## 3. Télécharger les binaires (une seule fois)

```
npx @neutralinojs/neu update
```

Ça télécharge dans `bin/` les exécutables Neutralino pour Windows, Mac et Linux. Ce
dossier est volontairement ignoré par git (voir `.gitignore`) parce qu'il est gros et
qu'il ne contient rien de spécifique à ton projet : si tu le supprimes, relance juste
cette commande.

## 4. Voir tes modifications sans compiler

Tout le code de l'app est dans un seul fichier : `resources/index.html`.

Pour tester vite, sans passer par la compilation :

```
npx @neutralinojs/neu run
```

Ça ouvre une fenêtre native qui affiche `resources/index.html`. Ferme-la et relance la
commande après chaque modification pour voir le résultat.

## 5. Ajouter les fonctionnalités au fil des conversations

À chaque étape, je te donnerai le contenu mis à jour de `resources/index.html` (ou les
portions à changer). Tu remplaces le fichier, tu testes avec `neu run`, et tu me dis si
ça te va avant qu'on enchaîne.

## 6. Compiler le `.exe` final

```
npx @neutralinojs/neu build --release
```

Le résultat arrive dans `dist/mailles/` : entre autres `mailles-win_x64.exe` et
`resources.neu`. Ces deux fichiers doivent toujours être envoyés ensemble et rester
dans le même dossier chez la personne qui les reçoit, sinon l'appli affiche une page
blanche.

Deux scripts font ce regroupement automatiquement et produisent une archive prête à
donner (`dist/Mailles-Windows.zip`) :

- Sous Windows : double-clique sur `build-windows.bat` (ou lance-le depuis le terminal).
- Sous Mac/Linux : `./build-unix.sh` dans le terminal.

## 7. À savoir avant de distribuer

- L'app Windows s'appuie sur **WebView2**, le moteur web déjà installé dans Windows
  10/11 à jour. C'est pour ça que l'exécutable est léger (quelques Mo au lieu de
  70+ Mo avec une techno comme Electron). Si la personne qui reçoit le fichier a un
  Windows très ancien sans WebView2, Windows le proposera automatiquement à
  l'installation, ou elle peut l'installer ici :
  https://go.microsoft.com/fwlink/p/?LinkId=2124703
- Pas d'icône personnalisée pour l'instant (celle par défaut de Neutralino), pas
  d'installateur avec raccourci menu Démarrer : c'est un exécutable portable à
  double-cliquer.

## Structure du dossier

```
mailles-project/
  neutralino.config.json   configuration de l'app (titre, taille de fenêtre...)
  resources/
    index.html              toute l'application (HTML + CSS + JS)
    icons/                  icônes de l'app et de la barre des tâches
    js/neutralino.js        librairie cliente Neutralino (pour les futures fonctions
                             fichier : import/export, enregistrement...)
  build-windows.bat
  build-unix.sh
  bin/                      binaires runtime (générés par `neu update`, pas versionnés)
  dist/                     résultat de compilation (généré par `neu build`, pas versionné)
```
