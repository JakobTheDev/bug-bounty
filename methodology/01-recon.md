<!-- omit in toc -->
# Recon

<!-- omit in toc -->
## Contents
- [Scope Enumeration](#scope-enumeration)
  - [Acquisitions / Subsidiaries](#acquisitions--subsidiaries)
  - [Autonomous System Number (ASN)](#autonomous-system-number-asn)
  - [IP Space](#ip-space)
- [Root Domain Enumeration](#root-domain-enumeration)
  - [Commands](#commands)
- [Subdomain Enumeration](#subdomain-enumeration)
  - [Certificate Transparency](#certificate-transparency)
  - [Commands](#commands-1)
  - [Tools](#tools)
  - [Resources](#resources)
- [DNS Resolving](#dns-resolving)
  - [Commands](#commands-2)
  - [Tools](#tools-1)
- [Port Scanning](#port-scanning)
  - [Commands](#commands-3)
  - [Tools](#tools-2)
- [Active Website Enumeration](#active-website-enumeration)
  - [Commands](#commands-4)
  - [Tools](#tools-3)
- [Content Discovery](#content-discovery)
  - [Commands](#commands-5)
  - [Tools](#tools-4)
  - [Lists](#lists)
  - [Tips](#tips)
- [Platform Identification](#platform-identification)
  - [Tools](#tools-5)

## Scope Enumeration

### Acquisitions / Subsidiaries
- [Chrunchbase](https://www.crunchbase.com/)
- [Wikipedia](https://en.wikipedia.org/)

### Autonomous System Number (ASN)
- [Hurricane Electric](http://he.net/)
- [ARIN](https://www.arin.net/)

### IP Space
- [Shodan](https://www.shodan.io/) - use org: search

## Root Domain Enumeration

### Commands
```bash
# Amass intel scan
amass intel -asn ASN
```

## Subdomain Enumeration

### Certificate Transparency

- [Facebook Certificate Transparency](https://developers.facebook.com/tools/ct/search/) - Search or subscribe to certificate transparency logs.

### Commands
```bash
# Amass scan
amass enum -active -v -d DOMAIN

# Amass aliases
amass-single DOMAIN
amass-list DOMAINS.txt

# Subfinder scan
subfinder -d DOMAIN

# Subfinder aliases
subfinder-single DOMAIN
subfinder-list DOMAINS.txt
```

### Tools
- [Amass](https://github.com/OWASP/Amass)
- [Subfinder](https://github.com/projectdiscovery/subfinder)

### Resources
- [Subdomains Enumeration Cheat Sheet](https://pentester.land/cheatsheets/2018/11/14/subdomains-enumeration-cheatsheet.html) - _Pentester Land_
- [The Art of Subdomain Enumeration](https://github.com/appsecco/the-art-of-subdomain-enumeration) - _Appsecco_

## DNS Resolving

### Commands

```bash
# Resolve hostnames into IP addresses
massdns -r ~/toolkit/massdns/lists/resolvers.txt -t A -w massdns-raw.txt -q -o S $1

# Convert massdns output into a list of IP addresses
cat massdns-raw.txt | grep -v CNAME | awk '{split($0,a," "); print a[3]}' | sort | uniq > massdns-resolved-ips.txt

# Alias
massdns-resolve subdomains.txt
```

### Tools
- [massdns](https://github.com/blechschmidt/massdns)

## Port Scanning

### Commands

```bash
# Scan top ports with masscan
masscan --top-ports 1000 -iL massdns-resolved-ips.txt

# Alias
masscan-top 1000 massdns-resolved-ips.txt

# Scan all ports
masscan -p0-65535 -iL

# Alias
masscan-full massdns-resolved-ips.txt
```

### Tools
- [masscan](https://github.com/robertdavidgraham/masscan)

## Active Website Enumeration

### Commands
```bash
# Probe for active web servers
cat subdomains.txt | httprobe -c 50 | tee up.txt

# Screenshot active web pages
# Note, this fails in wsl, use cmd or terminal instead
docker run --rm -it -v "$(pwd)/screenshots":/screenshots leonjza/gowitness:latest file -s /screenshots/up.txt
```

### Tools
- [EyeWitness](https://github.com/FortyNorthSecurity/EyeWitness) - _FortyNorthSecurity_
- [GoWitness](https://github.com/sensepost/gowitness) - _SensePost_

## Content Discovery

### Commands
```bash
# Hakrawler
hakrawler -url HOSTNAME

# dirsearch
dirsearch -r --plain-text-report=dirsearch.txt -u HOSTNAME -e EXTENSION1,EXTENSION2
```

### Tools
- [Dirsearch](https://github.com/maurosoria/dirsearch)
- [Hakrawler](https://github.com/hakluke/hakrawler)

### Lists
- RAFT
- SVN Digger
- Git Digger

### Tips
- Don't just scan one level deep, do recursive scanning to find access to resources under forbidden directories.

## Platform Identification

### Tools
- Wappalyzer
- Builtwith
- Retire.js
