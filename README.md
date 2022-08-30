# wookingwoo-ip-info

[//]: # (![Build Status]&#40;https://github.com/wookingwoo/ip-info/workflows/ci/badge.svg&#41;)

A simple service for looking up your IP address. This is the code that powers
http://ip.wookingwoo.com.

## Usage

Just the business, please:

```
$ curl ip.wookingwoo.com
127.0.0.1

$ http ip.wookingwoo.com
127.0.0.1

$ wget -qO- ip.wookingwoo.com
127.0.0.1

$ fetch -qo- http://ip.wookingwoo.com
127.0.0.1

$ bat -print=b ip.wookingwoo.com/ip
127.0.0.1
```

Country and city lookup:

```
$ curl ip.wookingwoo.com/country
South Korea

$ curl ip.wookingwoo.com/country-iso
KR

$ curl ip.wookingwoo.com/city
Mapo-gu

$ curl ip.wookingwoo.com/asn
AS4766
```

As JSON:

```
$ curl -H 'Accept: application/json' ip.wookingwoo.com  # or curl ip.wookingwoo.com/json
{
  "city": "Mapo-gu",
  "country": "South Korea",
  "country_iso": "KR",
  "ip": "127.0.0.1",
  "ip_decimal": 2130706433,
  "asn": "AS4766",
  "asn_org": "Korea Telecom"
}
```

Port testing:

```
$ curl ip.wookingwoo.com/port/80
{
  "ip": "127.0.0.1",
  "port": 80,
  "reachable": false
}
```

Pass the appropriate flag (usually `-4` and `-6`) to your client to switch
between IPv4 and IPv6 lookup.

## Features

* Easy to remember domain name
* Fast
* Supports IPv6
* Supports HTTPS
* Supports common command-line clients (e.g. `curl`, `httpie`, `ht`, `wget` and `fetch`)
* JSON output
* ASN, country and city lookup using the MaxMind GeoIP database
* Port testing
* All endpoints (except `/port`) can return information about a custom IP address specified via `?ip=` query parameter
* Open source under the [BSD 3-Clause license](https://opensource.org/licenses/BSD-3-Clause)



## Building

Compiling requires the [Golang compiler](https://golang.org/) to be installed.
This package can be installed with:

`go install github.com/wookingwoo/ip-info/...@latest`

For more information on building a Go project, see the [official Go
documentation](https://golang.org/doc/code.html).

## Docker image

A Docker image is available on [Docker
Hub](https://hub.docker.com/r/mpolden/echoip), which can be downloaded with:

`docker pull mpolden/echoip`


## Get started with Dockerfile

docker run -p <host port number>:<container port number>/<protocol> [IMAGE NAME] [OTHER OPTIONS...]

```
docker build . -t wookingwoo-ip-info:1.0
docker run -i -t -d -p 8001:8080 --name wookingwoo-ip-info wookingwoo-ip-info:1.0
```

## Get started with docker-compose

To use GeoLite2, get your own account and key from https://www.maxmind.com/

```
docker-compose -f docker-compose.yml up -d --build
```

### Usage

```
$ ip-info -h
Usage of wookingwoo-ip-info:
  -C int
    	Size of response cache. Set to 0 to disable
  -H value
    	Header to trust for remote IP, if present (e.g. X-Real-IP)
  -a string
    	Path to GeoIP ASN database
  -c string
    	Path to GeoIP city database
  -f string
    	Path to GeoIP country database
  -l string
    	Listening address (default ":8080")
  -p	Enable port lookup
  -r	Perform reverse hostname lookups
  -t string
    	Path to template directory (default "html")
```
