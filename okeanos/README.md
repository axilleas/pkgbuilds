* Archlinux pkgbuilds for the [Okeanos Infrastructure] (https://okeanos.grnet.gr/welcome/).
* Precompiled binaries can be found at http://animal.foss.ntua.gr/~axil/archlinux/okeanos

Currently there is only `kamaki` tool included.

#./kamaki
By invoking `kamaki` you get a list of permittable operations. 

    usage: kamaki <group> <command>

```	

  config       Configuration commands
	|		
	|--	list			List configuration options
	|--	get				Show a configuration option
	|--	set				Set a configuration option
	`--	delete 			Delete a configuration option (and use the default value)
	|
	|
  server       Compute API server commands
	|
	|--	list			List servers
	|--	info			Get server details
	|--	create			Create a server
	|--	rename			Update a server's name
	|--	delete			Delete a server
	|--	reboot			Reboot a server
	|--	start			Start a server
	|--	shutdown		Shutdown a server
	|--	console			Get a VNC console
	|--	firewall		Set the server's firewall profile
	|--	addr			List a server's addresses
	|--	meta			Get a server's metadata
	|--	addmeta			Add server metadata
	|--	setmeta			Update server's metadata
	|--	delmeta			Delete server metadata
	`--	stats			Get server statistics
	|
	|
  flavor       Compute API flavor commands
	|
	|--	list			List flavors
	`--	info			Get flavor details
	|
	|
  image        Compute or Glance API image commands
	|
	|--	list			List images
	|--	info			Get image details
	|--	delete			Delete image
	|--	properties		Get image properties
	|--	addproperty		Add an image property
	|--	setproperty		Update an image property
	|--	delproperty		Delete an image property
	|--	public			List public images
	|--	meta			Get image metadata
	|--	register		Register an image
	|--	members			Get image members
	|--	shared			List shared images
	|--	addmember		Add a member to an image
	|--	delmember		Remove a member from an image
	`--	setmembers		Set the members of an image
	|
	|
  network      Compute API network commands (Cyclades extension)
	|
	|--	list			List networks
	|--	create			Create a network
	|--	info			Get network details
	|--	rename			Update network name
	|--	delete			Delete a network
	|--	connect			Connect a server to a network
	`--	disconnect		Disconnect a server from a network
	|
	|
  store        Storage API commands
	|
	|--	create			Create a container
	|--	container		Get container info
	|--	list			List objects
	|--	upload			Upload a file
	|--	download		Download a file
	|--	delete			Delete a file
	`--	purge			Purge a container
	|
	|
  astakos      Astakos API commands
	|
	`--	authenticate		Authenticate a user
```

###kamakirc
If you own an account at okeanos, remeber to copy `kamakirc` to `$HOME/.kamakirc` and place your API key to global configuration.

###Example
#### Rebooting a server
By invoking 

    $ kamaki server list

we get a list of our available servers. Let's say we have two of them:

    2800 ftpbackup
    2801 webserver

With the following command we reboot our `ftpbackup` with key-id `2800`:

    $ kamaki server reboot 2800

