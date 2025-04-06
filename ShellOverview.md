# A fast and dirty booting route

The shell commands run processes ... also bombs, 
DO NOT RUN FOLLOWING COMMANDs !!!!

~~~
:(){ :|:& };:
~~~

See [https://en.wikipedia.org/wiki/Fork_bomb](https://en.wikipedia.org/wiki/Fork_bomb)

~~~bash
rm -Rf /
~~~

*Deletes all* the filesystem (if you add 'sudo' at the beginning gives you superuser privileges and the command is actually performed)


