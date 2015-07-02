## Installation

1. Clone this repo
1. Install [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)
1. `vagrant up`
1. `vagrant ssh`

This will create a ubuntu virtual machine with gitlab running. By default, web port forwards to `8080` and ssh port forwards to `8022`. You can change that in [Vagrantfile](Vagrantfile#L26~L27).

## Customization

### Hostname

Change `config.vm.hostname = "gitlab.local"`<sup>[link](Vagrantfile#L16)</sup> to your own hostname. This will be hostname of your site.

Without a valid hostname, your mail sent to Gmail will be blocked.

### Port forwarding

#### HTTP connection

Result in Gitlab being available on [http://192.168.33.20/](http://192.168.33.20/)

Or in hosts file, add lines to Result in Gitlab being available on [http://gitlab.local](http://gitlab.local)

```sh
192.168.33.20   gitlab.local

```

#### SSH Port

Instead of a HHTP connection to a SSH Ports, add line `config.vm.network "forwarded_port", guest: 22, host: 8022`<sup>[link](Vagrantfile#L27)</sup>, replace `8022` to any port you want ssh to connect.

Git client side need to configure ssh to connect to this port by default. Append following lines to `~/.ssh/config`.

```sh
Host gitlab.local # replace with your hostname
  Port 8022            # replace with your ssh port
```

#### Web Port

Find line `config.vm.network "forwarding_port", guest: 80, host: 8080`<sup>[link](Vagrantfile#L26)</sup>, replace `8080` to any port you want your host to listen HTTP requests.

## Start

Username | Password
---------|-----------
root     | 5iveL!fe     
