#!/bin/bash

mkdir -p /var/madsonic/incoming
mkdir -p /var/madsonic/podcast
mkdir -p /var/madsonic/import
mkdir -p /var/madsonic/export
mkdir -p /var/madsonic/backup
mkdir -p /var/madsonic/transcode

if [[ ! -z "$MEDIA_NFS" ]]; then 
	mount -t nfs $MEDIA_NFS -o nolock /var/media
fi

port="--port=4040"

if [[ -z "${CONTEXT_PATH}" ]]; then
	CONTEXT_PATH="/"
fi

/opt/madsonic/madsonic.sh \
	--home=/var/madsonic \
	--host=0.0.0.0 ${port} \
	--context-path=${CONTEXT_PATH} \
	--default-music-folder=/var/media 
	--default-podcast-folder=/var/madsonic/podcast \
	--default-playlist-import-folder=/var/madsonic/playlists/import \
	--default-playlist-export-folder=/var/madsonic/playlists/export \
	--default-playlist-backup-folder=/var/madsonic/playlists/backup

