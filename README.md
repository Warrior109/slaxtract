# slaxtract
*Easily dump usernames, first/last names, and email addresses from Slack*

Set the environment variable `slack_api_token`. You can get this from Slack's [web API page](https://api.slack.com/web).
The API token you use will determine which Slack organization you download info from.

Run with `ruby slaxtract.rb`. It will produce `dump.csv`, suitable to import into your email service.
