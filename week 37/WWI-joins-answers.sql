USE WideWorldImporters

-- Find kunden der har genereret mest profit.
SELECT c.CustomerId, SUM(il.LineProfit) Profit
FROM Sales.Customers c --wip
LEFT JOIN Sales.Invoices i
  ON c.CustomerID = i.CustomerID
  LEFT JOIN Sales.InvoiceLines il
    ON il.InvoiceID = i.InvoiceID
GROUP BY c.CustomerID
ORDER BY Profit DESC

-- Find den buying group der har genereret mest profit
SELECT bg.BuyingGroupID, SUM(il.LineProfit) Profit
FROM Sales.BuyingGroups bg
LEFT JOIN Sales.Customers c
  ON bg.BuyingGroupID = c.BuyingGroupID
  LEFT JOIN Sales.Invoices i
    ON c.CustomerID = i.CustomerID
    LEFT JOIN Sales.InvoiceLines il
      ON il.InvoiceID = i.InvoiceID
GROUP BY bg.BuyingGroupID
ORDER BY Profit DESC

-- Find den by med flest customers
SELECT TOP(1) CityName, COUNT(*) CustomerCount
FROM Application.Cities cities
  LEFT JOIN Sales.Customers customers
  ON cities.CityID =customers.PostalCityID
GROUP BY CityName
ORDER BY CustomerCount DESC

-- Select everything from buyinggroups that has special deals
SELECT * 
FROM Sales.BuyingGroups bg
JOIN Sales.SpecialDeals sd
  ON bg.BuyingGroupID = sd.BuyingGroupID

/*
 Select PurchaseOrders for the different suppliers and their supply category. (cont.)
 We want to find the delivery location, the category, phone number and the order date, where the supplierID is 4 */
SELECT 
  CONCAT(DeliveryAddressLine1, ' ', DeliveryAddressLine2) DeliveryLocation,
  SupplierCategoryName,
  PhoneNumber,
  po.OrderDate
FROM Purchasing.PurchaseOrders po
LEFT JOIN Purchasing.Suppliers s
  ON po.SupplierID = s.SupplierID
  LEFT JOIN Purchasing.SupplierCategories sc
    ON sc.SupplierCategoryID = s.SupplierCategoryID
WHERE po.SupplierID = 4

-- How many cities is there in texas?
SELECT COUNT(*) NoOfCities 
FROM Application.Cities City
JOIN Application.StateProvinces sp
  ON sp.StateProvinceID = City.StateProvinceID
WHERE sp.StateProvinceName = 'Texas'