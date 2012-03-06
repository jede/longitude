Longitude SCSS grid framework
=============================

Install
-------

To use it together with SASS just do:

    gem install jede-longitude --source http://gems.github.com

Or if you are using [Bundler](http://gembundler.com/) just type add it
to your Gemfile

    gem 'longitude', git: 'git@github.com:jede/longitude.git'

Usage
-----

Start off by creating a stylesheet for the parts of your design that
will depend on the screen width. Let's place it in a directory called
stylesheets. Also create a folder named public where the compiled CSS
files will be placed.

    ./stylesheets/layout.scss


Longitude calculates responsive widths for you, but to make it easier to
relate to actual pixels at the different breakpoints, it uses base values
in pixels. Breakpoints are then calculated by different column counts.
Longitude defaults to 60px wide columns with 10px gutters on each side.

     +------+-------------------------------+------+
     |      |                               |      |
     |      |                               |      |
     | 10px |             60px              | 10px |
     |      |                               |      |
     |      |                               |      |
     +------+-------------------------------+------+

This can be changed by updating the following config variables:

```scss
    $longitude-gutter-width: 5px; // Use 5px gutters instead of the
standard 10px
    $longitude-column-width: 70px; // Use 70px columns instead of the
standard 60px
```

Let's say that you want two responsive breakpoints, one for devices up
to 320px wide and then one 960px breakpoint for larger screens. Between
these breakpoints we want the design to be fluid.

Then our layout.scss could look like this:

```scss
@import 'longitude';

@include longitude(4 12) {
  article {
    margin: 0 gutter();
    width: columns(4);
  }
}
```

If you are running bundler you could now run the following

    bundle exec sass --watch stylesheets:public -r longitude

This then translates to CSS, and public/layout.css will now look like:

```css
@media (max-width: 320px) {
  article {
    margin: 0 3.125%;
    width: 93.75%; } }
@media (min-width: 321px) and (max-width: 960px) {
  article {
    margin: 0 1.042%;
    width: 31.25%; } }
@media (min-width: 961px) {
  article {
    margin: 0 10px;
    width: 300px; } }
```



Author
------

Longitude is made by Johannes Edelstam. It is licensed under the MIT
License, just like SASS is.
