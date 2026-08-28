# home.nix
{ lib, ... }: {

  # Add a new remote. Keep the default one (flathub)
  services.flatpak.remotes = lib.mkOptionDefault [{
    name = "flathub";
    location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = true;

  # Add here the flatpaks you want to install
  services.flatpak.packages = [
    "com.usebottles.bottles"
    "org.vinegarhq.Sober"
  ];

}
