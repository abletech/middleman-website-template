# Middleman Website Template

Here at @abletech, we've standardised on the tools we use to generate static websites. The technologies include:

* Ruby
* Middleman

## Installation

1. Clone this repo into a local directory
2. Change to your new local directory
3. `bundle install`
4. `npm i`
5. `middleman`

## Testing environment-specific settings using `server`

    middleman server -e production

## Testing environment-specific builds

    middleman build -e production

## Building for STAGING:

    git checkout develop
    git pull origin develop
    middleman build -e staging

## Building for PRODUCTION:

    git checkout master
    git pull origin master
    middleman build -e production

## Deployment options

Try one of the following gems for deployment options:

- `middleman-deploy` for Github Pages, SFTP, and other types of deployments
- `middleman-s3_sync` for S3 deployments.

Follow up your deployment tasks with the following CDN and cache invalidation options:

- `middleman-cloudfront` for AWS-specific CDNs
- `middleman-cdn` for CloudFlare CDNs

