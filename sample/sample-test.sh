#!/usr/bin/env bash

echo test Playbook is executing and recording results to log.txt

ansible-playbook -i Inventory/Home/ dev-machines_test.yml -u root > log.txt

echo Passing Tests....

grep TEST_PASSED log.txt

echo Failing Tests....

grep TEST_FAILED log.txt

echo Serious Failures...

grep fatal log.txt




