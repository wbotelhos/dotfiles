'use babel'

import path from 'path'
import { resetConfig, lint } from './test-helper'

describe('Lint json', () => {
  beforeEach(() => {
    resetConfig()
    waitsForPromise(() => atom.packages.activatePackage('linter-json-lint'))
  })

  describe('No content', () => {
    it('retuns one error "Invalid JSON, no content."', () => {
      waitsForPromise(() =>
        lint(path.join(__dirname, 'files', 'empty.json'))
          .then((messages) => {
            expect(messages.length).toEqual(1)
            expect(messages[0].text).toEqual('Invalid JSON, no content.')
            expect(messages[0].range).toEqual([[0, 0], [0, 1]])
          })
      )
    })
  })

  describe('Comments', () => {

    it('retuns no errors, if comments are allowed', () => {
      atom.config.set('linter-json-lint.allowComments', true)

      waitsForPromise(() =>
        lint(path.join(__dirname, 'files', 'comments.json'))
          .then((messages) => {
            expect(messages.length).toEqual(0)
          })
      )
    })

    it('retuns one error, if comments are not allowed', () => {
      waitsForPromise(() =>
        lint(path.join(__dirname, 'files', 'comments.json'))
          .then((messages) => {
            expect(messages.length).toEqual(1)
            expect(messages[0].text).toEqual('Unknown Character \'/\', expecting a string for key statement.')
            expect(messages[0].range).toEqual([[1, 2], [1, 3]])
          })
      )
    })
  })
})
