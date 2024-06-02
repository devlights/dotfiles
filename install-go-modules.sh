#!/bin/bash

if ! command -v go &> /dev/null
then
    echo "Error: goコマンドが見つかりません。Goがインストールされているか確認してください。"
    exit 1
fi

go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/deadcode@latest
go install golang.org/x/tools/cmd/stringer@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/go-task/task/v3/cmd/task@latest
go install golang.org/x/perf/cmd/...@latest
