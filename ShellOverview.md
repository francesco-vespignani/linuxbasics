# A fast and dirty booting route

The shell commands run processes ... also bombs, 
**DO NOT RUN FOLLOWING COMMANDs !!!!**

~~~bash
:(){ :|:& };:
~~~

See [https://en.wikipedia.org/wiki/Fork_bomb](https://en.wikipedia.org/wiki/Fork_bomb)

~~~bash
rm -Rf /
~~~

**Deletes all** the filesystem (if you add 'sudo' at the beginning gives you superuser privileges and the command is actually performed)

You can try this:

~~~bash
shutdown -h now
~~~

a "not so gentle" shutdown.

###  first steps

To see linux processes use ps:

~~~bash
ps
ps -f
ps -fA
~~~

Manual pages

~~~bash
man ps
~~~

To understand who you are and where you are: 

~~~bash
whoami
id
pwd
whereis bash
~~~

*Exercises:* 

- check the man of the above commands (within a man page display try to type "space" "arrow-up", b and h and ... q)
- try some other whereis

### interacting with the shell

- tab completion, history with arrow up
- Ctrl+Shift-C, Ctrl+Shift-V

###  nerdy jokes

A nerd joke:
[ whereis my brain?
~~~
[ whereis my brain?
~~~

For other jokes and tricks see:\\

[https://www.tecmint.com/funny-linux-commands/](https://www.tecmint.com/funny-linux-commands/])
or google for "linux shell jokes and tricks"

### going around

*Exercises:* 

go a bit around the filesystem with cd, pwd, ls

try ls -f

Hint: use special path symbols and tab to move easier:

. current folder

.. partent folder

~ home

/ root directory


### disk usage

Get an idea of disk usage with df, du (-h  human readable),  find files with find

~~~
 df -h
 du -h -d 1
 find .
 man find
~~~

Try the following (and stop it with Ctrl-C):

~~~
cd /
find .
~~~

We'll understand later the details but, try this:

~~~
whoami | xargs ps -fu
~~~

The simpler command:

~~~
echo hallo world
~~~

~~~
man ps >  afile.txt
~~~

Piping ...

~~~
echo hallo world | cat
~~~

###  create files and folders

let's make a folder go into it and start playing with files

~~~
mkdir test
ls 
cd test
pwd
ls
~~~

~~~
echo hallo world > file.txt
ls

man ps > file2.txt
ls

touch pippo
ls
~~~

Check rm and mv to remove (delete) and rename (move)

###  terminal display and terminal pagers

~~~
cat file2.txt
more file2.txt 
less file2.txt
~~~

see man more

more has many interactive commands we can invoke by keystrokes:

-    space – go to the next page in accordance with the terminal’s size

-    b – go back one page

-    enter – scroll down one line

-    = – display the current line number

-    :v – start up the vi text editor at the current line

The vi or vim (!) are editors, I suggest to use nano

Other redirections, errors and standard output are different streams:
 
~~~
[ whereis my brain? > pippo
[ whereis my brain? 2> pippo
~~~

You can also append the output with >>

~~~
echo hallo > pippo
echo hallo >> pippo
echo hallo >> pippo
echo hallo >> pippo
echo hallo >> pippo
~~~

*Exercise:* check pippo with cat in the different cases

Trash the output:

~~~
echo hallo > /dev/null
~~~

What is there in  /dev ?

~~~
ls /dev
tty
~~~

*Exercise:* open two terminals and echo hallo from one terminal to the other



###  shell programs are files

Variables

~~~
a=ciao
echo $a
~~~

Errors

~~~
a = ciao
a=ciao bello
~~~


Different quotes:

~~~
a="ciao bello"
a='ciao bello' 
echo "$a"
echo '$a'
~~~

Special variables (environment):


~~~
echo $HOME
echo $PATH
echo $0
echo $1
env
~~~

Your first program:

~~~
echo 'echo $1' > mycmd
chmod +775 mycmd
./mycmd
./mycmd pippo gianno maria
echo 'echo $3' > mycmd
./mycmd pippo gianno maria
~~~

A note on chmod, see man chmod, owner, group users

Multiple commands in sequence or in parallel

~~~
cowsay ciao; sleep 2
sleep 2; cowsay ciao
sleep 2| cowsay ciao
~~~


An infinite loop (the second is better for your cpu):

~~~
while true ; do continue ; done
~~~

~~~
while true ; do seleep 1 ; done
~~~


To see performances use top:

~~~
top
htop
~~~

Another little "bomb" (be ready to kill is with Ctrl-C)

~~~
while true
do
   mkdir pippo
   cd pippo
done
~~~

Go up and remove:


~~~
rm -R pippo/
~~~


### Signals

Ctrl-Z Ctrl-C fg, bg

Sleep for 500 seconds and ... kill it:

~~~
sleep 500
Ctrl-C
~~~

Run the process in background (give the terminal use back immediately):

~~~
sleep 500 &
jobs
ps
~~~

Multiple processes in parallel

~~~
sleep 200 &
sleep 500
Ctrl-Z
~~~

Pause the first job and restart it:

~~~
kill -n 19 %1
jobs
kill -s SIGCONT %1
jobs
~~~


Really kill it (see man kill):

~~~
kill -n 9 %1
jobs
~~~

Kill can be used with jobs and with processes (see jobs, ps, above),  some useful kill codes  follow.

0 - ? 

1 - SIGHUP - ?, controlling terminal closed, 

2 - SIGINT - interupt process stream, ctrl-C 

3 - SIGQUIT - like ctrl-C but with a core dump, interuption by error in code, ctl-/ 

9 - SIGKILL - terminate immediately/hard kill, use when 15 doesn't work or when something disastrous might happen if the process is allowed to cont., kill -9 

15 - SIGTERM - terminate whenever/soft kill, typically sends SIGHUP as well? 

18 - SIGCONT - Resume process, ctrl-Z (2nd)

19 - SIGSTOP - Pause the process / free command line, ctrl-Z (1st)

30 - SIGPWR - shutdown, typically from unusual hardware failure 
 


*Exercise:*

Open R, Python, Matlab (if these are installed) in the same terminal using &, Ctrl-Z, jobs, fg, bg, to switch beween them.

Hint for matlab start it as:

~~~
matlab -nosplash -nodesktop
~~~


###  Some more formal introduction from linuxjourney

[the shell](https://linuxjourney.com/lesson/the-shell)

[file permissions](https://linuxjourney.com/lesson/file-permissions)

[users and groups](https://linuxjourney.com/lesson/users-and-groups)

[monitor processes](https://linuxjourney.com/lesson/monitor-processes-ps-command)

[tracking processes](https://linuxjourney.com/lesson/tracking-processes-top)


