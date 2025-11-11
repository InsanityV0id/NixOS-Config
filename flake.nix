{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      # ...
      system = "x86_64-linux";
      modules = [
        # ...
        ./configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-p51
	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.insanityvoid = ./home.nix;
	  home-manager.backupFileExtension = "backup";
        }
      ];
    };
  
  
  };
}
