## List available cheatsheets
function cheatsheets() {
  # This is an ugly filter, but lazy.
cat ~/.oh-my-zsh/custom/cheatsheets.zsh | grep function | grep -v "function cheatsheets" | grep -v "cheatsheets.zsh" | cut -d " " -f2 | cut -d "(" -f1
}

## lazygit Cheatsheet
function cs-lazygit() {
lazygitcs=$(cat <<EOF
Lazygit menu
Global

  m: view merge/rebase options
  P: push
  p: pull
  R: refresh

Status

  e: edit config file
  o: open config file
  u: check for update
  s: switch to a recent repo

Files

  c: commit changes
  w: commit changes without pre-commit hook
  A: amend last commit
  C: commit changes using git editor
  space: toggle staged
  d: view 'discard changes' options
  e: edit file
  o: open file
  i: add to .gitignore
  r: refresh files
  S: stash files
  a: stage/unstage all
  t: add patch
  D: view reset options
  enter: stage individual hunks/lines
  f: fetch
  X: execute custom command

Branches

  space: checkout
  o: create pull request
  c: checkout by name
  F: force checkout
  n: new branch
  d: delete branch
  r: rebase branch
  M: merge into currently checked out branch
  f: fast-forward this branch from its upstream

Commits

  s: squash down
  r: reword commit
  R: rename commit with editor
  g: reset to this commit
  f: fixup commit
  F: create fixup commit for this commit
  S: squash above commits
  d: delete commit
  ctrl+j: move commit down one
  ctrl+k: move commit up one
  e: edit commit
  A: amend commit with staged changes
  p: pick commit (when mid-rebase)
  t: revert commit
  c: copy commit (cherry-pick)
  C: copy commit range (cherry-pick)
  v: paste commits (cherry-pick)
  enter: view commit's files
  space: select commit to diff with another commit

Stash

  space: apply
  g: pop
  d: drop

Commit files

  esc: go back
  c: checkout file
  d: discard this commit's changes to this file
  o: open file

Main (Normal)

  PgDn: scroll down (fn+up)
  PgUp: scroll up (fn+down)

Main (Staging)

  esc: return to files panel
  ▲: select previous line
  ▼: select next line
  ◄: select previous hunk
  ►: select next hunk
  space: stage line
  a: stage hunk

Main (Merging)

  esc: return to files panel
  space: pick hunk
  b: pick both hunks
  ◄: select previous conflict
  ►: select next conflict
  ▲: select top hunk
  ▼: select bottom hunk
  z: undo
EOF
)

echo $lazygitcs | less
unset lazygitcs
}