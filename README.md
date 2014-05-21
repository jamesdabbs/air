_N.B. This is a sample app for the [Atlanta Intermediate Ruby group](https://gist.github.com/jamesdabbs/9555346). I'm not serious. Don't take it seriously._

CATTR
=====

Cats on demand

## Running Locally

Clone this repo and then

```
$ bundle
$ rake db:setup cats:herd  # to download some gifs
$ rails s
```

## Tests

Assuming the app is already up and running…

```
$ rake db:test:prepare  # if needed
$ rspec
```

Note that (in the interest of not actually depending on outside services), "serving" a cat gif really just calls `open` on the file. You may need to replace that call with `thunar` or `nautilus` or what have you if you're not on OSX.

## Project Goals

* [x] Select a queue backend
* [x] Run `CatRequest#fulfill!` in the background
* [ ] Make sure specs still pass
* [x] Bonus: find a better way of spec'ing the `open` system call
* [ ] Install a job administration system
* [ ] Determine appropriate failure / retry logic

## Attributions

* Cats from [edgecats](http://edgecats.net)
* Design by [Lewis King](http://lewisking.net/)
