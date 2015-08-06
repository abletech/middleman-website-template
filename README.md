# Middleman Website Template

Here at @abletech, we've standardised on the tools we use to generate static websites. The technologies include:

* Ruby
* Middleman
* LiveReload
* Sass
* Autoprefixer
* CoffeeScript/JavaScript
* Google Analytics
* Travis CI
* Amazon S3
* Amazon CloudFront

## Browsers supported

* IE (9+)
* Google Chrome (Edge)
* Safari (6+)
* Firefox (Edge)
* Opera Mobile and Desktop (12+)

## Included features

* HTML
  * Boilerplate for Mobile-first Responsive Web Design
  * Basic Accessibility (a11y) features such as landmarks, skip-to nav
  * Titles, descriptions and opengraph metadata per page
* JavaScript
  * Progressively-enhanced and post-loaded
	* Menu toggling
	* `data-add-class` adds classes at runtime
	* Conditional loading of Google Analytics
	* Resize handling
* Environment
  * Development, Staging and Production boilerplate
  * Environment-specific debugging and conditionals
* Testing
  * Basic Capybara tests
* Web performance optimisations
  * Asset hashing
  * Cache-Control and Gzipping for S3
  * Script and stylesheet minification, concatenation
  * Inline CSS for the homepage
  
## Installation
1. Clone this repo into a local directory
2. Change to your new local directory
3. `bundle install`
4. `middleman`

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

## Checklist

### 1. Update configuration settings

In the `config` folder, you'll find three `.rb` files, one for each of the major environments we use. Make sure to change these settings for your own environments.

### 2. Add the touch-icons and favicons

Create and generate the necessary favicon and touch-icons and place them in the `source` folder.

		apple-touch-icon-114x114-precomposed.png
		apple-touch-icon-120x120-precomposed.png
		apple-touch-icon-144x144-precomposed.png
		apple-touch-icon-152x152-precomposed.png
		apple-touch-icon-180x180-precomposed.png
		apple-touch-icon-57x57-precomposed.png
		apple-touch-icon-72x72-precomposed.png
		apple-touch-icon-76x76-precomposed.png
		apple-touch-icon-precomposed.png (57x57 pixels)
		apple-touch-icon.png (180x180 pixels)
		touch-icon-192x192.png
		favicon.ico
		opengraph.png (200x200 pixels)

### 3. Update supporting files

		sitemap.xml.erb
		robots.txt
		humans.txt

### 4. Add a 404 page

Try out our 404 template: https://github.com/AbleTech/404_search_page

### 5. Add fallback metadata

`layouts/layout.html.erb` is expecting some metadata such as titles, descriptions and opegraph RDFa data. Add fallback values here.

## TODO

* Find a working sitemap plugin
* Build a set of PhotoShop Actions to help generate the touch-icons
