# bot-windows-set-dns

Set the DNS of a network interface on Windows

## Usage

```
Usage: set dns [options] <ip> <interface>

  Set the DNS of an interface

  Options:

    --help  output usage information
```

Example: `set dns 1.1.1.1 "Connexion au réseau local"`

## Some DNS address

1.1.1.1 is Cloudflare
8.8.8.8 is Google

## How to get interface names?

```
netsh interface ipv4 show interfaces
```
