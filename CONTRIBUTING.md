# Contributing

## Development Setup

```bash
make setup-dev
```

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>

[optional body]
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

Examples:

```
feat: add health check endpoint
fix: resolve memory leak in config parser
docs: update installation instructions
```

## Pull Request Process

1. Create a feature branch from `main`
2. Make changes following project conventions
3. Run linters: `make lint`
4. Build and test: `make build`
5. Submit PR with clear description

## Code Style

- Shell scripts: 2 spaces, `set -euo pipefail`
- YAML: 2 spaces
- Use shellcheck directives for intentional exceptions
