#!/bin/bash

usage () {
    echo "usage: `basename $0` aws_vault_profile"
    exit -1
}

[ "$#" -eq 1 ] || usage

if ! command -v aws-vault &> /dev/null
then
    echo "aws_vault could not be found. Please ensure that it is installed and available in \$PATH."
    exit 1
fi

aws-vault exec $1
