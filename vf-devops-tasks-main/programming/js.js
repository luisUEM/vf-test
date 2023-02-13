
function method1(value) {
  var v1 = splitter(value)
  var v2 = splitter(value).reverse()

  return v1.every((v, i) => (v2[i] === v))
}

function method2(value1, value2) {
  var r = 0
  for(var i = value1; i <= value2; i++) {
    r = (i%2 === 1) ? r+i : r
  }
  return r
}

function method3(value1, value2) {
  return splitter(value1).sort().join("") == splitter(value2).sort().join("")
}

function splitter(v) { return v.toLowerCase().split('') }