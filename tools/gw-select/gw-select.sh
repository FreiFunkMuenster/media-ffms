#!/bin/sh
##########################################################################################
#               Script um einem Node ein einzelnes Gateway zuzuweisen bzw.               #
#                    die automatische Zuweisung wieder zu aktivieren.                    #
#                                                                                        #
#                                   Nicht reboot-fest!                                   #
#                                                                                        #
# Aufruf: gw-select.sh fanlin|commander|fusselkater|padad0x|sense|kgbvax01|[...]|default #
##########################################################################################
 
 
fanlin_only()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=0

        }
 
commander1024_only()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=0
        }
 
fusselkater_only()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=0

        }
 
parad0x_only()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=0

        }
 
sense_only()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=0

        }
 
kgbvax01_only()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=0
        }
        
descilla1_only()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=0
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=1
        }
 
default()
        {
        uci set fastd.mesh_vpn_backbone_peer_fanlin.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_commander1024.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_fusselkater.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_parad0x.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_sense.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_kgbvax01.enabled=1
        uci set fastd.mesh_vpn_backbone_peer_descilla1.enabled=1
        }
 
recycle_fastd()
        {
        echo "fastd wird neu gestartet."
        /etc/init.d/fastd restart
        echo "Gewuenschte Konfiguration ist aktiviert!"
        }
#############################################
# </Funktionsdefinition>                    #
#############################################
 
case "$1" in
        fanlin)
                fanlin_only
                recycle_fastd
                ;;
 
        commander)
                commander1024_only
                recycle_fastd
                ;;
 
        fusselkater)
                fusselkater_only
                recycle_fastd
                ;;
 
        parad0x)
                parad0x_only
                recycle_fastd
                ;;
 
        sense)
                sense_only
                recycle_fastd
                ;;
 
        kgbvax01)
                kgbvax01_only
                recycle_fastd
                ;;
 
        descilla1)
                descilla1_only
                recycle_fastd
                ;;
 				
        default)
                default
                recycle_fastd
                ;;
 
        *)
                echo "Usage: $0 {fanlin|commander|fusselkater|parad0x|sense|kgbvax01|descilla1|default}"
                exit 1
esac
exit 0
