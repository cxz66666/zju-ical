GIT_COMMIT_HASH := $(shell git rev-list -1 HEAD)

all: clean grsical-windows-amd64 grsical-linux-amd64 grsical-darwin-amd64 grsical-darwin-arm64

grsical-windows-amd64:
	GOOS=windows GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-windows-amd64 grs-ical/cmd/grsical

grsical-linux-amd64:
	GOOS=linux GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-linux-amd64 grs-ical/cmd/grsical

grsical-darwin-amd64:
	GOOS=darwin GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-darwin-amd64 grs-ical/cmd/grsical

grsical-darwin-arm64:
	GOOS=darwin GOARCH=arm64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-darwin-arm64 grs-ical/cmd/grsical

clean:
	-rm -f build/*

.PHONY: grsical-windows-amd64 grsical-linux-amd64 grsical-darwin-amd64 grsical-darwin-arm64 clean