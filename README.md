incbool.vim
===========

The plugin allows to increment not only numbers but also allows to change between 
binary words.

To do it plugin modifies native C-A/C-X commands and makes true <-> false,
True <-> False and TRUE <-> FALSE transitions depending on the word under cursor.

List of Words
-------------
  * true - false
  * asc - desc
  * show - hide

Known Issues
============

Plugin does not ensures if cursor will get out of the word boundaries after convertion.
