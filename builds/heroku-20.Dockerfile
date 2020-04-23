FROM heroku/heroku:20-build

WORKDIR /app
ENV WORKSPACE_DIR="/app/builds" \
    S3_BUCKET="lang-python" \
    S3_PREFIX="heroku-20/" \
    DEBIAN_FRONTEND=noninteractive \
    STACK="heroku-20"

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        libsqlite3-dev \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip3 install --disable-pip-version-check --no-cache-dir -r /app/requirements.txt

COPY . /app
