#!/bin/bash

# Atualizar pacotes e instalar dependências
pkg update && pkg upgrade -y
pkg install git curl python -y

# Clonar o repositório da Omega
git clone https://github.com/alessandro-omega/omega.git

# Navegar para o diretório da Omega
cd omega

# Configurar permissões
chmod +x omega.py

# Criar alias para executar a Omega
echo 'alias omega="python ~/omega/omega.py"' >> ~/.bashrc
source ~/.bashrc

echo "Instalação concluída. Você pode executar a Omega digitando 'omega' no terminal."
