#!/usr/bin/env python

""" check_openstack

Usage:
    check_openstack (--nova | --neutron) -u <username> -p <password> -t <tenant> [-a <auth_url>]
    check_openstack (--nova | --neutron) -c <filename>

Options:
    --nova                   Perform authentication and query check against Nova service.
    --neutron                Perform authentication and query check against Neutron service.
    -c --conf <filename>     File from which to read configuration.
    -u --user <username>     Username to authenticate against the service.
    -p --pswd <password>     Password for the user to authenticate with.
    -t --tenant <tenant>     Tenant or project id the user belongs to.
    -a --auth <auth_url>     Service authentication url [default: https://cloud.forgeservicelab.fi:5001/v2.0/]
"""

from docopt import docopt, DocoptExit
from novaclient.v1_1 import client as novaclient
from neutronclient.v2_0 import client as neutronclient

class Bunch(dict):
    def __init__(self, adict):
        self.__dict__.update(adict)

def check_nova(args):
    nova = novaclient.Client(auth_url=args.auth, username=args.user, api_key=args.pswd, project_id=args.tenant)
    try:
        flavors = nova.flavors.list()
        print 'OK - Nova successfully returned a flavor list.'
    except Exception as ex:
        print 'CRITICAL - Nova returned an exception: %s' % ex
        exit(2)

def check_neutron(args):
    neutron = neutronclient.Client(auth_url=args.auth, username=args.user, password=args.pswd, tenant_name=args.tenant)
    try:
        token = neutron.list_subnets()
        print 'OK - Neutron successfully returned a list of networks.'
    except Exception as ex:
        print 'CRITICAL - Neutron returned an exception: %s' % ex
        exit(2)

if __name__ == '__main__':
    try:
        arguments = Bunch(dict((k.strip('-'),v) for (k,v) in docopt(__doc__).iteritems()))

        if (arguments.conf):
            with open(arguments.conf) as f:
                for line in f:
                    (k,v) = line.split(':')
                    arguments.__dict__[k] = v.strip()

        if (arguments.nova):
            check_nova(arguments)
        else:
            check_neutron(arguments)

    except DocoptExit as ex:
        print ex
        exit(-1)

