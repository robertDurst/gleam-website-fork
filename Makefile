.PHONY: watch serve

# Default port for the server
PORT ?= 8001

# Watch for changes and rebuild
watch:
	@echo "Watching for changes... (press Ctrl+C to stop)"
	@while true; do \
		gleam run; \
		echo "\nWaiting for changes in src/, priv/, posts/, case-studies/..."; \
		fswatch -1 -r src/ priv/ posts/ case-studies/ gleam.toml 2>/dev/null || \
		find src/ priv/ posts/ case-studies/ gleam.toml -type f 2>/dev/null | entr -d -p echo "Change detected"; \
	done

# Start the development server
serve:
	@echo "Starting server on port $(PORT)..."
	@node server.js $(PORT)

