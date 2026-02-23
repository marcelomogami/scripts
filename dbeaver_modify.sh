#!/bin/bash

# Garante que o atalho do KDE encontre o serviço do ydotool
export YDOTOOL_SOCKET="/run/user/$(id -u)/.ydotool_socket"


# 3. Confirma o nome da janela que está no foco
ACTIVE_TITLE=$(kdotool getactivewindow getwindowname)

if [[ "$ACTIVE_TITLE" == *"DBeaver"* ]]; then

    # 1. Aperta F4 (Abre a tela de propriedades/fonte)
    # Keycode F4 = 62
    ydotool key 62:1 62:0

    # 2. Aguarda o DBeaver carregar a aba de propriedades
    # Você pode diminuir esse tempo para 0.3 ou 0.4 se o seu PC carregar a aba muito rápido
    sleep 0.6

    # 3. Abre o Menu de Contexto simulando Shift + F10
    # Usar Shift+F10 é mais garantido em apps Java/Eclipse do que a tecla Menu dedicada
    # Keycode Shift = 42 | F10 = 68
    ydotool key 42:1 68:1 68:0 42:0

    # 4. Aguarda o menu flutuante aparecer
    sleep 0.2

    # 5. Navega e seleciona a opção "Abrir no console SQL"

    # OPÇÃO 1: Usando a letra "A" (se o DBeaver focar na opção ao apertar A)
    # Keycode A = 30 | Enter = 28
    # ydotool key 30:1 30:0
    # sleep 0.1
    # ydotool key 28:1 28:0 

    # OPÇÃO 2 (Alternativa): Usando a Seta para Baixo
    # Se a letra A não funcionar, apague a Opção 1 acima e descomente a linha abaixo.
    # Keycode Seta para Baixo = 108. 
    # Repita o par "108:1 108:0" de acordo com a quantidade de vezes que precisa descer no menu.
    # Exemplo para descer 3 vezes e dar Enter (28):
    # ydotool key 108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0   108:1 108:0    28:1 28:0
    # mudei pra usar seta pra cima, porque é a última opção.
    # Keycode Seta para Cima = 103.
    ydotool key 103:1 103:0  28:1 28:0

    # 6. Aguarda o Console SQL terminar de abrir e ganhar foco
    sleep 0.3

    # 7. Volta para a aba anterior (Ctrl + PageUp)
    # Segura Ctrl (29) -> Aperta PageUp (104) -> Solta PageUp (104) -> Solta Ctrl (29)
    ydotool key 29:1 104:1 104:0 29:0

    # 8. Aguarda a aba da procedure focar
    sleep 0.2

    # 9. Fecha a aba atual (Ctrl + W)
    # Segura Ctrl (29) -> Aperta W (17) -> Solta W (17) -> Solta Ctrl (29)
    ydotool key 29:1 17:1 17:0 29:0
fi