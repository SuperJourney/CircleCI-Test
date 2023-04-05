FROM golang:1-bullseye

WORKDIR /www

RUN --mount=type=ssh  mkdir ~/.ssh &&  ssh-keyscan github.com >> ~/.ssh/known_hosts && git clone git@github.com:SuperJourney/CircleCI-Test.git

EXPOSE 8080


RUN  cd CircleCI-Test && GOOS=linux GOARCH=amd64 go build -o app

RUN  cd CircleCI-Test && GOOS=linux GOARCH=amd64 go install 

ENTRYPOINT ["CircleCI-Test"]
 