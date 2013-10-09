#-- encoding: UTF-8
# Copyright (c) 2013 Holger Just, Planio GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# This plugin is based on code by Craig Taverner from
# http://www.redmine.org/issues/2854#note-1

require 'redmine'

Redmine::Plugin.register :redmine_wiki_template do
  name 'Wiki Template plugin'
  author 'Planio'
  description 'This plugin allows the use of templates for wiki formatting'
  version '0.0.1'
  url 'https://plan.io/contact/'

  Redmine::WikiFormatting::Macros.register do
    # wiki template macro
    desc "Replace token inside a template. Example:\n\n {{template(WikiTemplatePage,token=foo,token2=bar)}}."
    macro :template do |obj, args|
      out = macro_include(obj, [args.shift])
      args.each do |arg|
        _, key, value = /(\w+)\W*\=\W*(.+)$/.match(arg).to_a
        next unless key && value

        out.gsub!(key){ value.strip.gsub("<br />", "") }
      end

      out.html_safe
    end
  end
end
