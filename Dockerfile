FROM octohost/go-1.2

RUN curl -sf -o /usr/bin/forego https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego && chmod 777 /usr/bin/forego
RUN mkdir /srv/termshare
RUN go get code.google.com/p/go.net/websocket && go get github.com/heroku/hk/term && go get github.com/kr/pty && go get github.com/nu7hatch/gouuid
ADD . /srv/termshare/
RUN cd /srv/termshare && make build && cp termshare /usr/bin/

EXPOSE 5000

WORKDIR /srv/termshare

CMD forego start
