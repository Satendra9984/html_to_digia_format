var fs = require('fs');


const { HTMLToJSON } = require('html-to-json-parser'); // Common



const htmlconv = async(htmls) => {
    let element = htmls.replace(/^\s+/gm, '').replace(/\n/g, '').replace(/'/g, '');
    // console.log(element);

    let result = await HTMLToJSON(element, true);
    // console.log(result);
    
    fs.writeFile("C:/Users/LENOVO/development/internships/digia/html_to_digia/figma_html.json", result, function(err) {
      if (err) {
          console.log(err);
      }});

}

module.exports = htmlconv;

// const html =
// `
// <html>
//   <head>
//     <title>Href Attribute Example</title>
//   </head>
//   <body>
//     <h1>Href Attribute Example</h1>
//     <p>
//       <a href="https://www.freecodecamp.org/contribute/">The freeCodeCamp Contribution Page</a> shows you how and where you can contribute to freeCodeCamp's community and growth.
//     </p>
//   </body>
// </html>
// `;



