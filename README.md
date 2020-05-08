# datafortaxjustice

Middleman based code for http://datafortaxjustice.net/, published on GitHub Pages.

As of May 2020, the site is automatically built and deployed to GitHub Pages on each push to the `master` branch.

This will trigger a GitHub action that will install middleman, build the site and push it to the `gh-pages` branch.

If you want to build and run the site locally follow the instructions in the next section:

## Developing and running it locally

Middleman is a Ruby library. You need to have Ruby installed. To install the project dependencies, clone the repo and run the following commands:

```
gem install bundler
bundle install
```

To run the site locally, run:

    middleman serve

To build the site locally, run:

    middleman build

The site will be built on the `build` folder. **Do not** push this new build to the `gh-pages` directly. Commit and push your changes to the `master` branch and they will be automatically deployed.
