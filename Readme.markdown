# Guard-Jenkins#

Thanks for checking out this Jenkins Guard!

A
[RoadMap](https://github.com/justinstoller/guard-jenkins/wiki/Road-Map)
can be found on the
[Wiki](https://github.com/justinstoller/guard-jenkins/wiki/Home).

And a brief introduction can be found on the project's
[Homepage](https://justinstoller.github.com/guard-jenkins)

## Usage: ##

```bash

  # rb-inotify allows guard to learn of fs events in much more
  # performant way than simple polling
  gem install rb-inotify guard-jenkins

  # in either ~/ or $JENKINS_HOME
  guard init jenkins
  guard [start]

```

## Contributing: ##
Everyone should pitch in!

If you want to do development on this project you will need:

Rspec ~> 2.6
SimpleCov ~> 0.4

### Submit an Issue: ###
Please file complete bug reports when filing issues
That includes your complete environment,
exactly what you were doing when it occurred,
and for good measure your zodiac sign, hair color, and favorite color.

Even better! If you could provide a link to a Gist or patch with tests
that quickly shows how to replicate the issue, that would be
perfect

### Add a Feature: ###
Fork the project.
Add tests in a similar style to those that already exist (hrm...)
Add the feature
Issue a pull request!

### Write Documentation/Show Examples: ###
Got an amazing jenkins configuration you've buit with this?
Add it to the
[wiki](https://github.com/justinstoller/guard-jenkins/wiki/Projects-Using)!

