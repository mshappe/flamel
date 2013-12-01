flamel
======

A simple system potential teachers of specific topics.

This is designed specifically to the requirements of the Stellar University of Northshield's Chancellor. Northshield is a Kingdom of the Society for Creative Anachronism, Inc.

Installation Instructions
-------------------------

This can be installed the same as any rails app. It's simple enough that you could run it purely locally if you really wanted with the default WEBrick.

At a minimum, beyond the usual db:setup stuff, you'll want to run

    bundle exec rake generate:admin

to generate the first user account. The `seeds.db` also contains the list of groups current in Northshield. If you're not in Northshield, this is not very useful to you, but it's also easily imitated/replaced for what you need.

This software is Copyright © 2013 Michael Scott Shappe. Licensed under the Apache license, q.v.


