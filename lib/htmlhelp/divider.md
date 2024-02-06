To create horizontal and vertical dividers in HTML, you can use CSS styles or HTML elements tailored to your design needs. Here are some methods for both horizontal and vertical dividers:

### Horizontal Divider:

1. **Using Horizontal Rule (`<hr>`)**:
   The `<hr>` tag is specifically designed to create horizontal dividers.

   ```html
   <p>This is some content above the divider.</p>
   <hr>
   <p>This is some content below the divider.</p>
   ```

2. **Using CSS Borders**:
   You can apply border styles to a container element to create a horizontal line.

   ```html
   <div style="border-top: 2px solid black;"></div>
   ```

3. **Using CSS with `<hr>`**:
   You can use CSS styles along with the `<hr>` tag to customize the appearance of the horizontal divider.

   ```html
   <hr style="border-top: 2px solid black;">
   ```

### Vertical Divider:

1. **Using CSS Borders**:
   Apply border styles to a container element to create a vertical line.

   ```html
   <div style="border-left: 2px solid black; height: 100px;"></div>
   ```

2. **Using CSS Pseudo-elements**:
   You can use pseudo-elements (`::before` or `::after`) to create a vertical line without adding extra markup.

   ```html
   <style>
     .vertical-divider::after {
       content: "";
       border-left: 2px solid black;
       height: 100px;
       display: block;
     }
   </style>
   <div class="vertical-divider"></div>
   ```

3. **Using SVG**:
   You can use SVG graphics to create a vertical line.

   ```html
   <svg width="2" height="100">
     <line x1="1" y1="0" x2="1" y2="100" style="stroke:black;stroke-width:2" />
   </svg>
   ```

Choose the method that best fits your design requirements and integrates smoothly with your HTML structure.