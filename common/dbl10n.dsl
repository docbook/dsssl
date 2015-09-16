;; $Id$
;;
;; This file is part of the Modular DocBook Stylesheet distribution.
;; See ../README or http://nwalsh.com/docbook/dsssl/
;;

;; ----------------------------- Localization -----------------------------

;; If you create a new version of this file, please send it to
;; Norman Walsh, ndw@nwalsh.com.  Please use the ISO 639 language
;; code to identify the language.  Append a subtag as per RFC 1766,
;; if necessary.

;; The generated text for cross references to elements.  See dblink.dsl
;; for a discussion of how substitution is performed on the %x and #x
;; keywords.
;;

;; The following language codes from ISO 639 are recognized:
;; %%LANGUAGES%%
;; af - Afrikaans                           1.71
;; am - Amharic                             1.76
;; am - Arabic                              1.76
;; as - Assamese                            1.76
;; ast - Asturian                           1.76
;; az - Azerbaijani                         1.76
;; bg - Bulgarian
;; bn - Bengali                             1.76
;; bn_in - Bengali (India)                  1.76
;; bs - Bosnian
;; ca - Catalan
;; cs - Czech
;; cy - Welsh                               1.76
;; da - Danish (previously dk)
;; de - German (previously dege)
;; el - Greek
;; en - English (previously usen)
;; eo - Esperanto                           1.76
;; es - Spanish
;; et - Estonian                            1.55
;; eu - Basque                              1.74
;; fa - Persian                             1.76
;; fi - Finnish
;; fr - French
;; ga - Irish                               1.76
;; gl - Galician                            1.76
;; gu - Gujarati                            1.76
;; he - Hebrew                              1.76
;; hi - Hindi                               1.76
;; hr - Croatian                            1.76
;; hu - Hungarian                           1.55
;; id - Indonesian                          1.55
;; is - Icelandic                           1.76
;; it - Italian
;; ja - Japanese
;; ka - Georgian                            1.76
;; kn - Kannada                             1.76
;; ko - Korean                              1.59
;; ky - Kirghiz
;; la - Latin                               1.76
;; lt - Lithuanian                          1.76
;; lv - Latvian                             1.76
;; ml - Malayalam                           1.76
;; mn - Mongolian                           1.76
;; mr - Marathi                             1.76
;; nb - Norwegian (Bokmal)
;; nds - Low German                         1.76
;; nl - Dutch
;; nn - Norwegian (Nynorsk)                 1.74
;; no - Norwegian (previously bmno)
;; or - Oriya                               1.76
;; pa - Panjabi                             1.76
;; pl - Polish
;; pt - Portuguese
;; pt_br - Portuguese (Brazil)
;; ro - Romanian
;; ru - Russian
;; sk - Slovak
;; sl - Slovenian                           1.55
;; sr - Serbian                             1.70
;; sr_Latn - Serbian (Latin)                1.76
;; sv - Swedish (previously svse)
;; ta - Tamil                               1.76
;; te - Telugu                              1.76
;; th - Thai                                1.76
;; tl - Tagalog                             1.76
;; tr - Turkish                             1.71
;; uk - Ukranian                            1.74
;; xh - Xhosa                               1.74
;; zh_cn - Chinese (Continental)            1.55
;; zh_tw - Chinese (Traditional)            1.70

;; The following language codes are recognized for historical reasons:

;; bmno(no) - Norwegian (Bokmal)
;; dege(de) - German
;; dk(da)   - Danish
;; svse(sv) - Swedish
;; usen(en) - English

(define %default-language% "en")
(define %gentext-language% #f)
(define %gentext-use-xref-lang% #f)

(define ($lang$ #!optional (target (current-node)) (xref-context #f))
  (if %gentext-language%
      (lang-fix %gentext-language%)
      (if (or xref-context %gentext-use-xref-lang%)
	  (let loop ((here target))
	    (if (node-list-empty? here)
		(lang-fix %default-language%)
		(if (attribute-string (normalize "lang") here)
		    (lang-fix (attribute-string (normalize "lang") here))
		    (loop (parent here)))))
	  (if (inherited-attribute-string (normalize "lang"))
	      (lang-fix (inherited-attribute-string (normalize "lang")))
	      (lang-fix %default-language%)))))

(define (lang-fix language)
  ;; Lowercase the language
  ;; Translate 'xx-yy' to 'xx_yy'
  (let ((fixed-lang (if (> (string-index language "-") 0)
			(let ((pos (string-index language "-")))
			  (string-append
			   (substring language 0 pos)
			   "_"
			   (substring language (+ pos 1)
				      (string-length language))))
			language)))
    (case-fold-down fixed-lang)))

(define (author-string #!optional (author (current-node)))
  (let ((lang   (if (string? author) ($lang$) ($lang$ author))))
    (case lang
      ;; ISO 639/ISO 3166/RFC 1766
      <![%l10n-af[   (("af")    (af-author-string author)) ]]>
      <![%l10n-am[   (("am")    (am-author-string author)) ]]>
      <![%l10n-ar[   (("ar")    (ar-author-string author)) ]]>
      <![%l10n-as[   (("as")    (as-author-string author)) ]]>
      <![%l10n-ast[   (("ast")    (ast-author-string author)) ]]>
      <![%l10n-az[   (("az")    (az-author-string author)) ]]>
      <![%l10n-bg[   (("bg")    (bg-author-string author)) ]]>
      <![%l10n-bn[   (("bn")    (bn-author-string author)) ]]>
      <![%l10n-bnin[   (("bn_in")    (bnin-author-string author)) ]]>
      <![%l10n-bs[   (("bs")    (bs-author-string author)) ]]>
      <![%l10n-ca[   (("ca")    (ca-author-string author)) ]]>
      <![%l10n-cs[   (("cs")    (cs-author-string author)) ]]>
      <![%l10n-cy[   (("cy")    (cy-author-string author)) ]]>
      <![%l10n-da[   (("da")    (da-author-string author)) ]]>
      <![%l10n-de[   (("de")    (de-author-string author)) ]]>
      <![%l10n-el[   (("el")    (el-author-string author)) ]]>
      <![%l10n-en[   (("en")    (en-author-string author)) ]]>
      <![%l10n-eo[   (("eo")    (eo-author-string author)) ]]>
      <![%l10n-es[   (("es")    (es-author-string author)) ]]>
      <![%l10n-et[   (("et")    (et-author-string author)) ]]>
      <![%l10n-eu[   (("eu")    (eu-author-string author)) ]]>
      <![%l10n-fa[   (("fa")    (fa-author-string author)) ]]>
      <![%l10n-fi[   (("fi")    (fi-author-string author)) ]]>
      <![%l10n-fr[   (("fr")    (fr-author-string author)) ]]>
      <![%l10n-ga[   (("ga")    (ga-author-string author)) ]]>
      <![%l10n-gl[   (("gl")    (gl-author-string author)) ]]>
      <![%l10n-gu[   (("gu")    (gu-author-string author)) ]]>
      <![%l10n-he[   (("he")    (he-author-string author)) ]]>
      <![%l10n-hi[   (("hi")    (hi-author-string author)) ]]>
      <![%l10n-hr[   (("hr")    (hr-author-string author)) ]]>
      <![%l10n-hu[   (("hu")    (hu-author-string author)) ]]>
      <![%l10n-id[   (("id")    (id-author-string author)) ]]>
      <![%l10n-is[   (("is")    (is-author-string author)) ]]>
      <![%l10n-it[   (("it")    (it-author-string author)) ]]>
      <![%l10n-ja[   (("ja")    (ja-author-string author)) ]]>
      <![%l10n-ka[   (("ka")    (ka-author-string author)) ]]>
      <![%l10n-kn[   (("kn")    (kn-author-string author)) ]]>
      <![%l10n-ko[   (("ko")    (ko-author-string author)) ]]>
      <![%l10n-ky[   (("ky")    (ky-author-string author)) ]]>
      <![%l10n-la[   (("la")    (la-author-string author)) ]]>
      <![%l10n-lt[   (("lt")    (lt-author-string author)) ]]>
      <![%l10n-lv[   (("lv")    (lv-author-string author)) ]]>
      <![%l10n-ml[   (("ml")    (ml-author-string author)) ]]>
      <![%l10n-mn[   (("mn")    (mn-author-string author)) ]]>
      <![%l10n-mr[   (("mr")    (mr-author-string author)) ]]>
      <![%l10n-nb[   (("nb")    (nb-author-string author)) ]]>
      <![%l10n-nds[   (("nds")    (nds-author-string author)) ]]>
      <![%l10n-nl[   (("nl")    (nl-author-string author)) ]]>
      <![%l10n-nn[   (("nn")    (nn-author-string author)) ]]>
      <![%l10n-no[   (("no")    (no-author-string author)) ]]>
      <![%l10n-or[   (("or")    (or-author-string author)) ]]>
      <![%l10n-pa[   (("pa")    (pa-author-string author)) ]]>
      <![%l10n-pl[   (("pl")    (pl-author-string author)) ]]>
      <![%l10n-pt[   (("pt")    (pt-author-string author)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (ptbr-author-string author)) ]]>
      <![%l10n-ro[   (("ro")    (ro-author-string author)) ]]>
      <![%l10n-ru[   (("ru")    (ru-author-string author)) ]]>
      <![%l10n-sk[   (("sk")    (sk-author-string author)) ]]>
      <![%l10n-sl[   (("sl")    (sl-author-string author)) ]]>
      <![%l10n-sr[   (("sr")    (sr-author-string author)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (srLatn-author-string author)) ]]>
      <![%l10n-sv[   (("sv")    (sv-author-string author)) ]]>
      <![%l10n-ta[   (("ta")    (ta-author-string author)) ]]>
      <![%l10n-te[   (("te")    (te-author-string author)) ]]>
      <![%l10n-th[   (("th")    (th-author-string author)) ]]>
      <![%l10n-tl[   (("tl")    (tl-author-string author)) ]]>
      <![%l10n-tr[   (("tr")    (tr-author-string author)) ]]>
      <![%l10n-uk[   (("uk")    (uk-author-string author)) ]]>
      <![%l10n-xh[   (("xh")    (xh-author-string author)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (zhcn-author-string author)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (zhtw-author-string author)) ]]>
      <![%l10n-no[   (("bmno")    (no-author-string author)) ]]>
      <![%l10n-de[   (("dege")    (de-author-string author)) ]]>
      <![%l10n-da[   (("dk")    (da-author-string author)) ]]>
      <![%l10n-sv[   (("svse")    (sv-author-string author)) ]]>
      <![%l10n-en[   (("usen")    (en-author-string author)) ]]>
      (else (error (string-append "L10N ERROR: author-string: "
				  lang))))))

(define (gentext-xref-strings target)
  (let ((giname (if (string? target) (normalize target) (gi target)))
	(lang   (if (string? target) ($lang$) ($lang$ target))))
    (case lang
      <![%l10n-af[   (("af")    (gentext-af-xref-strings giname)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-xref-strings giname)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-xref-strings giname)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-xref-strings giname)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-xref-strings giname)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-xref-strings giname)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-xref-strings giname)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-xref-strings giname)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-xref-strings giname)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-xref-strings giname)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-xref-strings giname)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-xref-strings giname)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-xref-strings giname)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-xref-strings giname)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-xref-strings giname)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-xref-strings giname)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-xref-strings giname)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-xref-strings giname)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-xref-strings giname)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-xref-strings giname)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-xref-strings giname)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-xref-strings giname)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-xref-strings giname)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-xref-strings giname)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-xref-strings giname)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-xref-strings giname)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-xref-strings giname)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-xref-strings giname)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-xref-strings giname)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-xref-strings giname)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-xref-strings giname)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-xref-strings giname)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-xref-strings giname)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-xref-strings giname)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-xref-strings giname)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-xref-strings giname)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-xref-strings giname)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-xref-strings giname)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-xref-strings giname)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-xref-strings giname)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-xref-strings giname)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-xref-strings giname)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-xref-strings giname)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-xref-strings giname)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-xref-strings giname)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-xref-strings giname)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-xref-strings giname)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-xref-strings giname)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-xref-strings giname)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-xref-strings giname)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-xref-strings giname)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-xref-strings giname)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-xref-strings giname)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-xref-strings giname)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-xref-strings giname)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-xref-strings giname)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-xref-strings giname)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-xref-strings giname)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-xref-strings giname)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-xref-strings giname)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-xref-strings giname)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-xref-strings giname)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-xref-strings giname)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-xref-strings giname)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-xref-strings giname)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-xref-strings giname)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-xref-strings giname)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-xref-strings giname)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-xref-strings giname)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-xref-strings giname)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-xref-strings giname)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-xref-strings giname)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-xref-strings giname)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-xref-strings giname)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-xref-strings giname)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-xref-strings giname)) ]]>
      (else (error (string-append "L10N ERROR: gentext-xref-strings: " 
				  lang))))))

