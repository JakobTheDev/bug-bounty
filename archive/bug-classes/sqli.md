## SQLi

## Tips
- Basic SQLi testing in to run SQLMap against the target
- Next level is to test using polyglots
- Try testing injection points with isomorphic statements and see how responses differ (see spaceraccoon's post below)
  - Replace `id=1` with `id=2-1` and `id=1+''`
  - Replace `searchTerm=test` with `searchTerm=test%%` or `searchTerm=test%' '`

## Tools
- SQLMap
- SQLiPy (BurpSuite Extension)

## Lists
- [SecLists](https://github.com/danielmiessler/SecLists/tree/master/Fuzzing/SQLi)

## Cheatsheets

- MySQL:
  - [PentestMonkey's mySQL injection cheat sheet] (http://pentestmonkey.net/cheat-sheet/sql-injection/mysql-sql-injection-cheat-sheet)
  - [Reiners mySQL injection Filter Evasion Cheatsheet] (https://websec.wordpress.com/2010/12/04/sqli-filter-evasion-cheat-sheet-mysql/)
- MSQQL:
  - [EvilSQL's Error/Union/Blind MSSQL Cheatsheet] (http://evilsql.com/main/page2.php)
  - [PentestMonkey's MSSQL SQLi injection Cheat Sheet] (http://pentestmonkey.net/cheat-sheet/sql-injection/mssql-sql-injection-cheat-sheet)
- ORACLE:
  - [PentestMonkey's Oracle SQLi Cheatsheet] (http://pentestmonkey.net/cheat-sheet/sql-injection/oracle-sql-injection-cheat-sheet)
- POSTGRESQL:
  - [PentestMonkey's Postgres SQLi Cheatsheet] (http://pentestmonkey.net/cheat-sheet/sql-injection/postgres-sql-injection-cheat-sheet)
- Others
  - [Access SQLi Cheatsheet] (http://nibblesec.org/files/MSAccessSQLi/MSAccessSQLi.html)
  - [PentestMonkey's Ingres SQL Injection Cheat Sheet] (http://pentestmonkey.net/cheat-sheet/sql-injection/ingres-sql-injection-cheat-sheet)
  - [Pentestmonkey's DB2 SQL Injection Cheat Sheet] (http://pentestmonkey.net/cheat-sheet/sql-injection/db2-sql-injection-cheat-sheet)
  - [Pentestmonkey's Informix SQL Injection Cheat Sheet] (http://pentestmonkey.net/cheat-sheet/sql-injection/informix-sql-injection-cheat-sheet)
  - [SQLite3 Injection Cheat sheet] (https://sites.google.com/site/0x7674/home/sqlite3injectioncheatsheet)
  - [Ruby on Rails (Active Record) SQL Injection Guide] (http://rails-sqli.org/)

## Resources
- [The Bug Hunters Methodology - SQLi](https://github.com/jhaddix/tbhm/blob/master/06_SQLi.md)

## Write-Ups
- [Same Same But Different: Discovering SQL Injections Incrementally with Isomorphic SQL Statements](https://spaceraccoon.dev/same-same-but-different-discovering-sql-injections-incrementally-with) - _@spaceraccoon_

