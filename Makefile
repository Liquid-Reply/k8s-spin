.PHONY: default
default:
	cargo build --manifest-path=env-explorer/Cargo.toml --target wasm32-wasi --release

.PHONY: example-1
example-1:
	kubectl apply -f example-1-sidecars/deploy_spin-sidecars.yaml

.PHONY: sidecars
sidecars: example-1

.PHONY: example-2
example-2: install-redis
	kubectl apply -f example-2-redis/deploy_spin-redis.yaml

.PHONY: install-redis
install-redis:
	kubectl apply -f example-2-redis/redis.yaml
#   Not using Helm-Chart as I haven't found a way to deploy without PW
#   helm repo add bitnami https://charts.bitnami.com/bitnami
#   helm repo update
#   helm upgrade --install --atomic \
#   	--set-string global.redis.password="" \
#   	--set auth.enabled=true \
#   	--set-string architecture="standalone" \
#   	example2-redis bitnami/redis

.PHONY: redis
redis: example-2

.PHONY: clean
clean:
	kubectl delete -f example-1-sidecars/deploy_spin-sidecars.yaml
	kubectl delete -f example-2-redis/deploy_spin-redis.yaml
