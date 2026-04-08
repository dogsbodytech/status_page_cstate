# Dogsbody Technology Status Page
This repository contains the source for [the Dogsbody Technology public status page](https://status.dogsbody.com).

It is built with [Hugo](https://gohugo.io/) using the [cstate](https://github.com/cstate/cstate) theme, which is included as a git submodule.

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

Move to the root of the repo you downloaded and run `hugo server --disableFastRender`. 

Access the site in your browser at: http://localhost:1313

## Updating cstate template

```bash
git submodule update --remote --merge
# Test locally and commit back to github
git status
git add themes/cstate
git commit -m "Update cstate theme"
```

