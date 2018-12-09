let mysql = require('mysql2');
let dbInfo = require('./dbInfo.js');
let express = require('express');
let bodyParser = require("body-parser");

let app = express();

// Add static route for non-Node.js pages
app.use(express.static('public'));

// Configure body parser for handling post operations
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Add contacts
app.post('/reddit-import', function (req, res) {
   console.log("Route /reddit-import POST");

   // loop to populate the database
   for(let i = 0; i < x.data.children.length; i++){
   let user_data = {author: x.data.children[i].data.author};
   let sql = 'INSERT INTO users SET ?';
   connection.query(sql, 
      data, 
      function (errQuery, result) {
         if (errQuery) {
            console.log(errQuery);
            let post_data = {author: x.data.children[i].data.author, media_only: x.data.children[i].data.media_only, link_flair_template_id: x.data.children[i].data.link_flair_template_id, can_gild: x.data.children[i].data.can_gild, spoiler: x.data.children[i].data.spolier, locked: x.data.children[i].data.locked, authoer_flair_text: x.data.children[i].data.authoer_flair_text, visited: x.data.children[i].data.visited, num_reports: x.data.children[i].data.num_reports, distinguished: x.data.children[i].data.distinguished, mod_reason_by: x.data.children[i].data.mod_reason_by, removal_reason: x.data.children[i].data.removal_reason, link_flair_background_color: x.data.children[i].data.link_flair_background_color, id: x.data.children[i].data.id, is_robot_indexable: x.data.children[i].data.is_robot_indexable, reports_reason: x.data.children[i].data.reports_reason, num_crossposts: x.data.children[i].data.num_crossposts, num_comments: x.data.children[i].data.num_comments, send_replies: x.data.children[i].data.send_replies, whitelist_status: x.data.children[i].data.whitelist_status, mod_reports: x.data.children[i].data.mod_reports};
            connection.query('INSERT INTO media_only SET ?', 
               post_data,
               function (errQuery, result){
                  if (errQuery) {
                     console.log(errQuery);
                  } else {
                     console.log("Insert ID: ", result.insertId);
                  }
               })
         } else {
            console.log("Insert ID: ", result.insertId);
            res.json({status: result.insertId, err: ""});
         }
      }
   );
}
});

// Handle missing pages requested using GET HTTP verb
app.get('*', function(req, res) {
   res.status(404).send('Sorry that page does not exist');
});

// Create database connection
console.log('Creating connection...\n');
let connection = mysql.createConnection({
   host: dbInfo.dbHost,
   port: dbInfo.dbPort,
   user: dbInfo.dbUser,
   password: dbInfo.dbPassword,
   database: dbInfo.dbDatabase
});
// Connect to database
connection.connect(function(err) {
   console.log('Connecting to database...\n');

   // Handle any errors
   if (err) {
      console.log(err);
      console.log('Exiting application...\n');
   } else {
      console.log('Connected to database...\n');
      // Listen for connections
      // Note: Will terminate with an error if database connection
      // is closed
      const ip = 'localhost';
      const port = 8080;
      app.listen(port, ip, function () {
         try {
            console.log('Reddit-import server app listening on port ' + port);
         } catch (err) {
            console.log(err);
         }
      });
   }
});