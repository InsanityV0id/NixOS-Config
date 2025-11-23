{ config, pkgs, ... }:

{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";

  home.pointerCursor = {
    enable = true;
    package = pkgs.mint-cursor-themes;
    name = "Bibata-Modern-Ice";
    gtk.enable = true;
  };

  programs.bash.shellAliases = {
    rebuild = "sudo nixos-rebuild switch";
    updateflake = "cd /etc/nixos/ && sudo nix flake update";
    vim = "nvim";
    svim = "sudo nvim";
  };
}
