{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    rubocop
  ];

  # https://devenv.sh/languages/
  languages.c.enable = true;
  languages.ruby.enable = true;
  languages.shell.enable = true;

  # https://devenv.sh/tests/
  enterTest = ''
    rubocop -v
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = {
    clang-format.enable = true;
    mdformat.enable = true;
    nixfmt.enable = true;
    rubocop = {
      enable = true;
      name = "rubocop";
      entry = "${pkgs.rubocop}/bin/rubocop -A";
      files = "Vagrantfile$";
    };
    shellcheck.enable = true;
    shfmt.enable = true;
    trim-trailing-whitespace.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
