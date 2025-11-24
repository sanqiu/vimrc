### Metasploit
> Created Saturday 30 August 2014

- search NAME: 
- back
- connect ##
- -s ssh
- -u udp
- info

- irb ## enter into a real time ruby interpreter
- jobs

### use module
- show options/actions
- set VAR VAL
- set payload ....
- run/check

### load plugin
> {auxiliary
> encoders
> exploits
> nops
> payloads
> post
> }
##### install gem budler
> Allowing password authentication to access postgres on localhost

- Allow the possibility for account msf_user to use password based authentication to connect to databasse msf_user. Edit "/var/lib/pgsql/data/pg_hba.conf", change:

> host     all            all            127.0.0.1/32          ident
to
> host    "msf_database"	"msf_user"      127.0.0.1/32          md5
> host     all             all            127.0.0.1/32          ident
- See also: Postgresql Wiki: Client Authentication and Postgresql Documentation: pg_hba.conf

##### Starting postgres

> user@magnolia:$ sudo -s
> user@magnolia:$ postgresql-setup initdb
> user@magnolia:$ systemctl start postgresql.service
> Becoming the postgres user
> root@magnolia:# su postgres

##### Creating a database user

> postgres@magnolia:$ createuser msf_user -P
> Enter password for new role: yourmsfpassword
> Enter it again: yourmsfpassword 
> Shall the new role be a superuser? (y/n) n
> Shall the new role be allowed to create databases? (y/n) n
> Shall the new role be allowed to create more new roles? (y/n) n

##### Creating a database
- using ENVIRONMENT: 
> export MSF_DATABASE_CONFIG=file/to/the/database.yml
> echo $MSF_DATABASE_CONFIG

- postgres@magnolia:$ createdb --owner=msf_user msf_database
- Configure Metasploit
- Start the framework by running msfconsole, then enter the following commands:

> msf > db_status 
> [ * ]postgresql selected, no connection
> msf> db_connect msf_user: yourmsfpassword@ 127.0.0.1:5432/msf_database
> NOTICE:  CREATE TABLE will create implicit sequence "hosts_id_seq" for serial column "hosts.id"
> NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "hosts_pkey" for table "hosts"
> [..]
> NOTICE:  CREATE TABLE will create implicit sequence "mod_refs_id_seq" for serial column "mod_refs.id"
> NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "mod_refs_pkey" for table "mod_refs"

### Enable the database on startup ==

- Write the database configuration to separate configuration file so the password doesn't get printed on the screen during each start of the msfconsole.Please not the attributes are prepended with spaces characters not tabs.

> $ cat > /opt/metasploit4/config/database.yml << EOF
>> production:
	adapter: postgresql
	database: msf_database
	username: msf_user
	password: yourmsfpassword
	host: 127.0.0.1
	port: 5432
	pool: 75
	timeout: 5
>> EOF
- Use the database configuration file and connect to this database during each startup of msfconsole. Also change to the workspace of yur current pentesting project.

>> $ cat > ~/.msf4/msfconsole.rc << EOF
db_connect -y /opt/metasploit4/config/database.yml
workspace -a YourProject
>> EOF

##### Using the database

- Once you have database configured and connected you can use it to store information. First check the database status:

> msf > db_status
> [*] postgresql connected to msf_database

##### Scan the local network network:

> msf > db_nmap 192.168.1.0/24

##### List hosts  in the database:

> msf > hosts

>> Hosts

>> address        mac                name       os_name  os_flavor  os_sp  purpose  info  comments
>> -------        ---                ----       -------  ---------  -----  -------  ----  --------
>> 192.168.1.1    11:22:33:44:55:66  router     Linux    2.6.X             device         
>> 192.168.1.100  22:33:44:55:66:77  mixer      Linux    2.6.X             device         

##### List all the db command:

> msf > help database

##### Database Backend Commands
>>
	Command        Description
	-------        -----------
	creds          List all credentials in the database
	db_connect     Connect to an existing database
	db_disconnect  Disconnect from the current database instance
	db_export      Export a file containing the contents of the database
	db_import      Import a scan result file (filetype will be auto-detected)
	db_nmap        Executes nmap and records the output automatically
	db_status      Show the current database status
	hosts          List all hosts in the database
	loot           List all loot in the database
	notes          List all notes in the database
	services       List all services in the database
	vulns          List all vulnerabilities in the database
	workspace      Switch between database workspaces
>>

##### Troubleshooting

- If you run into issues, or need to modify the user or database, you can always use the psql command to do this. Asusming you're using IDENT authentication (default on Fedora and RHEL), you'll have to become the 'postgres' user before you can modify users or databases with psql. (see Becoming the postgres user above)

>> To list databases ==
postgres@magnolia:$ psql -l
To assign ownership of a database
To change the owner of a database, pass the following command to psql: "ALTER DATABASE name OWNER TO new_owner" For example:

postgres@magnolia:$ psql -c "ALTER DATABASE msf_database OWNER TO msf_user;" 
To add or change the password for a user
To change the password for a postgres user, pass the following command to psql: "ALTER USER username WITH ENCRYPTED PASSWORD 'passwd';" For example:

postgres@magnolia:$ psql -c "ALTER USER msf_user WITH ENCRYPTED PASSWORD 'omgwtfbbq';" 
>>
##### To drop a database
> Postgres provides a handy 'dropdb' command.

postgres@magnolia:$ dropdb msf_database

##### To drop a user
> Postgres provides a handy 'dropuser' command.

- postgres@magnolia:$ dropuser msf_user

- Other useful postgres tips
> psql is a handy tool if you need to modify anything inside the postgres system. If you prefer a graphical tool, pgadmin3 is quite good. For more information, see the (extensive) documentation here: http://www.postgresql.org/docs/manuals/

##### psql commands
>> select version(); - show the db version
\h - get help
\q - quit
