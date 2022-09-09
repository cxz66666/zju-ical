LIPO := /usr/bin/x86_64-apple-darwin-lipo
GIT_COMMIT_HASH := $(shell git rev-list -1 HEAD)

all: clean \
	grsical-windows-amd64 grsical-linux-amd64 grsical-linux-arm64 grsical-darwin-amd64 grsical-darwin-arm64 \
	grsicalsrv-windows-amd64 grsicalsrv-linux-amd64 grsicalsrv-linux-arm64 grsicalsrv-darwin-amd64 grsicalsrv-darwin-arm64 \
	merge-macos-binary

grsical-windows-amd64:
	GOOS=windows GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-windows-amd64.exe grs-ical/cmd/grsical

grsical-linux-amd64:
	GOOS=linux GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-linux-amd64 grs-ical/cmd/grsical

grsical-linux-arm64:
	GOOS=linux GOARCH=arm64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-linux-arm64 grs-ical/cmd/grsical

grsical-darwin-amd64:
	GOOS=darwin GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-darwin-amd64 grs-ical/cmd/grsical

grsical-darwin-arm64:
	GOOS=darwin GOARCH=arm64 go build -ldflags "-X grs-ical/internal/grsical/cli.version=$(GIT_COMMIT_HASH)" -o build/grsical-darwin-arm64 grs-ical/cmd/grsical

grsicalsrv-windows-amd64:
	GOOS=windows GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsicalsrv/cli.version=$(GIT_COMMIT_HASH)" -o build/grsicalsrv-windows-amd64.exe grs-ical/cmd/grsicalsrv

grsicalsrv-linux-amd64:
	GOOS=linux GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsicalsrv/cli.version=$(GIT_COMMIT_HASH)" -o build/grsicalsrv-linux-amd64 grs-ical/cmd/grsicalsrv

grsicalsrv-linux-arm64:
	GOOS=linux GOARCH=arm64 go build -ldflags "-X grs-ical/internal/grsicalsrv/cli.version=$(GIT_COMMIT_HASH)" -o build/grsicalsrv-linux-arm64 grs-ical/cmd/grsicalsrv

grsicalsrv-darwin-amd64:
	GOOS=darwin GOARCH=amd64 go build -ldflags "-X grs-ical/internal/grsicalsrv/cli.version=$(GIT_COMMIT_HASH)" -o build/grsicalsrv-darwin-amd64 grs-ical/cmd/grsicalsrv

grsicalsrv-darwin-arm64:
	GOOS=darwin GOARCH=arm64 go build -ldflags "-X grs-ical/internal/grsicalsrv/cli.version=$(GIT_COMMIT_HASH)" -o build/grsicalsrv-darwin-arm64 grs-ical/cmd/grsicalsrv

merge-macos-binary:
	$(LIPO) -create build/grsical-darwin-amd64 build/grsical-darwin-arm64 -o build/grsical-darwin-universal
	$(LIPO) -create build/grsicalsrv-darwin-amd64 build/grsicalsrv-darwin-arm64 -o build/grsicalsrv-darwin-universal

clean:
	-rm -f build/*

.PHONY: all clean \
	grsical-windows-amd64 grsical-linux-amd64 grsical-linux-arm64 grsical-darwin-amd64 grsical-darwin-arm64 \
	grsicalsrv-windows-amd64 grsicalsrv-linux-amd64 grsicalsrv-linux-arm64 grsicalsrv-darwin-amd64 grsicalsrv-darwin-arm64 \
	merge-macos-binary