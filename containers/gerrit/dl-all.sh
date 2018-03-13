repos=`ssh xvxax500 -p 29418 gerrit ls-projects   | grep -v "All-Users" | grep -v axios-qual | grep -v axios-dev | grep -v axios-media `
for r in $repos;
do
  echo downloading $r
  echo git clone ssh://x8693@xvxax500.oppd.oppd-ds.com:29418/$r
  git clone ssh://x8693@xvxax500.oppd.oppd-ds.com:29418/$r
  echo $r complete
  echo
done

