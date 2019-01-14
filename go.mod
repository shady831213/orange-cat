module github.com/utatti/orange-cat

require (
	github.com/Depado/bfchroma v1.1.1
	github.com/codegangsta/cli v1.20.0
	github.com/golang/sys v0.0.0-20190109145017-48ac38b7c8cb // indirect
	github.com/gorilla/websocket v1.4.0
	github.com/mitchellh/gox v0.4.0 // indirect
	github.com/mitchellh/iochan v1.0.0 // indirect
	github.com/onsi/ginkgo v1.7.0
	github.com/onsi/gomega v1.4.3
	github.com/russross/blackfriday v1.5.2
	github.com/skratchdot/open-golang v0.0.0-20190104022628-a2dfa6d0dab6
	gopkg.in/russross/blackfriday.v2 v2.0.1
)

replace (
	golang.org/x/sys v0.0.0-20180715085529-ac767d655b30 => github.com/golang/sys v0.0.0-20190109145017-48ac38b7c8cb
	golang.org/x/sys v0.0.0-20181128092732-4ed8d59d0b35 => github.com/golang/sys v0.0.0-20190109145017-48ac38b7c8cb
)

replace gopkg.in/russross/blackfriday.v2 v2.0.1 => github.com/russross/blackfriday/v2 v2.0.1
