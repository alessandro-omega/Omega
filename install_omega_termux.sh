
#!/data/data/com.termux/files/usr/bin/bash

echo "Ativando ambiente virtual Omega..."
source omega_env/bin/activate

echo "Instalando bibliotecas essenciais..."
pip install --upgrade pip setuptools wheel

echo "Instalando bibliotecas de voz e som individualmente..."
pip install SpeechRecognition
pip install gTTS

# Trocando playsound por alternativa mais compatível no Termux
pip install simpleaudio

# PyAudio no Termux costuma dar problema, instalamos via pkg
pkg install -y python-pyaudio

echo "Instalação concluída com sucesso!"
