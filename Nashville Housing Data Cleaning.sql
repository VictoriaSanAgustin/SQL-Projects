--CLEANING DATA IN SQL


--STANDARDIZE SALE DATE

SELECT SaleDate, CONVERT(DATE,SaleDate)
FROM Housing

ALTER TABLE Housing
ADD SaleDateConverted Date

UPDATE Housing
SET SaleDateConverted = CONVERT(DATE,SaleDate)

SELECT SaleDate, SaleDateConverted
FROM Housing

--POPULATE PROPERTY ADDRESS WITH SELF JOIN

SELECT A.ParcelID, A.PropertyAddress, B.ParcelID, B.PropertyAddress, ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM Housing A
JOIN Housing B
	ON A.ParcelID = B.ParcelID
	AND A.[UniqueID ] <> B.[UniqueID ]
WHERE A.PropertyAddress IS NULL

UPDATE A
SET PropertyAddress = ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM Housing A
JOIN Housing B
	ON A.ParcelID = B.ParcelID
	AND A.[UniqueID ] <> B.[UniqueID ]

--BREAKING OUT ADDRESS INTO INDIVIDUAL COLUMNS

SELECT PropertyAddress
FROM Housing

SELECT PropertyAddress,
SUBSTRING(PropertyAddress, 1, CHARINDEX((','), PropertyAddress) -1) AS Address,
SUBSTRING(PropertyAddress, CHARINDEX((','), PropertyAddress) +1, len(PropertyAddress)) as City
FROM Housing

ALTER TABLE HOUSING
ADD PropertySplitAddress NVARCHAR (255)

UPDATE Housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX((','), PropertyAddress) -1)


ALTER TABLE HOUSING
ADD PropertySplitCity NVARCHAR (255)

UPDATE Housing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX((','), PropertyAddress) +1, len(PropertyAddress))

SELECT PropertyAddress, PropertySplitAddress, PropertySplitCity
FROM Housing



SELECT
PARSENAME(REPLACE(OwnerAddress,',','.'), 3),
PARSENAME(REPLACE(OwnerAddress,',','.'), 2),
PARSENAME(REPLACE(OwnerAddress,',','.'), 1)
FROM HOUSING


ALTER TABLE HOUSING
ADD OwnerSplitAddress NVARCHAR (255)

UPDATE Housing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',','.'), 3)
	
ALTER TABLE HOUSING
ADD OwnerSplitCity NVARCHAR (255)

UPDATE Housing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',','.'), 2)

ALTER TABLE HOUSING
ADD OwnerSplitState NVARCHAR (255)

UPDATE Housing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',','.'), 1)

SELECT OwnerAddress, OwnerSplitAddress, OwnerSplitCity, OwnerSplitState
FROM Housing


--CHANGE Y AND N INTO YES AND NO

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM Housing
GROUP BY (SoldAsVacant)
ORDER BY 2


SELECT SoldAsVacant,
CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END
FROM Housing

UPDATE Housing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END

--REMOVE DUPLICATES

WITH ROWNUMCTE AS (
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY PARCELID, 
				PROPERTYADDRESS,
				SALEPRICE,
				SALEDATE,
				LEGALREFERENCE
				ORDER BY UNIQUEID)
				ROW_NUM
FROM Housing
)

DELETE
FROM ROWNUMCTE
WHERE ROW_NUM > 1


--DELETE UNUSED COLUMNS

ALTER TABLE HOUSING
DROP COLUMN PROPERTYADDRESS, OWNERADDRESS, TAXDISTRICT, SALEDATE

SELECT*
FROM Housing