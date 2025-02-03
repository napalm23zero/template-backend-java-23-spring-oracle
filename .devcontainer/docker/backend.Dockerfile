# ┌─────────────────────────────────────┐
# │  The Dark Side of Devcontainers     │
# │                                     │
# │  For dev and study use ONLY.        │
# │                                     │
# │  Deploy this to production?         │
# │  I will personally find you,        │
# │  and trust me, you won’t like it.   │
# │                                     │
# │  *You've been warned, apprentice.*  │
# └─────────────────────────────────────┘

# The backend container of your dreams (or nightmares)
# Alpine Linux, the lightweight container OS
# Latest version, because we like to live dangerously
FROM alpine:latest

# Who's the boss? I'm the boss!
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Every Ninja needs tools, and so does your backend
RUN set -ex && \
    # Install dependencies
    apk add --no-cache bash curl git maven nodejs npm && \
    # Update npm and verify
    npm install -g npm@latest

# Set JVM timezone to UTC, bugs never sleeps
ENV JAVA_OPTS="-Duser.timezone=UTC"

# Define the workspace where your backend sorcery happens
WORKDIR /workspace

# 8080, the universal backend port, so unoriginal
EXPOSE ${APP_PORT}

# Keep the container alive 
CMD ["tail", "-f", "/dev/null"]
