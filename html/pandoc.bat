@echo off
rem Define pandoc application directory
set PANDOC_HOME=C:\Program Files (x86)\Pandoc

"%PANDOC_HOME%\pandoc" index.md -s -o index.html
