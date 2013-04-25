VitaVim
=======

Your Daily dose of vim essentials.

To install Just do :

    git clone git://github.com/confessin/vitavim vitavim/
    cd vitavim
    ./install.sh


Ands you are doens. Enjoy !! *Derp*


FAQ:
=======

Not working:
    
You can just back up your .vimrc and .vim(if exists) and remove them (or unlink them), follow the installation steps and copy your .vimrc into local.vimrc

The incomplete cheatsheet to get you started:
=======

[NOTE] The ',' referred to here is the leader key. You can reassign leader key to any key you like.
[NOTE2] The <leader> is equivalent to ','

# Basic file handling.

Moving around your splits:

    ctrl + [hjkl]
    ctrl + w then [arrow keys]

Toggle up the file explorer.

    <leader>n

Opening up the goto file list/menu.

    <leader> + f

Deleting present buffer window.

    :bd

Deleting all buffer windows.

    :Bda

# Basic File editing stuff.

Open up the Undo menu for vim.

    <leader>g 

Paste from the global register (Copy from anywhere and pasting it into vim)

    <leader>p

# Code related stuff.

Goto definition

    <leader>j

Smart renaming: To rename all the occurance of that variable. (Using RopeRename here)

    <leader>r

Open up task list

    <leader>td

Open quickfix window

    <leader>c :copen<CR>

Close quickfix window

    <leader>cc :cclose<CR>

Set working directory to current directory

    <leader>.

Open up Snippets menu for a particular language.

    <ctrl>j

# Misc

Reload vimrc file.

    <leader>V

Open ack for searching text within files.

    <leader>a <Esc>:Ack!

Invoke split and scroll

    <leader>sb

UnHighlight the search results.

    <leader><space>

Remove trailing whitespace.

    <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

Shortcut to closing the present vim window.

    <leader>q :q<CR>

