# CLI installer

A one-line installer which installs closeheat CLI package and sets up access tokens.

#### With token
The idea is to make install and auth a breeze.
The command looks something like this:

```sh
https://install.closeheat.com/S4f3Us3rT0k3n | sh
```

#### Without token
The installer can be run without user token -  user will be forced to login before the first deploy.

```sh
https://install.closeheat.com | sh
```

#### Code style
Please keep the code **beautiful and simple** so the users can read what they are executing with pleasure.
