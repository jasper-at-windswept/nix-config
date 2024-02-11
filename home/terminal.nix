{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  programs.kitty = {
    enable = true;
    #font.package = pkgs.roboto;
    font.name = "Inter";
    font.size = 14;
    theme = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 15;
    };
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild-switch = "rm ~/.config/mimeapps.list && sudo nixos-rebuild switch --flake /home/${user}/.flake#nixos";
    };
    initExtra = ''

      nitch
      echo "Finished other maps up to the end of SWR"

      eval "$(oh-my-posh init zsh)"
    '';
    oh-my-zsh = {
      enable = true;
    };
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./bubbles.omp.json));
  };
}
