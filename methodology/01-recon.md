<!-- omit in toc -->
# Recon

<!-- omit in toc -->
## Contents
- [Scope Enumeration](#scope-enumeration)
  - [Acquisitions / Subsidiaries](#acquisitions--subsidiaries)
  - [Autonomous System Number (ASN)](#autonomous-system-number-asn)
  - [IP Space](#ip-space)
- [Subdomain Enumeration](#subdomain-enumeration)
  - [Commands](#commands)
  - [Tools](#tools)
  - [Resources](#resources)
- [Content Discovery](#content-discovery)
  - [Commands](#commands-1)
  - [Tools](#tools-1)
  - [Lists](#lists)
  - [Tips](#tips)
- [Platform Identification](#platform-identification)
  - [Tools](#tools-2)

## Scope Enumeration

### Acquisitions / Subsidiaries
- [Chrunchbase](https://www.crunchbase.com/)

### Autonomous System Number (ASN)
- [Hurricane Electric](http://he.net/)
- [ARIN](https://www.arin.net/)

### IP Space
- [Shodan](https://www.shodan.io/) - use org: search

## Subdomain Enumeration

### Commands
```bash
# Amass scan
amass -active -v -d DOMAIN

# Subfinder scan
subfinder -d DOMAIN

# Probe for active web servers
cat subdomains.txt | httprobe -c 50
```

### Tools
- [Amass](https://github.com/OWASP/Amass)
- [Subfinder](https://github.com/projectdiscovery/subfinder)

### Resources
- [Subdomains Enumeration Cheat Sheet](https://pentester.land/cheatsheets/2018/11/14/subdomains-enumeration-cheatsheet.html) - _Pentester Land_

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
