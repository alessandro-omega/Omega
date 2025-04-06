#!/data/data/com.termux/files/usr/bin/bash
echo "Instalando Omega no Termux..."
pkg update -y && pkg upgrade -y
pkg install -y python git
pip install --upgrade pip
pip install gTTS SpeechRecognition
echo "Omega instalada!"
