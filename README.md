# Personal Website

The design and format is adapted from html5up's TXT theme. All content is mine.

# Building 

This was originally built to work with Github pages, but is now hosted independently. In order to get things to build properly, use the following Docker command to generate the static HTML into the `_site` folder. 

````
docker run -it --rm -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages jekyll build -d "$PWD"/_site
````

# Testing

The following command will build host a version of the site locally for dev purposes. 

````
docker run -it --rm -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages
````
