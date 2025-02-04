# Devcontainer setup

Alright, listen up, newbie. You wanna know what a DevContainer is? Fine, I’ll break it down for you in the simplest way possible so your brain doesn’t hurt.

## **What is This?**

Imagine you’re setting up a new project, and it’s got a ton of dependencies—specific, Lombok specific versions, some ancient Java garbage, a weird database, and maybe some obscure tool that only runs on Linux.

Now, you could spend hours setting up your environment, fighting dependency hell, and breaking your OS… OR you could just use a **DevContainer** and be done in 5 seconds.

A **DevContainer** is like a **"project in a box"**. It’s a **Docker container** that holds everything your project needs:

✅ The right programming languages  
✅ The right libraries and dependencies  
✅ The right tools and extensions  
✅ The right OS setup  
✅ The right environment variables

So when you open your project inside a DevContainer (usually in VS Code), **BOOM 💥—everything is ready to go**. No setup, no conflicts, no “it works on my machine” drama.

## How it Works?

1. **Define Your Environment** – You create a `.devcontainer` folder with a `devcontainer.json` file that tells VS Code how to set things up.
2. **Containerized Magic** – VS Code reads this file, spins up a **Docker container** with all your junk pre-installed, and connects your editor to it.
3. **Instant Coding** – You work inside the container as if it were your local machine, but everything is isolated. No mess, no conflicts, no accidental "whoops I updated my Java version and now everything is broken" moments.

## Why You Should Care?

- 💀 No more "works on my machine" excuses
- 🛠 Super easy to onboard new devs (just clone and go)
- 🔥 No cluttering your actual system with dependencies
- 🚀 Makes your dev setup **portable**—run it anywhere with Docker
- 🎯 Perfect for open-source projects and teams

**TL;DR:** DevContainers are like pre-configured virtual dev environments inside Docker, making your life easier and your setup foolproof.

## **💮 What’s Inside?**

## 📁 **Directory Structure**

```
/workspace/
 ├── .devcontainer/
 │    ├── docker/
 │    │    ├── backend.Dockerfile           # The Backend Container Recipe
 │    │    ├── database.oracle.Dockerfile   # The Oracle Database Container Recipe
 │    ├── .env                              # Secrets live here. Guard them well.
 │    ├── devcontainer.json                 # The VS Code DevContainer Configuration
 │    ├── docker-compose.yml                # The glue that binds them all together
```

## **🛠️ How It Works**

### **Step 1: DevContainer Magic**

- **devcontainer.json** is your wizard’s spellbook. It **tells VS Code** how to set up the dev environment.
- It installs **essential VS Code extensions** (Java tools, Copilot, SonarLint, Docker, etc.).
- **Maps ports**, so your app and database can talk without screaming.

### **Step 2: Container Conjuring with Docker Compose**

- **docker-compose.yml** is your **summoning circle**.
- Defines:
    - **Backend container** → `template-backend`
    - **Database container** → `template-database-oracle`
- **Ensures backend starts only when the database is ready**.

### **Step 3: The `.env` Dark Side Secrets**

- 🚡 **NEVER COMMIT THIS FILE** (unless you want your credentials stolen).
- Stores:
    - Database credentials (`ORACLE_USER`, `ORACLE_PASSWORD`).
    - Port mappings (`APP_PORT`, `DB_ORACLE_PORT`).
- Password example: `DarthVader42` (because strong passwords are strong with the Dark Side).

## **🛠️ Setting Up**

## **1️⃣ Install Requirements**

- [Docker](https://www.docker.com/get-started) 🐳
- [VS Code](https://code.visualstudio.com/) 🖥️
- [Remote - Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## **2️⃣ Clone the Repository**

```
git clone https://github.com/napalm23zero/template-backend-java-23-spring-oracle.git
cd template-backend-java-23-spring-oracle
```

## **3️⃣ Open in VS Code**

```
code .
```

- **VS Code should prompt you to “Reopen in Container.”**
- Click it. **If it doesn’t, hit** `Ctrl + Shift + P` → `Reopen in Container`.

Backend + Database **magically come to life**.

## **👽 The Characters in This Play**

## **🖥️ Backend Container (`backend.Dockerfile`)**

- Based on **OpenJDK 23 + Maven**.
- **Mounts workspace** to sync your code changes.
- Caches Maven dependencies (because downloading them every time is for masochists).

## **🗀 Database Container (`database.oracle.Dockerfile`)**

- Runs an **Oracle 19c XE instance**.
- Has **persistent storage**, so your DB doesn’t vanish when the container stops.
- Uses **healthchecks** to ensure it’s alive.

## **👀 Ports & Networking**

| Service  | Container Port | Host Port (from .env)          |
| -------- | -------------- | ------------------------------ |
| Backend  | 8080           | `${APP_EXT_PORT}` (8060)       |
| Database | 1521           | `${DB_ORACLE_EXT_PORT}` (1561) |

## **🎉 That’s It!**

You’re now **armed and dangerous** with a **fully containerized Java-Spring-Oracle dev environment**.

Welcome to the future, where your backend and database **always work**, no matter what machine you’re on.

---

<!-- <p style="display: flex; justify-content: space-between;">
  <span>Previously</span>
  <span>Next</span>
</p> -->
