#1

SELECT * from person p
inner join family fam
on p.person_id = fam.person_id;

#A query to list all persons with family relationships using joins between person, family and relationship

#2

SELECT * from person p
inner join friend f
on p.person_id = f.person_id;

#A query to list all persons with friendship relationships using joins between person, friend and relationship

#3

SELECT * FROM assignment2.person
left join friend f
on p.person_id = f.person_id;

#A query to list all person, with or without a relationship of any kind, and any family relationships (hint: left join)
