"use babel"

import JSONLint from 'json-lint'

export default {

  name: "json-lint",

  grammarScopes: ['source.json'],

  scope: 'file',

  lintOnFly: true,

  lint(textEditor) {

    return new Promise((resolve, reject) => {

      var lint = JSONLint(textEditor.getText(), {
        comments: atom.config.get('linter-json-lint.allowComments')
      })

      const messages = []

      if (lint.error) {

        let lineIdx = lint.line - 1
        let columnIdx = Math.max(0, lint.character - 1)
        messages.push({
          type: 'Error',
          text: lint.error,
          filePath: textEditor.getPath(),
          range: [[lineIdx, columnIdx], [lineIdx, columnIdx + 1]]
        })
      }

      resolve(messages)
    })
  }
}
