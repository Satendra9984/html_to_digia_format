var css2json = require('css2json');
var fs = require('fs');





const cssconvertor = async (css) => {
    var json = css2json(css);
    // console.log(json);
    json  = JSON.stringify(json);
    var type = typeof json;
    // console.log(json);
    // console.log(type);

    fs.writeFile("C:/Users/LENOVO/development/internships/digia/html_to_digia/figma_css.json", json, function(err) {
    if (err) {
        console.log(err);
    }
    });
} 

module.exports = cssconvertor;

