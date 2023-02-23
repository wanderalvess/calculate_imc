# Como gerar um APK deste aplicativo Flutter
Este aplicativo Flutter é uma calculadora de índice de massa corporal que permite ao usuário inserir sua altura e peso e calcula seu IMC. 
Além disso, fornece uma mensagem sobre o estado de saúde do usuário com base no IMC calculado.

# Para gerar um APK deste aplicativo, siga os passos abaixo:

## Pré-requisitos:

Flutter SDK instalado e configurado no seu computador
Um dispositivo Android conectado ao computador ou um emulador Android

### Passo 1: Preparar o projeto

Antes de gerar o APK, certifique-se de que o projeto está pronto para ser compilado. Abra um terminal na pasta do projeto e execute os seguintes comandos:

 > flutter pub get

 > flutter clean

O primeiro comando baixa todas as dependências do projeto, enquanto o segundo comando limpa o diretório de saída.

### Passo 2: Gerar o APK

Para gerar o APK, execute o seguinte comando no terminal:

> flutter build apk

Este comando compilará o código Flutter e criará um arquivo APK na pasta "build/app/outputs/flutter-apk/app-release.apk".

### Passo 3: Instalar e executar o APK

Para instalar e executar o APK em um dispositivo Android, conecte o dispositivo ao computador e execute o seguinte comando:

> flutter install

Este comando instalará o APK no dispositivo Android conectado e o executará automaticamente.

Para executar o APK em um emulador Android, primeiro inicie o emulador e depois execute o seguinte comando:

> flutter run

Este comando instalará o APK no emulador Android e o executará automaticamente.

Pronto! Agora você gerou e instalou o APK do aplicativo Flutter com sucesso.
