#!/usr/bin/env bash
set -euo pipefail

version="${1:?Usage: $0 <version-without-v-prefix>}"
if [[ "$version" == v* ]]; then
  echo "Error: version must not start with 'v' (got: $version)" >&2
  exit 1
fi
if ! [[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-beta\.[0-9]+)?$ ]]; then
  echo "Error: version must match a.b.c or a.b.c-beta.x (got: $version)" >&2
  exit 1
fi

tag="v${version}"
file="Formula/icp-cli-beta.rb"
base="https://github.com/dfinity/icp-cli/releases/download/${tag}"

# Assert expected formula structure
assert_line() {
  local lineno=$1 pattern=$2
  local line
  line=$(awk "NR==$lineno" "$file")
  if ! [[ "$line" =~ $pattern ]]; then
    echo "Error: line $lineno does not match expected pattern" >&2
    echo "  expected: $pattern" >&2
    echo "  got:      $line" >&2
    exit 1
  fi
}
assert_line 4  'version "'
assert_line 14 'sha256 "'
assert_line 18 'sha256 "'
assert_line 26 'sha256 "'
assert_line 30 'sha256 "'

# Map line numbers to targets
declare -A line_target=(
  [14]=aarch64-apple-darwin
  [18]=x86_64-apple-darwin
  [26]=aarch64-unknown-linux-gnu
  [30]=x86_64-unknown-linux-gnu
)

# Read file into array
mapfile -t lines < "$file"

# Update version (line 4, array index 3)
lines[3]="  version \"${version}\""

# Update sha256 lines
for lineno in 14 18 26 30; do
  target="${line_target[$lineno]}"
  sha=$(curl -sfL "${base}/icp-cli-${target}.tar.xz.sha256" | awk '{print $1}')
  idx=$((lineno - 1))
  lines[$idx]="      sha256 \"${sha}\""
done

# Write back
printf '%s\n' "${lines[@]}" > "$file"
