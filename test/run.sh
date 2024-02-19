#!/bin/bash

# inject the environment variables
source "./.env.local"

dir="$(git rev-parse --show-toplevel)"

export GITHUB_SHA="69a3b64e5b36db68b54ca7291d8acfde261dda76"
export DISCORD_URL="$DISCORD_CI_CD_WEBHOOK_URL"
export GITHUB_REPOSITORY="DiscordHooks/github-actions-discord-webhook"
export GITHUB_REF="refs/heads/4/merge" # refs/heads/feature/new-stuff
export HOOK_OS_NAME="Windows"
export WORKFLOW_NAME="Main Pipeline"
export GITHUB_EVENT_NAME="pull_request" # Could also be push, ext.

"$dir/send.sh" Success $DISCORD_URL
