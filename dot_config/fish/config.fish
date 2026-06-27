set fish_greeting
set -e NO_COLOR

set -gx VISUAL nvim
set -gx EDITOR $VISUAL
set -gx PAGER  $VISUAL
set -gx MANPAGER "nvim +Man!"
fish_vi_key_bindings
set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_replace_one block
set -g fish_cursor_visual block

set -gx PROJECTS "$HOME/Projects"
set -gx PATH "/home/kurumi/.local/bin" $PATH

set -gx GOPATH "$PROJECTS/.go"
set -gx GOMODCACHE "$GOPATH/pkg/mod"
set -gx GOCACHE "$GOPATH/cache/build"
set -gx GOBIN "$GOPATH/bin"
fish_add_path -g "$GOBIN"
fish_add_path -g "$HOME/.local/bin"

set -gx DOCKER_SCAN_SUGGEST false
set -gx DOTNET_CLI_TELEMETRY_OPTOUT true
set -gx DO_NOT_TRACK true

if status is-interactive
	if type -q fzf
		set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --highlight-line --info=inline --prompt='> '"
		set -gx FZF_CTRL_T_COMMAND "fd --type f --type d --hidden --follow --exclude .git"
		set -gx FZF_CTRL_T_OPTS "--preview 'test -d {} && eza --tree --level=2 --color=always {} || bat --style=numbers --color=always --line-range=:200 {}' --preview-window=right,60%,border-left"
		set -gx FZF_ALT_C_COMMAND "fd --type d --hidden --follow --exclude .git"
		set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --level=2 --color=always {}' --preview-window=right,60%,border-left"
		fzf_key_bindings
	end

	if type -q starship
		eval (starship init fish)
	end

	if type -q eza
		alias ls='eza --group-directories-first'
		alias ll='eza --group-directories-first --long --git'
		alias la='eza --group-directories-first --long --all --git'
	end

	if type -q bat
		alias cat='bat --style=plain --paging=never'
	end

	if type -q yazi
		function yy
			set -l tmp (mktemp -t yazi-cwd.XXXXXX)
			yazi $argv --cwd-file "$tmp"
			if set -l cwd (command cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
				cd -- "$cwd"
			end
			rm -f -- "$tmp"
		end
	end
end
