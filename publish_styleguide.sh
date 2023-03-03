git clone git@bitbucket.org:limebv/limebv.bitbucket.io.git
cp docs/build/* limebv.bitbucket.io.git/JuliaStyleGuide.jl
cd limebv.bitbucket.io.git
git config user.email "bitbucket@sioux.eu"
git config user.name "Sioux Mathware Bitbucket Pipeline"
git add --all
git commit --allow-empty -m "Updated JuliaStyleGuide.jl from bitbucket"
git push
