# Environment

- Docker container
- BurpSuite
- Firefox
- Terminal
- [Private collaborator](https://teamrot.fi/2019/05/23/self-hosted-burp-collaborator-with-custom-domain/)

## Commands

### Docker
```docker
# Rebuild container
docker-compose.exe build bug-bounty

# Start bug-bounty container
docker run -it -v /c/Users/jakob/Bug\ Bounty/:/root/workspace jakob/bug-bounty
```
