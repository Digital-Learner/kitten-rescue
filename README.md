# Kitten Finder

## Docker image details

 - build from ruby 2.6 alpine image (to keep it small)
 - `docker build -t kitten-rescue .` to build the kitten-rescue docker image
 - `docker run -it --rm kitten-rescue /bin/bash` to run the container


## manual testing (within the docker container)

 - `require './lib/operations';`
 - `k = KittenRescue::Operations.new; `
 - `evidence = k.gather_evidence; `
 - `guess = k.process_evidence; `
 - `k.validate_location; `

## TODO's

 - had an issue with Docker container having the `Gemfile.lock`
 - it was not reflected in local directory (most likely as not instally ruby locally, only via docker)

 - spent some time investigating reasons, and believe these take down correct route

 www.chrisblunt.com/rails-on-docker-quickly-create-or-update-your-gemfile-lock
 nickjanetakis.com/blog/dealing-with-lock-files-when-using-ruby-node-and-elixir-with-docker

 - could spend some time refactoring, as probably on reflection the following methods in the operations class belong in the location class

 - #process_directions
 - #create_and_update_position
 - #move

 - write some more specs around submitting the final guess

 - would add some linting with rubocop and probably some other metrics tools (reek/flay/flog/brakeman/etc)

## Questions

 - it seemed that i had less than 5 requests for rate limited endpoint (location), belive I executed it 3 times, 2 x from browser, 1 x programatically
 - curious as to how you tracked it, assume by IP?