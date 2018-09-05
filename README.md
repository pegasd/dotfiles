# dotfiles

## Overview

Contains various personal dotfiles and is expected to change quite a bit.

Please ping me if you find anything in here that you think could be done faster, better, or prettier.

Your mileage may vary though. These are highly personalized.

## Installation

I use [macos-config-playbook](https://github.com/pegasd/macos-config-playbook) to install and update these. However, these are not macOS-specific.

Here's a relevant bit of code that manages this:

```yaml
- name: Bring over my dotfiles
  git:
    dest: '~/.dotfiles'
    repo: '{{ dotfiles_repo }}'
    update: '{{ update_dotfiles }}'
    force: '{{ update_dotfiles }}'

- name: rsync '~/.dotfiles' -> '~'
  synchronize:
    src: '~/.dotfiles/'
    dest: '~'
    archive: true
    rsync_opts:
      - '--exclude=.git'
      - '--exclude=LICENSE'
      - '--exclude=*.md'
```

## Contributing

Feel free to submit issues, PRs, or just comment.
