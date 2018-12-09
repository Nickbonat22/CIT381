DELIMITER //
CREATE PROCEDURE imageInfo()
BEGIN 
SELECT width, height  FROM data
INNER JOIN  images ON join_condition;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE visitedSubreddits()
BEGIN 
SELECT visited FROM media_only
WHERE visited = 1;
END //
DELIMITER ;