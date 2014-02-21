# Middleman Patterns

This is a simple boilerplate application to build pattern libraries and styleguides in middleman. It's also directly set up to deploy to heroku, for ad-hoc public facing styleguides, or you can build and deploy anywhere you can serve files.

The inspiration for this comes directly from @bradfrost's *incredible* project at [patternlab.info](http://patternlab.info), but with a few twists.

1) I prefer ruby. It's just what I work on, and I think there are a few programmers who have ignored patternlab style artifacts simply because the most maintained projects are the php version and the slightly behind node version.

2) I don't particularly care for ordering the css structure by prefixing the files with numbers. I am more inclined to use scss manifest files, ordering in a file I think is easier and more powerful than changing the file names. In the past, I used to build out libraries using @chriseppstein's amazing [sass-globbing](https://github.com/chriseppstein/sass-globbing) gem, but I favor the manifest style now.

Is this perfect or for everyone? By no means. I think a few people will find it useful, and I intend to use it.
