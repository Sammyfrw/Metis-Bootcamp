SELECT galleries.name, COUNT(images.id)
FROM galleries 
JOIN images
	on images.gallery_id = galleries.id
GROUP BY galleries.id
ORDER BY COUNT(images.id) DESC
LIMIT 1