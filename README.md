# Hacker Registration

Hacker Registration is a mobile friendly, easy to use, application to assists hackathon sponsors organize a raffle. The landing page is a form with only the minimal amount of fields needed to capture a hacker's profile.

## Setup
To create an admin, run the following rake task:

```sh
rake generate_admin
```

To access the admin screen append '/admin' to the end of your url

## Environment Variables

| Name | description | default |
|------|-------------|---------|
|ADMIN_EMAIL| The email address for your admin account | admin@admin.com (development)|
|ADMIN_PASSWORD| The default password for your admin account| password (development)|

## Testing

```
bundle exec rspec
```

or use Guard to autorun your test suite

```
guard
```
