{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [ git checkmake mdformat nixfmt-classic rubocop ];

  # https://devenv.sh/languages/
  languages.c.enable = true;
  languages.shell.enable = true;

  # https://devenv.sh/tasks/
  tasks = {
    "lint:run".exec = ''
      git ls-files --cached --others --exclude-standard 'Makefile' | xargs checkmake Makefile
      git ls-files --cached --others --exclude-standard '*.c' '*.h' | xargs clang-format -i
      mdformat README.md
      nixfmt devenv.nix
      rubocop -A .
      git ls-files --cached --others --exclude-standard '*.sh' | xargs shellcheck
      git ls-files --cached --others --exclude-standard '*.sh' | xargs shfmt -w'';
  };

  enterTest = ''
    make help
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
