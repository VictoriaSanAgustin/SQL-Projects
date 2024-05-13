--What are the most visited countries?

SELECT Top 5 Destination_Country, COUNT(Destination_Country) AS Visited
FROM ['Travel details dataset$']
GROUP BY Destination_Country
ORDER BY Visited Desc


France             	15
Australia        	13
Japan              	13
USA                	13
Indonesia        	12

--Which nationality travels the most?

SELECT Top 5 [Traveler nationality], COUNT([Traveler nationality]) AS Travelers
FROM ['Travel details dataset$']
GROUP BY [Traveler nationality]
ORDER BY Travelers Desc

American	26
British	    14
Korean	    13
Canadian	11
Chinese	     9

--How much do people spend on average for travel and accommodation?

SELECT avg([Accommodation cost])
FROM ['Travel details dataset$']

1245,10948905109

SELECT AVG([Accommodation cost]/[Duration (days)])
FROM ['Travel details dataset$']

174,573368642712 per day

SELECT avg([Transportation cost])
FROM ['Travel details dataset$']

645,183823529412 in general


SELECT avg([Transportation cost])
FROM ['Travel details dataset$']
WHERE [Transportation type] LIKE 'Flight'

883,333333333333

SELECT avg([Transportation cost])
FROM ['Travel details dataset$']
WHERE [Transportation type] LIKE 'Car'

1433,33333333333

SELECT avg([Transportation cost])
FROM ['Travel details dataset$']
WHERE [Transportation type] LIKE 'Train'

344,594594594595

--What is the most popular accommodation type?

SELECT COUNT([Accommodation type]) AS Visits,[Accommodation type]
FROM ['Travel details dataset$']
GROUP BY [Accommodation type]
ORDER BY Visits Desc

60	Hotel
30	Airbnb
24	Hostel

--What is the most popular travel type?

SELECT COUNT([Transportation type]) AS Trips,[Transportation type]
FROM ['Travel details dataset$']
GROUP BY [Transportation type]
ORDER BY Trips Desc

75	Flight
37	Train
13	Car rental


--Busiest travel months of the year?

SELECT MONTH, count(Month) as Most_travelled
FROM ['Travel details dataset$']
GROUP BY MONTH
ORDER BY Most_travelled DESC

June - September



--Do women or men travel more?

SELECT [Traveler gender],COUNT([Traveler gender])
FROM ['Travel details dataset$']
GROUP BY [Traveler gender]

Female	70
Male	67

--How long do people travel on average for?

SELECT avg([Duration (days)])
FROM ['Travel details dataset$']

7,60583941605839 days


--What is the age range for most travellers?

SELECT [Age_Range], COUNT(Age_Range) AS Range
FROM ['Travel details dataset$']
GROUP BY Age_Range
ORDER BY Range Desc

30s  55
20s  54
40s  25
50s  2
60s  1


