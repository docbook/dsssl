<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
  <!-- HTML by default -->
  <!ENTITY % html "INCLUDE">
  <!ENTITY % print "IGNORE">

  <![%print;[
    <!ENTITY % html "IGNORE">
    <!ENTITY docbook.dsl PUBLIC 
        "-//Norman Walsh//DOCUMENT DocBook Print Stylesheet//EN" CDATA DSSSL>
  ]]>

  <![%html;[
     <!ENTITY docbook.dsl PUBLIC
        "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA DSSSL>
  ]]>
]>

<style-sheet>

<style-specification id="html" use="docbook">
<style-specification-body>

<!-- DSSSL for HTML output goes here  -->

</style-specification-body>
</style-specification>

<style-specification id="print" use="docbook">
<style-specification-body>

<!-- DSSSL for print output, i.e., TeX, RTF, MIF, goes here  -->

</style-specification-body>
</style-specification>

<external-specification id="docbook" document="docbook.dsl">

</style-sheet>
