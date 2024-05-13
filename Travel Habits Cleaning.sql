--Retrieve only Country from Destination

ALTER TABLE ['Travel details dataset$']
	ADD Destination_Country CHAR(250)

UPDATE ['Travel details dataset$']SET Destination_Country = 'Netherlands' WHERE Destination LIKE '%Netherlands%' OR Destination LIKE '%Amsterdam%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Greece' WHERE Destination LIKE '%Greece%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'New Zealand' WHERE Destination LIKE '%New Zealand%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'United Kingdom' WHERE Destination LIKE '%London%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Australia' WHERE Destination LIKE '%Aus%' OR Destination LIKE '%Sydney%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Japan' WHERE Destination LIKE '%Japan%' OR Destination LIKE '%Tokyo%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Spain' WHERE Destination LIKE '%Spain%' OR Destination LIKE '%Barcelona%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Canada' WHERE Destination LIKE '%Canada%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Brazil' WHERE Destination LIKE '%Brazil%' OR Destination LIKE '%Rio%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Mexico' WHERE Destination LIKE '%Mexico%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'USA' WHERE Destination LIKE '%USA%' OR Destination LIKE '%New York%' OR Destination LIKE '%Hawaii%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'UAE' WHERE Destination LIKE '%UAE%'OR Destination LIKE '%Dubai%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Portugal' WHERE Destination LIKE '%Portugal%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'France' WHERE Destination LIKE '%France%' OR Destination LIKE '%Paris%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Indonesia' WHERE Destination LIKE '%Indonesia%'OR Destination LIKE '%Bali%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Morocco' WHERE Destination LIKE '%Morocco%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Germany' WHERE Destination LIKE '%Germany%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Scotland' WHERE Destination LIKE '%Scotland%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Egypt' WHERE Destination LIKE '%Egypt%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Italy' WHERE Destination LIKE '%Italy%' OR Destination LIKE '%Rome%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Thailand' WHERE Destination LIKE '%Thailand%' OR Destination LIKE '%Bangkok%' OR Destination LIKE '%Phuket%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Greece' WHERE Destination LIKE '%Santorini%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'South Africa' WHERE Destination LIKE '%Cape Town%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'South Korea' WHERE Destination LIKE '%South Korea%' OR Destination LIKE '%Seoul%'
UPDATE ['Travel details dataset$']SET Destination_Country = 'Cambodia' WHERE Destination LIKE '%Phnom%'

--Standardizing the Traveler Nationality

UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Brazilian' WHERE [Traveler nationality] LIKE '%Brazil%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Canadian' WHERE [Traveler nationality] LIKE '%Canada%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Chinese' WHERE [Traveler nationality] LIKE '%China%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Cambodian' WHERE [Traveler nationality] LIKE '%Cambodia%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'German' WHERE [Traveler nationality] LIKE '%Germany%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Greek' WHERE [Traveler nationality] LIKE '%Greece%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Brazilian' WHERE [Traveler nationality] LIKE '%Brazil%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Chinese' WHERE [Traveler nationality] LIKE '%HOng kong%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Japanese' WHERE [Traveler nationality] LIKE '%Japan%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Singaporean' WHERE [Traveler nationality] LIKE '%Singapore%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Spanish' WHERE [Traveler nationality] LIKE '%Spain%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Taiwanese' WHERE [Traveler nationality] LIKE '%Taiwan%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'British' WHERE [Traveler nationality] LIKE '%UK%' or [Traveler nationality] LIKE '%United KIngdom%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'Emirati' WHERE [Traveler nationality] LIKE '%Arab%'
UPDATE ['Travel details dataset$'] SET [Traveler nationality] = 'American' WHERE [Traveler nationality] LIKE '%USA%'

--Standardizing Transportation types

UPDATE ['Travel details dataset$']SET [Transportation type] = 'Flight' WHERE [Transportation type] LIKE '%Plane%' 

--Creating an Age Range

ALTER TABLE ['Travel details dataset$']
	ADD Age_Range CHAR(250)

UPDATE ['Travel details dataset$']SET Age_Range = '20s' WHERE [Traveler Age] BETWEEN 20 AND 29
UPDATE ['Travel details dataset$']SET Age_Range = '30s' WHERE [Traveler Age] BETWEEN 30 AND 39
UPDATE ['Travel details dataset$']SET Age_Range = '40s' WHERE [Traveler Age] BETWEEN 40 AND 49
UPDATE ['Travel details dataset$']SET Age_Range = '50s' WHERE [Traveler Age] BETWEEN 50 AND 59
UPDATE ['Travel details dataset$']SET Age_Range = '60s' WHERE [Traveler Age] BETWEEN 60 AND 69

--Creating a month column

ALTER TABLE ['Travel details dataset$']
	ADD Month CHAR(250)

UPDATE ['Travel details dataset$'] SET Month = 'January' WHERE [Start date] LIKE '1/%'
UPDATE ['Travel details dataset$'] SET Month = 'February' WHERE [Start date] LIKE '2/%'
UPDATE ['Travel details dataset$'] SET Month = 'March' WHERE [Start date] LIKE '3/%'
UPDATE ['Travel details dataset$'] SET Month = 'April' WHERE [Start date] LIKE '4/%'
UPDATE ['Travel details dataset$'] SET Month = 'May' WHERE [Start date] LIKE '5/%'
UPDATE ['Travel details dataset$'] SET Month = 'June' WHERE [Start date] LIKE '6/%'
UPDATE ['Travel details dataset$'] SET Month = 'July' WHERE [Start date] LIKE '7/%'
UPDATE ['Travel details dataset$'] SET Month = 'August' WHERE [Start date] LIKE '8/%'
UPDATE ['Travel details dataset$'] SET Month = 'September' WHERE [Start date] LIKE '9/%'
UPDATE ['Travel details dataset$'] SET Month = 'October' WHERE [Start date] LIKE '10/%'
UPDATE ['Travel details dataset$'] SET Month = 'November' WHERE [Start date] LIKE '11/%'
UPDATE ['Travel details dataset$'] SET Month = 'December' WHERE [Start date] LIKE '12/%'
