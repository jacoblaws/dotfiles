{ pkgs, ... }: {
  home.packages = with pkgs; [
    android-studio
    android-studio-tools
    android-tools
    gradle
    jdk
  ];

  xdg.configFile."ideavim/ideavimrc".text = ''
    " General options
    set clipboard=unnamedplus
    set hlsearch
    set ignorecase
    set incsearch
    set nocursorline
    set nowrap
    set relativenumber
    set scrolloff=10
    set showcmd
    set showmode
    set sidescrolloff=10
    set smartcase
    set visualbell

    " Leader key
    let mapleader = " "
    let localleader = " "

    " Plugins
    set easymotion
    set highlightedyank
    set nerdtree
    set notimeout
    set quickscope
    set surround
    set which-key

    " Which-key config
    let g:WhichKey_FontSize = 16
    let g:WhichKey_SortOrder = "by_key_prefix_first"

    " General
    let g:WhichKeyDesc_hsplit = "<leader>_ Horizontal Split"
    let g:WhichKeyDesc_vsplit = "<leader>| Vertical Split"

    "" Code
    let g:WhichKeyDesc_c = "<leader>c Code"
    let g:WhichKeyDesc_ca = "<leader>ca Actions"
    let g:WhichKeyDesc_cd = "<leader>cd Diagnostics"
    let g:WhichKeyDesc_cf = "<leader>cf Format"

    "" Find
    let g:WhichKeyDesc_f = "<leader>f Find"
    let g:WhichKeyDesc_ff = "<leader>ff Files"
    let g:WhichKeyDesc_fr = "<leader>fr Recent"

    "" Git
    let g:WhichKeyDesc_g = "<leader>g Git"
    let g:WhichKeyDec_gc = "<leader>gc Commit"

    "" UI
    let g:WhichKeyDesc_u = "<leader>u UI"
    let g:WhichKeyDesc_ud = "<leader>ud Toggle Distraction-Free Mode"
    let g:WhichKeyDesc_uf = "<leader>uf Toggle Full Screen"
    let g:WhichKeyDesc_uz = "<leader>uz Toggle Zen Mode"

    " Keymaps
    "" Pane navigation
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-l>l

    "" Pane resize
    map <C-Up> <cmd>resize +2<cr>
    map <C-Down> <cmd>resize -2<cr>
    map <C-Left> <cmd>vertical resize -2<cr>
    map <C-Right> <cmd>vertical resize +2<cr>

    "" Pane splits
    map <leader>_ <C-w>s
    map <leader>| <C-w>v

    "" Better visual mode indentation
    map < <gv
    map > >gv

    "" Code
    map <leader>ca <action>(ShowIntentionActions)
    map <leader>cd <action>(ShowErrorDescription)
    map <leader>cf <action>(ReformatCode)

    "" Find
    map <leader>ff <action>(GotoFile)
    map <leader>fr <action>(RecentFiles)

    "" Git
    map <leader>gc <action>(ChangesView.Commit)

    "" UI
    map <leader>ud <action>(ToggleDistractionFreeMode)
    map <leader>uf <action>(ToggleFullScreen)
    map <leader>uz <action>(ToggleZenMod)
  '';
}
