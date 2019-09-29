# qr-tag-generator
 
 
 This can be used to generate QR tags and later fill a table in MS Word with them.
 
 Personally, I used this to generate QR Code labels to label data in the field. First, I had a spreadsheet with information about the field and I used one column to generate the `fields.txt`. Then, I needed one QR Code for each one of the rows in `fields.txt`. For that, I used the Google API to get the QR Code and added readable text to it. To print them appropriatelly, I copied the printed label template dimensions using a table and made a Visual Basic script to complete the table (`QRCode_Macro.bas`).

 To use this tools, you have to edit the `fields.txt` to your needs and run the python script. After that, you can take a template like the `table.docx` and run the `QRCode_Macro.bas` on it.

