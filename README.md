# 🛠️ Linux Automation Scripts

Este repositório contém scripts de automação para otimizar o fluxo de trabalho no Linux, focando em produtividade e integração de ferramentas.

## 📄 Descrição dos Scripts

* **`conectar.sh`**: Simplifica a conexão via RDP (Remote Desktop) usando o `xfreerdp`. Ele carrega credenciais de um arquivo externo para manter a segurança e facilitar o uso de múltiplos servidores.
* **`mute_meet.sh`**: Uma macro inteligente que alterna o mudo (Mute/Unmute) no **Google Meet** e no **Microsoft Teams**. O script identifica qual dessas janelas está aberta, traz para o foco e envia o atalho de teclado correto via hardware.
* **`dbeaver_modify.sh`**: Automatiza a edição de Procedures no DBeaver. Em um único comando, ele abre as propriedades da procedure, aciona o menu de contexto para abrir no console SQL e fecha a aba de visualização original, economizando vários cliques manuais.

> ⚠️ **AVISO IMPORTANTE**: Os scripts `mute_meet.sh` e `dbeaver_modify.sh` foram projetados especificamente para o ambiente **KDE Plasma**, pois dependem do `kdotool` para gerenciar o foco das janelas e da arquitetura do KWin.


---

## ⚙️ Instalação e Configuração

### 1. Dependências do Sistema

Para o pleno funcionamento no **CachyOS / Arch**, instale os pacotes necessários:

```bash
sudo pacman -S ydotool kdotool freerdp

```

### 2. Configuração do `ydotool` (Necessário para Macros)

O `ydotool` emula um teclado físico no kernel. Para ativá-lo:

1. Adicione seu usuário ao grupo de entrada:
```bash
sudo usermod -aG input $USER

```


2. Ative o serviço de usuário (não use sudo aqui):
```bash
systemctl --user enable --now ydotool.service

```


*Nota: Se os comandos de teclado não funcionarem de imediato, reinicie sua sessão ou o computador.*

### 3. Configuração do RDP (`mti_rdp.sh`)

O script de conexão busca os dados em um arquivo chamado `mti_rdp.env`.

1. Crie o arquivo `mti_rdp.env` na mesma pasta do script.
2. Preencha com o seguinte modelo:
```bash
RDP_HOST="IP_OU_HOSTNAME"
RDP_USER="seu_usuario"
RDP_PASS="sua_senha"
RDP_DOMAIN="dominio_da_rede"

```

---

## 🚀 Como Utilizar

1. **Permissões**: Dê permissão de execução aos arquivos:
```bash
chmod +x *.sh

```


2. **Atalhos de Teclado**: No KDE, vá em *Configurações do Sistema > Atalhos > Atalhos do Sistema* e crie novos atalhos apontando para o caminho completo dos scripts `mute_meet.sh` e `dbeaver_modify.sh`.
