This is a native module to use the TinyMT library in a node.js environment. Example:
```js
let {TinyMT32, TinyMT64} = require('tinymt');

let tinymt32 = new TinyMT32(/* seed */ 0);
let tinymt64 = new TinyMT64(/* seed */ 0);

console.log(`TinyMT32: ${tinymt32.generate_uint32()} ${tinymt32.generate_float()}`);
console.log(`TinyMT64: ${tinymt64.generate_uint64()} ${tinymt64.generate_double()}`);
```
Available methods on TinyMT32: `get_mexp, generate_uint32, generate_float, generate_float12, generate_float01, generate_floatOC, generate_floatOO, generate_32double`  
Available methods on TinyMT64: `get_mexp, generate_uint64, generate_double, generate_double12, generate_double01, generate_doubleOC, generate_doubleOO`