(define (auto-xref-indirect-connector before) 
  (case ($lang$)
      <![%l10n-af[   (("af")    (af-auto-xref-indirect-connector before)) ]]>
      <![%l10n-am[   (("am")    (am-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ar[   (("ar")    (ar-auto-xref-indirect-connector before)) ]]>
      <![%l10n-as[   (("as")    (as-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ast[   (("ast")    (ast-auto-xref-indirect-connector before)) ]]>
      <![%l10n-az[   (("az")    (az-auto-xref-indirect-connector before)) ]]>
      <![%l10n-bg[   (("bg")    (bg-auto-xref-indirect-connector before)) ]]>
      <![%l10n-bn[   (("bn")    (bn-auto-xref-indirect-connector before)) ]]>
      <![%l10n-bnin[   (("bn_in")    (bnin-auto-xref-indirect-connector before)) ]]>
      <![%l10n-bs[   (("bs")    (bs-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ca[   (("ca")    (ca-auto-xref-indirect-connector before)) ]]>
      <![%l10n-cs[   (("cs")    (cs-auto-xref-indirect-connector before)) ]]>
      <![%l10n-cy[   (("cy")    (cy-auto-xref-indirect-connector before)) ]]>
      <![%l10n-da[   (("da")    (da-auto-xref-indirect-connector before)) ]]>
      <![%l10n-de[   (("de")    (de-auto-xref-indirect-connector before)) ]]>
      <![%l10n-el[   (("el")    (el-auto-xref-indirect-connector before)) ]]>
      <![%l10n-en[   (("en")    (en-auto-xref-indirect-connector before)) ]]>
      <![%l10n-eo[   (("eo")    (eo-auto-xref-indirect-connector before)) ]]>
      <![%l10n-es[   (("es")    (es-auto-xref-indirect-connector before)) ]]>
      <![%l10n-et[   (("et")    (et-auto-xref-indirect-connector before)) ]]>
      <![%l10n-eu[   (("eu")    (eu-auto-xref-indirect-connector before)) ]]>
      <![%l10n-fa[   (("fa")    (fa-auto-xref-indirect-connector before)) ]]>
      <![%l10n-fi[   (("fi")    (fi-auto-xref-indirect-connector before)) ]]>
      <![%l10n-fr[   (("fr")    (fr-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ga[   (("ga")    (ga-auto-xref-indirect-connector before)) ]]>
      <![%l10n-gl[   (("gl")    (gl-auto-xref-indirect-connector before)) ]]>
      <![%l10n-gu[   (("gu")    (gu-auto-xref-indirect-connector before)) ]]>
      <![%l10n-he[   (("he")    (he-auto-xref-indirect-connector before)) ]]>
      <![%l10n-hi[   (("hi")    (hi-auto-xref-indirect-connector before)) ]]>
      <![%l10n-hr[   (("hr")    (hr-auto-xref-indirect-connector before)) ]]>
      <![%l10n-hu[   (("hu")    (hu-auto-xref-indirect-connector before)) ]]>
      <![%l10n-id[   (("id")    (id-auto-xref-indirect-connector before)) ]]>
      <![%l10n-is[   (("is")    (is-auto-xref-indirect-connector before)) ]]>
      <![%l10n-it[   (("it")    (it-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ja[   (("ja")    (ja-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ka[   (("ka")    (ka-auto-xref-indirect-connector before)) ]]>
      <![%l10n-kn[   (("kn")    (kn-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ko[   (("ko")    (ko-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ky[   (("ky")    (ky-auto-xref-indirect-connector before)) ]]>
      <![%l10n-la[   (("la")    (la-auto-xref-indirect-connector before)) ]]>
      <![%l10n-lt[   (("lt")    (lt-auto-xref-indirect-connector before)) ]]>
      <![%l10n-lv[   (("lv")    (lv-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ml[   (("ml")    (ml-auto-xref-indirect-connector before)) ]]>
      <![%l10n-mn[   (("mn")    (mn-auto-xref-indirect-connector before)) ]]>
      <![%l10n-mr[   (("mr")    (mr-auto-xref-indirect-connector before)) ]]>
      <![%l10n-nb[   (("nb")    (nb-auto-xref-indirect-connector before)) ]]>
      <![%l10n-nds[   (("nds")    (nds-auto-xref-indirect-connector before)) ]]>
      <![%l10n-nl[   (("nl")    (nl-auto-xref-indirect-connector before)) ]]>
      <![%l10n-nn[   (("nn")    (nn-auto-xref-indirect-connector before)) ]]>
      <![%l10n-no[   (("no")    (no-auto-xref-indirect-connector before)) ]]>
      <![%l10n-or[   (("or")    (or-auto-xref-indirect-connector before)) ]]>
      <![%l10n-pa[   (("pa")    (pa-auto-xref-indirect-connector before)) ]]>
      <![%l10n-pl[   (("pl")    (pl-auto-xref-indirect-connector before)) ]]>
      <![%l10n-pt[   (("pt")    (pt-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (ptbr-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ro[   (("ro")    (ro-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ru[   (("ru")    (ru-auto-xref-indirect-connector before)) ]]>
      <![%l10n-sk[   (("sk")    (sk-auto-xref-indirect-connector before)) ]]>
      <![%l10n-sl[   (("sl")    (sl-auto-xref-indirect-connector before)) ]]>
      <![%l10n-sr[   (("sr")    (sr-auto-xref-indirect-connector before)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (srLatn-auto-xref-indirect-connector before)) ]]>
      <![%l10n-sv[   (("sv")    (sv-auto-xref-indirect-connector before)) ]]>
      <![%l10n-ta[   (("ta")    (ta-auto-xref-indirect-connector before)) ]]>
      <![%l10n-te[   (("te")    (te-auto-xref-indirect-connector before)) ]]>
      <![%l10n-th[   (("th")    (th-auto-xref-indirect-connector before)) ]]>
      <![%l10n-tl[   (("tl")    (tl-auto-xref-indirect-connector before)) ]]>
      <![%l10n-tr[   (("tr")    (tr-auto-xref-indirect-connector before)) ]]>
      <![%l10n-uk[   (("uk")    (uk-auto-xref-indirect-connector before)) ]]>
      <![%l10n-xh[   (("xh")    (xh-auto-xref-indirect-connector before)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (zhcn-auto-xref-indirect-connector before)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (zhtw-auto-xref-indirect-connector before)) ]]>
      <![%l10n-no[ (("bmno") (no-auto-xref-indirect-connector before)) ]]>
      <![%l10n-de[ (("dege") (de-auto-xref-indirect-connector before)) ]]>
      <![%l10n-da[ (("dk") (da-auto-xref-indirect-connector before)) ]]>
      <![%l10n-sv[ (("svse") (sv-auto-xref-indirect-connector before)) ]]>
      <![%l10n-en[ (("usen") (en-auto-xref-indirect-connector before)) ]]>
    (else (error "L10N ERROR: auto-xref-indirect-connector"))))

(define (generate-toc-in-front)
  (case ($lang$)
      <![%l10n-af[   (("af")    (generate-af-toc-in-front)) ]]>
      <![%l10n-am[   (("am")    (generate-am-toc-in-front)) ]]>
      <![%l10n-ar[   (("ar")    (generate-ar-toc-in-front)) ]]>
      <![%l10n-as[   (("as")    (generate-as-toc-in-front)) ]]>
      <![%l10n-ast[   (("ast")    (generate-ast-toc-in-front)) ]]>
      <![%l10n-az[   (("az")    (generate-az-toc-in-front)) ]]>
      <![%l10n-bg[   (("bg")    (generate-bg-toc-in-front)) ]]>
      <![%l10n-bn[   (("bn")    (generate-bn-toc-in-front)) ]]>
      <![%l10n-bnin[   (("bn_in")    (generate-bnin-toc-in-front)) ]]>
      <![%l10n-bs[   (("bs")    (generate-bs-toc-in-front)) ]]>
      <![%l10n-ca[   (("ca")    (generate-ca-toc-in-front)) ]]>
      <![%l10n-cs[   (("cs")    (generate-cs-toc-in-front)) ]]>
      <![%l10n-cy[   (("cy")    (generate-cy-toc-in-front)) ]]>
      <![%l10n-da[   (("da")    (generate-da-toc-in-front)) ]]>
      <![%l10n-de[   (("de")    (generate-de-toc-in-front)) ]]>
      <![%l10n-el[   (("el")    (generate-el-toc-in-front)) ]]>
      <![%l10n-en[   (("en")    (generate-en-toc-in-front)) ]]>
      <![%l10n-eo[   (("eo")    (generate-eo-toc-in-front)) ]]>
      <![%l10n-es[   (("es")    (generate-es-toc-in-front)) ]]>
      <![%l10n-et[   (("et")    (generate-et-toc-in-front)) ]]>
      <![%l10n-eu[   (("eu")    (generate-eu-toc-in-front)) ]]>
      <![%l10n-fa[   (("fa")    (generate-fa-toc-in-front)) ]]>
      <![%l10n-fi[   (("fi")    (generate-fi-toc-in-front)) ]]>
      <![%l10n-fr[   (("fr")    (generate-fr-toc-in-front)) ]]>
      <![%l10n-ga[   (("ga")    (generate-ga-toc-in-front)) ]]>
      <![%l10n-gl[   (("gl")    (generate-gl-toc-in-front)) ]]>
      <![%l10n-gu[   (("gu")    (generate-gu-toc-in-front)) ]]>
      <![%l10n-he[   (("he")    (generate-he-toc-in-front)) ]]>
      <![%l10n-hi[   (("hi")    (generate-hi-toc-in-front)) ]]>
      <![%l10n-hr[   (("hr")    (generate-hr-toc-in-front)) ]]>
      <![%l10n-hu[   (("hu")    (generate-hu-toc-in-front)) ]]>
      <![%l10n-id[   (("id")    (generate-id-toc-in-front)) ]]>
      <![%l10n-is[   (("is")    (generate-is-toc-in-front)) ]]>
      <![%l10n-it[   (("it")    (generate-it-toc-in-front)) ]]>
      <![%l10n-ja[   (("ja")    (generate-ja-toc-in-front)) ]]>
      <![%l10n-ka[   (("ka")    (generate-ka-toc-in-front)) ]]>
      <![%l10n-kn[   (("kn")    (generate-kn-toc-in-front)) ]]>
      <![%l10n-ko[   (("ko")    (generate-ko-toc-in-front)) ]]>
      <![%l10n-ky[   (("ky")    (generate-ky-toc-in-front)) ]]>
      <![%l10n-la[   (("la")    (generate-la-toc-in-front)) ]]>
      <![%l10n-lt[   (("lt")    (generate-lt-toc-in-front)) ]]>
      <![%l10n-lv[   (("lv")    (generate-lv-toc-in-front)) ]]>
      <![%l10n-ml[   (("ml")    (generate-ml-toc-in-front)) ]]>
      <![%l10n-mn[   (("mn")    (generate-mn-toc-in-front)) ]]>
      <![%l10n-mr[   (("mr")    (generate-mr-toc-in-front)) ]]>
      <![%l10n-nb[   (("nb")    (generate-nb-toc-in-front)) ]]>
      <![%l10n-nds[   (("nds")    (generate-nds-toc-in-front)) ]]>
      <![%l10n-nl[   (("nl")    (generate-nl-toc-in-front)) ]]>
      <![%l10n-nn[   (("nn")    (generate-nn-toc-in-front)) ]]>
      <![%l10n-no[   (("no")    (generate-no-toc-in-front)) ]]>
      <![%l10n-or[   (("or")    (generate-or-toc-in-front)) ]]>
      <![%l10n-pa[   (("pa")    (generate-pa-toc-in-front)) ]]>
      <![%l10n-pl[   (("pl")    (generate-pl-toc-in-front)) ]]>
      <![%l10n-pt[   (("pt")    (generate-pt-toc-in-front)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (generate-ptbr-toc-in-front)) ]]>
      <![%l10n-ro[   (("ro")    (generate-ro-toc-in-front)) ]]>
      <![%l10n-ru[   (("ru")    (generate-ru-toc-in-front)) ]]>
      <![%l10n-sk[   (("sk")    (generate-sk-toc-in-front)) ]]>
      <![%l10n-sl[   (("sl")    (generate-sl-toc-in-front)) ]]>
      <![%l10n-sr[   (("sr")    (generate-sr-toc-in-front)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (generate-srLatn-toc-in-front)) ]]>
      <![%l10n-sv[   (("sv")    (generate-sv-toc-in-front)) ]]>
      <![%l10n-ta[   (("ta")    (generate-ta-toc-in-front)) ]]>
      <![%l10n-te[   (("te")    (generate-te-toc-in-front)) ]]>
      <![%l10n-th[   (("th")    (generate-th-toc-in-front)) ]]>
      <![%l10n-tl[   (("tl")    (generate-tl-toc-in-front)) ]]>
      <![%l10n-tr[   (("tr")    (generate-tr-toc-in-front)) ]]>
      <![%l10n-uk[   (("uk")    (generate-uk-toc-in-front)) ]]>
      <![%l10n-xh[   (("xh")    (generate-xh-toc-in-front)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (generate-zhcn-toc-in-front)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (generate-zhtw-toc-in-front)) ]]>
      <![%l10n-no[ (("bmno") %generate-no-toc-in-front%) ]]>
      <![%l10n-de[ (("dege") %generate-de-toc-in-front%) ]]>
      <![%l10n-da[ (("dk") %generate-da-toc-in-front%) ]]>
      <![%l10n-sv[ (("svse") %generate-sv-toc-in-front%) ]]>
      <![%l10n-en[ (("usen") %generate-en-toc-in-front%) ]]>
    (else (error "L10N ERROR: generate-toc-in-front"))))

(define (gentext-element-name target)
  (let ((giname (if (string? target) (normalize target) (gi target)))
	(lang   (if (string? target) ($lang$) ($lang$ target #t))))
    (case lang
      <![%l10n-af[   (("af")    (gentext-af-element-name giname)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-element-name giname)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-element-name giname)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-element-name giname)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-element-name giname)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-element-name giname)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-element-name giname)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-element-name giname)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-element-name giname)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-element-name giname)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-element-name giname)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-element-name giname)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-element-name giname)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-element-name giname)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-element-name giname)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-element-name giname)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-element-name giname)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-element-name giname)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-element-name giname)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-element-name giname)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-element-name giname)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-element-name giname)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-element-name giname)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-element-name giname)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-element-name giname)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-element-name giname)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-element-name giname)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-element-name giname)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-element-name giname)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-element-name giname)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-element-name giname)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-element-name giname)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-element-name giname)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-element-name giname)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-element-name giname)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-element-name giname)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-element-name giname)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-element-name giname)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-element-name giname)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-element-name giname)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-element-name giname)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-element-name giname)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-element-name giname)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-element-name giname)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-element-name giname)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-element-name giname)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-element-name giname)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-element-name giname)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-element-name giname)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-element-name giname)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-element-name giname)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-element-name giname)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-element-name giname)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-element-name giname)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-element-name giname)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-element-name giname)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-element-name giname)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-element-name giname)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-element-name giname)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-element-name giname)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-element-name giname)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-element-name giname)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-element-name giname)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-element-name giname)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-element-name giname)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-element-name giname)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-element-name giname)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-element-name giname)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-element-name giname)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-element-name giname)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-element-name giname)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-element-name giname)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-element-name giname)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-element-name giname)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-element-name giname)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-element-name giname)) ]]>
      (else (error (string-append "L10N ERROR: gentext-element-name: "
				  lang
				  " ("
				  giname
				  ")"))))))

