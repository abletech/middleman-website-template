# Middleman Website Template

Here at @abletech, we've standardised on the tools we use to generate static websites. The technologies include:

* Ruby 2.4.0
* [Middleman 4](https://middlemanapp.com/) with External Pipeline 
* [Gulp-Starter](https://github.com/vigetlabs/gulp-starter) with:
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
4. *Important:* Use Node v5.6.0
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

## Checklist before deploying to PRODUCTION:

1. Supply supporting images:
  1. `source/opengraph.png` At least: 600x315 (maintaining that aspect ratio)
  2. Touch icons:
    - `source/apple-touch-icon-57x57-precomposed.png`
    - `source/apple-touch-icon-precomposed.png` - also 57x57
    - `source/touch-icon-58x58.png`
    - `source/touch-icon-64x64.png`
    - `source/apple-touch-icon-72x72-precomposed.png`
    - `source/apple-touch-icon-76x76-precomposed.png`
    - `source/touch-icon-96x96.png`
    - `source/apple-touch-icon-114x114-precomposed.png`
    - `source/apple-touch-icon-120x120-precomposed.png`
    - `source/touch-icon-128x128.png`
    - `source/apple-touch-icon-144x144-precomposed.png`
    - `source/apple-touch-icon-152x152-precomposed.png`
    - `source/apple-touch-icon-180x180-precomposed.png`
    - `source/apple-touch-icon.png` - also 180x180
    - `source/touch-icon-192x192.png`
    - `source/touch-icon-256x256.png`
  3. `source/favicon.ico` Ideally with 16x16, 24x24, 32x32, 48x48, and 64x64 PNGs embedded.
  4. Double-check `source/manifest.json` is using the icons supplied as above.
2. If you want to prefetch domains, make sure `data/prefetch_domains.json` is up-to-date.
3. If you’ve enabled service-workers, make sure your ignore-list is up-to-date at `data/offline_cache_ignore.json`.
4. Update `source/humans.txt`
5. Update `source/sitemap.xml.erb`
6. Make sure all your pages have a `title` and `description` set in the YAML frontmatter.
