# Middleman Website Template

Here at @abletech, we've standardised on the tools we use to generate static websites. The technologies include:

* Ruby 2.4.0
* Middleman 4 with External Pipeline 
* Gulp-starter with:
  * Browser-Sync
  * Webpack
  * Sass
  * Image compressors
  * HTML minifiers
  * Autoprefixer
  * JavaScript/ES5/ES6
* Travis CI
* Amazon S3
* Amazon CloudFront

## Browsers supported

* IE (9+)
* Google Chrome (Edge)
* Safari (6+)
* Firefox (Edge)
* Opera Mobile and Desktop (12+)

## Installation

1. Clone this repo into a local directory
2. Change to your new local directory
3. `bundle install`
4. Use Node v5.6.0
5. `npm install`
6. `middleman`

## Building/Deploying to STAGING:

Make sure you've modified your configuration settings (as described below) before proceeding with deploying to staging or production.

		git checkout develop
		git pull origin develop
		APP_ENV=staging bundle exec middleman build
		APP_ENV=staging bundle exec middleman s3_sync

## Building/Deploying to PRODUCTION:

Make sure you've modified your configuration settings (as described below) before proceeding with deploying to staging or production.

		git checkout master
		git pull origin master
		APP_ENV=production bundle exec middleman build
		APP_ENV=production bundle exec middleman s3_sync
