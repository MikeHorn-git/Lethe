{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [ git gnumake rubyPackages_3_4.rubocop vagrant ];

  # https://devenv.sh/languages/
  languages.c.enable = true;
  languages.ruby.enable = true;
  languages.shell.enable = true;

  # https://devenv.sh/scripts/
  scripts = {
    plugins.exec = ''
      vagrant install vagrant-libvirt
      vagrant install vagrant-reload
    '';
  };

  # https://devenv.sh/basics/
  enterShell = ''
    echo "Available commands:"
    echo " - plugins      : Install plugins"
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    make -v
    rubocop --help
    vagrant --help
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = {
    clang-format.enable = true;
    mdformat.enable = true;
    nixfmt-classic.enable = true;
    rubocop = {
      enable = true;
      name = "rubocop";
      entry = "${pkgs.rubyPackages_3_4.rubocop}/bin/rubocop -A";
      files = "Vagrantfile$";
    };
    shellcheck.enable = true;
    shfmt.enable = true;
    trim-trailing-whitespace.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
