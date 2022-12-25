#!/bin/bash

apt-get update && apt-get install -y unzip

# protocolbufのインストール
curl -OL https://github.com/google/protobuf/releases/download/v3.19.4/protoc-3.19.4-linux-x86_64.zip
unzip protoc-3.19.4-linux-x86_64.zip -d protoc3
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/

# protoc-gen-docのインストール
go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@latest

# sshのセットアップ
# mkdir -p ~/.ssh
# chmod 700 ~/.ssh
# ssh-keyscan -H "$CI_SERVER_HOST" >> ~/.ssh/known_hosts
# eval "$(ssh-agent -s)"
# echo "$SSH_PRIVATE_KEY" | ssh-add - > /dev/null

# gitのセットアップ
git remote set-url origin https://github-actions:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

# docディレクトリがなければ作る
if [ ! -d ./doc ]; then
  mkdir ./doc
fi

# ドキュメント作成(markdownとhtmlの2種類を生成)
protoc \
  --doc_out=./doc \
  --doc_opt=html,index.html \
  ./**/*.proto

protoc \
  --doc_out=./doc \
  --doc_opt=markdown,index.md \
  ./**/*.proto

# ごみ削除
if [ -d ./protoc3 ]; then
  rm -r protoc3
fi

if [ -e protoc-3.19.4-linux-x86_64.zip ]; then
  rm protoc-3.19.4-linux-x86_64.zip
fi

# 差分があればコミットし直す
if [ `git status -s | wc -l` -gt 0 ]; then
  git add ./doc
  git commit -m 'update document'
  git push --push-option=ci.skip origin $CI_COMMIT_REF_NAME
  
  echo "Success commit"
else
  echo "Exit due to no difference"
fi