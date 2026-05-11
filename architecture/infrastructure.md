# Infrastructure Architecture

Use Docker for local and deployable service packaging. Use AWS with Terraform
for cloud infrastructure.

## Containers

Use separate containers for:

- frontend
- API
- worker
- PostgreSQL
- Redis

## Environments

- Keep development, staging, and production separate.
- Use environment variables for environment-specific configuration.
- Do not share production credentials with local development.
- Document required environment variables.

## AWS

Prefer managed services where practical:

- RDS for PostgreSQL
- ElastiCache for Redis
- S3 for file storage
- CloudFront for public assets
- CloudWatch or equivalent for logs and metrics

## Terraform

- Manage cloud infrastructure with Terraform.
- Keep modules small and understandable.
- Avoid hardcoding secrets in Terraform files.
- Use least-privilege IAM policies.
- Keep state secure.

## Operations

- Provide health checks for services.
- Log enough context to debug production issues.
- Monitor API errors, job failures, database health, and queue depth.
- Make deployments repeatable.
