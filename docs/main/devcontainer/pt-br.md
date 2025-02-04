# Template Backend Dev Container | Java 23 + Spring | Oracle Database

## Configuração do DevContainer

Beleza, presta atenção, novato. Você quer saber o que é um DevContainer? Ok, eu vou te explicar da maneira mais simples possível pra não fritar seu cérebro.

### **O Que É Isso?**

Imagina que você está configurando um novo projeto, e ele tem um monte de dependências—versões específicas do Lombok, alguma versão antiga do Java, um banco de dados esquisito e talvez alguma ferramenta obscura que só roda no Linux.  

Agora, você pode perder horas configurando o ambiente, brigando com o inferno das dependências e quebrando seu sistema operacional... OU você pode simplesmente usar um **DevContainer** e resolver tudo em 5 segundos.  

Um **DevContainer** é como um **"projeto dentro de uma caixa"**. É um **container Docker** que contém tudo o que seu projeto precisa:  

✅ A linguagem de programação certa  
✅ As bibliotecas e dependências corretas  
✅ As ferramentas e extensões necessárias  
✅ A configuração certa do sistema operacional  
✅ As variáveis de ambiente corretas  

Então, quando você abre seu projeto dentro de um DevContainer (geralmente no VS Code), **BOOM 💥—tudo pronto para rodar**. Sem setup, sem conflitos, sem drama de “na minha máquina funciona”.  

### Como Funciona?  

1. **Defina Seu Ambiente** – Você cria uma pasta `.devcontainer` com um arquivo `devcontainer.json` que diz ao VS Code como configurar tudo.  
2. **Magia Containerizada** – O VS Code lê esse arquivo, inicia um **container Docker** com tudo pré-instalado e conecta seu editor a ele.  
3. **Codificação Instantânea** – Você trabalha dentro do container como se fosse sua máquina local, mas tudo fica isolado. Nada de bagunça, nada de conflitos, nada de “ops, atualizei meu Java e quebrei tudo”.  

### Por Que Você Deveria Se Importar?

- 💀 Chega de desculpas do tipo "funciona na minha máquina"  
- 🛠 Super fácil para novos devs entrarem no projeto (só clonar e rodar)  
- 🔥 Não polui seu sistema com dependências desnecessárias  
- 🚀 Torna seu ambiente de desenvolvimento **portável**—roda em qualquer lugar com Docker  
- 🎯 Perfeito para projetos open-source e equipes  

**TL;DR:** DevContainers são ambientes de desenvolvimento pré-configurados dentro do Docker, facilitando sua vida e tornando seu setup à prova de falhas.  

### **💮 O Que Tem Aqui Dentro?**
#### 📁 **Estrutura do Diretório**
```
/workspace/
 ├── .devcontainer/
 │    ├── docker/
 │    │    ├── backend.Dockerfile           # Receita do Container Backend
 │    │    ├── database.oracle.Dockerfile   # Receita do Container do Oracle Database
 │    ├── .env                              # Segredos vivem aqui. Proteja-os bem.
 │    ├── devcontainer.json                 # Configuração do DevContainer para o VS Code
 │    ├── docker-compose.yml                # A cola que une tudo
```

#### **🛠️ Como Funciona**
##### **Passo 1: A Magia do DevContainer**
- O **devcontainer.json** é seu livro de feitiços. Ele **diz ao VS Code** como configurar o ambiente de desenvolvimento.
- Instala **extensões essenciais do VS Code** (ferramentas Java, Copilot, SonarLint, Docker, etc.).
- **Mapeia portas**, para que seu app e banco de dados se comuniquem sem gritaria.

##### **Passo 2: A Invocação dos Containers com Docker Compose**
- O **docker-compose.yml** é seu **círculo de invocação**.
- Define:
  - **Container do backend** → `template-backend`
  - **Container do banco de dados** → `template-database-oracle`
- **Garante que o backend só inicie quando o banco de dados estiver pronto**.

##### **Passo 3: O Lado Sombrio do `.env`**
- 🚡 **NUNCA COMITE ESSE ARQUIVO** (a menos que queira que suas credenciais sejam roubadas).
- Armazena:
  - Credenciais do banco de dados (`ORACLE_USER`, `ORACLE_PASSWORD`).
  - Mapeamento de portas (`APP_PORT`, `DB_ORACLE_PORT`).
- Exemplo de senha: `DarthVader42` (porque senhas fortes são fortes no Lado Sombrio).

### **🛠️ Configurando**
#### **1️⃣ Instale os Requisitos**
- [Docker](https://www.docker.com/get-started) 🐳
- [VS Code](https://code.visualstudio.com/) 🖥️
- [Extensão Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

#### **2️⃣ Clone o Repositório**
```
git clone https://github.com/napalm23zero/template-backend-java-23-spring-oracle.git
cd template-backend-java-23-spring-oracle
```

#### **3️⃣ Abra no VS Code**
```
code .
```
- **O VS Code deve sugerir “Reabrir no Container.”**
- Clique nisso. **Se não aparecer, pressione** `Ctrl + Shift + P` → `Reopen in Container`.

Backend + Banco de Dados **ganham vida magicamente**.

### **👽 Os Personagens Desta História**
#### **🖥️ Container do Backend (`backend.Dockerfile`)**
- Baseado em **OpenJDK 23 + Maven**.
- **Monta o workspace** para sincronizar suas mudanças de código.
- Faz cache das dependências do Maven (porque baixá-las toda vez é coisa de masoquista).

#### **🗀 Container do Banco de Dados (`database.oracle.Dockerfile`)**
- Roda uma instância **Oracle 19c XE**.
- Tem **armazenamento persistente**, então seu banco não desaparece quando o container para.
- Usa **healthchecks** para garantir que está funcionando.

### **👀 Portas e Rede**
| Serviço | Porta do Container | Porta Externa (do .env) |
|---------|----------------|----------------|
| Backend | 8080 | `${APP_EXT_PORT}` (8060) |
| Banco de Dados | 1521 | `${DB_ORACLE_EXT_PORT}` (1561) |

### **🎉 E é isso!**
Agora você está **armado e perigoso** com um **ambiente de desenvolvimento Java-Spring-Oracle totalmente containerizado**.

Bem-vindo ao futuro, onde seu backend e banco de dados **sempre funcionam**, independente da máquina em que você esteja.

---