#!/usr/bin/env sh

_create_github_repo() {
    printf "Repository name: "
    read -r REPO_NAME

    gh repo create "$REPO_NAME" \
        --public \
        --source=. \
        --remote=origin

    git push -u origin master
    git push -u origin develop
}

_init_git() {
    git init
    git add .

    git commit \
        -m "init(project): Automated project init" \
        -m "- add templates
    - init git local repo (master)
    - add local develop branch"

    git checkout -b develop 2>/dev/null || \
    git branch develop

    printf "Create GitHub repository? [y/N] "
    read -r ANSWER

    case "$ANSWER" in
        y|Y|yes|YES)
            _create_github_repo
            ;;
    esac

    echo "Git project initialized."
}

_init_angular() {
    printf "Init Git local repository? [y/N] "
    read -r ANSWER

    case "$ANSWER" in
        y|Y|yes|YES)
            _init_git
            ;;
    esac

    echo "Angular project initialized."
}

_init_latex() {
    printf "Init Git local repository? [y/N] "
    read -r ANSWER

    case "$ANSWER" in
        y|Y|yes|YES)
            _init_git
            ;;
    esac

    echo "LaTeX project initialized."
 }

  project-init() {
    TYPE="$1"

    if [ -z "$TYPE" ]; then
        echo "Usage: project-init <git|angular|latex>"
        return 1
    fi

    TEMPLATE_DIR="$HOME/.make/templates/$TYPE"

    if [ ! -d "$TEMPLATE_DIR" ]; then
        echo "Unknown project type: $TYPE"
        return 1
    fi

    echo "Initializing $TYPE project..."

    cp -r "$TEMPLATE_DIR"/. .

    case "$TYPE" in
        git)
            _init_git
            ;;
        angular)
            _init_angular
            ;;
        latex)
            _init_latex
            ;;
    esac
}

alias init='project-init'
