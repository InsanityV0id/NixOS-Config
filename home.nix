{ config, pkgs, nixvim, ... }:

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

  imports = [
    nixvim.homeModules.nixvim
  ];

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

  programs.nixvim = {
    enable = true;
    plugins = {
      blink-cmp = {
        enable = true;
        autoLoad = true;
      };
      treesitter = {
        enable = true;
	highlight.enable = true;
      };
    };
    lsp = {
      servers = {
        nimls = {
          enable = true;
          packageFallback = true;
	  config = {
	    cmd = [
	      "nimlsp"
	    ];
	    filetypes = [
	      "nim"
	    ];
	  };
        };
      };
    };
  };

  services.udiskie = {
    enable = true;
    settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
        };
    };
  };
}
