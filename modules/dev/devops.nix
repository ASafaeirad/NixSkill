{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      kubernetes-helm
      minikube
      terraform
      kubectl
      act
    ];
  };
}
