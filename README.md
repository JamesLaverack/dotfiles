# Dotfiles

Personal configuration "dotfiles" for laptops, remote machines, etc.

# Installing

1. Setup a git private key, add it to GitHub
2. Clone the repository somewhere. (`~/.dotfiles` maybe)
3. Run the platform-approprate script in the root directory.
4. Perform linking
5. Install other applications

# Linking

Linking is, right now, manual.

| File                   | Dotfile Location      |
|------------------------|-----------------------|
| `zsh/zshrc`            | `~/.zshrc`            |
| `zsh/zshenv`           | `~/.zshenv`           |
| `git/gitconfig`        | `~/.gitconfig`        |
| `git/global_gitignore` | `~/.global_gitignore` |
| `spacemacs/spacemacs`  | `~/.spacemacs`        |

# Local Configuration

Place machine local configuration in the files `~/.zshrc.local` and `~/.zshenv.local`. Can also be used for secrets like API keys.

# Other Applications

This application does not install some applications. Notibly a password manager or Discord. Those should be done manually
