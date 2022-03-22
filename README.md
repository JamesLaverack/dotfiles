# Dotfiles

Personal configuration "dotfiles" for laptops, remote machines, etc.

# Installing

1. Clone the repository somewhere. (`~/.dotfiles` or `~/github.com/jameslaverack/dotfiles`)
2. Run the platform-approprate script in the root directory.
3. Perform linking
4. Add extra configuration
5. Install other applications

### GNUPG

A file should be placed at `~/.gnupg/gpg-agent.conf` with the following directives:

```
enable-ssh-support
default-cache-ttl 600
max-cache-ttl 7200
```

An additional line `pinentry-program` should be set, followed by the full path to the `pinentry-mac` executable.
