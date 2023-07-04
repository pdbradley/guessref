# Guessref

Guessref has been dockerized, so getting it up and running in development is not supposed to be hard.

Assuming you have docker installed, you should be able to go into the root of the project
where the docker-compose.yml file is, and simply type

```docker-compose up```

This should build or pull, then run, the images you need (basically to run rails, postgres, and redis)

I hope my docker terminology is correct.  

Note that locally, if you have ports 3000, 5432, or 6379 occupied, ```docker-compose up``` will break, so make sure you have terminated any competing processes that use those ports. 

## Editing files and running rails commands 

Any changes to the files in the project will be reflected in the rails docker app, because the directory
in the local filesystem is linked to the one inside the rails docker container.

So if you are working on the front end and not really creating new rails classes or database tables, you should be good to go, you can make changes and see them immediately at localhost:3000

**But** during development, any rails commands like ```rails generate <whatever>``` or ```rake db:migrate``` will need to be run inside the rails container (not in your local terminal in the project folder as you might be accustomed).  You run commands in a container like this:

```docker exec -it <container_name> <command>```

The ```-it``` flags stand for interactive and tty, and they matter if you ever want your command to be "bash" or something with a shell.  
They don't cause any harm if your command is a one-off like a migration, so I tend to use those flags consistently.

So if you want to run a command in the rails container, how do you find the name of the container?  Try this:

```docker ps```

And the rightmost column will show you the name of the running rails container, for me it is usually "guessref_hotwire_web_1"

So to run rake db:migrate would be:

```docker exec -it guess_ref_hotwire_web_1 rake db:migrate```



## Debugging

Because the rails server runs in a container, tools like debugger or pry require a little bit more work.

To attach to the docker container when you have added a breakpoint run

```docker attach <container id>```


## Custom Colors

Edit /config/tailwind.config.js to define custom colors, then you can use them with tailwind like:

.bg-<customcolorname> # to set a background
.text-<customcolorname> # to set text color 
