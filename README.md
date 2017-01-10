
* Ruby version : ruby 2.3.1p112

* End-points: 
  - GET /html_contents  - returns list of urls and content in JSON format
  - POST /html_contents - parses the link to add the content and returns the entry as JSON

* Uses mongodb so no db setup required

* rspec spec/models/html_content_spec.rb and rspec spec/controllers/html_contents_controller_spec.rb  for running tests.

* ...
