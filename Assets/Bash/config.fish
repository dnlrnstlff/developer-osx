set fish_greeting ''

set -x PATH $PATH $HOME/npm/bin
set -x PATH $PATH $HOME/bin
set -x PATH $PATH /usr/local/bin

alias NAME DEFINITION

# databases
alias psql_start="postgres -D /usr/local/var/postgres"
alias mongo_start="mongod --config /usr/local/etc/mongod.conf"

# filesystem
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias l 'ls'
alias ll 'ls -Alh'
alias fn 'find . -name'
alias hi 'history | tail -20'

# shortcuts
alias d 'cd ~/Dropbox'
alias ps 'python -m SimpleHTTPServer 4000'
alias editgit 'atom ~/.gitconfig'

## Switch repos
alias h 'cd ~/'

# applications
alias a. 'atom .'
alias a 'atom'

# git
alias g 'git'
alias ga 'git add'
alias gau 'git add -u'
alias gl 'git log'
alias gs 'git status'
alias gss 'git status --short'
alias gd 'git diff'
alias gds 'git diff --staged'
alias gdt 'git difftool'
alias gdts 'git difftool --staged'
alias gm 'git commit -m'
alias gma 'git commit -am'
alias gb 'git branch'
alias gc 'git checkout'
alias gra 'git remote add'
alias grr 'git remote rm'
alias gpu 'git pull'
alias grh 'git reset HEAD'
alias undo 'git reset --soft HEAD^'
alias gup 'git up'

# Prompt Mixin
function _read_confirm
  while true
    read -l -p _read_confirm_prompt confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

function _read_confirm_prompt
  echo 'Do you want to continue? [Y/n] '
end

# Smart git commit (kill merge conflicts)
function gcommit
	git status
	git up
	git add --all
	git commit -m $argv[1]
	echo 'Do you want to push to origin?'
	if _read_confirm
		git push
	end
	git status
end

# Smart git merge
function gmerge
	echo 'Merge ' $argv[1] ' -> ' $argv[2]
	if _read_confirm
		git up
		git checkout $argv[2]
		git merge $argv[1] --no-ff
		echo 'Do you want to push to origin?'
    if _read_confirm
      git push
    end
	end
end

function gcheck
	echo 'Checkout ' $argv[1]
	git checkout $argv[1]
end

############################

# AVIT ZSH Theme with an Ashkan Kiani twist.
function _update_git_branch_name
  set -g _git_branch_name (command git symbolic-ref HEAD ^/dev/null | sed 's|^refs/heads/||')
end

function _has_git
  test -n "$_git_branch_name"
end

function _no_git
  test -z "$_git_branch_name"
end

function _git_is_dirty
  test -n "$_is_git_dirty"
end

function _git_is_commit_ready
  test -n "$_git_commit_ready"
end

function _git_parse_flags
  set -g _git_status_output (command git status --porcelain --ignore-submodules=dirty ^/dev/null)
  set -g _git_flags '' '' '' '' '' ''
  set -g _is_git_dirty ''
  set -g _git_commit_ready ''
  for line in $_git_status_output
    switch $line
      case ' A*'
        set _git_flags[1] 1
        set _is_git_dirty 1
      case ' M*'
        set _git_flags[2] 1
        set _is_git_dirty 1
      case ' D*'
        set _git_flags[3] 1
        set _is_git_dirty 1
      case ' R*'
        set _git_flags[4] 1
        set _is_git_dirty 1
      case ' U*'
        set _git_flags[5] 1
        set _is_git_dirty 1
      case '\?\?*'
        set _git_flags[6] 1
      case '*'
        set _git_commit_ready 1
    end
  end
end

set ZSH_THEME_GIT_PROMPT_PREFIX (set_color green)
set ZSH_THEME_GIT_PROMPT_SUFFIX (set_color normal)

