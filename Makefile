.PHONY: build rebuild getdep rmdep

build: 
			go build -o graphql.serve main.go

rebuild: 
				go build -o graphql.serve main.go

getdep: 
			bash ./getdep.sh

rmdep:
			 rm -rf ./vendor
