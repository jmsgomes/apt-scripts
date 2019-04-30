#!/bin/bash

cat <<END_FILEOVERVIEW
${0##*/} - Configures APT to use the given proxy URL, by adding/overwriting
/etc/apt/apt.conf.d/01proxy.conf.

END_FILEOVERVIEW

show_usage() {
  cat <<END_USAGE
## Usage
  "${0##*/}" <url_of_proxy>

E.g.
  "${0##*/}" 'http://10.0.0.1:3142/'

END_USAGE
}

if [ $# -eq 0 ]; then show_usage; exit 1; fi

PROXY_URL="$1"
cat <<EOF |sudo tee /etc/apt/apt.conf.d/01proxy.conf >/dev/null
Acquire::http::Proxy "${PROXY_URL}";
EOF
