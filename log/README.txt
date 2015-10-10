A simple bash script that opens up a window prompting the user to enter some text.
The input is saved to a file along with the date and time of entry.

It is intended to be run as a cron job every hour so that you can keep track of your daily activity and productivity.

By default, the script writes to log.txt in its current directory.
You can optionally specify a file to write to by using -f, e.g.
bash log.sh -f /path/to/file.txt
