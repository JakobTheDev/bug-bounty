# Insecure Direct Object Reference (IDOR)

## Testing with Autorise

### What it does
Autorise lets you browse a web application as one user, then automatically repeat each request with the cookies / authorisation headers ot another user, and with no authentication at all to find potential authorisation flaws.

### When to use
This is the main tool I use when testing for broken access controls / IDORs.

### Workflow
- Log in to two browser sessions with to different accounts (optionally at different privilege levels)
- Copy all cookies / headers used for authentication and paste into Autorise tab.
- Browse the application as primary user, review output and see if any requests respond with data that they shouldn't.
- Manually validate potential issues in repeater.

### Tips
- Set an interception filter to in scope items only to reduce noise.
- Remove items from scope as you test so you can reduce noise in Autorise.

## Testing with Auto Repeater

### What it does
Set up rules to find specific strings in web requests, then replace with another sting and replay the request. This can be used when testing for IDORs to find and replace IDs in web requests to see if you can access additional data or functionality.

### When to use
When you find ID or UUIDs and want to test with different identifiers.

## Tools
- [Autorize (BurpSuite Plugin)](https://portswigger.net/bappstore/f9bbac8c4acf4aefa4d7dc92a991af2f)
- [Auto Repeater (BurpSuite Plugin)](https://portswigger.net/bappstore/f89f2837c22c4ab4b772f31522647ed8)
