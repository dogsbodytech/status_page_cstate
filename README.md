# Dogsbody Technology Status Page
Using [cstate](https://github.com/cstate/cstate) and [Hugo](https://github.com/cstate/cstate) frameworks.

Commits to this repo are automatically built by Cloudflare and deployed immediately to Cloudflare Pages.

## Cloning
`git clone --recursive git@github.com:dogsbodytech/status_page_cstate.git`

## Running locally
To run the site locally you'll need Hugo installed. Install Hugo from the [latest release](https://github.com/gohugoio/hugo/releases). Install the `.deb` file for the easiest install. 

Move to the root of the repo you downloaded and run `hugo serve`. 

Access the site in your browser at: http://localhost:1313

## Updating cstate template
`git submodule foreach git pull origin master`
test and commit




