SELECT galleries.name, images.name 
FROM images 
JOIN galleries 
	ON images.gallery_id = gallery_id
WHERE images.name ILIKE '%space%';