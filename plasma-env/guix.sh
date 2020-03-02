#!/bin/bash
export PATH="$HOME/.config/guix/current/bin${PATH:+:}$PATH"

GUIX_PROFILE=${GUIX_ENVIRONMENT:="$HOME/.guix-profile"}
. $GUIX_PROFILE/etc/profile

# Make Desktop Environment find guix apps:
export XDG_DATA_DIRS="$GUIX_PROFILE/share${XDG_DATA_DIRS:+:}$XDG_DATA_DIRS"

export LIBRARY_PATH="$GUIX_PROFILE/lib${LIBRARY_PATH:+:}$LIBRARY_PATH"
export CPATH="$GUIX_PROFILE/include${CPATH:+:}$CPATH"
export GUIX_LOCPATH="$GUIX_PROFILE/lib/locale" # Locale directory

export SSL_CERT_DIR="$GUIX_PROFILE/etc/ssl/certs"
export SSL_CERT_FILE="$GUIX_PROFILE/etc/ssl/certs/ca-certificates.crt"
