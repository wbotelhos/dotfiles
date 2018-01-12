"use babel"

import { config } from '../lib/init'
import LinterJsonLintProvider from '../lib/linter-json-lint-provider'

export function resetConfig() {
  Object.keys(config).forEach((key) => {
    atom.config.set("linter-json-lint.#{key}", config[key].default)
  })
}

export function lint(filePath) {
  return atom.workspace.open(filePath)
    .then((editor) => LinterJsonLintProvider.lint(editor))
}
