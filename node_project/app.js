// const http = require('http')


const cssconvertor = require('./css_convertor')
const htmlconvertor = require('./htmlconv')

async function main() {
  await htmlconvertor(html);
  await cssconvertor(css);
}


var html = `
<button type="button" class="custom-button">Click me</button>
`;

var css = `
.custom-button {
      display: inline-block;
      padding: 10px 20px;
      font-size: 16px;
      font-weight: bold;
      text-align: center;
      text-decoration: none;
      cursor: pointer;
      border: 2px solid #3498db;
      color: #fff;
      background-color: #3498db;
      border-radius: 5px;
      transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
    }
`;






main();
