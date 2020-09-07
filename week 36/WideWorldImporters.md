# WideWorldImporters

- [Hent bak fil](https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak) (kilde: [github](https://github.com/Microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0))
- Kopier bak filen ind i docker containeren der indeholder sql server:

`docker cp ./WideWorldImporters-Full.bak [docker-container-id]:/var/opt/mssql/data`
- start MS SQL Server Management studio og log ind.
- højreklik på databases og vælg 'Restore database'
- vælg 'Source: Device' og naviger til stien hvor du kopierede WWI ind.