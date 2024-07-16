{
  pkgs,
  lib,
  config,
  ...
}: {
  # xsession.windowManager.herbstluftwm = {
  #   enable = true;
  #   # extraConfig = builtins.readFile ./config;
  # };

  home.file = {
    ".config/herbstluftwm/autostart" = {
      source = ./config;
      executable = true;
      force = true;
    };

    ".config/compfy.conf" = {
      source = ./compfy.conf;
      force = true;
    };

    ".config/picom.conf" = {
      source = ./picom.conf;
      force = true;
    };

    # ".config/kitty/Everblush.conf" = {
    #   source = ./kitty-everblush.conf;
    # };

    ".config/rofi/launcher.rasi" = {
      source = ./everforest-launcher.rasi;
      force = true;
    };

    ".config/nitrogen/bg-saved.cfg".text = ''
      [xin_0]
      file=${../../../wallpapers/nixos-everblush.png}
      mode=5
      bgcolor=#000000

      [xin_1]
      file=${../../../wallpapers/nixos-everblush-right.png}
      mode=5
      bgcolor=#000000

      [xin_2]
      file=${../../../wallpapers/nixos-everblush-left.png}
      mode=5
      bgcolor=#000000
    '';
  };

  services.polybar = {
    enable = true;
    package = pkgs.polybarFull;
    config = ./polybar-mac.ini;
    script = "";
  };

  home.packages = with pkgs; [
    (writers.writeBashBin "herb-ws-switch" ./ws-switch.sh)
  ];
}
