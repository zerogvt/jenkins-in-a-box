## Vagrant machine to test out PoC

### Spec
Machine similar to the one I'm using for dev (Ubuntu 16.04)

### How to run
From within current directory run:
`vagrant up --provision`

If all goes well you should get Jenkins running inside your vagrant machine 
which is port forwarding its port to your host machine port 8181. I.e. you should be 
able to see Jenkins web page on `localhost:8181` from your local browser.



### Docker cheat sheet:
docker system prune
