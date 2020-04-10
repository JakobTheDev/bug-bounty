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
- [Active Website Enumeration](#active-website-enumeration)
  - [Commands](#commands-2)
  - [Tools](#tools-1)
- [Content Discovery](#content-discovery)
  - [Commands](#commands-3)
  - [Tools](#tools-2)
  - [Lists](#lists)
  - [Tips](#tips)
- [Platform Identification](#platform-identification)
  - [Tools](#tools-3)

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

### Commands
```bash
# Amass scan
amass -active -v -d DOMAIN

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

## Active Website Enumeration

### Commands
```bash
# Probe for active web servers
cat subdomains.txt | httprobe -c 50

# Screenshot active web pages
docker run --rm -it -v $(pwd)/screenshots:/screenshots leonjza/gowitness:latest file /screenshots/hostnames.txt
docker run --rm -it -v $(pwd)/screenshots:/screenshots leonjza/gowitness:latest report generate
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
