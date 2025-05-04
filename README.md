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

<img src="Assets/img/image1.png">  

Após ter sido concluído o download do arquivo, basta seguir o fluxo padrão de instalação do Tomcat:  

<img src="Assets/img/image2.png">
<img src="Assets/img/image3.png">
<img src="Assets/img/image4.png">  

É importante certificar-se de que, na etapa seguinte, você adicione o papel "manager-script" aos papéis do administrador (ou roles, em inglês), além de escolher um nome e senha para utilizarmos posteriormente. Dessa forma o Apache NetBeans terá o acesso necessário para rodar a aplicação web no localhost.  

<img src="Assets/img/image5.png">
<img src="Assets/img/image6.png">
<img src="Assets/img/image7.png">  

## Instalação do Apache NetBeans