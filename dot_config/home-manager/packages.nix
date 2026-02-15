{ pkgs, ... }:
let
  cliTools = with pkgs; [
    bat # less
    btop # top
    chezmoi # config management
    eza # ls
    fd # find
    fzf
    just
    mosh # ssh on bad connection
    nmap
    ripgrep # silver surfer
    rnr # file renamer
    tealdeer # tldr
    uutils-coreutils-noprefix # coreutils
    wget
    yt-dlp
  ];

  editors = with pkgs; [
    neovim
    vscodium
  ];

  shells = with pkgs; [
    bash
    fish
    zsh
  ];

  vcs = with pkgs; [
    git
    jujutsu
  ];

  python = with pkgs; [
    python314
    ruff
    uv
  ];

  lspServers = with pkgs; [
    nil
    nixd
  ];

  homelabAdmin = with pkgs; [
    age
    nixos-rebuild-ng
    restic
    sops
  ];
in
{
  home.packages = builtins.concatLists [
    cliTools
    editors
    shells
    vcs
    python
    lspServers
    homelabAdmin
  ];
}
