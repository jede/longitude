Longitude - Make a responsive SCSS grid
=======================================

Longitude lets you easily create responsive, mobile first layouts with
minimal footprint in an unobtrusive way!

Longitude is more a collection of calculations than just a normal CSS
grid. It lets you define how elements will be styled based on your
class hierarchy, not the framework's.


Install
-------

To use it together with SASS just do:

    gem install longitude

Or if you are using [Bundler](http://gembundler.com/) just type add it
to your Gemfile

    gem 'longitude'

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
    $longitude-gutter-width: 5px; // Use 5px gutters instead of the standard 10px
    $longitude-column-width: 70px; // Use 70px columns instead of the standard 60px
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

Documentation
---------------

### columns($columns, $surrounding-gutters: false)

Calculates the width for the specified number of columns. You can choose
to include surrounding gutters, this is normally not preferred since you
add that as gutters with margin.

### gutter($gutters: 1)

Calculates the width for the specified number of gutters (normally one).

### column-count()

The column count for this breakpoint. If you call @include longitude(4 12)
then column-count() would return 4, 12 and then 12 again.

### full-width($outer-gutters: true)

Returns the "full-width" for the current breakpoint. This is
equivalent to calling columns(column-count(), $surrounding-gutters: true)


### absolute-width($columns)

The width in pixels for the specified columns. So with standard config
values absolute-width(12) would return 960px.

### @include gutters

This is a mixin to add gutters to a selector.

```scss
section {
  @include gutters;
}
```

If the current gutter width is 5%, it will compile to:

```css
section {
  margin-left: 5%;
  margin-right: 5%;
}
```

### @include longitude($columns-list){ ... }

Creates breakpoints for the columns in the columns list. It also adds an
extra breakpoint for all width larger then the maximum provided with in
real pixels. This makes debugging and adjusting much easier and ensures
pixel perfectness when the largest breakpoint is used.

Compatibility mode (dealing with Internet Explorer)
---------------------------------------------------

Longitude uses the mobile first approach. This means that when you visit
the site with a browser that doesn't handle media queries the smallest
layout will be the default (i.e. we assume that it is a feature phone).
However IE 8 and down doesn't support media queries. This means that IE
8 will get the same layout as old mobile phones (which it maybe deserves
though). But fear not!

This solution is inspired from a solution that [Henrik Ekelöf](http://twitter.com/#!/henrikekelo)
presented in a [blog post](http://henrikekelof.se/2011/12/responsive-design-med-sass-for-alla-webblasare.html) (unfortunately in swedish).

In short the idea is to load different main stylesheets depending on if
the user uses IE 8 or lower. Say that you include your layout stylesheet
in your application.scss file like this. Then you could create an
application-ie.scss file that only loads in IE 8 and lower. 

This will look something like this in your HTML:

```html
<!--[if (gte IE 9)|!(IE)]><!-->
    <link rel="stylesheet" href="public/application.css">
<!--<![endif]-->

<!--[if (lte IE 8)]>
    <link rel="stylesheet" href="public/application-ie.css">
<![endif]-->
```

The application-ie.scss would then set a config variable:


```scss

$longitude-compatibility-mode: true;

@import 'layout';
```

When setting this variable only the largest breakpoint without any media
queries will be rendered.


Author
------

Longitude is created by Johannes Edelstam. It is licensed under the MIT
License, just like SASS.
