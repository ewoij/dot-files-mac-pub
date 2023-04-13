#!/bin/bash
DOT_SCRIPT_FILE=${BASH_SOURCE[0]:-$0}
DOT_SCRIPT_DIR="$( cd "$( dirname "$DOT_SCRIPT_FILE" )" &> /dev/null && pwd )"
DOT_FILES_FILE="$DOT_SCRIPT_DIR/list.txt"
DOT_FILES_DIR="$DOT_SCRIPT_DIR/files"

function dot_pull() (
    set -e
    echo --- Pulling -------------------------------------------------------------------- 
    cd "$DOT_SCRIPT_DIR"
    git pull

    echo --- Restoring ------------------------------------------------------------------
    cd "$DOT_FILES_DIR"
    tar_file="dot-files.tar"
    tar cf $tar_file -T "$DOT_FILES_FILE"
    mv $tar_file "$HOME"/

    cd "$HOME"
    tar xf $tar_file
    rm $tar_file

    echo --- Done -----------------------------------------------------------------------
)

function dot_push() (
    set -e

    echo --- Saving ---------------------------------------------------------------------
    cd "$HOME"
    tar_file="dot-files.tar"
    tar cf $tar_file -T "$DOT_FILES_FILE"

    [[ -a $DOT_FILES_DIR ]] && rm -fR "$DOT_FILES_DIR"
    mkdir "$DOT_FILES_DIR"
    cd "$DOT_FILES_DIR"
    mv "$HOME"/$tar_file .
    tar xf $tar_file
    rm $tar_file

    echo --- Pushing --------------------------------------------------------------------
    cd "$DOT_FILES_DIR"
    git add .
    git commit -m 'Dot Push'
    git push

    echo --- Done -----------------------------------------------------------------------
)

function dot_config_edit() (
    echo --- Editing --------------------------------------------------------------------
    $EDITOR "$DOT_FILES_FILE"
    echo --- Pushing --------------------------------------------------------------------
    cd "$DOT_SCRIPT_DIR"
    git add "$DOT_FILES_FILE"
    git commit -m 'Update config'
    git push
    echo --- Done -----------------------------------------------------------------------
)

function dot_config_new() (
    echo --- Generating -----------------------------------------------------------------
    files=$(
        (
            cd "$HOME"
            find . -mindepth 1 -maxdepth 1 -path './.*'
            find ./.config -mindepth 1 -maxdepth 1
        ) | sort
    )
    files=$(echo "$files" | grep -v './.cache')

    echo "$files" > "$DOT_FILES_FILE"

    dot_config_edit
)
