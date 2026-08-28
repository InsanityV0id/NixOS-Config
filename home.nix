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

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      updateflake = "cd /etc/nixos/ && sudo nix flake update";
      editnixconf = "sudo nvim /etc/nixos";
      vim = "nvim";
      svim = "sudo nvim";
    };
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
      nvim-tree = {
        enable = true;
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
	ccls = {
	  enable = true;
	  config = {
	    cmd = [
	      "ccls"
	    ];
	    filetypes = [
	      "c"
	      "cpp"
	    ];
	    root_markers = [
	      "compile_commands.json"
	      ".ccls"
	      ".git"
	    ];
	  };
	};
	pyright = {
	  enable = true;
	  config = {
	    cmd = [
	      "pyright-langserver"
	      "--stdio"
	    ];
	    filetypes = [
	      "python"
	    ];
	    root_markers = [
	      "pyrightconfig.json"
	    ];
	  };
	};
      };
    };
    extraConfigLua = "vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1";
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