(define (gentext-element-name-space target)
  (let ((giname (if (string? target) (normalize target) (gi target)))
	(lang   (if (string? target) ($lang$) ($lang$ target))))
    (case lang
      <![%l10n-af[   (("af")    (gentext-af-element-name-space giname)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-element-name-space giname)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-element-name-space giname)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-element-name-space giname)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-element-name-space giname)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-element-name-space giname)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-element-name-space giname)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-element-name-space giname)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-element-name-space giname)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-element-name-space giname)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-element-name-space giname)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-element-name-space giname)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-element-name-space giname)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-element-name-space giname)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-element-name-space giname)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-element-name-space giname)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-element-name-space giname)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-element-name-space giname)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-element-name-space giname)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-element-name-space giname)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-element-name-space giname)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-element-name-space giname)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-element-name-space giname)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-element-name-space giname)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-element-name-space giname)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-element-name-space giname)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-element-name-space giname)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-element-name-space giname)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-element-name-space giname)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-element-name-space giname)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-element-name-space giname)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-element-name-space giname)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-element-name-space giname)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-element-name-space giname)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-element-name-space giname)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-element-name-space giname)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-element-name-space giname)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-element-name-space giname)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-element-name-space giname)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-element-name-space giname)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-element-name-space giname)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-element-name-space giname)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-element-name-space giname)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-element-name-space giname)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-element-name-space giname)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-element-name-space giname)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-element-name-space giname)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-element-name-space giname)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-element-name-space giname)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-element-name-space giname)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-element-name-space giname)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-element-name-space giname)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-element-name-space giname)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-element-name-space giname)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-element-name-space giname)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-element-name-space giname)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-element-name-space giname)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-element-name-space giname)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-element-name-space giname)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-element-name-space giname)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-element-name-space giname)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-element-name-space giname)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-element-name-space giname)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-element-name-space giname)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-element-name-space giname)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-element-name-space giname)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-element-name-space giname)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-element-name-space giname)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-element-name-space giname)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-element-name-space giname)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-element-name-space giname)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-element-name-space giname)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-element-name-space giname)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-element-name-space giname)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-element-name-space giname)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-element-name-space giname)) ]]>
      (else (error "L10N ERROR: gentext-element-name-space")))))

(define (gentext-intra-label-sep target)
  (let ((giname (if (string? target) (normalize target) (gi target)))
	(lang   (if (string? target) ($lang$) ($lang$ target))))
    (case lang
      <![%l10n-af[   (("af")    (gentext-af-intra-label-sep giname)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-intra-label-sep giname)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-intra-label-sep giname)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-intra-label-sep giname)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-intra-label-sep giname)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-intra-label-sep giname)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-intra-label-sep giname)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-intra-label-sep giname)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-intra-label-sep giname)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-intra-label-sep giname)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-intra-label-sep giname)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-intra-label-sep giname)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-intra-label-sep giname)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-intra-label-sep giname)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-intra-label-sep giname)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-intra-label-sep giname)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-intra-label-sep giname)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-intra-label-sep giname)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-intra-label-sep giname)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-intra-label-sep giname)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-intra-label-sep giname)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-intra-label-sep giname)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-intra-label-sep giname)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-intra-label-sep giname)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-intra-label-sep giname)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-intra-label-sep giname)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-intra-label-sep giname)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-intra-label-sep giname)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-intra-label-sep giname)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-intra-label-sep giname)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-intra-label-sep giname)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-intra-label-sep giname)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-intra-label-sep giname)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-intra-label-sep giname)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-intra-label-sep giname)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-intra-label-sep giname)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-intra-label-sep giname)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-intra-label-sep giname)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-intra-label-sep giname)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-intra-label-sep giname)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-intra-label-sep giname)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-intra-label-sep giname)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-intra-label-sep giname)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-intra-label-sep giname)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-intra-label-sep giname)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-intra-label-sep giname)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-intra-label-sep giname)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-intra-label-sep giname)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-intra-label-sep giname)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-intra-label-sep giname)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-intra-label-sep giname)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-intra-label-sep giname)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-intra-label-sep giname)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-intra-label-sep giname)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-intra-label-sep giname)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-intra-label-sep giname)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-intra-label-sep giname)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-intra-label-sep giname)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-intra-label-sep giname)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-intra-label-sep giname)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-intra-label-sep giname)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-intra-label-sep giname)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-intra-label-sep giname)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-intra-label-sep giname)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-intra-label-sep giname)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-intra-label-sep giname)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-intra-label-sep giname)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-intra-label-sep giname)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-intra-label-sep giname)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-intra-label-sep giname)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-intra-label-sep giname)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-intra-label-sep giname)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-intra-label-sep giname)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-intra-label-sep giname)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-intra-label-sep giname)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-intra-label-sep giname)) ]]>
      (else (error "L10N ERROR: gentext-intra-label-sep")))))

(define (gentext-label-title-sep target)
  (let ((giname (if (string? target) (normalize target) (gi target)))
	(lang   (if (string? target) ($lang$) ($lang$ target))))
    (case lang
      <![%l10n-af[   (("af")    (gentext-af-label-title-sep giname)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-label-title-sep giname)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-label-title-sep giname)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-label-title-sep giname)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-label-title-sep giname)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-label-title-sep giname)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-label-title-sep giname)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-label-title-sep giname)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-label-title-sep giname)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-label-title-sep giname)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-label-title-sep giname)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-label-title-sep giname)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-label-title-sep giname)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-label-title-sep giname)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-label-title-sep giname)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-label-title-sep giname)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-label-title-sep giname)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-label-title-sep giname)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-label-title-sep giname)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-label-title-sep giname)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-label-title-sep giname)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-label-title-sep giname)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-label-title-sep giname)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-label-title-sep giname)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-label-title-sep giname)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-label-title-sep giname)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-label-title-sep giname)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-label-title-sep giname)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-label-title-sep giname)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-label-title-sep giname)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-label-title-sep giname)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-label-title-sep giname)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-label-title-sep giname)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-label-title-sep giname)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-label-title-sep giname)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-label-title-sep giname)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-label-title-sep giname)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-label-title-sep giname)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-label-title-sep giname)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-label-title-sep giname)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-label-title-sep giname)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-label-title-sep giname)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-label-title-sep giname)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-label-title-sep giname)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-label-title-sep giname)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-label-title-sep giname)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-label-title-sep giname)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-label-title-sep giname)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-label-title-sep giname)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-label-title-sep giname)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-label-title-sep giname)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-label-title-sep giname)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-label-title-sep giname)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-label-title-sep giname)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-label-title-sep giname)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-label-title-sep giname)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-label-title-sep giname)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-label-title-sep giname)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-label-title-sep giname)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-label-title-sep giname)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-label-title-sep giname)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-label-title-sep giname)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-label-title-sep giname)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-label-title-sep giname)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-label-title-sep giname)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-label-title-sep giname)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-label-title-sep giname)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-label-title-sep giname)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-label-title-sep giname)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-label-title-sep giname)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-label-title-sep giname)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-label-title-sep giname)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-label-title-sep giname)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-label-title-sep giname)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-label-title-sep giname)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-label-title-sep giname)) ]]>
      (else (error "L10N ERROR: gentext-label-title-sep")))))

