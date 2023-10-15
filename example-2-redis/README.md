# Spin using Redis on Kubernetes

## Scenario

This scenario will demonstrate deployment and configuration a Spin application connecting to a Redis database.

## Known-Issues

At this point in time it is not possible to handover a `runtime_config.toml` to [containerd-shim-spin-v1](https://github.com/deislabs/containerd-wasm-shims/tree/main/containerd-shim-spin-v1). This means that the Spin application will not honor the `RUNTIME_CONFIG_FILE` environment variable and always use a local KV instead.

Therefore this scenario is not yet fully functional.