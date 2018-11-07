# display first and last name from join page
SELECT first_name, last_name FROM assign04.join;

# display success_stories from home
SELECT success_stories FROM assign04.home;

# display the email used for the contact page
SELECT contact_email FROM assign04.contact;

# display the members that are joined and able to login
SELECT * from assign04.join j
inner join assign04.login_update l
on j.member_id = l.join_member_id;

# display the members whose name's are "Nick"
SELECT * FROM assign04.join
WHERE first_name IN
(SELECT * FROM assign04.join WHERE first_name = 'Nick')