(define (label-number-format target)
  (let ((giname (if (string? target) (normalize target) (gi target)))
	(lang   (if (string? target) ($lang$) ($lang$ target))))
    (case lang
      <![%l10n-af[   (("af")    (af-label-number-format target)) ]]>
      <![%l10n-am[   (("am")    (am-label-number-format target)) ]]>
      <![%l10n-ar[   (("ar")    (ar-label-number-format target)) ]]>
      <![%l10n-as[   (("as")    (as-label-number-format target)) ]]>
      <![%l10n-ast[   (("ast")    (ast-label-number-format target)) ]]>
      <![%l10n-az[   (("az")    (az-label-number-format target)) ]]>
      <![%l10n-bg[   (("bg")    (bg-label-number-format target)) ]]>
      <![%l10n-bn[   (("bn")    (bn-label-number-format target)) ]]>
      <![%l10n-bnin[   (("bn_in")    (bnin-label-number-format target)) ]]>
      <![%l10n-bs[   (("bs")    (bs-label-number-format target)) ]]>
      <![%l10n-ca[   (("ca")    (ca-label-number-format target)) ]]>
      <![%l10n-cs[   (("cs")    (cs-label-number-format target)) ]]>
      <![%l10n-cy[   (("cy")    (cy-label-number-format target)) ]]>
      <![%l10n-da[   (("da")    (da-label-number-format target)) ]]>
      <![%l10n-de[   (("de")    (de-label-number-format target)) ]]>
      <![%l10n-el[   (("el")    (el-label-number-format target)) ]]>
      <![%l10n-en[   (("en")    (en-label-number-format target)) ]]>
      <![%l10n-eo[   (("eo")    (eo-label-number-format target)) ]]>
      <![%l10n-es[   (("es")    (es-label-number-format target)) ]]>
      <![%l10n-et[   (("et")    (et-label-number-format target)) ]]>
      <![%l10n-eu[   (("eu")    (eu-label-number-format target)) ]]>
      <![%l10n-fa[   (("fa")    (fa-label-number-format target)) ]]>
      <![%l10n-fi[   (("fi")    (fi-label-number-format target)) ]]>
      <![%l10n-fr[   (("fr")    (fr-label-number-format target)) ]]>
      <![%l10n-ga[   (("ga")    (ga-label-number-format target)) ]]>
      <![%l10n-gl[   (("gl")    (gl-label-number-format target)) ]]>
      <![%l10n-gu[   (("gu")    (gu-label-number-format target)) ]]>
      <![%l10n-he[   (("he")    (he-label-number-format target)) ]]>
      <![%l10n-hi[   (("hi")    (hi-label-number-format target)) ]]>
      <![%l10n-hr[   (("hr")    (hr-label-number-format target)) ]]>
      <![%l10n-hu[   (("hu")    (hu-label-number-format target)) ]]>
      <![%l10n-id[   (("id")    (id-label-number-format target)) ]]>
      <![%l10n-is[   (("is")    (is-label-number-format target)) ]]>
      <![%l10n-it[   (("it")    (it-label-number-format target)) ]]>
      <![%l10n-ja[   (("ja")    (ja-label-number-format target)) ]]>
      <![%l10n-ka[   (("ka")    (ka-label-number-format target)) ]]>
      <![%l10n-kn[   (("kn")    (kn-label-number-format target)) ]]>
      <![%l10n-ko[   (("ko")    (ko-label-number-format target)) ]]>
      <![%l10n-ky[   (("ky")    (ky-label-number-format target)) ]]>
      <![%l10n-la[   (("la")    (la-label-number-format target)) ]]>
      <![%l10n-lt[   (("lt")    (lt-label-number-format target)) ]]>
      <![%l10n-lv[   (("lv")    (lv-label-number-format target)) ]]>
      <![%l10n-ml[   (("ml")    (ml-label-number-format target)) ]]>
      <![%l10n-mn[   (("mn")    (mn-label-number-format target)) ]]>
      <![%l10n-mr[   (("mr")    (mr-label-number-format target)) ]]>
      <![%l10n-nb[   (("nb")    (nb-label-number-format target)) ]]>
      <![%l10n-nds[   (("nds")    (nds-label-number-format target)) ]]>
      <![%l10n-nl[   (("nl")    (nl-label-number-format target)) ]]>
      <![%l10n-nn[   (("nn")    (nn-label-number-format target)) ]]>
      <![%l10n-no[   (("no")    (no-label-number-format target)) ]]>
      <![%l10n-or[   (("or")    (or-label-number-format target)) ]]>
      <![%l10n-pa[   (("pa")    (pa-label-number-format target)) ]]>
      <![%l10n-pl[   (("pl")    (pl-label-number-format target)) ]]>
      <![%l10n-pt[   (("pt")    (pt-label-number-format target)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (ptbr-label-number-format target)) ]]>
      <![%l10n-ro[   (("ro")    (ro-label-number-format target)) ]]>
      <![%l10n-ru[   (("ru")    (ru-label-number-format target)) ]]>
      <![%l10n-sk[   (("sk")    (sk-label-number-format target)) ]]>
      <![%l10n-sl[   (("sl")    (sl-label-number-format target)) ]]>
      <![%l10n-sr[   (("sr")    (sr-label-number-format target)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (srLatn-label-number-format target)) ]]>
      <![%l10n-sv[   (("sv")    (sv-label-number-format target)) ]]>
      <![%l10n-ta[   (("ta")    (ta-label-number-format target)) ]]>
      <![%l10n-te[   (("te")    (te-label-number-format target)) ]]>
      <![%l10n-th[   (("th")    (th-label-number-format target)) ]]>
      <![%l10n-tl[   (("tl")    (tl-label-number-format target)) ]]>
      <![%l10n-tr[   (("tr")    (tr-label-number-format target)) ]]>
      <![%l10n-uk[   (("uk")    (uk-label-number-format target)) ]]>
      <![%l10n-xh[   (("xh")    (xh-label-number-format target)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (zhcn-label-number-format target)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (zhtw-label-number-format target)) ]]>
      <![%l10n-no[ (("bmno") (no-label-number-format target)) ]]>
      <![%l10n-de[ (("dege") (de-label-number-format target)) ]]>
      <![%l10n-da[ (("dk") (da-label-number-format target)) ]]>
      <![%l10n-sv[ (("svse") (sv-label-number-format target)) ]]>
      <![%l10n-en[ (("usen") (en-label-number-format target)) ]]>
      (else (error "L10N ERROR: label-number-format")))))

(define ($lot-title$ lotgi)
  (case ($lang$)
      <![%l10n-af[   (("af")    ($lot-title-af$ lotgi)) ]]>
      <![%l10n-am[   (("am")    ($lot-title-am$ lotgi)) ]]>
      <![%l10n-ar[   (("ar")    ($lot-title-ar$ lotgi)) ]]>
      <![%l10n-as[   (("as")    ($lot-title-as$ lotgi)) ]]>
      <![%l10n-ast[   (("ast")    ($lot-title-ast$ lotgi)) ]]>
      <![%l10n-az[   (("az")    ($lot-title-az$ lotgi)) ]]>
      <![%l10n-bg[   (("bg")    ($lot-title-bg$ lotgi)) ]]>
      <![%l10n-bn[   (("bn")    ($lot-title-bn$ lotgi)) ]]>
      <![%l10n-bnin[   (("bn_in")    ($lot-title-bnin$ lotgi)) ]]>
      <![%l10n-bs[   (("bs")    ($lot-title-bs$ lotgi)) ]]>
      <![%l10n-ca[   (("ca")    ($lot-title-ca$ lotgi)) ]]>
      <![%l10n-cs[   (("cs")    ($lot-title-cs$ lotgi)) ]]>
      <![%l10n-cy[   (("cy")    ($lot-title-cy$ lotgi)) ]]>
      <![%l10n-da[   (("da")    ($lot-title-da$ lotgi)) ]]>
      <![%l10n-de[   (("de")    ($lot-title-de$ lotgi)) ]]>
      <![%l10n-el[   (("el")    ($lot-title-el$ lotgi)) ]]>
      <![%l10n-en[   (("en")    ($lot-title-en$ lotgi)) ]]>
      <![%l10n-eo[   (("eo")    ($lot-title-eo$ lotgi)) ]]>
      <![%l10n-es[   (("es")    ($lot-title-es$ lotgi)) ]]>
      <![%l10n-et[   (("et")    ($lot-title-et$ lotgi)) ]]>
      <![%l10n-eu[   (("eu")    ($lot-title-eu$ lotgi)) ]]>
      <![%l10n-fa[   (("fa")    ($lot-title-fa$ lotgi)) ]]>
      <![%l10n-fi[   (("fi")    ($lot-title-fi$ lotgi)) ]]>
      <![%l10n-fr[   (("fr")    ($lot-title-fr$ lotgi)) ]]>
      <![%l10n-ga[   (("ga")    ($lot-title-ga$ lotgi)) ]]>
      <![%l10n-gl[   (("gl")    ($lot-title-gl$ lotgi)) ]]>
      <![%l10n-gu[   (("gu")    ($lot-title-gu$ lotgi)) ]]>
      <![%l10n-he[   (("he")    ($lot-title-he$ lotgi)) ]]>
      <![%l10n-hi[   (("hi")    ($lot-title-hi$ lotgi)) ]]>
      <![%l10n-hr[   (("hr")    ($lot-title-hr$ lotgi)) ]]>
      <![%l10n-hu[   (("hu")    ($lot-title-hu$ lotgi)) ]]>
      <![%l10n-id[   (("id")    ($lot-title-id$ lotgi)) ]]>
      <![%l10n-is[   (("is")    ($lot-title-is$ lotgi)) ]]>
      <![%l10n-it[   (("it")    ($lot-title-it$ lotgi)) ]]>
      <![%l10n-ja[   (("ja")    ($lot-title-ja$ lotgi)) ]]>
      <![%l10n-ka[   (("ka")    ($lot-title-ka$ lotgi)) ]]>
      <![%l10n-kn[   (("kn")    ($lot-title-kn$ lotgi)) ]]>
      <![%l10n-ko[   (("ko")    ($lot-title-ko$ lotgi)) ]]>
      <![%l10n-ky[   (("ky")    ($lot-title-ky$ lotgi)) ]]>
      <![%l10n-la[   (("la")    ($lot-title-la$ lotgi)) ]]>
      <![%l10n-lt[   (("lt")    ($lot-title-lt$ lotgi)) ]]>
      <![%l10n-lv[   (("lv")    ($lot-title-lv$ lotgi)) ]]>
      <![%l10n-ml[   (("ml")    ($lot-title-ml$ lotgi)) ]]>
      <![%l10n-mn[   (("mn")    ($lot-title-mn$ lotgi)) ]]>
      <![%l10n-mr[   (("mr")    ($lot-title-mr$ lotgi)) ]]>
      <![%l10n-nb[   (("nb")    ($lot-title-nb$ lotgi)) ]]>
      <![%l10n-nds[   (("nds")    ($lot-title-nds$ lotgi)) ]]>
      <![%l10n-nl[   (("nl")    ($lot-title-nl$ lotgi)) ]]>
      <![%l10n-nn[   (("nn")    ($lot-title-nn$ lotgi)) ]]>
      <![%l10n-no[   (("no")    ($lot-title-no$ lotgi)) ]]>
      <![%l10n-or[   (("or")    ($lot-title-or$ lotgi)) ]]>
      <![%l10n-pa[   (("pa")    ($lot-title-pa$ lotgi)) ]]>
      <![%l10n-pl[   (("pl")    ($lot-title-pl$ lotgi)) ]]>
      <![%l10n-pt[   (("pt")    ($lot-title-pt$ lotgi)) ]]>
      <![%l10n-ptbr[   (("pt_br")    ($lot-title-ptbr$ lotgi)) ]]>
      <![%l10n-ro[   (("ro")    ($lot-title-ro$ lotgi)) ]]>
      <![%l10n-ru[   (("ru")    ($lot-title-ru$ lotgi)) ]]>
      <![%l10n-sk[   (("sk")    ($lot-title-sk$ lotgi)) ]]>
      <![%l10n-sl[   (("sl")    ($lot-title-sl$ lotgi)) ]]>
      <![%l10n-sr[   (("sr")    ($lot-title-sr$ lotgi)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    ($lot-title-srLatn$ lotgi)) ]]>
      <![%l10n-sv[   (("sv")    ($lot-title-sv$ lotgi)) ]]>
      <![%l10n-ta[   (("ta")    ($lot-title-ta$ lotgi)) ]]>
      <![%l10n-te[   (("te")    ($lot-title-te$ lotgi)) ]]>
      <![%l10n-th[   (("th")    ($lot-title-th$ lotgi)) ]]>
      <![%l10n-tl[   (("tl")    ($lot-title-tl$ lotgi)) ]]>
      <![%l10n-tr[   (("tr")    ($lot-title-tr$ lotgi)) ]]>
      <![%l10n-uk[   (("uk")    ($lot-title-uk$ lotgi)) ]]>
      <![%l10n-xh[   (("xh")    ($lot-title-xh$ lotgi)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    ($lot-title-zhcn$ lotgi)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    ($lot-title-zhtw$ lotgi)) ]]>
      <![%l10n-no[ (("bmno") ($lot-title-no$ lotgi)) ]]>
      <![%l10n-de[ (("dege") ($lot-title-de$ lotgi)) ]]>
      <![%l10n-da[ (("dk") ($lot-title-da$ lotgi)) ]]>
      <![%l10n-sv[ (("svse") ($lot-title-sv$ lotgi)) ]]>
      <![%l10n-en[ (("usen") ($lot-title-en$ lotgi)) ]]>
    (else (error "L10N ERROR: $lot-title$"))))

