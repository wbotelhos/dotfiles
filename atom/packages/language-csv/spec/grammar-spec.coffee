describe 'CSV file grammars', ->
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage 'language-csv'

  it 'load the "CSV" config grammar', ->
    grammar = atom.grammars.grammarForScopeName 'text.csv'
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'text.csv'

  it 'load the "CSV semicolon" config grammar', ->
    grammar = atom.grammars.grammarForScopeName 'text.csv.semicolon'
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'text.csv.semicolon'
