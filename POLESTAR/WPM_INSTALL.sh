#!/bin/bash

# WPM HOME_DIR PATH SETTINGS
read -p "ENTER WPM HOME DIR TO USE ex)/usr/nkia : " WPM_HOME
if [ ! -d "$WPM_HOME" ]; then
    mkdir -p "$WPM_HOME"
    echo "Created $WPM_HOME success"
else
    echo "$WPM_HOME already exists"
fi
echo -e " "
echo -e "================================"
echo -e "| WPM HOME_DIR PATH = WPM_HOME |"
echo -e "================================"
ls -l $WPM_HOME
echo -e " "

# WPM WPM_AGENT INSTALL
read -p "ENTER WPM AGENT FILE NAME ex)WPMAgent.zip : " WPM_AGENT
if [ -n "$WPM_AGENT" ]; then
    unzip "$WPM_AGENT" -d "$WPM_HOME"
else
    echo "NOT FOUND"
fi
echo -e " "
echo -e "=================="
echo -e "| WPM = WPM_HOME |"
echo -e "=================="
ls -l $WPM_HOME
echo -e " "

# WPM AGENT_ID CONFIG
read -p "ENTER AGENT_ID ex)WPM_CYWEB_WS : " AGENT_ID
if [ -n "$AGENT_ID" ]; then
    sed -i "s/^AGENT_ID=.*/AGENT_ID=$AGENT_ID/" "$WPM_HOME/WPMAgent/WPMAgentInfo.conf"
    echo "AGENT_ID set to $AGENT_ID"
else
    echo "No AGENT_ID received for AGENT_ID"
fi
echo -e " "
echo -e "========================================================"
echo -e "| AGENT_ID INFO (""$WPM_HOME"/WPMAGENT/WPMAgentInfo.conf") |"
echo -e "========================================================"
tail -1 $WPM_HOME/WPMAgent/WPMAgentInfo.conf
echo -e " "

# WPM TEMPLATE CONFIG
read -p "ENTER WPM TEMPLATE NAME ex)JEUS_MILESHOP : " WPM_TEMPLATE
read -p "ENTER WPM OBJ_NAME NAME ex)DEV_MILESHOP : " WPM_OBJ_NAME
read -p "ENTER WPM MANAGER_IP NAME : " WPM_MANAGE_IP
if [ -n "$WPM_TEMPLATE" ]; then
    cp -Rf $WPM_HOME/WPMAgent/template $WPM_HOME/WPMAgent/$WPM_TEMPLATE
    sed -i "s/^obj_name=.*/obj_name=$WPM_OBJ_NAME/" "$WPM_HOME/WPMAgent/$WPM_TEMPLATE/wpmagent.conf"
    sed -i "s/^manager_ip=.*/manager_ip=$WPM_MANAGE_IP/" "$WPM_HOME/WPMAgent/$WPM_TEMPLATE/wpmagent.conf"
    echo "Created "$WPM_HOME/WPMAgent/$WPM_TEMPLATE""
else
    echo "Failed to create"
fi
echo -e " "
echo -e "============"
echo -e "| WPM INFO |"
echo -e "============"
echo -e "WPM_HOME = "$WPM_HOME""
echo -e "AGENT_ID = "$AGENT_ID""
echo -e "OBJ_NAME = "$WPM_OBJ_NAME""
echo -e "MANAGER_IP = "$WPM_MANAGE_IP""
