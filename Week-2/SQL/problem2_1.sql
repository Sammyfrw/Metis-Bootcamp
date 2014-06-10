SELECT galleries.id, images.name
FROM galleries
JOIN images
	ON images.gallery_id = galleries.id
WHERE images.name ILIKE '%grumpy%';