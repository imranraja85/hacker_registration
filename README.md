# Hacker Registration

Hacker Registration is a mobile friendly and easy to use application to assist hackathon sponsors run a raffle. The landing page is a form with only the minimal amount of fields needed to capture a hacker's profile.

## Setup
To create an admin, run the following rake task:

```sh
rake generate_admin
```

To access the admin screen append '/admin' to the end of your url

## Environment Variables

| Name | description | default |
|------|-------------|---------|
|ADMIN_EMAIL| The email address for your admin account | admin@admin.com (development) |
|ADMIN_PASSWORD| The default password for your admin account| password (development) |
|SMTP_DEFAULT_MAILER| The default mailer address outbound emails originate from ( ex. noreply@yourdomain.com ) | none |
|SMTP_ADDRESS| The remote mail server | none |
|SMTP_PORT| The port of your mail server | 25 |
|SMTP_DOMAIN| If you need to specify a HELO domain | none |
|SMTP_USER_NAME| User name for your mail server | none |
|SMTP_PASSWORD| Password for your mail server | none |
|SMTP_AUTHENTICATION| The auth type of your server (plain, login or cram_md5) | plain |
|SMTP_ENABLE_STARTTLS_AUTO| Detects if STARTTLS is enabled in your SMTP server and starts to use it.  | true |

## Testing

```
bundle exec rspec
```

or use Guard to autorun your test suite

```
guard
```
