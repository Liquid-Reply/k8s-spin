# Spin using Sidecars on Kubernetes

## Scenario

This scenario will demonstrate deployment and configuration a Spin application sharing an ephemeral volume with a content providing container.

The sidecar container will continuously pull a git repository which contains an `index.html` that will be served by the Spin application.

[insert image here]

## Known-Issues

At this point in time the spin-static-file server performs a local copy of the served directory. As a consequence the server will not be able to detect or serve updated files.

This behavior can be circumvented by using the `--direct-mounts` flag of `spin up` command. Unfortunately this is not yet possible using [containerd-shim-spin-v1](https://github.com/deislabs/containerd-wasm-shims/tree/main/containerd-shim-spin-v1).
