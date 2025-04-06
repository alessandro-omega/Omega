#!/data/data/com.termux/files/usr/bin/bash

echo "Atualizando Termux..."
pkg update -y && pkg upgrade -y

echo "Instalando dependências essenciais..."
pkg install -y git python ffmpeg termux-api

echo "Clonando o repositório da Omega..."
git clone https://github.com/alessandro-omega/Omega.git || echo "Repositório já existe."

cd Omega || exit

echo "Instalando bibliotecas Python..."
pip install --upgrade pip
pip install -r requirements.txt || {
    echo "requirements.txt não encontrado. Instalando pacotes básicos..."
    pip install SpeechRecognition gTTS simpleaudio
}

echo "Instalação concluída!"
echo "Para iniciar a Omega, use: python omega.py"
