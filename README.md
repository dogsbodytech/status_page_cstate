# Dogsbody Technology Status Page
Using [cstate](https://github.com/cstate/cstate) and [Hugo](https://github.com/cstate/cstate) frameworks.

Commits to this repo are automatically built by GitHub Actions and deployed immediately to GitHub Pages.

## Cloning
 git clone --recursive git@github.com:dogsbodytech/status_page_cstate.git

## Updating cstate
 git submodule foreach git pull origin master

## Running locally
To run the site locally you'll need Hugo installed. Install Hugo from the [latest release](https://github.com/gohugoio/hugo/releases). Install the `.deb` file for the easiest install. 

Move to the root of the repo you downloaded and run `hugo serve`. 

Access the site in your browser at: http://localhost:1313










## Are you updating? Use these commands

Download your site with all the directories. `git clone --recursive <your repo link goes here>`

Update the cState theme submodule. `git submodule foreach git pull origin master`

In the parent directory, type `hugo serve`. Check to see if everything is working.

Then do `git add -A; git commit -m "Update cState"; git push origin <branch, probably main or master>`. Your status page is now updated and uploaded.


## For maintainers (probably not for you)

Maintainers need to update both cstate/cstate and cstate/example for each new version.

Download this repo with all the directories. `git clone --recursive -b master https://github.com/cstate/example.git`

Add your changes from cstate/cstate's exampleSite folder.

Update the cState theme submodule. `git submodule foreach git pull origin master`

Then push `git add -A; git commit -m "Update cState vX.X.X"; git push origin master`.

## License

MIT © Mantas Vilčinskas
