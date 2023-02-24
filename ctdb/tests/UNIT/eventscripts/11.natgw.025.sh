#!/bin/sh

. "${TEST_SCRIPTS_DIR}/unit.sh"

define_test "static routes, custom gateway, multiple transitions"

setup

setup_script_options <<EOF
CTDB_NATGW_STATIC_ROUTES="10.1.1.0/24 10.1.2.0/24@10.1.1.253"
EOF

echo "*** Leader node..."

setup_ctdb_natgw <<EOF
192.168.1.21 leader
192.168.1.22
192.168.1.23
192.168.1.24
EOF

ok_null
simple_test_event "ipreallocated"

ok_natgw_leader_static_routes
simple_test_command ip route show

ok_natgw_leader_ip_addr_show
simple_test_command ip addr show "$CTDB_NATGW_PUBLIC_IFACE"

echo "*** Follower node..."

setup_ctdb_natgw <<EOF
192.168.1.21
192.168.1.22 leader
192.168.1.23
192.168.1.24
EOF

ok_null
simple_test_event "ipreallocated"

ok_natgw_follower_static_routes
simple_test_command ip route show

ok_natgw_follower_ip_addr_show
simple_test_command ip addr show "$CTDB_NATGW_PUBLIC_IFACE"

echo "*** Leader node again..."

setup_ctdb_natgw <<EOF
192.168.1.21 leader
192.168.1.22
192.168.1.23
192.168.1.24
EOF

ok_null
simple_test_event "ipreallocated"

ok_natgw_leader_static_routes
simple_test_command ip route show

ok_natgw_leader_ip_addr_show
simple_test_command ip addr show "$CTDB_NATGW_PUBLIC_IFACE"
