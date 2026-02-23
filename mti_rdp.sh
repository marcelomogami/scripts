#!/bin/bash

# Carrega as variáveis se o arquivo existir
if [ -f mti_rdp.env ]; then
    source mti_rdp.env
else
    echo "Erro: Arquivo mti_rdp.env não encontrado!"
    exit 1
fi

echo "Verificando conexão com $RDP_HOST..."

# Tenta pingar o host 3 vezes com um tempo de espera (timeout) de 2 segundos
if ping -c 3 -W 2 "$RDP_HOST" > /dev/null 2>&1; then
    echo "Conexão ativa! Iniciando RDP..."
    #xfreerdp /f /multimon /monitors:2,1 /v:$REMOTO /u:$USUARIO /d:$DOMINIOI /p:"$SENHA" /gfx:avc444 /network:auto /cert:ignore /dynamic-resolution /gdi:sw +clipboard -grab-keyboard -grab-mouse
    #xfreerdp3 /f /multimon /monitors:2,1 /v:$REMOTO /u:$USUARIO /d:$DOMINIOI /p:"$SENHA" /network:auto /cert:ignore /dynamic-resolution /gdi:sw +clipboard -grab-mouse
    xfreerdp3 /v:$RDP_HOST /u:$RDP_USER /d:$RDP_DOMAIN /p:"$RDP_PASS" /network:lan /cert:ignore /dynamic-resolution /gfx:avc444 -wallpaper +clipboard -grab-mouse > /dev/null 2>&1 &
else
    notify-send "Erro de Conexão" "A máquina remota não respondeu ao ping. Verifique a VPN." --icon=network-error
fi