(define (gentext-start-quote)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-start-quote%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-start-quote%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-start-quote%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-start-quote%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-start-quote%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-start-quote%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-start-quote%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-start-quote%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-start-quote%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-start-quote%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-start-quote%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-start-quote%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-start-quote%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-start-quote%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-start-quote%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-start-quote%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-start-quote%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-start-quote%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-start-quote%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-start-quote%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-start-quote%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-start-quote%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-start-quote%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-start-quote%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-start-quote%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-start-quote%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-start-quote%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-start-quote%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-start-quote%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-start-quote%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-start-quote%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-start-quote%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-start-quote%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-start-quote%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-start-quote%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-start-quote%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-start-quote%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-start-quote%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-start-quote%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-start-quote%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-start-quote%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-start-quote%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-start-quote%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-start-quote%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-start-quote%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-start-quote%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-start-quote%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-start-quote%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-start-quote%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-start-quote%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-start-quote%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-start-quote%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-start-quote%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-start-quote%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-start-quote%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-start-quote%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-start-quote%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-start-quote%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-start-quote%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-start-quote%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-start-quote%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-start-quote%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-start-quote%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-start-quote%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-start-quote%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-start-quote%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-start-quote%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-start-quote%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-start-quote%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-start-quote%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-start-quote%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-start-quote%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-start-quote%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-start-quote%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-start-quote%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-start-quote%) ]]>
    (else (error "L10N ERROR: gentext-start-quote"))))

(define (gentext-end-quote)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-end-quote%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-end-quote%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-end-quote%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-end-quote%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-end-quote%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-end-quote%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-end-quote%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-end-quote%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-end-quote%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-end-quote%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-end-quote%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-end-quote%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-end-quote%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-end-quote%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-end-quote%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-end-quote%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-end-quote%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-end-quote%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-end-quote%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-end-quote%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-end-quote%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-end-quote%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-end-quote%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-end-quote%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-end-quote%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-end-quote%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-end-quote%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-end-quote%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-end-quote%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-end-quote%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-end-quote%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-end-quote%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-end-quote%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-end-quote%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-end-quote%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-end-quote%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-end-quote%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-end-quote%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-end-quote%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-end-quote%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-end-quote%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-end-quote%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-end-quote%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-end-quote%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-end-quote%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-end-quote%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-end-quote%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-end-quote%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-end-quote%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-end-quote%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-end-quote%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-end-quote%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-end-quote%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-end-quote%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-end-quote%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-end-quote%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-end-quote%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-end-quote%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-end-quote%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-end-quote%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-end-quote%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-end-quote%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-end-quote%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-end-quote%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-end-quote%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-end-quote%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-end-quote%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-end-quote%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-end-quote%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-end-quote%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-end-quote%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-end-quote%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-end-quote%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-end-quote%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-end-quote%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-end-quote%) ]]>
    (else (error "L10N ERROR: gentext-end-quote"))))

(define (gentext-start-nested-quote)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-start-nested-quote%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-start-nested-quote%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-start-nested-quote%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-start-nested-quote%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-start-nested-quote%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-start-nested-quote%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-start-nested-quote%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-start-nested-quote%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-start-nested-quote%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-start-nested-quote%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-start-nested-quote%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-start-nested-quote%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-start-nested-quote%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-start-nested-quote%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-start-nested-quote%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-start-nested-quote%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-start-nested-quote%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-start-nested-quote%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-start-nested-quote%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-start-nested-quote%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-start-nested-quote%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-start-nested-quote%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-start-nested-quote%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-start-nested-quote%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-start-nested-quote%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-start-nested-quote%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-start-nested-quote%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-start-nested-quote%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-start-nested-quote%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-start-nested-quote%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-start-nested-quote%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-start-nested-quote%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-start-nested-quote%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-start-nested-quote%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-start-nested-quote%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-start-nested-quote%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-start-nested-quote%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-start-nested-quote%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-start-nested-quote%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-start-nested-quote%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-start-nested-quote%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-start-nested-quote%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-start-nested-quote%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-start-nested-quote%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-start-nested-quote%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-start-nested-quote%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-start-nested-quote%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-start-nested-quote%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-start-nested-quote%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-start-nested-quote%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-start-nested-quote%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-start-nested-quote%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-start-nested-quote%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-start-nested-quote%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-start-nested-quote%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-start-nested-quote%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-start-nested-quote%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-start-nested-quote%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-start-nested-quote%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-start-nested-quote%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-start-nested-quote%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-start-nested-quote%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-start-nested-quote%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-start-nested-quote%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-start-nested-quote%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-start-nested-quote%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-start-nested-quote%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-start-nested-quote%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-start-nested-quote%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-start-nested-quote%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-start-nested-quote%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-start-nested-quote%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-start-nested-quote%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-start-nested-quote%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-start-nested-quote%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-start-nested-quote%) ]]>
    (else (error "L10N ERROR: gentext-start-nested-quote"))))

(define (gentext-end-nested-quote)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-end-nested-quote%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-end-nested-quote%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-end-nested-quote%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-end-nested-quote%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-end-nested-quote%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-end-nested-quote%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-end-nested-quote%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-end-nested-quote%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-end-nested-quote%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-end-nested-quote%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-end-nested-quote%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-end-nested-quote%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-end-nested-quote%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-end-nested-quote%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-end-nested-quote%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-end-nested-quote%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-end-nested-quote%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-end-nested-quote%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-end-nested-quote%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-end-nested-quote%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-end-nested-quote%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-end-nested-quote%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-end-nested-quote%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-end-nested-quote%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-end-nested-quote%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-end-nested-quote%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-end-nested-quote%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-end-nested-quote%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-end-nested-quote%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-end-nested-quote%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-end-nested-quote%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-end-nested-quote%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-end-nested-quote%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-end-nested-quote%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-end-nested-quote%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-end-nested-quote%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-end-nested-quote%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-end-nested-quote%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-end-nested-quote%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-end-nested-quote%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-end-nested-quote%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-end-nested-quote%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-end-nested-quote%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-end-nested-quote%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-end-nested-quote%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-end-nested-quote%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-end-nested-quote%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-end-nested-quote%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-end-nested-quote%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-end-nested-quote%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-end-nested-quote%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-end-nested-quote%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-end-nested-quote%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-end-nested-quote%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-end-nested-quote%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-end-nested-quote%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-end-nested-quote%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-end-nested-quote%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-end-nested-quote%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-end-nested-quote%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-end-nested-quote%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-end-nested-quote%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-end-nested-quote%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-end-nested-quote%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-end-nested-quote%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-end-nested-quote%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-end-nested-quote%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-end-nested-quote%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-end-nested-quote%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-end-nested-quote%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-end-nested-quote%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-end-nested-quote%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-end-nested-quote%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-end-nested-quote%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-end-nested-quote%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-end-nested-quote%) ]]>
    (else (error "L10N ERROR: gentext-end-nested-quote"))))

(define (gentext-by)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-by%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-by%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-by%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-by%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-by%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-by%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-by%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-by%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-by%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-by%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-by%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-by%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-by%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-by%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-by%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-by%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-by%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-by%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-by%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-by%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-by%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-by%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-by%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-by%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-by%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-by%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-by%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-by%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-by%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-by%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-by%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-by%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-by%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-by%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-by%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-by%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-by%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-by%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-by%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-by%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-by%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-by%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-by%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-by%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-by%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-by%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-by%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-by%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-by%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-by%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-by%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-by%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-by%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-by%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-by%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-by%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-by%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-by%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-by%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-by%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-by%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-by%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-by%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-by%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-by%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-by%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-by%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-by%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-by%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-by%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-by%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-by%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-by%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-by%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-by%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-by%) ]]>
    (else (error "L10N ERROR: gentext-by"))))

(define (gentext-edited-by)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-edited-by%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-edited-by%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-edited-by%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-edited-by%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-edited-by%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-edited-by%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-edited-by%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-edited-by%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-edited-by%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-edited-by%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-edited-by%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-edited-by%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-edited-by%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-edited-by%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-edited-by%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-edited-by%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-edited-by%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-edited-by%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-edited-by%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-edited-by%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-edited-by%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-edited-by%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-edited-by%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-edited-by%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-edited-by%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-edited-by%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-edited-by%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-edited-by%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-edited-by%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-edited-by%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-edited-by%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-edited-by%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-edited-by%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-edited-by%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-edited-by%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-edited-by%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-edited-by%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-edited-by%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-edited-by%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-edited-by%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-edited-by%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-edited-by%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-edited-by%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-edited-by%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-edited-by%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-edited-by%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-edited-by%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-edited-by%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-edited-by%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-edited-by%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-edited-by%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-edited-by%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-edited-by%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-edited-by%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-edited-by%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-edited-by%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-edited-by%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-edited-by%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-edited-by%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-edited-by%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-edited-by%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-edited-by%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-edited-by%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-edited-by%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-edited-by%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-edited-by%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-edited-by%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-edited-by%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-edited-by%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-edited-by%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-edited-by%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-edited-by%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-edited-by%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-edited-by%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-edited-by%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-edited-by%) ]]>
    (else (error "L10N ERROR: gentext-edited-by"))))

(define (gentext-revised-by)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-revised-by%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-revised-by%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-revised-by%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-revised-by%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-revised-by%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-revised-by%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-revised-by%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-revised-by%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-revised-by%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-revised-by%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-revised-by%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-revised-by%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-revised-by%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-revised-by%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-revised-by%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-revised-by%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-revised-by%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-revised-by%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-revised-by%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-revised-by%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-revised-by%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-revised-by%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-revised-by%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-revised-by%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-revised-by%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-revised-by%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-revised-by%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-revised-by%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-revised-by%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-revised-by%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-revised-by%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-revised-by%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-revised-by%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-revised-by%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-revised-by%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-revised-by%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-revised-by%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-revised-by%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-revised-by%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-revised-by%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-revised-by%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-revised-by%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-revised-by%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-revised-by%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-revised-by%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-revised-by%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-revised-by%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-revised-by%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-revised-by%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-revised-by%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-revised-by%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-revised-by%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-revised-by%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-revised-by%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-revised-by%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-revised-by%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-revised-by%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-revised-by%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-revised-by%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-revised-by%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-revised-by%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-revised-by%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-revised-by%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-revised-by%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-revised-by%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-revised-by%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-revised-by%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-revised-by%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-revised-by%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-revised-by%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-revised-by%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-revised-by%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-revised-by%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-revised-by%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-revised-by%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-revised-by%) ]]>
    (else (error "L10N ERROR: gentext-revised-by"))))

(define (gentext-page)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-page%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-page%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-page%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-page%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-page%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-page%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-page%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-page%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-page%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-page%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-page%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-page%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-page%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-page%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-page%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-page%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-page%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-page%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-page%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-page%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-page%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-page%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-page%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-page%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-page%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-page%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-page%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-page%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-page%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-page%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-page%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-page%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-page%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-page%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-page%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-page%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-page%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-page%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-page%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-page%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-page%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-page%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-page%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-page%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-page%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-page%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-page%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-page%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-page%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-page%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-page%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-page%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-page%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-page%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-page%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-page%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-page%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-page%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-page%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-page%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-page%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-page%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-page%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-page%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-page%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-page%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-page%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-page%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-page%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-page%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-page%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-page%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-page%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-page%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-page%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-page%) ]]>
    (else (error "L10N ERROR: gentext-page"))))

