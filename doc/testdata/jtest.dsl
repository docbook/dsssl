<!doctype style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN">
<style-sheet>
<style-specification>
<style-specification-body>
;;
;; $Id$
;;
;; Style sheet for jtest.sgm
;;
;; Changes:
;; 30 Sep 1997: Added style sheet DTD tags so OMITTAG is unnecessary
;; 20 Aug 1997: Created by Norman Walsh (nwalsh@arbortext.com)
;;

(define debug
  (external-procedure "UNREGISTERED::James Clark//Procedure::debug"))

(define %font-size% 12pt)
(define %line-spacing-factor% 1.2)

(define-unit em %font-size%)
(define-unit pi (/ 1in 6))

(define %header-font% "Arial")

(declare-initial-value font-size        %font-size%)
(declare-initial-value font-weight      'medium)
(declare-initial-value font-posture     'upright)
(declare-initial-value font-family-name "Times New Roman")
(declare-initial-value line-spacing     (* %font-size% %line-spacing-factor%))
(declare-initial-value writing-mode 	'left-to-right)
(declare-initial-value left-margin 	6pi)
(declare-initial-value right-margin 	6pi)
(declare-initial-value top-margin	6pi)
(declare-initial-value bottom-margin	6pi)
(declare-initial-value header-margin	4pi)
(declare-initial-value footer-margin	4pi)
(declare-initial-value page-width	8.5in)
(declare-initial-value page-height	11in)
(declare-initial-value quadding         'start)

(element MEMO
    (make simple-page-sequence
	  start-indent: 0pt
	  input-whitespace-treatment: 'collapse
	  (process-children-trim)))

(element HEAD
  (let ((to (select-elements (children (current-node)) "TO")))
    (make sequence
      (process-children)
      (make paragraph
	space-after: 1pi
	(literal "Dear ")
	(process-node-list (children to))
	(literal ":")))))

(element (HEAD DATE)
  (make paragraph
    space-before: 0.75in
    space-after: %font-size%
    (make sequence
      (make line-field
	field-width: 0.75in
	font-family-name: %header-font%
	(literal "Date:"))
      (process-children))))

(element (HEAD TO)
  (make paragraph
    (make sequence
      (make line-field
	field-width: 0.75in
	font-family-name: %header-font%
	(literal "To:"))
      (process-children))))

(element (HEAD SUBJECT)
  (make paragraph
    space-after: (* 2 %font-size%)
    (make sequence
      (make line-field
	field-width: 0.75in
	font-family-name: %header-font%
	(literal "Subject:"))
      (process-children))))

(element BODY 
  (process-children))

(element PARA
  (make paragraph
    space-after: 0.5pi
    (process-children)))

(element END
  (make paragraph
    space-before: 2pi
    (process-children)))

(element (END CLOSING)
  (make paragraph
    space-after: 1in
    (process-children)))

(element (END SENDER)
  (make paragraph
    (process-children)))

</style-specification-body>
</style-specification>
</style-sheet>
