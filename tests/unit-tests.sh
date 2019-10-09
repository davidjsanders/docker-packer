#!/bin/bash
echo "Unit Test - Packer version - ${1}"
expected="Packer v1.4.4"
packer_version=$(docker run --rm ${1} version)
echo "Test 1  : Packer version"
echo "Expected: ${expected}"
echo "Actual  : ${packer_version}"
echo -n "Result  : "
if [ "${packer_version}" == "${expected}" ]
then
    echo "Pass"
    exit 0
else
    echo "Fail"
    exit 1
fi