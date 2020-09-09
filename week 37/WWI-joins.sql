-- Show each invoice id and the name of the salesperson did the sale
SELECT i.InvoiceID Invoice, ppl.FullName SalesPerson
FROM Sales.Invoices i
	  LEFT JOIN Application.People as ppl
	    ON SalespersonPersonID = ppl.PersonID
ORDER BY Invoice ASC


-- Show all invoicelines, listing the invoiceId, Stockitemname, quantity and unitprice
SELECT InvoiceID, si.StockItemName, il.Quantity, il.UnitPrice
--SELECT *
FROM Sales.InvoiceLines il
LEFT JOIN Warehouse.StockItems si
  ON il.StockItemID = si.StockItemID

-- Show all stockitems names with name of supplier
SELECT si.StockItemName, s.SupplierName 
FROM Warehouse.StockItems si
LEFT JOIN Purchasing.Suppliers s
  ON si.SupplierID = S.SupplierID