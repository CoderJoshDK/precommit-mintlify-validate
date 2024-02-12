# pre-commit mintlify validator

A pre-commit helper for [mintlify websites](https://mintlify.com/)

Don't let yourself upload a broken website. This pre-commit will automagically validate your site.  
It does this by running `mintlify broken-links`. In the process of trying to run this command, any other obviously broken components will raise errors.

## General Usage

In your mintlify repo, add a file called `.pre-commit-config.yaml` with (as an example) the following contents:

```yaml
repos:
  - repo: https://github.com/CoderJoshDK/precommit-mintlify-validate/
    rev: <VERSION> # Get the latest from: https://github.com/CoderJoshDK/precommit-mintlify-validate/
    hooks:
      - id: mintlify-validate
        args: [docs] # relative path to directory with mint.json file (optional, defaults to `.`)
```

Next, have every developer:

1. Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
2. Install [mintlify](https://mintlify.com/docs/development). E.g. `npm i -g mintlify`.
3. Run `pre-commit install` in the repo.

## Expected output

If there are issues with a broken link, the file location and the broken link will be provided in a list.  
If the issue is related to a broken component, the location where it breaks will be given (row and column)
