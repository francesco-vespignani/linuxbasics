# A fast and dirty booting route

The shell commands run processes ... also bombs, 
*DO NOT RUN FOLLOWING COMMANDs !!!!*

~~~bash
:(){ :|:& };:
~~~

See [https://en.wikipedia.org/wiki/Fork_bomb](https://en.wikipedia.org/wiki/Fork_bomb)

~~~bash
rm -Rf /
~~~

*Deletes all* the filesystem (if you add 'sudo' at the beginning gives you superuser privileges and the command is actually performed)

You can try this:

~~~bash
shutdown -h now
~~~

a "not so gentle" shutdown.

To see linux processes use ps:

~~~bash
> ps
> ps -f
> ps -fA
~~~

Manual pages

~~~bash
> man ps
~~~

To understand who you are and where you are: 

~~~bash
> whoami
> id
> pwd
> whereis bash
~~~

*Exercise:* check the man of the above commands (within a man page display try to type "space" "arrow-up", b and h and ... q)




