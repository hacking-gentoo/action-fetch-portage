#!/usr/bin/env bash

function die()
{
	echo "::error::$1"
	echo "------------------------------------------------------------------------------------------------------------------------"
    exit 1
}

# Download and verify portage snapshot, when using latest it will download at most once per day
#
# Arguments:
# 1: portage_file
function download_portage_snapshot()
{
    git clone --quiet --depth=1 --branch=master https://github.com/gentoo/gentoo.git portage || die "Unable to clone portage repository"
    rm -rf ./portage/.git
}

cat << END
------------------------------------------------------------------------------------------------------------------------
                      _   _                    __     _       _                            _                   
                     | | (_)                  / _|   | |     | |                          | |                  
            __ _  ___| |_ _  ___  _ __ ______| |_ ___| |_ ___| |__ ______ _ __   ___  _ __| |_ __ _  __ _  ___ 
           / _\` |/ __| __| |/ _ \| '_ \______|  _/ _ \ __/ __| '_ \______| '_ \ / _ \| '__| __/ _\` |/ _\` |/ _ \\
          | (_| | (__| |_| | (_) | | | |     | ||  __/ || (__| | | |     | |_) | (_) | |  | || (_| | (_| |  __/
           \__,_|\___|\__|_|\___/|_| |_|     |_| \___|\__\___|_| |_|     | .__/ \___/|_|   \__\__,_|\__, |\___|
                                                                         | |                         __/ |     
                                                                         |_|                        |___/      
          https://github.com/hacking-gentoo/action-fetch-portage                           (c) 2019 Max Hacking 
------------------------------------------------------------------------------------------------------------------------
END

[[ -z "${GITHUB_WORKSPACE}" ]] && die "Must set GITHUB_WORKSPACE in env"
cd "${GITHUB_WORKSPACE}" || die "GITHUB_WORKSPACE does not exist"
download_portage_snapshot

echo "------------------------------------------------------------------------------------------------------------------------"