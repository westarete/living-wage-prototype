# Living Wage Calculator

This is the source code for http://livingwage.mit.edu/, produced under the research and direction of 
Dr. Amy K. Glasmeier.

## Development

This is a typical Ruby on Rails / PostgreSQL web application. 

    rbenv version  # should report the same thing as what's in .ruby-version
    bundle install
    rake db:setup

### Database

There's a large amount of static data that needs to be loaded -- the living wage data. If you're just looking
to do development, then you can quickly load it by running the `rake db:seed` task (after you've loaded the
empty schema). This will use a pre-existing database dump of the data, and it will load very quickly.
 
If you're working on the data itself, you may want to load the data from its raw source. The CSV files 
exist in `db/fixtures`. If you want to load these from scratch, you can do so after you've loaded
the schema with the command `rake csv:import`. 
