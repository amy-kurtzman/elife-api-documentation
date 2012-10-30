# Background.

This is the documentation repo for the eLifesciences developer resources. The documentation is based on the excellent [github api documentation][gitapi] 
and it uses [nanoc]i[nanoc] to build the documentation pages. The api is built by parsing our [article XML] and pushing it into [fluidinfo]. You can inspect 
the eLife article objects in fluidinfo [directly][efi].

[gitapi]: http://developer.github.com/v3/
[nanoc]: http://nanoc.stoneship.org/
[fi]: http://fluidinfo.com/
[efi]: https://explorer.fluidinfo.com/fluidinfo/elifesciences.org

# Deploying updates to the documentation.

API documentation is stored in `content/`, we are currently working on `v1` of the namespace, and so the current documentation is in `content/v1`. To update or extend the documentation just add to this repo, and then `rake publish`. This will place the approriate changes into a `gh-pages` branch, and deploy them to github. They will be available shortly thereafter at [http://dev.elifesciences.org/][edev].

[edev]: http://dev.elifesciences.org/

# Nanoc basics. 

If you wish to iterate on the documentation locally you can comile your changes with:  
`nanoc compile`

You can view your changes locally with:  
`nanoc view`

There is far more information on using nanoc at the [nanoc site][ndocs]. 

[ndocs]: http://nanoc.stoneship.org/docs/
