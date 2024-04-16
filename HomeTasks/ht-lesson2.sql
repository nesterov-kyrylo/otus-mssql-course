--1. ��� ������, � ������� � �������� ���� ������� urgent ��� �������� ���������� � Animal
select ol.*
from Sales.OrderLines ol with (nolock)
where ol.Description like '%urgent%'
	or Description like 'Animal%';

--2. �����������, � ������� �� ���� ������� �� ������ ������ (����� ������� ��� ��� ������ ����� ���������, ������ �������� ����� JOIN)

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

--3. ������� � ��������� ������, � ������� ���� �������, ������� ��������, � �������� ��������� �������, 
--�������� ����� � ����� ����� ���� ��������� ���� - ������ ����� �� 4 ������, 
--���� ������ ������ ������ ���� ������, � ����� ������ ����� 100$ ���� ���������� ������ ������ ����� 20. 
--�������� ������� ����� ������� � ������������ �������� ��������� ������ 1000 � ��������� ��������� 100 �������. 
--���������� ������ ���� �� ������ ��������, ����� ����, ���� �������. 

select top 100 *
from Sales.Orders o with (nolock)

