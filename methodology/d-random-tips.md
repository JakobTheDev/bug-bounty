# Random Tips

## Account Testing
- If you aren't asked to verify your email on account creation, try creating an account with their email domain (me@target.com)
- If there is an invite account feature, send an invite to account B and try accepting on account C

## API Testing
- Always fuzz IDs
- Look out for endpoints other than auth / change password that accept a password, and see if you can bypass password rate limiting

## Authentication Testing
- Try brute forcing OTPs to see if the endpoint is rate limited

## Payment
- Try using sandbox credit card details
- Try changing country to see if different payment options appear
