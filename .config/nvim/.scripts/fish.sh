#!/usr/bin/env bash

if ! command -v fish >/dev/null; then
  echo "Fish not installed"
  exit 1
fi

if ! functions -q fisher 2>/dev/null; then
  fish -c "curl -sL https://git.io/fisher | source"
fi

fish -c "fisher update"
