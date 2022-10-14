# Dogsbody Technology Status Page
Using the [Hugo framework](https://gohugo.io/) with the [cstate theme](https://github.com/cstate/cstate).

Commits to this repo are automatically built by Cloudflare and deployed immediately to the [Dogsbody Technology Status Page](https://status.dogsbody.com) which is hosted on Cloudflare Pages.

## Cloning
This repo uses git submodules so use:
`git clone --recursive git@github.com:dogsbodytech/status_page_cstate.git`

## Creating an issue
Just run  `create_a_new_issue.sh` and follow the instructions.

This will guide you through creating a file in `content/issues/`

Details of the file format can be found on [the cstate wiki](https://github.com/cstate/cstate/wiki/Usage#creating-incidents-method-1)

## Running locally
The site can be run locally but will require Hugo to be installed. 

Install Hugo from the [latest release](https://github.com/gohugoio/hugo/releases). Install the `.deb` file for the easiest install. 

Move to the root of the repo you downloaded and run `hugo server --disableFastRender`. 

Access the site in your browser at: http://localhost:1313

## Updating cstate template
`git submodule foreach git pull origin master`

Test locally and commit back to github


