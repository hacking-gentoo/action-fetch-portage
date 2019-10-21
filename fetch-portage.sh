#!/usr/bin/env bash

function die()
{
    echo "$1"
    exit 1
}

# Download and verify portage snapshot, when using latest it will download at most once per day
#
# Arguments:
# 1: portage_file
function download_portage_snapshot()
{
    git clone --depth=1 --branch=master git@github.com:gentoo/gentoo.git portage || die "Unable to clone portage repository"
    rm -rf ./portage/.git
}

download_portage_snapshot
