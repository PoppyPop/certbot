#!/bin/bash
#

set -e

pvenode cert set ${RENEWED_LINEAGE}/fullchain.pem ${RENEWED_LINEAGE}/privkey.pem --force --restart