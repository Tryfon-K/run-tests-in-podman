# Playwright Automation Tests

Automated end-to-end tests using [Playwright](https://playwright.dev/), executed inside containers using [Podman](https://podman.io/).

## Prerequisites

- Git
- Podman
- Node.js and npm (for the npm execution script)

## Getting Started

Clone the repository:

```bash
git clone <repository-url>
cd <repository-name>
```

## Option 1: Build and Run Using a Custom Image

Build the container image:

```bash
podman build -t playwright-tests:latest .
```

Execute all tests:

```bash
npm run test:podman
```

Alternatively, run directly through Podman:

```bash
podman run --rm playwright-tests:latest
```

## Run Specific Tests

Run a specific test file:

```bash
podman run --rm playwright-tests:latest npx playwright test tests/example.spec.js
```

Run tests by title:

```bash
podman run --rm playwright-tests:latest npx playwright test -g "test title"
```

## Test Reports

Test reports and execution artifacts are saved locally in:

- `playwright-report/`
- `test-results/`

View the HTML report (if configured):

```bash
npx playwright show-report
```
## Option 2: Run Tests Without Building an Image

Run the tests directly using the official Playwright image:

```bash
podman run --rm \
  -v "$PWD:/app:Z" \
  -w /app \
  mcr.microsoft.com/playwright:v1.64.1-noble \
  bash -c "npm ci && npx playwright test"
```
