# Development environment
.PHONY: dev
dev:
	docker-compose -f docker/docker-compose.dev.yml up

# Production environment
.PHONY: prod
prod:
	docker-compose -f docker/docker-compose.prod.yml up

# Build Docker images for development
.PHONY: build-dev
build-dev:
	docker-compose -f docker/docker-compose.dev.yml build

# Build Docker images for production
.PHONY: build-prod
build-prod:
	docker-compose -f docker/docker-compose.prod.yml build

# Clean up all Docker resources
.PHONY: clean
clean:
	docker-compose -f docker/docker-compose.dev.yml -f docker/docker-compose.prod.yml down --rmi all --volumes --remove-orphans

# Build and run development environment
.PHONY: dev-build
dev-build:
	docker-compose -f docker/docker-compose.dev.yml up --build

# Build and run production environment
.PHONY: prod-build
prod-build:
	docker-compose -f docker/docker-compose.prod.yml up --build


# 環境変数はfargateで指定するのがベターな姿
# デプロイ当時の環境変数がわかるように。
# Dockerfile内に書くのは「環境」としての切り訳が曖昧にもなる。
