SELECT galleries.id, AVG(images.likes)
FROM galleries
JOIN images
ON galleries.id = images.gallery_id
GROUP BY galleries.id;