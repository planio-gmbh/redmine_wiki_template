# Redmine Wiki Template

This plugin to Redmine adds a new wiki macro called `{{template}}` which
allows to include other wiki pages similar to the existing `{{include}}`
macro but additionally allows to replace existing "tags" in the included page.

It can thus be used to define customizable wiki page templates.

The tags in the included page don't need any special markup. Any text can
be simply replaced by defining a mapping in the `{{template}}` tag.

## Example

    {{template(WikiTemplatePage,token=foo,token2=bar)}}

## Table handling

There exists a special argument to the `{{template}}` tag which can be used to
customize tables. It thus allows the user to define full tables from multiple
templates.

The `TableType` argument can take three different values:

* `first` for the table header
* `mid` for intermediate table rows
* `last` for the last table row

    {{template(TableHeader,TableType=first,foo=bar)}}

It is up to the user to make sure that there are proper tables in the end.
That means if the user defines a `TableType=first`, they have to make sure,
that there is a `TableType=last` after that. Between the two macros, there can
only be `TableType=mid` macros and not any other text.

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
