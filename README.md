# dofus-docker

This is an unofficial Docker image for running [Dofus](https://www.dofus.com).

## Prerequistes

* Have Docker (client & daemon) installed.
* Use X11 (Wayland not supported).

## Usage

Simply run the script, as a non-root user :

```sh
./run
```

## Notes

* A `home` directory will be created and used as a volume for persisting data.
* Authentication to the XOrg server is done by mounting "$XAUTHORITY" inside the container.
* Docker is invoked using `sudo`. You can edit the script if this doesn't suit you.

## TODO

* Add sound support.
