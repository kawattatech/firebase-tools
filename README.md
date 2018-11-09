# kawatta/firebase-tools

> Minimal docker image that includes NodeJS and Firebase tools

[![Docker Automated build](https://img.shields.io/docker/automated/kawatta/firebase-tools.svg)](https://hub.docker.com/r/kawatta/firebase-tools/)
[![Docker Build Status](https://img.shields.io/docker/build/kawatta/firebase-tools.svg)](https://hub.docker.com/r/kawatta/firebase-tools/)
[![Docker image size](https://img.shields.io/microbadger/image-size/kawatta/firebase-tools.svg)](https://hub.docker.com/r/kawatta/firebase-tools/)

## Goal

This image was created to allow interacting with [Firebase](https://github.com/firebase/firebase-tools) from a CI/CD environment (e.g. publish a website to Firebase).

## Usage example
### Gitlab CI + Firebase:
```yml
# Inside .gitlab-ci.yml
# The environment variables FIREBASE_PROJECT and FIREBASE_TOKEN need to be declared in the CI/CD settings of your project

image: kawatta/firebase-tools

cache:
  paths:
    - node_modules/ # caching npm modules will allow subsequent builds to run faster, if your project relies on Node 

before_script:
  - npm install # This is only needed if you need Node to build your assets

deploy-to-firebase:
  stage: deploy
  script:
  - npm run build # Building assets
  - firebase use $FIREBASE_PROJECT --token $FIREBASE_TOKEN
  - firebase deploy --only hosting -m "Build $CI_JOB_ID Commit $CI_COMMIT_SHA" --token $FIREBASE_TOKEN
  only:
  - master
```