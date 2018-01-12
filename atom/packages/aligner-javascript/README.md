# aligner-javascript

[Aligner](https://github.com/adrianlee44/atom-aligner) add-on to support Javascript.

## Supported character / operator
`=`: assignment
```javascript
let foo   = "bar"
let test  = "notest"
let hello = "world"
```
`+=`, `-=` and other with `=`
```javascript
let foo    = "bar"
let test  += "notest"
let hello -= "world"
```
`:`: Object
```javascript
random = {
  troll: "internet",
  foo:   "bar",
  bar:   "beer"
}
```
`,`: Items in arrays
```javascript
["helloText", 123456, "world"]
["foo"      ,  32124, "bar"]
```
`from`:
```
import * from 'fs';
import * from 'https';
```
Comments (if `Align Comments` options on)
```javascript
let hello = 'world'; // line 1
let foo   = 'bar';   // line 2
```

## Installation
Aligner must be installed along with this package. For more information, please check out [Aligner](https://github.com/adrianlee44/atom-aligner)

## Changelog
- 2017-08-02   v1.3.0   Add support for JSON
- 2017-07-06   v1.2.0   Add support for inline Javascript
- 2017-05-13   v1.1.0   Update README
- 2016-07-21   v1.0.0   Initial release