(define (gentext-and)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-and%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-and%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-and%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-and%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-and%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-and%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-and%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-and%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-and%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-and%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-and%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-and%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-and%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-and%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-and%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-and%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-and%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-and%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-and%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-and%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-and%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-and%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-and%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-and%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-and%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-and%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-and%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-and%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-and%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-and%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-and%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-and%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-and%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-and%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-and%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-and%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-and%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-and%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-and%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-and%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-and%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-and%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-and%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-and%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-and%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-and%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-and%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-and%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-and%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-and%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-and%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-and%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-and%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-and%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-and%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-and%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-and%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-and%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-and%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-and%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-and%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-and%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-and%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-and%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-and%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-and%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-and%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-and%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-and%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-and%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-and%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-and%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-and%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-and%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-and%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-and%) ]]>
    (else (error "L10N ERROR: gentext-and"))))

(define (gentext-listcomma)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-listcomma%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-listcomma%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-listcomma%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-listcomma%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-listcomma%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-listcomma%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-listcomma%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-listcomma%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-listcomma%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-listcomma%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-listcomma%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-listcomma%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-listcomma%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-listcomma%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-listcomma%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-listcomma%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-listcomma%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-listcomma%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-listcomma%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-listcomma%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-listcomma%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-listcomma%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-listcomma%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-listcomma%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-listcomma%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-listcomma%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-listcomma%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-listcomma%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-listcomma%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-listcomma%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-listcomma%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-listcomma%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-listcomma%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-listcomma%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-listcomma%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-listcomma%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-listcomma%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-listcomma%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-listcomma%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-listcomma%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-listcomma%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-listcomma%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-listcomma%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-listcomma%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-listcomma%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-listcomma%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-listcomma%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-listcomma%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-listcomma%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-listcomma%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-listcomma%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-listcomma%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-listcomma%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-listcomma%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-listcomma%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-listcomma%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-listcomma%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-listcomma%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-listcomma%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-listcomma%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-listcomma%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-listcomma%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-listcomma%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-listcomma%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-listcomma%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-listcomma%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-listcomma%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-listcomma%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-listcomma%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-listcomma%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-listcomma%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-listcomma%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-listcomma%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-listcomma%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-listcomma%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-listcomma%) ]]>
    (else (error "L10N ERROR: gentext-listcomma"))))

(define (gentext-lastlistcomma)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-lastlistcomma%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-lastlistcomma%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-lastlistcomma%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-lastlistcomma%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-lastlistcomma%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-lastlistcomma%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-lastlistcomma%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-lastlistcomma%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-lastlistcomma%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-lastlistcomma%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-lastlistcomma%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-lastlistcomma%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-lastlistcomma%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-lastlistcomma%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-lastlistcomma%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-lastlistcomma%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-lastlistcomma%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-lastlistcomma%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-lastlistcomma%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-lastlistcomma%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-lastlistcomma%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-lastlistcomma%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-lastlistcomma%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-lastlistcomma%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-lastlistcomma%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-lastlistcomma%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-lastlistcomma%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-lastlistcomma%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-lastlistcomma%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-lastlistcomma%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-lastlistcomma%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-lastlistcomma%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-lastlistcomma%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-lastlistcomma%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-lastlistcomma%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-lastlistcomma%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-lastlistcomma%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-lastlistcomma%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-lastlistcomma%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-lastlistcomma%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-lastlistcomma%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-lastlistcomma%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-lastlistcomma%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-lastlistcomma%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-lastlistcomma%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-lastlistcomma%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-lastlistcomma%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-lastlistcomma%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-lastlistcomma%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-lastlistcomma%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-lastlistcomma%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-lastlistcomma%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-lastlistcomma%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-lastlistcomma%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-lastlistcomma%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-lastlistcomma%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-lastlistcomma%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-lastlistcomma%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-lastlistcomma%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-lastlistcomma%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-lastlistcomma%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-lastlistcomma%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-lastlistcomma%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-lastlistcomma%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-lastlistcomma%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-lastlistcomma%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-lastlistcomma%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-lastlistcomma%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-lastlistcomma%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-lastlistcomma%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-lastlistcomma%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-lastlistcomma%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-lastlistcomma%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-lastlistcomma%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-lastlistcomma%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-lastlistcomma%) ]]>
    (else (error "L10N ERROR: gentext-lastlistcomma"))))

(define (gentext-bibl-pages)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-bibl-pages%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-bibl-pages%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-bibl-pages%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-bibl-pages%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-bibl-pages%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-bibl-pages%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-bibl-pages%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-bibl-pages%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-bibl-pages%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-bibl-pages%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-bibl-pages%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-bibl-pages%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-bibl-pages%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-bibl-pages%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-bibl-pages%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-bibl-pages%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-bibl-pages%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-bibl-pages%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-bibl-pages%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-bibl-pages%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-bibl-pages%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-bibl-pages%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-bibl-pages%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-bibl-pages%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-bibl-pages%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-bibl-pages%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-bibl-pages%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-bibl-pages%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-bibl-pages%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-bibl-pages%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-bibl-pages%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-bibl-pages%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-bibl-pages%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-bibl-pages%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-bibl-pages%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-bibl-pages%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-bibl-pages%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-bibl-pages%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-bibl-pages%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-bibl-pages%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-bibl-pages%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-bibl-pages%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-bibl-pages%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-bibl-pages%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-bibl-pages%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-bibl-pages%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-bibl-pages%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-bibl-pages%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-bibl-pages%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-bibl-pages%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-bibl-pages%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-bibl-pages%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-bibl-pages%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-bibl-pages%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-bibl-pages%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-bibl-pages%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-bibl-pages%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-bibl-pages%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-bibl-pages%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-bibl-pages%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-bibl-pages%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-bibl-pages%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-bibl-pages%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-bibl-pages%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-bibl-pages%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-bibl-pages%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-bibl-pages%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-bibl-pages%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-bibl-pages%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-bibl-pages%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-bibl-pages%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-bibl-pages%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-bibl-pages%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-bibl-pages%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-bibl-pages%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-bibl-pages%) ]]>
    (else (error "L10N ERROR: gentext-bibl-pages"))))

(define (gentext-endnotes)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-endnotes%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-endnotes%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-endnotes%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-endnotes%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-endnotes%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-endnotes%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-endnotes%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-endnotes%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-endnotes%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-endnotes%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-endnotes%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-endnotes%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-endnotes%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-endnotes%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-endnotes%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-endnotes%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-endnotes%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-endnotes%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-endnotes%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-endnotes%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-endnotes%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-endnotes%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-endnotes%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-endnotes%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-endnotes%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-endnotes%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-endnotes%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-endnotes%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-endnotes%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-endnotes%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-endnotes%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-endnotes%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-endnotes%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-endnotes%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-endnotes%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-endnotes%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-endnotes%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-endnotes%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-endnotes%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-endnotes%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-endnotes%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-endnotes%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-endnotes%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-endnotes%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-endnotes%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-endnotes%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-endnotes%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-endnotes%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-endnotes%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-endnotes%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-endnotes%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-endnotes%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-endnotes%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-endnotes%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-endnotes%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-endnotes%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-endnotes%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-endnotes%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-endnotes%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-endnotes%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-endnotes%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-endnotes%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-endnotes%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-endnotes%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-endnotes%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-endnotes%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-endnotes%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-endnotes%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-endnotes%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-endnotes%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-endnotes%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-endnotes%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-endnotes%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-endnotes%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-endnotes%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-endnotes%) ]]>
    (else (error "L10N ERROR: gentext-endnotes"))))

(define (gentext-table-endnotes)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-table-endnotes%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-table-endnotes%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-table-endnotes%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-table-endnotes%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-table-endnotes%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-table-endnotes%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-table-endnotes%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-table-endnotes%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-table-endnotes%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-table-endnotes%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-table-endnotes%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-table-endnotes%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-table-endnotes%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-table-endnotes%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-table-endnotes%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-table-endnotes%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-table-endnotes%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-table-endnotes%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-table-endnotes%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-table-endnotes%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-table-endnotes%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-table-endnotes%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-table-endnotes%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-table-endnotes%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-table-endnotes%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-table-endnotes%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-table-endnotes%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-table-endnotes%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-table-endnotes%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-table-endnotes%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-table-endnotes%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-table-endnotes%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-table-endnotes%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-table-endnotes%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-table-endnotes%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-table-endnotes%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-table-endnotes%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-table-endnotes%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-table-endnotes%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-table-endnotes%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-table-endnotes%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-table-endnotes%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-table-endnotes%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-table-endnotes%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-table-endnotes%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-table-endnotes%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-table-endnotes%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-table-endnotes%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-table-endnotes%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-table-endnotes%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-table-endnotes%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-table-endnotes%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-table-endnotes%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-table-endnotes%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-table-endnotes%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-table-endnotes%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-table-endnotes%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-table-endnotes%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-table-endnotes%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-table-endnotes%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-table-endnotes%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-table-endnotes%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-table-endnotes%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-table-endnotes%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-table-endnotes%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-table-endnotes%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-table-endnotes%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-table-endnotes%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-table-endnotes%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-table-endnotes%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-table-endnotes%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-table-endnotes%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-table-endnotes%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-table-endnotes%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-table-endnotes%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-table-endnotes%) ]]>
    (else (error "L10N ERROR: gentext-table-endnotes"))))

(define (gentext-index-see)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-index-see%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-index-see%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-index-see%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-index-see%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-index-see%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-index-see%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-index-see%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-index-see%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-index-see%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-index-see%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-index-see%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-index-see%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-index-see%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-index-see%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-index-see%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-index-see%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-index-see%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-index-see%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-index-see%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-index-see%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-index-see%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-index-see%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-index-see%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-index-see%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-index-see%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-index-see%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-index-see%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-index-see%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-index-see%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-index-see%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-index-see%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-index-see%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-index-see%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-index-see%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-index-see%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-index-see%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-index-see%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-index-see%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-index-see%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-index-see%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-index-see%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-index-see%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-index-see%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-index-see%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-index-see%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-index-see%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-index-see%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-index-see%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-index-see%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-index-see%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-index-see%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-index-see%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-index-see%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-index-see%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-index-see%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-index-see%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-index-see%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-index-see%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-index-see%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-index-see%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-index-see%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-index-see%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-index-see%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-index-see%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-index-see%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-index-see%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-index-see%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-index-see%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-index-see%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-index-see%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-index-see%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-index-see%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-index-see%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-index-see%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-index-see%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-index-see%) ]]>
    (else (error "L10N ERROR: gentext-index-see"))))

