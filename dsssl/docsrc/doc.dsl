<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!-- HTML by default -->
<!ENTITY % print "IGNORE">
<![%print;[
<!ENTITY % html "IGNORE">
<!ENTITY docbook.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook Print Stylesheet//EN" CDATA dsssl>
]]>
<!ENTITY % html "INCLUDE">
<![%html;[
<!ENTITY docbook.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA dsssl>
]]>
]>

<style-sheet>
<style-specification id="html" use="docbook">
<style-specification-body>

(define %use-id-as-filename% #t)
(define %generate-legalnotice-link% #t)

(define (toc-depth nd) 1)

(define (chunk-element-list)
  (list (normalize "preface")
	(normalize "chapter")
	(normalize "appendix") 
	(normalize "article")
	(normalize "glossary")
	(normalize "bibliography")
	(normalize "index")
	(normalize "setindex")
	(normalize "reference")
	(normalize "refentry")
	(normalize "part")
	(normalize "book") ;; just in case nothing else matches...
	(normalize "set")  ;; sets are definitely chunks...
	))

(define (chunk-skip-first-element-list)
  '())

(define (set-titlepage-recto-elements)
  (list (normalize "title")
	(normalize "subtitle")
	(normalize "graphic")
	(normalize "corpauthor")
	(normalize "authorgroup")
	(normalize "author")
	(normalize "editor")
	(normalize "releaseinfo")
	(normalize "pubdate")
	(normalize "copyright")
	(normalize "legalnotice")))

</style-specification-body>
</style-specification>

<style-specification id="print" use="docbook">
<style-specification-body>

(element pubdate
  (if (equal? (attribute-string (normalize "role")) "rcs")
      (let* ((datelist (split (data (current-node))))
	     (date (car (cdr datelist))))
	(literal date))
      (process-children)))

(mode book-titlepage-verso-mode
  (element pubdate
    (make paragraph
      (literal (gentext-element-name-space (gi (current-node))))
      (if (equal? (attribute-string (normalize "role")) "rcs")
	  (let* ((datelist (split (data (current-node))))
		 (date (car (cdr datelist))))
	    (literal date))
	  (process-children))))
)

</style-specification-body>
</style-specification>

<external-specification id="docbook" document="docbook.dsl">

</style-sheet>
