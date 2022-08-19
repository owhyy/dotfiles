# Neovim configuration with Lua

A [Neovim](https://github.com/neovim/neovim) configuration using Lua, with the _minimal_ number of plugins I use for programming.

This readme exists, so I don't have to remember how to do all these things when setting up a new machine.

## Installing the configuration

Clone the repo into Neovim's installation folder (usually `/home/.config/nvim`):

```bash
git clone https://github.com/owhyy/nvim ~/.config/nvim
cd ~/.config/nvim
```

This will create a folder with the configuration with the following structure is as follows:

```
|- lua
|  |- lsp/
|  |- plugins/
|  |- keymaps.lua
|  |- options.lua
|  |- plugins.lua
|  |- theme.lua
|  \- utils.lua
|- plugin/
|- ftplugin/
|- snippets/
\- init.lua
```

This structure is important since Lua will not load files that are not located inside `lua`. The file `init.lua` loads all the modules located inside this folder to set the configuration. Plugin configruation is done by editing `plugins.lua`. Some of the most important plugins are:

1. [**`packer`**](https://github.com/wbthomason/packer.nvim): Manage the plugins.
2. [**`lspconfig`**](https://github.com/neovim/nvim-lspconfig): provides a client for the different language servers using the Language Server Protocol (LSP).
3. [**`cmp`**](https://github.com/hrsh7th/nvim-cmp): Auto-complete functionality. Recommended by the core Neovim team.
4. [**`treesitter`**](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting and other functionality.
5. [**`NvimTree`**](https://github.com/kyazdani42/nvim-tree.lua): File explorer written in Lua.
6. [**`gitsigns`**](https://github.com/lewis6991/gitsigns.nvim): Hunk management and diff info.
7. [**`telescope`**](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder.
8. [**`lualine`**](https://github.com/nvim-lualine/lualine.nvim): A status line written in Lua.

There are some more packages that are dependencies of the ones mentioned above, and some for formatting and theming as well. Adding new plugins is simple using the `use` function:

```lua
use({
  '<author>/<plugin-repo>',
  config = function() require('<plugin-name>').setup({}) end,
})
```

This will load a plugin with its standard configuration. For more complex configurations, we create the relevant file in `lua/plugins` (e.g. `lua/plugins/foo.lua`) and load it using the `require` function along with any other option we wish to pass to the `use` function:

```lua
use({
  '<author>/<plugin-repo>',
  config = function() require('plugin/<plugin-name>') end,
  -- Optionally require other plugins.
  requires = '<author>/<required-plugin-repo>'
  -- Other functionality
})
```

Notice that the file type is omitted from this call.

## Auto-completion

The auto-complete functionality is achieved by using `nvim-cmp` to attach the relevant language servers to the buffers containing code. Most servers only require that the `on_attach` function, but some language servers also require additional tweaking. I put my configuration in `lua/lsp/`, and then call `require(lsp.<filename>)` in my `lspconfig`. See [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) for more information about that.

The second part is installing the language servers themselves. I suggest you install it manually, rather than using `LspInstall`, as some of them are not working correctly (the java one, for example), and I like them to automatically update when doing a system update, rather than having to worry about updating then from within neovim.

### Installing the language servers

If you use arch, everything is very simple, as most language servers are on AUR. Otherwise, you can install language servers from their GitHub page or `npm`, `pip`.

### Some further notes

Inline error messages are disabled in the current configuration. They create a lot of clutter. I suggest you just use `Trouble` instead for looking at the error messages, but if you want to enable them back, comment the code on line 34 of `lua/options.lua`.

## Web-dev Icons

To visualize fancy icons and separators, a patched font must be installed. [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) has many already patched and offers instructions on how to create new ones (I don't recommend). To install a patched font follow these instructions:

1. Head to the [repo](https://github.com/ryanoasis/nerd-fonts) and download the font. I use Iosevka Mono.
2. Copy the file to `~/.local/share/fonts/`
3. Change the font in the terminal emulator's settings to the patched font.

## Attributions

[This config](https://github.com/miltonllera/neovim-lua-config) acted as the base of my configuration.
