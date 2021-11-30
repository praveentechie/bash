#!/bin/sh
BRANCH_NAME=$(git branch | grep \* | cut -d ' ' -f2)
echo "committing to branch $BRANCH_NAME"
read -p "Enter Commit message: "  COMMIT_MSG:wq

echo $(git commit -m "$BRANCH_NAME: $COMMIT_MSG")
