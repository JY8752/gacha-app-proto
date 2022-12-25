#!/bin/bash

apt-get update && apt-get install -y clang-format

find . -name "*.proto" | xargs clang-format -i

# gitのセットアップ
git remote set-url origin https://github-actions:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

# 差分があればコミットし直す
if [ `git status -s | wc -l` -gt 0 ]; then
  git add .
  git commit -m 'clang-format'
  git push --push-option=ci.skip origin $CI_COMMIT_REF_NAME
  
  echo "Success format"
else
  echo "Exit due to no difference"
fi