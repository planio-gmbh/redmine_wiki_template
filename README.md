# Redmine Wiki Template

This plugin to Redmine adds a new wiki macro called `{{template}}` which
allows to include other wiki pages similar to the existing `{{include}}`
macro but additionally allows to replace existing "tags" in the included page.

It can thus be used to define customizable wiki page templates.

## Example

    {{template(WikiTemplatePage,token=foo,token2=bar)}}

# Installation
1. Copy the software to the `vendor/plugins` (for Redmine 1.x) or `plugins`
   (for Redmine 2.x) directory. Make sure that the name of the directory is
   `redmine_wiki_template`.
2. Restart Redmine

# License

Copyright (c) 2013 Holger Just, Planio GmbH

This plugin is licensed under the GNU GPL v2 or later. See License.txt for
more details. It is based on code by Craig Taverner from 
http://www.redmine.org/issues/2854#note-1.
