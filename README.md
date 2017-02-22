# vagrant-docker
Init docker vagrant machine, possibly offline

Spins up ready to use docker VM.

## Usage:

```bash
> vagrant up
```

WARNING: Before issuing vagrant up make sure all ports you need is set
in Vagrantfile.

Only specfied here ports will be available on host.

```bash
  config.vm.network :forwarded_port, guest: 1433, host: 1433
```
