FROM eawsy/aws-lambda-go-shim:latest

ENV SERVERLESS serverless@1.22.0
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

RUN true && \
    yum -q -e 0 -y update || true && \
    yum -q -e 0 -y install git || true
RUN	go get -u github.com/golang/dep/cmd/dep && \
    go get -u github.com/rancher/trash && \
    curl https://glide.sh/get | sh ||  true
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - && \
 	yum install -y nodejs
RUN npm install -g $SERVERLESS