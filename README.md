# slaxtract
*Easily extract usernames, first/last names, and email addresses from Slack*

**Instructions:**

1. Get a Slack web API token from their [web API page](https://api.slack.com/web).
2. Set your environment variable `slack_api_token` to the above. Running `export slack_api_token=YOURTOKENHERE` is sufficient.
  * *N.B.: the API token you use here will determine what Slack organization you'll be downloading from.*
3. Run `gem install slack-api`.
4. Run slaxtract with `ruby slaxtract.rb`.

This will produce `dump.csv`, suitable to import into your email service of choice. See `example.csv` for a quick look at what data will be available.

*Remember, it is against Slack's API TOS (and probably that of your email service) to extract email addresses without the consent of the users.*
