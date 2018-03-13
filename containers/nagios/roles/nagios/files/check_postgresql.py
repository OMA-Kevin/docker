#!/usr/bin/env python

"""check_postgresql

Usage:
    check_postgresql (-h | --help)
    check_postgresql (-r | --replication) -w <warn> -c <crit>
    check_postgresql [-H <hostname> | -I <ip_address>] [-p <port>] [-d <database>] [-u <username>] [-P <password>]
    check_postgresql (-r | --replication) [-H <hostname> | -I <ip_address>] [-p <port>] [-d <database>] [-u <username>] [-P <password>] -w <warn> -c <crit>

Options:
    -h --help                     Show this screen and exit.
    -r --replication              Check replication status on the local host.
    -w --warning <warn>           Replication delay warning threshold in seconds.
    -c --critical <crit>          Replication delay critical threshold in seconds.
    -H --host <hostname>          FQDN of the host to connect to.
    -I --IP_address <ip_address>  IP address of the host to connect to.
    -p --port <port>              Port where the postgresql server is listening [default: 5432].
    -d --database <database>      Name of the database to connect to [default: postgres].
    -u --username <username>      Name of the user with which to connect to the database.
    -P --password <password>      Password of the user with which to connect to the database.

When not using the '-r' option, the test is an attempt to connect, returning OK on success and CRITICAL otherwise.
"""
import psycopg2
from docopt import docopt, DocoptExit

class Bunch(object):
    def __init__(self, adict):
        self.__dict__.update(adict)

def check_connectivity(args):
    try:
        conn = psycopg2.connect(database=args.database, user=args.username, password=args.password, host=args.host or args.IP_address, port=args.port)
        print 'OK - Connection to database \'%s\' was successful' % args.database
    except psycopg2.Error as e:
        if e.pgcode and e.pgerror:
            print 'CRITICAL - Connection failed with error code \'%s\': %s' % (e.pgcode, e.pgerror)
        elif hasattr(e, 'message'):
            print 'CRITICAL - Connection failed (reason): %s' % e.message
        else:
            print 'CRITICAL - Connection failed for unknown reasons.'
        exit(2)

def check_replication(args):
    try:
        conn = psycopg2.connect(database=args.database, user=args.username, password=args.password, host=args.host or args.IP_address, port=args.port)
        cur = conn.cursor()
        cur.execute('SELECT CASE WHEN pg_last_xlog_receive_location() = pg_last_xlog_replay_location() THEN 0 ELSE EXTRACT (EPOCH FROM now() - pg_last_xact_replay_timestamp()) END AS log_delay;')
        delay = cur.fetchone()[0] # The above query returns a tuple, we just want the first value.
        cur.close()
        conn.close()

        if delay > float(args.critical):
            print 'CRITICAL - Replication delay exceeds critical threshold. | delay=%ss;%s;%s' % (delay, args.warning, args.critical)
            exit(2)
        elif delay > float(args.warning):
            print 'WARNING - Replication delay exceeds warning threshold. | delay=%ss;%s;%s' % (delay, args.warning, args.critical)
            exit(1)
        print 'OK - Replication delay is below all thresholds. | delay=%ss;%s;%s' % (delay, args.warning, args.critical)

    except psycopg2.Error as e:
        if e.pgcode and e.pgerror:
            print 'UNKNOWN - Check failed with error code \'%s\': %s' % (e.pgcode, e.pgerror)
        elif hasattr(e, 'message'):
            print 'UNKNOWN - Check failed (reason): %s' % e.message
        else:
            print 'UNKNOWN - Check failed for unknown reasons.'
        exit(3)


if __name__ == '__main__':
    try:
        arguments = Bunch(dict((k.strip('-'),v) for (k,v) in docopt(__doc__).iteritems()))
    except DocoptExit as ex:
        print ex
        exit(-1)

    if (arguments.replication):
        if float(arguments.warning) < float(arguments.critical):
            check_replication(arguments)
        else:
            print 'The warning threshold must be lower than the critical threshold.'
            print (__doc__)
            exit(-1)
    else:
        check_connectivity(arguments)