(define (gentext-index-seealso)
  (case ($lang$)
      <![%l10n-af[   (("af")    %gentext-af-index-seealso%) ]]>
      <![%l10n-am[   (("am")    %gentext-am-index-seealso%) ]]>
      <![%l10n-ar[   (("ar")    %gentext-ar-index-seealso%) ]]>
      <![%l10n-as[   (("as")    %gentext-as-index-seealso%) ]]>
      <![%l10n-ast[   (("ast")    %gentext-ast-index-seealso%) ]]>
      <![%l10n-az[   (("az")    %gentext-az-index-seealso%) ]]>
      <![%l10n-bg[   (("bg")    %gentext-bg-index-seealso%) ]]>
      <![%l10n-bn[   (("bn")    %gentext-bn-index-seealso%) ]]>
      <![%l10n-bnin[   (("bn_in")    %gentext-bnin-index-seealso%) ]]>
      <![%l10n-bs[   (("bs")    %gentext-bs-index-seealso%) ]]>
      <![%l10n-ca[   (("ca")    %gentext-ca-index-seealso%) ]]>
      <![%l10n-cs[   (("cs")    %gentext-cs-index-seealso%) ]]>
      <![%l10n-cy[   (("cy")    %gentext-cy-index-seealso%) ]]>
      <![%l10n-da[   (("da")    %gentext-da-index-seealso%) ]]>
      <![%l10n-de[   (("de")    %gentext-de-index-seealso%) ]]>
      <![%l10n-el[   (("el")    %gentext-el-index-seealso%) ]]>
      <![%l10n-en[   (("en")    %gentext-en-index-seealso%) ]]>
      <![%l10n-eo[   (("eo")    %gentext-eo-index-seealso%) ]]>
      <![%l10n-es[   (("es")    %gentext-es-index-seealso%) ]]>
      <![%l10n-et[   (("et")    %gentext-et-index-seealso%) ]]>
      <![%l10n-eu[   (("eu")    %gentext-eu-index-seealso%) ]]>
      <![%l10n-fa[   (("fa")    %gentext-fa-index-seealso%) ]]>
      <![%l10n-fi[   (("fi")    %gentext-fi-index-seealso%) ]]>
      <![%l10n-fr[   (("fr")    %gentext-fr-index-seealso%) ]]>
      <![%l10n-ga[   (("ga")    %gentext-ga-index-seealso%) ]]>
      <![%l10n-gl[   (("gl")    %gentext-gl-index-seealso%) ]]>
      <![%l10n-gu[   (("gu")    %gentext-gu-index-seealso%) ]]>
      <![%l10n-he[   (("he")    %gentext-he-index-seealso%) ]]>
      <![%l10n-hi[   (("hi")    %gentext-hi-index-seealso%) ]]>
      <![%l10n-hr[   (("hr")    %gentext-hr-index-seealso%) ]]>
      <![%l10n-hu[   (("hu")    %gentext-hu-index-seealso%) ]]>
      <![%l10n-id[   (("id")    %gentext-id-index-seealso%) ]]>
      <![%l10n-is[   (("is")    %gentext-is-index-seealso%) ]]>
      <![%l10n-it[   (("it")    %gentext-it-index-seealso%) ]]>
      <![%l10n-ja[   (("ja")    %gentext-ja-index-seealso%) ]]>
      <![%l10n-ka[   (("ka")    %gentext-ka-index-seealso%) ]]>
      <![%l10n-kn[   (("kn")    %gentext-kn-index-seealso%) ]]>
      <![%l10n-ko[   (("ko")    %gentext-ko-index-seealso%) ]]>
      <![%l10n-ky[   (("ky")    %gentext-ky-index-seealso%) ]]>
      <![%l10n-la[   (("la")    %gentext-la-index-seealso%) ]]>
      <![%l10n-lt[   (("lt")    %gentext-lt-index-seealso%) ]]>
      <![%l10n-lv[   (("lv")    %gentext-lv-index-seealso%) ]]>
      <![%l10n-ml[   (("ml")    %gentext-ml-index-seealso%) ]]>
      <![%l10n-mn[   (("mn")    %gentext-mn-index-seealso%) ]]>
      <![%l10n-mr[   (("mr")    %gentext-mr-index-seealso%) ]]>
      <![%l10n-nb[   (("nb")    %gentext-nb-index-seealso%) ]]>
      <![%l10n-nds[   (("nds")    %gentext-nds-index-seealso%) ]]>
      <![%l10n-nl[   (("nl")    %gentext-nl-index-seealso%) ]]>
      <![%l10n-nn[   (("nn")    %gentext-nn-index-seealso%) ]]>
      <![%l10n-no[   (("no")    %gentext-no-index-seealso%) ]]>
      <![%l10n-or[   (("or")    %gentext-or-index-seealso%) ]]>
      <![%l10n-pa[   (("pa")    %gentext-pa-index-seealso%) ]]>
      <![%l10n-pl[   (("pl")    %gentext-pl-index-seealso%) ]]>
      <![%l10n-pt[   (("pt")    %gentext-pt-index-seealso%) ]]>
      <![%l10n-ptbr[   (("pt_br")    %gentext-ptbr-index-seealso%) ]]>
      <![%l10n-ro[   (("ro")    %gentext-ro-index-seealso%) ]]>
      <![%l10n-ru[   (("ru")    %gentext-ru-index-seealso%) ]]>
      <![%l10n-sk[   (("sk")    %gentext-sk-index-seealso%) ]]>
      <![%l10n-sl[   (("sl")    %gentext-sl-index-seealso%) ]]>
      <![%l10n-sr[   (("sr")    %gentext-sr-index-seealso%) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    %gentext-srLatn-index-seealso%) ]]>
      <![%l10n-sv[   (("sv")    %gentext-sv-index-seealso%) ]]>
      <![%l10n-ta[   (("ta")    %gentext-ta-index-seealso%) ]]>
      <![%l10n-te[   (("te")    %gentext-te-index-seealso%) ]]>
      <![%l10n-th[   (("th")    %gentext-th-index-seealso%) ]]>
      <![%l10n-tl[   (("tl")    %gentext-tl-index-seealso%) ]]>
      <![%l10n-tr[   (("tr")    %gentext-tr-index-seealso%) ]]>
      <![%l10n-uk[   (("uk")    %gentext-uk-index-seealso%) ]]>
      <![%l10n-xh[   (("xh")    %gentext-xh-index-seealso%) ]]>
      <![%l10n-zhcn[   (("zh_cn")    %gentext-zhcn-index-seealso%) ]]>
      <![%l10n-zhtw[   (("zh_tw")    %gentext-zhtw-index-seealso%) ]]>
      <![%l10n-no[ (("bmno") %gentext-no-index-seealso%) ]]>
      <![%l10n-de[ (("dege") %gentext-de-index-seealso%) ]]>
      <![%l10n-da[ (("dk") %gentext-da-index-seealso%) ]]>
      <![%l10n-sv[ (("svse") %gentext-sv-index-seealso%) ]]>
      <![%l10n-en[ (("usen") %gentext-en-index-seealso%) ]]>
    (else (error "L10N ERROR: gentext-index-seealso"))))

(define (gentext-nav-prev prev) 
  (case ($lang$)
      <![%l10n-af[   (("af")    (gentext-af-nav-prev prev)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-nav-prev prev)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-nav-prev prev)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-nav-prev prev)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-nav-prev prev)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-nav-prev prev)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-nav-prev prev)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-nav-prev prev)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-nav-prev prev)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-nav-prev prev)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-nav-prev prev)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-nav-prev prev)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-nav-prev prev)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-nav-prev prev)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-nav-prev prev)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-nav-prev prev)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-nav-prev prev)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-nav-prev prev)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-nav-prev prev)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-nav-prev prev)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-nav-prev prev)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-nav-prev prev)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-nav-prev prev)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-nav-prev prev)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-nav-prev prev)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-nav-prev prev)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-nav-prev prev)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-nav-prev prev)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-nav-prev prev)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-nav-prev prev)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-nav-prev prev)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-nav-prev prev)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-nav-prev prev)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-nav-prev prev)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-nav-prev prev)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-nav-prev prev)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-nav-prev prev)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-nav-prev prev)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-nav-prev prev)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-nav-prev prev)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-nav-prev prev)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-nav-prev prev)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-nav-prev prev)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-nav-prev prev)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-nav-prev prev)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-nav-prev prev)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-nav-prev prev)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-nav-prev prev)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-nav-prev prev)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-nav-prev prev)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-nav-prev prev)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-nav-prev prev)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-nav-prev prev)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-nav-prev prev)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-nav-prev prev)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-nav-prev prev)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-nav-prev prev)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-nav-prev prev)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-nav-prev prev)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-nav-prev prev)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-nav-prev prev)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-nav-prev prev)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-nav-prev prev)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-nav-prev prev)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-nav-prev prev)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-nav-prev prev)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-nav-prev prev)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-nav-prev prev)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-nav-prev prev)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-nav-prev prev)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-nav-prev prev)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-nav-prev prev)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-nav-prev prev)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-nav-prev prev)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-nav-prev prev)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-nav-prev prev)) ]]>
    (else (error "L10N ERROR: gentext-nav-prev"))))

(define (gentext-nav-prev-sibling prevsib) 
  (case ($lang$)
      <![%l10n-af[   (("af")    (gentext-af-nav-prev-sibling prevsib)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-nav-prev-sibling prevsib)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-nav-prev-sibling prevsib)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-nav-prev-sibling prevsib)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-nav-prev-sibling prevsib)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-nav-prev-sibling prevsib)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-nav-prev-sibling prevsib)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-nav-prev-sibling prevsib)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-nav-prev-sibling prevsib)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-nav-prev-sibling prevsib)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-nav-prev-sibling prevsib)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-nav-prev-sibling prevsib)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-nav-prev-sibling prevsib)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-nav-prev-sibling prevsib)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-nav-prev-sibling prevsib)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-nav-prev-sibling prevsib)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-nav-prev-sibling prevsib)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-nav-prev-sibling prevsib)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-nav-prev-sibling prevsib)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-nav-prev-sibling prevsib)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-nav-prev-sibling prevsib)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-nav-prev-sibling prevsib)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-nav-prev-sibling prevsib)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-nav-prev-sibling prevsib)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-nav-prev-sibling prevsib)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-nav-prev-sibling prevsib)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-nav-prev-sibling prevsib)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-nav-prev-sibling prevsib)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-nav-prev-sibling prevsib)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-nav-prev-sibling prevsib)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-nav-prev-sibling prevsib)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-nav-prev-sibling prevsib)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-nav-prev-sibling prevsib)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-nav-prev-sibling prevsib)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-nav-prev-sibling prevsib)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-nav-prev-sibling prevsib)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-nav-prev-sibling prevsib)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-nav-prev-sibling prevsib)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-nav-prev-sibling prevsib)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-nav-prev-sibling prevsib)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-nav-prev-sibling prevsib)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-nav-prev-sibling prevsib)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-nav-prev-sibling prevsib)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-nav-prev-sibling prevsib)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-nav-prev-sibling prevsib)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-nav-prev-sibling prevsib)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-nav-prev-sibling prevsib)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-nav-prev-sibling prevsib)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-nav-prev-sibling prevsib)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-nav-prev-sibling prevsib)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-nav-prev-sibling prevsib)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-nav-prev-sibling prevsib)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-nav-prev-sibling prevsib)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-nav-prev-sibling prevsib)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-nav-prev-sibling prevsib)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-nav-prev-sibling prevsib)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-nav-prev-sibling prevsib)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-nav-prev-sibling prevsib)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-nav-prev-sibling prevsib)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-nav-prev-sibling prevsib)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-nav-prev-sibling prevsib)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-nav-prev-sibling prevsib)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-nav-prev-sibling prevsib)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-nav-prev-sibling prevsib)) ]]>
    (else (error "L10N ERROR: gentext-nav-prev-sibling "))))

