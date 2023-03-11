#!/bin/sh

. "${TEST_SCRIPTS_DIR}/unit.sh"

define_test "CTDB_NATGW_PUBLIC_IFACE unset, not follower-only"

setup

setup_ctdb_natgw <<EOF
192.168.1.21 leader
192.168.1.22
192.168.1.23
192.168.1.24
EOF

setup_script_options <<EOF
CTDB_NATGW_PUBLIC_IFACE=""
EOF

required_result 1 "Invalid configuration: CTDB_NATGW_PUBLIC_IFACE not set"

for i in "startup" "ipreallocated" ; do
    simple_test_event "$i"
done
