#!/bin/bash

git checkout deploy
git reset --hard origin/master

npm install
npm run build

find * -maxdepth 0 -name 'build' -prune -o -exec rm -rf '{}' ';'

mv ./build/* .

git rm -rf --cache .
git add .
git commit -m "Deploy"

git push origin deploy --force

git checkout master
