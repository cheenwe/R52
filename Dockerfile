FROM ruby:2.5.8-slim-buster

# 来指代容器中的 rails 程序放的目录
ENV APP_ROOT /opt/R52
ENV LANG C.UTF-8

# 时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezon

# 设置容器里的工作目录
WORKDIR ${APP_ROOT}

# 将 Dockerfile 目录下所有内容复制到容器工作目录
COPY . .

RUN gem install bundler
RUN sed -i 's#http://deb.debian.org#https://mirrors.163.com#g' /etc/apt/sources.list && \
    apt update && apt install -y curl  && \
    curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
    apt update

RUN apt install -y  nodejs htop  \
    libxml2-dev libxslt-dev  build-essential libsqlite3-dev


RUN bin/setup

EXPOSE 3210

ENTRYPOINT ["/bin/sh", "-c"]

CMD ["bin/bundle exec puma -C config/puma.yml"]