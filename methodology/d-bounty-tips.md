# Bounty Tips

## API Testing
- Always fuzz IDs
- Look out for endpoints other than auth / change password that accept a password, and see if you can bypass password rate limiting
- Convert POST/PUT/PATCH endpoint to XML (and change content-type header). If 200, test for XXE.

## Payment
- Try using sandbox credit card details
- Try changing country to see if different payment options appear

## Resources
- [XXE  by converting JSON to XML](https://twitter.com/11xuxx/status/1250764273623629826)
