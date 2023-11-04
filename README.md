# VIM Buffer History 1.0.0

A vim plugin to maintain a MRU buffer jump history per window

## Getting Started

### Installation

Install this like any other (n)vim plugin based on the plugin manager you use

### VIM API

Buffer History provides the following vim commands :

- `:BufferHistoryList`: Lists the window local history of buffers visited
  buffers stack
- `:BufferHistoryBack`: Jumps to previously visited buffer
- `:BufferHistoryForward`: Jumps forward to next visited buffer when you're
  not already on the last one

These are also available as the following plug mappings :

- `<Plug>(buffer-history-list)`: Set to <kbd>gbl</kbd> by default
- `<Plug>(buffer-history-back)`: Set to <kbd>gbp</kbd> by default
- `<Plug>(buffer-history-forward)`: Set to <kbd>gbn</kbd> by default

You can override these mappings by setting them in your vim configurations

## Credits

This plugin took inspiration from https://github.com/ton/vim-bufsurf, with a
cleaner and simpler approach to the problem.
