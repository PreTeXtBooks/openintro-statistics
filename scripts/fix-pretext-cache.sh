#!/bin/bash
# Workaround for PreTeXt 2.36.0 bug with cached Runestone services file
# The cached file is named runestone_services.xml but the code looks for rs_services.xml

RS_CACHE_DIR="$HOME/.ptx/2.36.0/rs_cache"

if [ -f "$RS_CACHE_DIR/runestone_services.xml" ] && [ ! -f "$RS_CACHE_DIR/rs_services.xml" ]; then
    echo "Applying workaround for PreTeXt 2.36.0 cached services file..."
    cp "$RS_CACHE_DIR/runestone_services.xml" "$RS_CACHE_DIR/rs_services.xml"
    echo "Workaround applied successfully."
fi
