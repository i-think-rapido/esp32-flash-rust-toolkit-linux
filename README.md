# esp32 Rust CLI in a Docker Container with convenience Shell Scripts

This guide helps you set up a command line flashing environment of 
embedded systems supported by esp32 Rust for linux based systems
(unfortunately not WSL).

---

The following walkthrough helps patching the `/dev` folder into
the container, so it is available with root access.

For futher usage, we use the esp32 xtensa toolchain within the container.
This wraps the toolchain in a consistant and safe environment.

**Restrictions**
    
This project runs on Linux systems only. (no WSL)

**Prerequisites** 

The docker engine must be running on your linux system. 
For installing the docker engine, look at the [installations guide (ubuntu)](https://docs.docker.com/engine/install/ubuntu/). 
Other installation guides must be looked up on the internet.

## One-Time Setup

First we need to create the docker image.

Switch into this projects folder and execute

```bash
# in this projects folder
./build.sh
```

## Working on your Project

When starting to work on your project, you must assure, that
the controller is attached to your usb port and powered up.

Ensure that the controller is available in the `/dev` folder.
Usually this is `/dev/ttyUSB0`, but can be different, 
depending on circumstances on your OS.

The presense of this device ensures the proper patching into the
docker container. If you try to spin up the container before the USB device is attached to the computer, it won't be availabe in 
the container later on despite you reattache your device. 
(This is a common mistake, so be warned.)

    All following commands have to be executed within
    your project's folder.

So, at the start of your programming session, you have to spin up the container each time.

```bash
# in the esp32 projects folder
<path-to-this-project>/run-docker.sh
```

Try this procedure first, when you have trouble setting up the
development environment.

# Your Working Session

Upload your flash image (repeated)

    Make sure, that you set your embedded device in upload mode.

```bash
# in the esp32 projects folder
<path-to-this-project>/flash.sh <additional options like --mirror>
```

This will build the firmware and flash your device.

---

I hope you'll find this project useful.