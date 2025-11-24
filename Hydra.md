### Hydra
> Created Tuesday 18 November 2014

##### hydra
> 		[[[-l LOGIN|-L  FILE] [-p PASS|-P FILE|-x OPT]] | [-C FILE]] [-e nsr]
> 		[-u] [-f] [-F] [-M FILE] [-o FILE] [-t TASKS] [-w TIME] [-W TIME]
> 		[-s PORT] [-S] [-4/6] [-vV] [-d]
> 		server service [OPTIONAL_SERVICE_PARAMETER]

- -U servicename usrmanual about servicename
- -R restored session
- -S ssl
- -x min:max:charset  ## 5:7:1aA%*
- -e nsr additional checks, "n" for null password, "s" try login as pass, "r" try the reverse login as pass
- -C login:pass pair file
- -u first pass to all login and then next pass to all logins
- -M server list
- -o file  write found to file
- -t parallel task default 16
- -w time out
