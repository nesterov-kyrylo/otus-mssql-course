--1. Все товары, в которых в название есть пометка urgent или название начинается с Animal
select ol.*
from Sales.OrderLines ol with (nolock)
where ol.Description like '%urgent%'
	or Description like 'Animal%';

--2. Поставщиков, у которых не было сделано ни одного заказа (потом покажем как это делать через подзапрос, сейчас сделайте через JOIN)

select *
from Purchasing.Suppliers s with (nolock)
where s.SupplierID not in 
(
	select po.SupplierID
	from Purchasing.PurchaseOrders po with (nolock)
);

select *
from Purchasing.Suppliers s with (nolock)
left join Purchasing.PurchaseOrders po with (nolock) on s.SupplierID = po.SupplierID
where po.PurchaseOrderID is null;

--3. Продажи с названием месяца, в котором была продажа, номером квартала, к которому относится продажа, 
--включите также к какой трети года относится дата - каждая треть по 4 месяца, 
--дата забора заказа должна быть задана, с ценой товара более 100$ либо количество единиц товара более 20. 
--Добавьте вариант этого запроса с постраничной выборкой пропустив первую 1000 и отобразив следующие 100 записей. 
--Соритровка должна быть по номеру квартала, трети года, дате продажи. 

select top 100 *
from Sales.Orders o with (nolock)

