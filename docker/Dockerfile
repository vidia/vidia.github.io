FROM starefossen/github-pages:latest
COPY .. /usr/src/app

EXPOSE 4000
CMD jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000