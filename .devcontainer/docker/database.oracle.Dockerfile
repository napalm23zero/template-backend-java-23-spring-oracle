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

# Official Oracle Database Free image, we like to keep it legal
FROM container-registry.oracle.com/database/free:latest

# Who's the boss? I'm the boss!
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Configuration settings so you don't have to type them every time
ENV ORACLE_DATABASE=${ORACLE_DATABASE}
ENV ORACLE_USER=${ORACLE_USER}
ENV ORACLE_PASSWORD=${ORACLE_PASSWORD}

# Because databases need to communicate too
EXPOSE ${DB_ORACLE_PORT}

# Start the database and keep it running forever
CMD ["/bin/sh", "-c", "/etc/init.d/oracle-free start && tail -f /dev/null"]
