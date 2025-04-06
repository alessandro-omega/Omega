import speech_recognition as sr
from gtts import gTTS
import os
import playsound

nome_ativacao = "omega"
senha_voz = "permitido omega"
nome_usuario = "Alessandro"

def falar(texto):
    print(f'Omega: {texto}')
    tts = gTTS(text=texto, lang='pt')
    tts.save("resposta.mp3")
    playsound.playsound("resposta.mp3")
    os.remove("resposta.mp3")

def ouvir_microfone():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Omega ouvindo...")
        audio = r.listen(source)
    try:
        frase = r.recognize_google(audio, language="pt-BR")
        print("Você disse:", frase)
        return frase.lower()
    except sr.UnknownValueError:
        falar("Desculpe, não entendi.")
        return ""
    except sr.RequestError:
        falar("Erro ao acessar o serviço de reconhecimento.")
        return ""

def omega_loop():
    while True:
        frase = ouvir_microfone()
        if nome_ativacao in frase:
            falar("Diga a senha de ativação.")
            senha = ouvir_microfone()
            if senha == senha_voz:
                falar(f"Olá, {nome_usuario}. O que deseja?")
                comando = ouvir_microfone()
                if "hora" in comando:
                    import datetime
                    agora = datetime.datetime.now().strftime("%H:%M")
                    falar(f"Agora são {agora}.")
                elif "sair" in comando or "encerrar" in comando:
                    falar("Até logo!")
                    break
                else:
                    falar("Desculpe, não sei fazer isso ainda.")
            else:
                falar("Senha incorreta.")

omega_loop()
