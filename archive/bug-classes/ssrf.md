# Server-Side Request Forgery (SSRF)

## Tips - Identification
- Try setting up accounts with BurpSuite collaborator domains e.g. `user@random.burpcollaborator.net`

## Tips - Exploitation
- Run Responder on your attacking server to try capturing hashes.
- Try using internal SMTP servers to send emails to validate SSRF
- If running on AWS, get data from AWS metadata service.
- Try using 302 redirects to pivot into the internal

## Resources
- [Piercing the Veil](https://medium.com/@d0nut/piercing-the-veal-short-stories-to-read-with-friends-4aa86d606fc5)
- [SSRF to RCE](https://twitter.com/SirLeeroyJenkin/status/1254258307478556672?s=20)

## Tools
- [SSRFMap](https://github.com/swisskyrepo/SSRFmap)
- [xip.io](http://xip.io/)
