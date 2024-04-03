# install
npm install --verbose
npm install --legacy-peer-deps
npm install --save-exact
npm install --save-dev

# clean install
npm clean-install
# replace node_modules
# check consistency with lock (fails if not)

# uninstall
npm uninstall

# test
npm test a -- --coverage
npm test file.test.ts -- --coverage

####
#### share react component
####

# repo to be shared
npm link
npm unlink --no-save react
npm unlink --no-save @athena/custom-eligibility-check

# see the list of symlinks
npm ls -g --depth=0 --link=true

# repo to consume
"@athena/custom-eligibility-check": "0.1.0"
npm link @athena/custom-eligibility-check # client
npm unlink @athena/custom-eligibility-check # client
