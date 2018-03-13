git init
git remote add origin git@bitbucket.org:zenbook
git add . --all
echo "Kevin Hansen" >> contributors.txt
git add contributors.txt
git commit -m 'Initial commit with contributors'
git push -u origin master


