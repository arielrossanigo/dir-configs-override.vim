dir-configs-override.vim
========================

This extension overrides vim configs using custom configs stored in ``.vim.custom`` files.

Installation
------------

* If you use [Vim-plug](https://github.com/junegunn/vim-plug), add this to your plugins list: ``Plug 'arielrossanigo/dir-configs-override.vim'``.
* If you use [Patogen](https://github.com/tpope/vim-pathogen), clone this repo inside your bundles dir.

How to use it
-------------

* Create a `.vim.custom` file in the directory you want to customize.
* In that file make the configs that you want.
* That's it. When you open Vim from this folder (or any subfolder) that custom configs will override the ones in your `.vimrc` file.

Example
-------

Suppose that you have a project with a folder tree like the showed bellow, you use Fuzzyfinder and you want to exclude ``folder_x`` from FuzzyFinder, put ``let g:ctrlp_custom_ignore["dir"] = g:ctrlp_custom_ignore["dir"] . '|\v[\/]folder_x$'`` in the ``.vim.custom`` file.

    project
    ├── folder_1
    ├── folder_2
    ├── folder_x
    └── .vim.custom

Custom configs resolution
-------------------------

This extension supports multiple custom files across the path from the dir where Vim is open and root (/). Additionaly, allow to configure a  ``.vim.custom``
file in your home dir (~) to be used when no custom config files were found in the path previously mentioned.

When multiple files are found in the path mentioned above, the configs will be applied in order from root to the current dir.

Example
-------

Suppose you have:

    home
    └── user
        ├── projects
        │   ├── fades
        │   ├── fisa-vim-config
        │   ├── other-python-project
        │   │   └── .vim.custom
        │   └── .vim.custom
        └── .vim.custom

Where the contents of every ``.vim.custom`` is:


    $ cat home/user/.vim.custom
    let g:syntastic_python_flake8_args = "--max-line-length=100"
    let foo = "bar"


    $ cat home/user/projects/.vim.custom
    let foo = "bar in project"


    $ cat home/user/projects/other-python-project/.vim.custom
    let g:syntastic_python_flake8_args = "--max-line-length=80"

If Vim is opened in */home/user/projects/other-python-project/*, configs wil be:

* foo = "bar"
* syntastic_python_flake8_args = "--max-line-length=80"

