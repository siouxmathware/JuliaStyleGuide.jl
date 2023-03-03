#!/bin/bash
set -e
git clone https://x-token-auth:${ACCESS_TOKEN}@bitbucket.org/limebv/limebv.bitbucket.io.git
cp -r docs/build/* limebv.bitbucket.io/JuliaStyleGuide.jl
cd limebv.bitbucket.io
git config user.email "6401e75a93cf2599462ea026@bots.bitbucket.org"
git config user.name "Sioux Mathware Bitbucket Pipeline"
git add --all
git commit --allow-empty -m "Updated JuliaStyleGuide.jl from bitbucket"
git push

