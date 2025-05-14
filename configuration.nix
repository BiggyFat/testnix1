{ pkgs, ... }:

{
  # Installation des logiciels et outils
  environment.systemPackages = with pkgs; [
    python310                      # Python 3.10
    python310Packages.pip          # pip pour installer des modules
    python310Packages.pyautogui    # Module pyautogui
    cudaPackages                   # CUDA (bibliothèques et outils)
    nvidia_x11                     # Pilotes NVIDIA
  ];

  # Activer CUDA
  hardware.nvidia = {
    modesetting.enable = true;
    compute.enable = true;         # Support CUDA pour le calcul GPU
  };

  # Configurer le fond d'écran
  environment.variables = {
    XDG_PICTURES_DIR = "/chemin/vers/images"; # Définit le répertoire des images
  };

  # Copier une image comme fond d'écran
  environment.etc."backgrounds/wallpaper.jpg".source = ./fond_d_ecran.jpg;

  # Définir le fond d'écran sous GNOME
  system.activationScripts.setWallpaper = ''
    gsettings set org.gnome.desktop.background picture-uri "file:///etc/backgrounds/wallpaper.jpg"
  '';
}