# Rails Demo - Blog

-   Setup environment: `jruby-truffle-tool setup --offline`
-   Configure `config/database.yml` (Postgresql required)
-   Start Postgres (eg `postgres -D /usr/local/var/postgres`)
-   Create database: `jruby-truffle-tool run bin/rake db:create`   
-   Migrate database: `jruby-truffle-tool run bin/rake db:migrate`   
-   Run Rails server: `jruby-truffle-tool run bin/rails server`
-   Go to <http://localhost:3000>
-   Create a new post with:

        = This is the Title of the blog post
        Author Name
        :icons: font
         
        This is an *example* of a _blog post_.
        
        == Header 1
        
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus est ante, 
        congue aliquet suscipit vel, mollis ac quam. Nam aliquam porta massa, non 
        porttitor risus cursus quis. Quisque suscipit, lorem eget congue semper, 
        sem tortor volutpat arcu, non volutpat libero felis et eros. 
        
        * Item 1
        * Item 2
        * Item 3
        
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus est ante, 
        congue aliquet suscipit vel, mollis ac quam.        
        
        NOTE: This is really just an example.
         
## Alternatively using `bundler`

-   _Omitting first 3 steps from above._     
-   Install stubs `jruby-truffle-tool setup --no-bundler` (used by bundle exec)
-   Install gems `jruby-truffle -r bundler-workarounds -S bundle install`
-   Create database: `jruby-truffle -r bundler-workarounds -I .jruby-truffle-tool_bundle/mocks/ -r stubs -S bundle exec bin/rake db:create`    
-   Migrate database: `jruby-truffle -r bundler-workarounds -I .jruby-truffle-tool_bundle/mocks/ -r stubs -S bundle exec bin/rake db:migrate`   
-   Run Rails server: `jruby-truffle -r bundler-workarounds -I .jruby-truffle-tool_bundle/mocks/ -r stubs -S bundle exec bin/rails server`
-   _Remaining steps omitted._
