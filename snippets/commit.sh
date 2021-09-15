#!/bin/sh
BRANCH_NAME=$(git branch | grep \* | cut -d ' ' -f2)
CHANGESET_NAME=$(git branch | grep "*" | sed 's/.*\///g')
echo "committing to branch: $BRANCH_NAME, changeset: $CHANGESET_NAME"
read -p "Enter Commit message: "  COMMIT_MSG
echo "$CHANGESET_NAME: $COMMIT_MSG"
echo $(git commit -m "$CHANGESET_NAME: $COMMIT_MSG")