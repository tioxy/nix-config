{ pkgs, ... }: {
  # Import all modules for Darwin hosts
  imports = [
    ../../modules/darwin # Import all Darwin modules
  ];
}
