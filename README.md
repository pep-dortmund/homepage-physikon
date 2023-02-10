# PeP et al. PhysiKon website

We use jekyll to build static html pages from markdown and travis to deploy the site.

If you want to build the site locally, install ruby, node and some optional dependencies we need using your package manager and bundler using `gem`.

### Ubuntu

```
$ sudo apt install ruby-dev nodejs-legacy libxml2-dev libxslt-dev
$ sudo gem install bundler
```


### Arch Linux

```
$ sudo pacman -S ruby nodejs libxml2 libxslt
$ sudo gem install bundler
```

### macOS

```
$ brew install ruby node
$ gem install bundler
```

## Testing locally

Install the necessary gems
```
$ bundle install --path vendor/bundle
```

Build and serve the site locally, automatically updates if you make changes.
You might need to reload without cache (`Shift` + `R` in Chrome).

```
$ bundle exec jekyll serve
```

# PeP et al. PhysiKon website remake

Über ```_data/unternehmen.json``` können weitere Messeteilnehmer zum Carousel hinzugefügt werden.

# Working with git

We use the github workflow in this repository, see <https://guides.github.com/introduction/flow/>.

In short, to contribute:

1. Synchronize latest updates `git fetch`
1. Switch to the new branch using `git switch -c <my new branch> origin/main`
1. Make changes and commit
1. Push the Branch using `git push -u origin <name>`
1. Open a Pull Request on github.
