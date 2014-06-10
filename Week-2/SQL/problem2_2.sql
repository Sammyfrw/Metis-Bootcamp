SELECT gallery.name, MIN(images.name)
FROM images
JOIN galleries 
	ON images.gallery_id = galleries.id
GROUP BY galleries.id