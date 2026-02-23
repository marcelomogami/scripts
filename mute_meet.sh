#!/bin/bash

# Garante que o atalho do KDE encontre o serviço do ydotool rodando no fundo
export YDOTOOL_SOCKET="/run/user/$(id -u)/.ydotool_socket"

# 1. Procura a janela e ativa diretamente
kdotool search --name "Meet|Teams" windowactivate

# 2. Pausa curta para a animação do Wayland terminar e o foco cravar
sleep 0.5

# 3. Confirma o nome da janela que está no foco
ACTIVE_TITLE=$(kdotool getactivewindow getwindowname)

# 4. Envia os keycodes exatos do hardware
if [[ "$ACTIVE_TITLE" == *"Meet"* ]]; then
    # Segura Ctrl(29) -> Aperta D(32) -> Solta D(32) -> Solta Ctrl(29)
    ydotool key 29:1 32:1 32:0 29:0
elif [[ "$ACTIVE_TITLE" == *"Teams"* ]]; then
    # Segura Ctrl(29) -> Segura Shift(42) -> Aperta M(50) -> Solta M(50) -> Solta Shift(42) -> Solta Ctrl(29)
    ydotool key 29:1 42:1 50:1 50:0 42:0 29:0
else
    # Se errar o alvo, avisa para você saber que não deu certo
    notify-send "Script de Mute" "Foco na janela incorreta: $ACTIVE_TITLE"
fi