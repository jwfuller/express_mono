#!/bin/bash

git config --global user.email "osr_web_deploy@colorado.edu"
git config --global user.name "osrwebdeploy"

echo Start script...
echo Cloning express-mono-upstream
git clone https://osrwebdeploy:$TOKEN@github.com/CuBoulder/express-mono-upstream.git
cd express-mono-upstream
echo Creating new branch $GITHUB_REF
git checkout -b $GITHUB_REF
cd profiles
rm -rf express
echo Cloning express_mono $GITHUB_REF into express-mono-upstream
git clone https://osrwebdeploy:$TOKEN@github.com/CuBoulder/express_mono.git --branch $GITHUB_REF --single-branch express
git add express
git commit -m "Updating express_mono to $GITHUB_REF"
echo Pushing changes...
git push --set-upstream origin $GITHUB_REF

TITLE="Update express_mono to ${GITHUB_REF}"; 
BODY="Pull Request Generated by Github Actions";

DATA="{\"title\":\"${TITLE}\", \"body\":\"${BODY}\", \"base\":\"master\", \"head\":\"${GITHUB_REF}\"}";

echo Sending pull request
curl -sSL -H "Authorization: token ${TOKEN}" -H "application/vnd.github.v3+json" -X POST --data "${DATA}" https://api.github.com/repos/CuBoulder/express-mono-upstream/pulls

echo End Script...