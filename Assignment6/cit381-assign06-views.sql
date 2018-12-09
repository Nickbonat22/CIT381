DROP VIEW IF EXISTS getAuthors;
CREATE VIEW getTextColor AS
SELECT
	CONCAT(assign06.media_only.link_flair_text_color,
			IF(assign06.media_only.link_flair_text_color IS NOT NULL,
				CONCAT(', ', assign06.media_only.subreddit_subreddit_name_prefixed),)''),
				'')) AS 'FTextColor'
FROM
	assign06.subreddit s
		INNER JOIN
	assign06.media_only m ON s.subreddit_name_prefixed = m.subreddit_subreddit_name_prefixed

DROP VIEW IF EXISTS getUsers;
CREATE VIEW getUsers AS
SELECT
	CONCAT(assign06.users.user_id,
			IF(assign06.users.user_id IS NOT NULL,
				CONCAT(', ', assign06.users.user_id),)''),
			IF(assign06.users.author) IS NOT NULL,
				CONCAT(' ', assign06.users.author),
				'')) AS 'ID/Users'
FROM
	assign06.users



