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


## Setup Instructions

1. **Place the `.vimrc` file** in your home directory (`~/.vimrc`).

2. **Place the `.vim/` directory** at the root of your home directory (`~/.vim/`).

3. If the `.vim/` directory already exists, make sure to place the `syntax/` directory inside it, as it contains necessary syntax files for your configuration.

4. After completing these steps, run the following command to install the necessary plugins:

  ```
   vim +PluginInstall
  ```

## Keyboard Shortcuts

### Navigation
- `T` Open the terminal in vim and `Ctrl + w, N`: change the terminal to normal mode.
- `Ctrl + t`: Activate NERDTree for file navigation (choose a file and press `t` to open it in a new tab).
- `Ctrl + Up/Down Arrow`: Change buffer.
- `Ctrl + Right/Left Arrow`: Change tab.
- `Ctrl + g`: Open GDB.

### Editing
- `Ctrl + j`: Format all code.
- Select code in visual and `=`: Format the selected portion of code.
- `,`: Comment / uncomment.
- `\re`: Rename a variable.
- `\co`: Show error suggestions.

### Searching
- `Ctrl + k`: Find a function (use `Ctrl + J/K` to navigate between results).
- `Ctrl + f`: Find a file.
- `Ctrl + Click`: Go to the declaration of a variable or function.

### Utilities
- `F5`: Enable / disable AutoComplPop.
- `F6`: Enable / disable the background.
- `F8`: Open Tagbar.
- `:Man <code>`: Use man directly in Vim.


## Additional Requirements

- Powerline Symbols: Install the provided font (`JetBrainsMonoNerdFontMono-Bold.ttf`) for proper powerline display.

## Note on Plugins

- If no Wakatime API keys are available, comment out the Wakatime plugin to prevent errors.