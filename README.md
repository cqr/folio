The folio.
----------

This is a little site for your portfolio. It tracks the things I think are
important to show off. Specifically, it tracks the tools that you use in
your projects.

Why?
----

The way that you learn how to use a particular language, framework, or library
is by using it on a whole bunch of projects. The first time, you may not get it,
but the second time, you will learn how better to use it and the third time you
will be even better.

By emphasizing how often you use certain tools, you get a much better idea of what
tools you use every day and what tools you should probably either think about
using in your next project or scrapping altogether.

Installation.
------------

Couldn't be easier.

    git clone git://github.com/chrisrhoden/folio.git my_folio
    cd my_folio
    echo "some_username: some_password" >> config/users.yml
    bundle install
    rake db:migrate
    rake cucumber
    rackup config.ru && open http://localhost:9292 # on mac
    
This is compatible with Heroku, so go for it.

Configuration.
-------------

All of the configuration is located in the config/ directory in YAML files. You will
probably discover that there is not much configuration. That is because you should
consider writing your own little hacks. I don't think there is anything too crazy
going on in the code, but that is just me and if I am wrong go ahead and shoot me
a message.

Contribute.
----------

Fork on github, commit changes, send pull request. :)

License.
-------

See the file with that name.

