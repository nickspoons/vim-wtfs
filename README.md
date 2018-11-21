# WTFS

Handy vim wrapper for the `tf` TFS command-line tool, making it simple to list file history, view previous versions of files, and diff previous versions with each other, or with the current buffer.

## Usage

The plugin provides command `:TFHistory`, which fetches the history of the file in the current buffer.

The resulting window contains a line for each changeset version of the file. Each can be viewed (in a new tab) by hitting `<CR>`.

`d` can be used to diff a changeset with the current buffer version. `d` when a visual selection spans multiple lines creates a diff between the first and last versions of the selection, in a new tab.

Close the history window with `q`, or using `:pclose`.
