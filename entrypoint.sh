#!/bin/sh
function helptext() {
    echo
    echo "docker run --rm -it \\"
    echo "  --volume /path/to/data:/data \\"
    echo "  --volume /path/to/secrets:/secrets \\"
    echo "  --volume /path/to/.ssh:/ssh \\"
    echo "  dsanderscan/docker-terraform:${build} \\"
    echo "    [command] [arguments]"
    echo
}

first_arg=$(echo ${1} | tr [A-Z] [a-z])
if [ "${first_arg}" == "--help" ] || \
   [ "${first_arg}" == "-help" ] || \
   [ "${first_arg}" == "" ];
then
    helptext
    packer
else
    packer ${@}
fi
