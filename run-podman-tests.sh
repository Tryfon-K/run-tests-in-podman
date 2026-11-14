
#!/bin/bash
set -e

podman run --rm \
  -e PLAYWRIGHT_HTML_OPEN=never \
  -v "$(pwd):/app" \
  -v /app/node_modules \
  playwright-tests:lesson2 \
  npx playwright test "$@"
