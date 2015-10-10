Hello Internet is one of my favorite podcasts. It is produced by Brady Haran and CGP Grey.

This bash script checks whether a new episode has come out.
It is intended to be run as a cron job.

This program uses the CLI browser lynx to get the HTML content of "Hello Internet"'s iTunes page,
parses it and finds the number of the latest episode that has come out.

It saves that number to a file, and when the script runs for a second time, it uses this file to check if a new episode has been released.
If it has, it sends a notification using notify-send, and updates the file.

By default, the file used for storing the latest episode so far is called last_episode.txt and is stored in the current directory of the script.
You can specify a file to use by using the -f flag, e.g.
bash hello_internet_ep_check.sh -f my_file.txt
