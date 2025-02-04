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

# Every Ninja needs tools, so let's install them
RUN apk add --no-cache bash curl git maven

# Install Node.js and update npm
RUN apk add --no-cache nodejs npm && \
    npm install -g npm@latest

# Install OpenJDK 23 from edge/testing
RUN apk add --no-cache \
    --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    openjdk23

# Set JVM timezone to UTC, bugs never sleeps
ENV JAVA_OPTS="-Duser.timezone=UTC"

# Define the workspace where your backend sorcery happens
WORKDIR /workspace

# 8080, the universal backend port, so unoriginal
EXPOSE ${APP_PORT}

# Keep the container alive 
CMD ["tail", "-f", "/dev/null"]