(define (gentext-nav-next-sibling nextsib)
  (case ($lang$)
      <![%l10n-af[   (("af")    (gentext-af-nav-next-sibling nextsib)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-nav-next-sibling nextsib)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-nav-next-sibling nextsib)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-nav-next-sibling nextsib)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-nav-next-sibling nextsib)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-nav-next-sibling nextsib)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-nav-next-sibling nextsib)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-nav-next-sibling nextsib)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-nav-next-sibling nextsib)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-nav-next-sibling nextsib)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-nav-next-sibling nextsib)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-nav-next-sibling nextsib)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-nav-next-sibling nextsib)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-nav-next-sibling nextsib)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-nav-next-sibling nextsib)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-nav-next-sibling nextsib)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-nav-next-sibling nextsib)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-nav-next-sibling nextsib)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-nav-next-sibling nextsib)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-nav-next-sibling nextsib)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-nav-next-sibling nextsib)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-nav-next-sibling nextsib)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-nav-next-sibling nextsib)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-nav-next-sibling nextsib)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-nav-next-sibling nextsib)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-nav-next-sibling nextsib)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-nav-next-sibling nextsib)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-nav-next-sibling nextsib)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-nav-next-sibling nextsib)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-nav-next-sibling nextsib)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-nav-next-sibling nextsib)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-nav-next-sibling nextsib)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-nav-next-sibling nextsib)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-nav-next-sibling nextsib)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-nav-next-sibling nextsib)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-nav-next-sibling nextsib)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-nav-next-sibling nextsib)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-nav-next-sibling nextsib)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-nav-next-sibling nextsib)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-nav-next-sibling nextsib)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-nav-next-sibling nextsib)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-nav-next-sibling nextsib)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-nav-next-sibling nextsib)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-nav-next-sibling nextsib)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-nav-next-sibling nextsib)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-nav-next-sibling nextsib)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-nav-next-sibling nextsib)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-nav-next-sibling nextsib)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-nav-next-sibling nextsib)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-nav-next-sibling nextsib)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-nav-next-sibling nextsib)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-nav-next-sibling nextsib)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-nav-next-sibling nextsib)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-nav-next-sibling nextsib)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-nav-next-sibling nextsib)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-nav-next-sibling nextsib)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-nav-next-sibling nextsib)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-nav-next-sibling nextsib)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-nav-next-sibling nextsib)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-nav-next-sibling nextsib)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-nav-next-sibling nextsib)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-nav-next-sibling nextsib)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-nav-next-sibling nextsib)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-nav-next-sibling nextsib)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-nav-next-sibling nextsib)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-nav-next-sibling nextsib)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-nav-next-sibling nextsib)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-nav-next-sibling nextsib)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-nav-next-sibling nextsib)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-nav-next-sibling nextsib)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-nav-next-sibling nextsib)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-nav-next-sibling nextsib)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-nav-next-sibling nextsib)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-nav-next-sibling nextsib)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-nav-next-sibling nextsib)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-nav-next-sibling nextsib)) ]]>
    (else (error "L10N ERROR: gentext-nav-next-sibling"))))

(define (gentext-nav-next next)
  (case ($lang$)
      <![%l10n-af[   (("af")    (gentext-af-nav-next next)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-nav-next next)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-nav-next next)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-nav-next next)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-nav-next next)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-nav-next next)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-nav-next next)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-nav-next next)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-nav-next next)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-nav-next next)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-nav-next next)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-nav-next next)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-nav-next next)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-nav-next next)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-nav-next next)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-nav-next next)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-nav-next next)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-nav-next next)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-nav-next next)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-nav-next next)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-nav-next next)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-nav-next next)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-nav-next next)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-nav-next next)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-nav-next next)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-nav-next next)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-nav-next next)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-nav-next next)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-nav-next next)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-nav-next next)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-nav-next next)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-nav-next next)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-nav-next next)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-nav-next next)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-nav-next next)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-nav-next next)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-nav-next next)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-nav-next next)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-nav-next next)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-nav-next next)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-nav-next next)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-nav-next next)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-nav-next next)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-nav-next next)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-nav-next next)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-nav-next next)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-nav-next next)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-nav-next next)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-nav-next next)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-nav-next next)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-nav-next next)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-nav-next next)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-nav-next next)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-nav-next next)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-nav-next next)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-nav-next next)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-nav-next next)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-nav-next next)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-nav-next next)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-nav-next next)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-nav-next next)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-nav-next next)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-nav-next next)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-nav-next next)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-nav-next next)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-nav-next next)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-nav-next next)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-nav-next next)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-nav-next next)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-nav-next next)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-nav-next next)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-nav-next next)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-nav-next next)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-nav-next next)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-nav-next next)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-nav-next next)) ]]>
    (else (error "L10N ERROR: gentext-nav-next"))))

(define (gentext-nav-up up)
  (case ($lang$)
      <![%l10n-af[   (("af")    (gentext-af-nav-up up)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-nav-up up)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-nav-up up)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-nav-up up)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-nav-up up)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-nav-up up)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-nav-up up)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-nav-up up)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-nav-up up)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-nav-up up)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-nav-up up)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-nav-up up)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-nav-up up)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-nav-up up)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-nav-up up)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-nav-up up)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-nav-up up)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-nav-up up)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-nav-up up)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-nav-up up)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-nav-up up)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-nav-up up)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-nav-up up)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-nav-up up)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-nav-up up)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-nav-up up)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-nav-up up)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-nav-up up)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-nav-up up)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-nav-up up)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-nav-up up)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-nav-up up)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-nav-up up)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-nav-up up)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-nav-up up)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-nav-up up)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-nav-up up)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-nav-up up)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-nav-up up)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-nav-up up)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-nav-up up)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-nav-up up)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-nav-up up)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-nav-up up)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-nav-up up)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-nav-up up)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-nav-up up)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-nav-up up)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-nav-up up)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-nav-up up)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-nav-up up)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-nav-up up)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-nav-up up)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-nav-up up)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-nav-up up)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-nav-up up)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-nav-up up)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-nav-up up)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-nav-up up)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-nav-up up)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-nav-up up)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-nav-up up)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-nav-up up)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-nav-up up)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-nav-up up)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-nav-up up)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-nav-up up)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-nav-up up)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-nav-up up)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-nav-up up)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-nav-up up)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-nav-up up)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-nav-up up)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-nav-up up)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-nav-up up)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-nav-up up)) ]]>
    (else (error "L10N ERROR: gentext-nav-up"))))

(define (gentext-nav-home home)
  (case ($lang$)
      <![%l10n-af[   (("af")    (gentext-af-nav-home home)) ]]>
      <![%l10n-am[   (("am")    (gentext-am-nav-home home)) ]]>
      <![%l10n-ar[   (("ar")    (gentext-ar-nav-home home)) ]]>
      <![%l10n-as[   (("as")    (gentext-as-nav-home home)) ]]>
      <![%l10n-ast[   (("ast")    (gentext-ast-nav-home home)) ]]>
      <![%l10n-az[   (("az")    (gentext-az-nav-home home)) ]]>
      <![%l10n-bg[   (("bg")    (gentext-bg-nav-home home)) ]]>
      <![%l10n-bn[   (("bn")    (gentext-bn-nav-home home)) ]]>
      <![%l10n-bnin[   (("bn_in")    (gentext-bnin-nav-home home)) ]]>
      <![%l10n-bs[   (("bs")    (gentext-bs-nav-home home)) ]]>
      <![%l10n-ca[   (("ca")    (gentext-ca-nav-home home)) ]]>
      <![%l10n-cs[   (("cs")    (gentext-cs-nav-home home)) ]]>
      <![%l10n-cy[   (("cy")    (gentext-cy-nav-home home)) ]]>
      <![%l10n-da[   (("da")    (gentext-da-nav-home home)) ]]>
      <![%l10n-de[   (("de")    (gentext-de-nav-home home)) ]]>
      <![%l10n-el[   (("el")    (gentext-el-nav-home home)) ]]>
      <![%l10n-en[   (("en")    (gentext-en-nav-home home)) ]]>
      <![%l10n-eo[   (("eo")    (gentext-eo-nav-home home)) ]]>
      <![%l10n-es[   (("es")    (gentext-es-nav-home home)) ]]>
      <![%l10n-et[   (("et")    (gentext-et-nav-home home)) ]]>
      <![%l10n-eu[   (("eu")    (gentext-eu-nav-home home)) ]]>
      <![%l10n-fa[   (("fa")    (gentext-fa-nav-home home)) ]]>
      <![%l10n-fi[   (("fi")    (gentext-fi-nav-home home)) ]]>
      <![%l10n-fr[   (("fr")    (gentext-fr-nav-home home)) ]]>
      <![%l10n-ga[   (("ga")    (gentext-ga-nav-home home)) ]]>
      <![%l10n-gl[   (("gl")    (gentext-gl-nav-home home)) ]]>
      <![%l10n-gu[   (("gu")    (gentext-gu-nav-home home)) ]]>
      <![%l10n-he[   (("he")    (gentext-he-nav-home home)) ]]>
      <![%l10n-hi[   (("hi")    (gentext-hi-nav-home home)) ]]>
      <![%l10n-hr[   (("hr")    (gentext-hr-nav-home home)) ]]>
      <![%l10n-hu[   (("hu")    (gentext-hu-nav-home home)) ]]>
      <![%l10n-id[   (("id")    (gentext-id-nav-home home)) ]]>
      <![%l10n-is[   (("is")    (gentext-is-nav-home home)) ]]>
      <![%l10n-it[   (("it")    (gentext-it-nav-home home)) ]]>
      <![%l10n-ja[   (("ja")    (gentext-ja-nav-home home)) ]]>
      <![%l10n-ka[   (("ka")    (gentext-ka-nav-home home)) ]]>
      <![%l10n-kn[   (("kn")    (gentext-kn-nav-home home)) ]]>
      <![%l10n-ko[   (("ko")    (gentext-ko-nav-home home)) ]]>
      <![%l10n-ky[   (("ky")    (gentext-ky-nav-home home)) ]]>
      <![%l10n-la[   (("la")    (gentext-la-nav-home home)) ]]>
      <![%l10n-lt[   (("lt")    (gentext-lt-nav-home home)) ]]>
      <![%l10n-lv[   (("lv")    (gentext-lv-nav-home home)) ]]>
      <![%l10n-ml[   (("ml")    (gentext-ml-nav-home home)) ]]>
      <![%l10n-mn[   (("mn")    (gentext-mn-nav-home home)) ]]>
      <![%l10n-mr[   (("mr")    (gentext-mr-nav-home home)) ]]>
      <![%l10n-nb[   (("nb")    (gentext-nb-nav-home home)) ]]>
      <![%l10n-nds[   (("nds")    (gentext-nds-nav-home home)) ]]>
      <![%l10n-nl[   (("nl")    (gentext-nl-nav-home home)) ]]>
      <![%l10n-nn[   (("nn")    (gentext-nn-nav-home home)) ]]>
      <![%l10n-no[   (("no")    (gentext-no-nav-home home)) ]]>
      <![%l10n-or[   (("or")    (gentext-or-nav-home home)) ]]>
      <![%l10n-pa[   (("pa")    (gentext-pa-nav-home home)) ]]>
      <![%l10n-pl[   (("pl")    (gentext-pl-nav-home home)) ]]>
      <![%l10n-pt[   (("pt")    (gentext-pt-nav-home home)) ]]>
      <![%l10n-ptbr[   (("pt_br")    (gentext-ptbr-nav-home home)) ]]>
      <![%l10n-ro[   (("ro")    (gentext-ro-nav-home home)) ]]>
      <![%l10n-ru[   (("ru")    (gentext-ru-nav-home home)) ]]>
      <![%l10n-sk[   (("sk")    (gentext-sk-nav-home home)) ]]>
      <![%l10n-sl[   (("sl")    (gentext-sl-nav-home home)) ]]>
      <![%l10n-sr[   (("sr")    (gentext-sr-nav-home home)) ]]>
      <![%l10n-srLatn[   (("sr_Latn")    (gentext-srLatn-nav-home home)) ]]>
      <![%l10n-sv[   (("sv")    (gentext-sv-nav-home home)) ]]>
      <![%l10n-ta[   (("ta")    (gentext-ta-nav-home home)) ]]>
      <![%l10n-te[   (("te")    (gentext-te-nav-home home)) ]]>
      <![%l10n-th[   (("th")    (gentext-th-nav-home home)) ]]>
      <![%l10n-tl[   (("tl")    (gentext-tl-nav-home home)) ]]>
      <![%l10n-tr[   (("tr")    (gentext-tr-nav-home home)) ]]>
      <![%l10n-uk[   (("uk")    (gentext-uk-nav-home home)) ]]>
      <![%l10n-xh[   (("xh")    (gentext-xh-nav-home home)) ]]>
      <![%l10n-zhcn[   (("zh_cn")    (gentext-zhcn-nav-home home)) ]]>
      <![%l10n-zhtw[   (("zh_tw")    (gentext-zhtw-nav-home home)) ]]>
      <![%l10n-no[ (("bmno") (gentext-no-nav-home home)) ]]>
      <![%l10n-de[ (("dege") (gentext-de-nav-home home)) ]]>
      <![%l10n-da[ (("dk") (gentext-da-nav-home home)) ]]>
      <![%l10n-sv[ (("svse") (gentext-sv-nav-home home)) ]]>
      <![%l10n-en[ (("usen") (gentext-en-nav-home home)) ]]>
    (else (error "L10N ERROR: gentext-nav-home"))))
