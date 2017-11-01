# Middleman Website Template

This static site generator template is written for Middleman. It contains [plenty of rich features every website should have](./FEATURES.md), such as:

- Performance improvements
- Progressive Web App capabilities
- Opengraph configuration

## Installation

1. Clone this repo into a local directory
2. Change to your new local directory
3. `brew install ImageMagick` (Required for the `middleman-favicon-maker` gem)
4. `bundle install`
5. `npm i`
6. `middleman`

## Development

### Defining JS manifests

To create the link between Webpack bundles and Middleman's HTML, you need to define each manifest or entry as follows:

- Define the Webpack entries in `config/entries.js`
- Create corresonding `<script>` references in in `source/_layouts/layout.erb`

### Defining CSS manifests

- Define the Webpack entries in `config/entries.js`
- Create corresonding `<link>` references in in `source/_layouts/layout.erb`

## Build

### Doing environment-specific builds

All builds default to production mode

    middleman build

If you want a STAGING specific build use the following:

    middleman build -e staging

## Building for STAGING:

    git checkout develop
    git pull origin develop
    middleman build -e staging

## Building for PRODUCTION:

    git checkout master
    git pull origin master
    middleman build -e production

## Deployment

### Deployment options

Try one of the following gems for deployment options:

- `middleman_gh-pages` for Github Pages deployments
- `middleman-s3_sync` for S3 deployments.

Follow up your deployment tasks with the following CDN and cache invalidation options:

- `middleman-cloudfront` for AWS-specific CDNs
- `middleman-cdn` for CloudFlare CDNs

