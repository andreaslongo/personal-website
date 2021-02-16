"""Module for standard workflows.

- new_til - Start new TIL article
- publish - Publish article
"""

import subprocess
import shlex
from pathlib import Path
from datetime import date


def new_til(branch: str, dry_run: bool = True) -> None:
    """Start new TIL article."""

    # Create article branch
    run('git switch main', dry_run=dry_run)
    run(f'git switch --create {branch}', dry_run=dry_run)

    # Create new article from archetype
    archetype = Path.cwd() / 'archetypes/til.adoc'
    article = Path.cwd() / f'content/blog/{branch}.adoc'
    title = branch.replace('-', ' ').title()

    content = parse_archetype(archetype, title)

    if dry_run:
        print(article)
        print(content)
    else:
        if article.exists():
            print(f"[Error] File already exist '{article}'.")
        else:
            article.write_text(content)

    # Commit new article
    run(f'git add {article}', dry_run=dry_run)
    run(f'git commit --message "Add new article {branch}"', dry_run=dry_run)


def publish(branch: str, dry_run: bool = True) -> None:
    """Publish article"""

    # Merge article branch to master
    run('git switch main', dry_run=dry_run)
    run(f'git merge {branch}', dry_run=dry_run)

    # Tag article
    run(f'git tag --sign publish-{branch} --message "Publish article {branch}"', dry_run=dry_run)

    # Delete article branch
    run(f'git branch --delete {branch}', dry_run=dry_run)

    # Push to github
    run('git push', dry_run=dry_run)
    run('git push --tags', dry_run=dry_run)


def run(command: str, dry_run: bool = True) -> None:
    cmd = shlex.split(command)
    if dry_run:
        print(cmd)
    else:
        subprocess.run(cmd, check=True)


def cwd_is_git_root() -> None:
    """Check if the current working directory is the root of the git repository."""
    git_dir = Path.cwd() / '.git'
    return git_dir.is_dir()


def parse_archetype(archetype: Path, title: str) -> str:
    today = date.today().isoformat()

    content = []
    for line in archetype.open():
        if line.startswith('#'):
            continue
        elif line.startswith('title:'):
            content.append(f'title: {title}\n')
        elif line.startswith('date:'):
            content.append(f'date: {today}\n')
        else:
            content.append(line)

    content = ''.join(content)
    return content


def parse_arguments(arguments: list) -> tuple:
    dry_run = '--dry-run' in arguments

    if dry_run:
        arguments.remove('--dry-run')
        print('== Dry run', 69 * '=')

    # Get article branch to publish as command line argument
    _, branch = arguments
    return branch, dry_run
