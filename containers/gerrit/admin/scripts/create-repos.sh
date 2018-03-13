h="$1"
REPOS=$(cat /tmp/repolist)
echo $REPOS
for repo in $REPOS;
do
 echo 
 r=$(echo $repo | sed 's/\.git$//g') 
 
 echo creating repo $r on $h
 ssh $h -p 29418 -l $LOGNAME gerrit create-project --name $r

done




