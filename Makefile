.PHONY: build
build:
	docker buildx build -t supernomad111/bucket-storage-backups:latest -f Dockerfile --platform linux/amd64,linux/arm64 --push .
