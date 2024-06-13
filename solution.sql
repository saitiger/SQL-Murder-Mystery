select * from crime_scene_report where city = 'SQL City' and date = '20180115'

-- From the footage we gather that there were two witness, someone that lives on
-- the last house on Northwestern Dr and Annabel from Franklin Ave

select * from person where address_street_name = 'Northwestern Dr' order by address_number desc

-- Assuming that address_number represents the house number then the last house belongs 
-- to Morty Schapiro with id 14887 and ssn 111564949

select * from person where address_street_name = 'Franklin Ave' and name like '%annabel%'

-- The other witness is Annabel Miller with id 16371 and ssn 318771143

select * from interview where person_id = '16371' or person_id = '14887'

-- Morty --> Man(Male), Get Fit Now Gym Bag, Membership number starts with 48Z, Gold member. 
-- Car plate includes H42W

-- Annabel --> Saw in gym on January 9th

select * from get_fit_now_member where membership_status = 'gold' and id like '48Z%'

-- Can be either Joe Germuska (48Z7A) or Jeremy Bowers (48Z55)
-- Cross verify with January 9th check-in

select * from get_fit_now_check_in where check_in_date = '20180109' and membership_id like '48Z%'

-- Both Checked-in on Jan 9th need to check the drivers license

select * from person where name = 'Joe Germuska' or name = 'Jeremy Bowers'

-- Joe Germuska 28819 138909730 Fisk Rd	license id --> 173289
-- Jeremy Bowers 67318 871539279 Washington Pl, Apt 3A license id --> 423327

select * from drivers_license where id = '423327'
select * from drivers_license where plate_number like '%H42W%'

-- id 423327 age 30  
-- Killer is Jeremy Bowers based on the evidence

select * from person where name = 'Jeremy Bowers'

-- id --> 67318 ssn --> 871539279

select * from interview where person_id = '67318'

-- I was hired by a woman with a lot of money. I don't know her name 
-- but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and 
-- she drives a Tesla Model S. I know that she attended the 
-- SQL Symphony Concert 3 times in December 2017.

select person_id from facebook_event_checkin where event_name = 'SQL Symphony Concert' and date like '201712%' group by 1 having count(*)=3

-- person_id = 24556 and 99716 attended the concert thrice 

select * from person where id = 24556 or id = 99716 
-- To get the ssn for the given person id

-- ssn = 816663882 Bryan Pardo 
-- and 
-- ssn = 987756388 Miranda Priestly 
-- Based on the information it looks like Miranda is the person behind the murder
-- since Bryan sounds a name for a Male. But still need to validate the other 
-- information based on the killer's interview

select * from drivers_license where car_make = 'Tesla' and car_model = 'Model S' and gender = 'female'

-- 202298
-- 291182
-- 918773

-- Based on the height information and hair color these are the three probable convicts.

select * from person where license_id = 202298 or license_id = 291182 or license_id = 918773

-- Miranda Priestly (ssn 987756388) is the common name that comes up again but for one last verification we can check the income to confirm 100%

select * from income where ssn = 987756388
 
-- Her annual income is 310000 which can be considered to be a lot of money.
