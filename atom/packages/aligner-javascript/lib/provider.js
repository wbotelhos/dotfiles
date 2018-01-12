module.exports = {
  selector: [
    '.source.js',
    '.source.js.jsx',
    '.source.js.embedded.html',
    '.source.json'
  ],
  id: 'aligner-javascript', // package name
  config: {
    "=-alignment": {
      "title": "Padding for =",
      "description": "Pad left or right of the character",
      "type": "string",
      "default": "left",
      "enum": ["left", "right"]
    },
    "=-leftSpace": {
      "title": "Left space for =",
      "description": "Add 1 whitespace to the left of the character",
      "type": "boolean",
      "default": true
    },
    "=-rightSpace": {
      "title": "Right space for =",
      "description": "Add 1 whitespace to the right of the character",
      "type": "boolean",
      "default": true
    },
    ":-alignment": {
      "title": "Padding for :",
      "description": "Pad left or right of the character",
      "type": "string",
      "default": "right",
      "enum": ["left", "right"]
    },
    ":-leftSpace": {
      "title": "Left space for :",
      "description": "Add 1 whitespace to the left of the character",
      "type": "boolean",
      "default": false
    },
    ":-rightSpace": {
      "title": "Right space for :",
      "description": "Add 1 whitespace to the right of the character",
      "type": "boolean",
      "default": true
    },
    ",-leftSpace": {
      "title": "Left space for ,",
      "description": "Add 1 whitespace to the left of the character",
      "type": "boolean",
      "default": false
    },
    ",-rightSpace": {
      "title": "Right space for ,",
      "description": "Add 1 whitespace to the right of the character",
      "type": "boolean",
      "default": true
    },
    "from-alignment": {
      "title": "Padding for 'from'",
      "description": "Pad left or right of the operator",
      "type": "string",
      "default": "left",
      "enum": ["left", "right"]
    },
    "from-leftSpace": {
      "title": "Left space for 'from'",
      "description": "Add 1 whitespace to the left of the operator",
      "type": "boolean",
      "default": true
    },
    "from-rightSpace": {
      "title": "Right space for 'from'",
      "description": "Add 1 whitespace to the right of the operator",
      "type": "boolean",
      "default": true
    }
  },
  privateConfig: {
    "=-prefixes": ["+", "-", "&", "|", "<", ">", "!", "~", "%", "/", "*", "."],
    "=-scope": "operator|assignment",
    ":-scope": "operator|assignment|separator|punctuation",
    ",-scope": "delimiter",
    ",-multiple-number-alignment": "right",
    ",-multiple-string-alignment": "left",
    "from-scope": "keyword.control"
  }
};
