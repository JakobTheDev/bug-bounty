# Authentication

## Forgot Password Testing
- Is the password reset token leaked in the response to the reset password request?
- Can you send the password reset token to the attackers email address using HTTP parameter pollution
- Can you change the victim email or user ID to the attachers email or user ID?
- Does the password reset token expire?
- Can you brute force password reset tokens?
- Are there any other logic flaws in the forgot password function?

## Login
- Try brute forcing OTPs to see if the endpoint is rate limited

## Password Reset Testing
- Brute-force reset token if it's numeric.
- Host header injection - change website.com to hacker.com (Victim might receive the reset link with your host instead of the original website's)
- Figure out how tokens are generated
  - Based on Timestamp
  - Based on User ID
  - Based on uer email
- Include your email as a second parameter
  ```http
  POST /reset
  ...
  email=victim@example.com&email=you@evil.com
  ```
- Try to use your reset token on target's account
  ```http
  POST /reset
  ...
  email=victim@example.com&code=YOUR_TOKEN
  ```
