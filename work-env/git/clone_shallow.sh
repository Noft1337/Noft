#!/bin/bash

# This script clones a Git repository with a depth of 1 (shallow)
# and then fetches all associated tags without pulling the full history.

# --- Configuration ---
# Exit immediately if a command exits with a non-zero status.
_pwd=$(pwd)
set -e

# --- Validation ---
# Check if a repository URL was provided as an argument.
if [ -z "$1" ]; then
  echo "Error: No repository URL provided."
  echo "Usage: ./clone_shallow.sh <repository_url>"
  exit 1
fi

REPO_URL=$1
# Extract the repository name from the URL (e.g., "https://github.com/user/my-repo.git" becomes "my-repo").
REPO_NAME=$(basename "$REPO_URL" .git)

# --- Main Logic ---
echo "Performing a shallow clone of '$REPO_URL'..."
# Clone the repository with only the latest commit.
# The --no-tags flag can be used to ensure we start clean, though it's often the default for shallow clones.
git clone --depth 1 --no-tags "$REPO_URL"

# Change into the newly cloned repository's directory.
cd "$REPO_NAME"

echo "Fetching all tags and branches..."
# Fetch all tags from the remote. This will download the tag objects and the
# specific commits they point to, without downloading the entire history.
git fetch --tags
git fetch --all
echo "Fetched $(git tag | wc -l) tags"
echo "Fetched $(git branch -a | wc -l) branches"

echo "Repository '$REPO_NAME' is cloned with depth 1 and all tags are fetched."
cd "$_pwd"
