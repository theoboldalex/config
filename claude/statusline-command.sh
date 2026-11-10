#!/bin/bash
# Agnoster-style powerline segments in Tokyo Night colours: model, context used %, git branch. Needs a Nerd Font for the glyphs.
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
branch=$(git -C "${cwd:-.}" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
# UTF-8 bytes, since macOS bash 3.2 has no \u escapes
sep=$'\xee\x82\xb0'          # U+E0B0 powerline arrow
robot=$'\xf3\xb0\x9a\xa9'    # U+F06A9 nf-md-robot
gauge=$'\xf3\xb0\x8a\x9a'    # U+F029A nf-md-gauge
git=$'\xee\x9c\xa5'          # U+E725 nf-dev-git_branch

# Tokyo Night palette (r;g;b)
dark='26;27;38'; blue='122;162;247'; green='158;206;106'; yellow='224;175;104'; red='247;118;142'; purple='187;154;247'

prev=''
# segment <bg> <text>: draws the arrow from the previous segment, then this one
segment() {
  [ -n "$prev" ] && printf '\033[38;2;%s;48;2;%sm%s' "$prev" "$1" "$sep"
  printf '\033[38;2;%s;48;2;%sm %s ' "$dark" "$1" "$2"
  prev=$1
}

segment "$blue" "$robot ${model:-?}"
pct=$(printf '%.0f' "$used")
if [ "$pct" -lt 50 ]; then bg=$green; elif [ "$pct" -lt 80 ]; then bg=$yellow; else bg=$red; fi
segment "$bg" "$gauge $pct%"
[ -n "$branch" ] && segment "$purple" "$git $branch"
printf '\033[0;38;2;%sm%s\033[0m\n' "$prev" "$sep"
