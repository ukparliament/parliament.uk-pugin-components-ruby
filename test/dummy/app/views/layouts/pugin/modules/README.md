# Pugin Partials

All CSS classes used to style HTML components should be prefixed with 'pds-' so they are easy indentified as front end resources used by the UK Parliament websites.

## Header

* Has own container div wrap class 'pds-header-wrap'
* Has own container div row class 'pds-header-row'
* Uses 'pds-header-logo' class for logo styling

## Components

Page components share the same content container structure:

* Container div wrap class is 'pds-cont-wrap'
* Container div row class 'pds-cont-row'

### Breadcrumbs

* Uses 'pds-crumb' class to manage the breadcrumb content div
* Uses 'pds-crumb-spacer' class to determine white space around breadcrumb divider
* Current partial example uses 2 'a' tags and divider to illustrate usage

### Profile Card

* Uses 'pds-profcard' class to manage profile card content div
* Uses 'pds-profcard-picture' class to style profile pds-profcard-picture
* Uses 'pds-profcard-detail' class to manage profile headline and subtext
* Current partial example shows profile 'img' plus 'h2' and 'p' to illustate headline/subtext

### Standard Panel

* Uses 'pds-panel' class to customise content
* Current partial example uses 'h3' and 'p' to illustrate usage

### Definition List

* Uses 'pds-deflist' class to style standard definition list
* Current partial example uses 'h4' and 2 'dt' 'dd' sets to illustrate usage

## Footer

* Has own container div wrap class 'pds-footer-wrap'
* Has own container div row class 'pds-footer-row'
* Uses 'pds-footer-copy' class for date/copyright content styling
* Uses 'pds-footer-logo' class for logo styling
