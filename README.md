Quickerproject
==============

[![Build Status](https://travis-ci.org/DalekBaldwin/quickerproject.svg?branch=master)](https://travis-ci.org/DalekBaldwin/quickerproject)

```
CL-USER> (asdf:system-definition-pathname :quickerproject)
#P"/Users/me/quicklisp/local-projects/quicker-project/quickerproject.asd"
CL-USER> (quickerproject:make-project "derp")
"derp"
CL-USER> (asdf:system-definition-pathname :derp)
#P"/Users/me/quicklisp/local-projects/derp/derp.asd"
CL-USER> (ql:quickload "derp")
To load "derp":
  Load 1 ASDF system:
    derp
; Loading "derp"
[package derp]
("derp")
CL-USER> (ql:quickload "derp-test")
To load "derp-test":
  Load 1 ASDF system:
    derp-test
; Loading "derp-test"
..................................................
[package derp-test].
("derp-test")
CL-USER> (derp-test:TEST-ALL)

#<test-run: 1 tests, 0 assertions, 0 failures in 0.0 sec>
```