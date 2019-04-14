
npm-packages:
  cmd.run:
    - name: npm install -g \
        broccoli-cli@latest \
        csslint@latest \
        elm-oracle@latest \
        elm@latest \
        elm-test@latest \
        elm-format@latest \
        htmlhint@latest \
        npm@latest \
        prettier@latest \
        stylelint@latest \
        sass-lint@latest \
        tern@latest \
        tslib@latest \
        tslint@latest \
        typescript@latest \
        yarn@latest \
        eslint-plugin-class-property@latest \
        babel-eslint@latest \
        javascript-typescript-langserver@latest \
        dockerfile-language-server-nodejs@latest \
        neovim@latest \
        typescript-tslint-plugin@latest \
        jsvu@latest

npm-eslint:
  cmd.run:
    - name: ( export PKG=eslint-config-airbnb; npm info "$PKG@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$PKG@latest" )
