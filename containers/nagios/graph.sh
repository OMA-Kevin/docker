#https://raymii.org/s/tutorials/Nagios_Core_4_Installation_on_Ubuntu_12.04.html
yum install -y perl-Digest-MD5.x86_64 perl-Nagios-Plugin.noarch perl-Nagios-Plugin-WWW-Mechanize.noarch
mkdir -p /usr/local/src/nagiosgraph/
cd /usr/local/src/nagiosgraph/
rm -rf nagiosgraph-git
git clone http://git.code.sf.net/p/nagiosgraph/git nagiosgraph-git


cd nagiosgraph-git
#Check that we have all the dependencies installed:

./install.pl --check-prereq
./install.pl --layout standalone --prefix /usr/local/nagiosgraph
echo go to
pwd
