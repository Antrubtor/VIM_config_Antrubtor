# Custom Vim Configuration

This repository contains my customized Vim configuration, including keyboard shortcuts, plugins, and commands to enhance my workflow.

## Prerequisites

Before using this configuration, ensure you have the following installed:

- **vundle vim**: Plugin manager.
  ```
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```

- **clang-format**: Used for file formatting.
  ```
  sudo apt install clang-format
  ```

- **exuberant-ctags**: Required for proper functioning of Taglist.
  ```
  sudo apt-get install exuberant-ctags
  ```

- **vim-lsp dependencies**: Required for proper functioning of VIM-LSP.
  ```
  sudo apt install nodejs npm cargo clangd
  ```

- **c/cpp usages**: Required for proper functioning of termdebug.
  ```
  sudo apt install gdb
  ```

- **JetBrains Mono Nerd Font**: This font (`JetBrainsMonoNerdFontMono-Bold.ttf`) is required for powerline symbols. Find the font file in the repository and install it.

## Keyboard Shortcuts

- `+`: Resize tabs.
- `F12`: Toggle ALE (Asynchronous Lint Engine) on/off.
- `T`: Open a terminal (Ctrl + W, N for normal mode).
- `Ctrl + T`: Activate NERDTree for file navigation.
- `F8`: Open Tagbar for tag view.

## Custom Commands

- `Ctrl + j`: Format the entire code.
- Select code and use `=` to format the selected part.
- `F4`: Enable autocompletion.
- `F5`: Disable autocompletion.
- Use `:Man <code>` to access man documentation directly in Vim.
- `F6`: Toggle background/transparent theme.

## Additional Requirements

- Powerline Symbols: Install the provided font (`JetBrainsMonoNerdFontMono-Bold.ttf`) for proper powerline display.

## Note on Plugins

- If no Wakatime API keys are available, comment out the Wakatime plugin to prevent errors.
