SELECT galleries.name, COUNT(images.id)
--(images.name ILIKE '%sushi%') 
FROM images
JOIN galleries
	on galleries.id = images.gallery_id
WHERE images.name ILIKE '%sushi%'
GROUP BY galleries.id

-- galleries.name
-- 1GROUP_BY galleries.name