# Colors vary depending on time lapsed.
set ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT (set_color green)
set ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM (set_color yellow)
set ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG (set_color red)
set ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL (set_color black)

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _update_git_time_since_commit
  if command git rev-parse --git-dir >/dev/null 2>&1
    # Only proceed if there is actually a commit.
    if test (command git log 2>&1 >/dev/null | grep -c "^fatal: bad default revision") -eq 0
      # Get the last commit.
      set last_commit (git log --pretty=format:'%at' -1 ^/dev/null)
      set now (date +%s)
      set seconds_since_last_commit (math "$now-$last_commit")

      # Totals
      set minutes (math "$seconds_since_last_commit / 60")
      set hours (math "$seconds_since_last_commit/3600")

      # Sub-hours and sub-minutes
      set days (math "$seconds_since_last_commit / 86400")
      set sub_hours (math "$hours % 24")
      set sub_minutes (math "$minutes % 60")

      if test $hours -gt 24
          set commit_age {$days}d
          set color $ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG
      else if test $minutes -gt 60
          set commit_age {$sub_hours}h{$sub_minutes}m
          set color $ZSH_THEME_GIT_TIME_SINCE_COMMIT_MEDIUM
      else
          set commit_age {$minutes}m
          set color $ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT
      end

      _git_is_dirty; or set color $ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL
      set -g _git_time_since_commit "$color$commit_age$normal"
    end
  end
end



function _dirname
  # list-join '/' (list-split '/' (pwd))[-3..-1]
  pwd | tr '/' '\n' | tail -n3 | tr '\n' '/'
end

function _user_host
  set user (command whoami)
  set host (command hostname -s)
  if test -n "$SSH_CONNECTION"
    set me "$user@$host"
  else
    if test "$LOGNAME" != "$USER"
      set me $user
    end
  end
  if test -n "$me"
    echo -n "$cyan$me$normal:"
  end
end

function _ruby_version
  echo -n
end

function _vi_status
  if echo $fpath | grep -q "plugins/vi-mode"
    echo (vi_mode_prompt_info)
  end
end

function _ruby_version
  if echo $fpath | grep -q "plugins/rvm"
    echo (set_color black)(rvm_prompt_info)(set_color normal)
  end
end

# LS colors, made with http://geoff.greer.fm/lscolors/
set -x LSCOLORS "exfxcxdxbxegedabagacad"
set -x LS_COLORS 'di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
set -x GREP_COLOR '1;33'

function fish_right_prompt
  set -l last_status $status
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l black (set_color black)
  set -l normal (set_color normal)

  if _has_git
    echo -ne $_git_time_since_commit
    test -z $_git_flags[1]; or printf {$green}"%2s" ✚
    test -z $_git_flags[2]; or printf {$yellow}"%2s" ⚑
    test -z $_git_flags[3]; or printf {$red}"%2s" ✖
    test -z $_git_flags[4]; or printf {$blue}"%2s" ▴
    test -z $_git_flags[5]; or printf {$cyan}"%2s" §
    test -z $_git_flags[6]; or printf {$black}"%2s" ◒
  end
  printf {$red}"%3s" (test $last_status -eq 0; or echo ⍉)
end

# set bold_green

function fish_prompt
  _update_git_branch_name
  _git_parse_flags
  _update_git_time_since_commit

  set caret ▶
  # set caret >>

  set -g cyan (set_color -o cyan)
  set -g yellow (set_color -o yellow)
  set -g red (set_color red)
  set -g blue (set_color blue)
  set -g green (set_color green)
  set -g bold_green (set_color -o green)
  set -g white (set_color white)
  set -g bold_white (set_color -o white)
  set -g normal (set_color normal)

  if test "$USER" = "root"
    set CARETCOLOR $red
  else
    if _git_is_dirty
      set CARETCOLOR $bold_white
    else
      set CARETCOLOR $green
    end
  end

  printf "\n"
  _user_host
  printf $blue"%s" (_dirname)
  if _has_git
    printf $green" %s" $_git_branch_name
    printf " "
    if _git_is_dirty
      echo -n {$red}✗
    else
      if _git_is_commit_ready
        echo -n {$yellow}■
      else
        echo -n {$green}✔
      end
    end
    echo -n $normal
    # printf " %s" (_git_is_dirty; and echo {$red}✗; or echo {$green}✔)$normal
  end
  printf $CARETCOLOR"\n"$caret" "$normal
  return
end
