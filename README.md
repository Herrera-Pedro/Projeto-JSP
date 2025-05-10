# Guia de Implementação (localhost)
Um guia passo-a-passo para a instalação das ferramentas necessárias e resolução de possíveis problemas ao iniciar um projeto do tipo "webapp" pelo Apache NetBeans, utilizando o servidor Apache Tomcat

## Instalação do Apache NetBeans

A primeira etapa para iniciar a colaboração neste projeto é a instalação da IDE Apache NetBeans.  
Link do site oficial com as versões para a instalação: (https://netbeans.apache.org/front/main/download/).  
É recomendada a instalação da última versão da IDE, para evitar quaisquer conflitos entre versões.  

Caso ainda não tenha instalado nenhuma versão do JDK em sua máquina, será exigida a instalação para rodar a IDE.  
Link do site oficial para instalação da última versão do JDK: (https://www.oracle.com/br/java/technologies/downloads/).  
Após a instalação, a IDE deverá abrir normalmente.  

## Instalação do Apache Tomcat

Para instalar o Apache Tomcat, basta utilizar o link (https://tomcat.apache.org/download-11.cgi) e baixá-lo como serviço, acessando a área "Binary Distributions", "Core" e "Windows Service Installer" conforme a imagem abaixo:  

![Image](https://github.com/user-attachments/assets/f6c64d7e-1712-4da1-84ce-0b29ea8bb040)  

Após ter sido concluído o download do arquivo, basta seguir o fluxo padrão de instalação do Tomcat:  

![Image](https://github.com/user-attachments/assets/7e616624-da94-495c-8d25-99ca42806ee0)  
![Image](https://github.com/user-attachments/assets/84318571-f6fa-477c-9f80-61ffbd40b25a)  
![Image](https://github.com/user-attachments/assets/fe1666dc-adba-4b2d-aeac-f6292123e956)  

É importante certificar-se de que, na etapa seguinte, você adicione o papel "manager-script" aos papéis do administrador (ou roles, em inglês), além de escolher um nome e senha para utilizarmos posteriormente. Dessa forma o Apache NetBeans terá o acesso necessário para rodar a aplicação web no localhost.  

![Image](https://github.com/user-attachments/assets/e084305a-aad8-44e8-9847-b631b4b9f654)  
![Image](https://github.com/user-attachments/assets/465cd8b5-8e34-44c4-86ab-9d34b4dc3459)  
![Image](https://github.com/user-attachments/assets/27d25f7c-b7d9-4f81-b15e-e6eb805d6ee7)  

## Criação do Webapp no Apache NetBeans

![Image](https://github.com/user-attachments/assets/0526164e-fca5-4175-89de-a20d50c4f6a9)  
![Image](https://github.com/user-attachments/assets/e2f34132-f85b-4083-b5b8-8687a90995c3)  
![Image](https://github.com/user-attachments/assets/ba74ee4c-5b6f-4095-88ef-c7c398ca5949)  
![Image](https://github.com/user-attachments/assets/c9ab6d2a-3efd-46dc-9b85-9287ac70371b)  
![Image](https://github.com/user-attachments/assets/4e9f3f4b-50f7-4ab6-8c85-251f16cdb120)  
![Image](https://github.com/user-attachments/assets/3363e9eb-202f-4d8b-8658-72648143e397)  

Local de instalação padrão do Tomcat: C:\Program Files\Apache Software Foundation

![Image](https://github.com/user-attachments/assets/3a133136-6489-4688-8ac8-39f99c2542e8)  
![Image](https://github.com/user-attachments/assets/13d31074-a75d-484d-9882-a35aa9102008)  

Ao fim desse processo, uma estrutura de diretórios como a mostrada a seguir será criada:

![Image](https://github.com/user-attachments/assets/a45cc008-cef2-490b-9e6d-c7a1e5af3225)  

Basta, então, que você execute o projeto para que ele seja compilado e comece a rodar no localhost (localhost:8080/NomeDoProjeto).

![Image](https://github.com/user-attachments/assets/61d351d6-2232-4b1f-91ce-88b58e03078c)  

## Problemas Conhecidos

As próximas etapas deste guia servem para contornar alguns dos problemas enfrentados ao iniciar a aplicação web diretamente do Apache NetBeans.

### Permissão de Acesso para o Diretório do Tomcat

Ao criar um projeto do tipo webapp no Apache NetBeans, é provável que a IDE lhe informe que o caminho do arquivo do servidor é inválido e isso é um problema causado pela falta de acesso da IDE com o Tomcat.  

![Image](https://github.com/user-attachments/assets/c3da9e46-6bf1-4fc3-823a-5ccee6c63b81)  

Para contornar esse problema, pode ser acessado o diretório do Tomcat através do explorador de arquivos para que o sistema solicite a permissão de administrador.

![Image](https://github.com/user-attachments/assets/2c9f89ed-31c6-4889-81b3-4ca38614e697)
![Image](https://github.com/user-attachments/assets/018f7ee6-57e0-403e-89a2-3d01bb80054b)  

Após essa alteração, basta fechar a janela de seleção do diretório do servidor e tentar novamente:  

![Image](https://github.com/user-attachments/assets/6bbd83ac-451f-4cee-b936-2a7fbf351bb2)  

### Deploy com o Servidor em Funcionamento

Caso o servidor Tomcat esteja em funcionamento ao tentar dar deploy no projeto, é provável que receba a mensagem de erro "FALHA - Incapaz de criar o diretório [C:\Program Files\Apache Software Foundation\Tomcat 11.0\conf\Catalina\localhost]".  
Se isso acontecer, uma possível solução é parar a execução do servidor e rodar o webapp diretamente da IDE, sem antes iniciar o servidor.

![Image](https://github.com/user-attachments/assets/1bef3ab0-6e3e-4501-a90c-c3a189f50243)  
![Image](https://github.com/user-attachments/assets/61d351d6-2232-4b1f-91ce-88b58e03078c)

