#!/bin/sh

#  CIS-DC-Build1.sh
#  
#
#  Created by Carl Javier on 23/11/2015.
#


SOURCEFILE
PROJECTFILE


#######
#Setup Data Centre
######


#Setup security groups

neutron security-group-rule-create --direction ingress --remote_ip_prefix 0.0.0.0/0 server-sec-group

#Setup Networks

#Private Network
neutron net-create <Network-Name>

#Public Network
neutron net-create <Network-Name>

#Setup subnets per Networks

#Inside Subnet
neutron subnet-create <Network-Name> <A.B.C.D/X> --name <Subnet-Name> --gateway <A.B.C.D/X> --dns-nameservers list=true <DNS1> <DNS2>

#Outside Subnet
neutron subnet-create <Network-Name> <A.B.C.D/X> --name <Subnet-Name> --gateway <A.B.C.D/X> --dns-nameservers list=true <DNS1> <DNS2>


#Create Network Ports

neutron port-create --name <Port-Name> --fixed-ip ip_address=<A.B.C.D> --security-group server-sec-group <Network-Name>


#Allow traffic from anywhere on the Internet:
neutron port-update <Port-Name> --allowed_address_pairs type=dict list=tru ip_address=0.0.0.0/0


#Setup Neutron Router
neutron router-create Internet-router
neutron router-gateway-set Internet-router public-floating-601

#Connect neutron to public subnet
neutron router-interface-add Internet-router <Subnet-Name>

#Setup Volumes

#Setup Instances


#Add Interfaces to any instances





#Setup port security


#Setup Firewall Instances


#Setup Floating IP Addresses



#Setup Loadbalancers