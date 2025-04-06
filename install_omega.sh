#!/data/data/com.termux/files/usr/bin/bash

echo "Instalando dependências da Omega..."
pkg update -y && pkg upgrade -y
pkg install -y git curl python termux-api espeak

echo "Criando ambiente virtual..."
python -m venv omega_env
source omega_env/bin/activate

echo "Instalando bibliotecas Python..."
pip install --upgrade pip
pip install SpeechRecognition pyaudio gtts playsound termcolor

echo "Criando script principal da Omega..."
cat > omega.py <<EOF
import speech_recognition as sr
from gtts import gTTS
import os
from termcolor import cprint
import time

senha = "permitido omega"
ativador = "omega"
nome_usuario = "Alessandro"

def falar(frase):
    tts = gTTS(text=frase, lang='pt-br')
    tts.save("fala.mp3")
    os.system("termux-media-player play fala.mp3")

def ouvir():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        cprint("Ouvindo...", "cyan")
        audio = r.listen(source)
    try:
        texto = r.recognize_google(audio, language="pt-BR")
        cprint(f"Você disse: {texto}", "green")
        return texto.lower()
    except:
        cprint("Não entendi. Tente novamente.", "red")
        return ""

while True:
    comando = ouvir()
    if ativador in comando:
        falar("Diga a senha de ativação.")
        tentativa = ouvir()
        if senha in tentativa:
            falar(f"Olá, {nome_usuario}. O que deseja?")
            while True:
                acao = ouvir()
                if "horas" in acao:
                    hora = time.strftime("%H:%M")
                    falar(f"Agora são {hora}")
                elif "sair" in acao:
                    falar("Até logo.")
                    break
                else:
                    falar("Desculpe, ainda não sei fazer isso.")
EOF

echo "Instalação concluída!"
echo "Para iniciar a Omega, ative o ambiente e rode:"
echo "source omega_env/bin/activate && python omega.py"

