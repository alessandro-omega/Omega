#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando dependências da Omega..."
pkg update && pkg upgrade -y
pkg install -y python git termux-api espeak

echo "Criando ambiente virtual..."
python -m venv omega_env
source omega_env/bin/activate

echo "Instalando bibliotecas Python..."
pip install --upgrade pip
pip install SpeechRecognition pyaudio gTTS playsound

echo "Instalação concluída."
echo "Para iniciar a Omega, ative o ambiente com:"
echo "source omega_env/bin/activate"
echo "E depois rode:"
echo "python omega.py"

