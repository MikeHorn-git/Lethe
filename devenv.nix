{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    checkmake
    mdformat
    nixfmt-classic
    rubyPackages_3_4.rubocop
    vagrant
  ];

  # https://devenv.sh/languages/
  languages.c.enable = true;
  languages.ruby.enable = true;
  languages.shell.enable = true;

  # https://devenv.sh/scripts/
  scripts = {
    lint.exec = ''
      git ls-files --cached --others --exclude-standard '*Makefile' | xargs checkmake Makefile
      git ls-files --cached --others --exclude-standard '*.c' '*.h' | xargs clang-format -i
      mdformat README.md
      nixfmt devenv.nix
      rubocop -A .
      git ls-files --cached --others --exclude-standard '*.sh' | xargs shellcheck
      git ls-files --cached --others --exclude-standard '*.sh' | xargs shfmt -w'';
    reqs.exec = "vagrant install vagrant-reload";
  };

  # https://devenv.sh/basics/
  enterShell = ''
    echo "Available commands:"
    echo " - lint         : Lint the all the repository"
    echo " - reqs         : Install vagrant plugins"
  '';

  enterTest = ''
    make help
    vagrant --help
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = {
    checkmake.enable = true;
    clang-format.enable = true;
    mdformat.enable = true;
    nixfmt-classic.enable = true;
    shellcheck.enable = true;
    shfmt.enable = true;
    trim-trailing-whitespace.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
