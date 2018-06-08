FROM cfssl/cfssl
LABEL maintainer="Richard Agyei <https://github.com/rnkoaa>"

RUN go get -u -v github.com/go-task/task/cmd/task

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y vim zsh \
    && wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

VOLUME [ "/workspace" ]

WORKDIR /workspace

ENTRYPOINT [ "/bin/zsh" ]
