-- Extended list of MySQL Queries
-- Samantha Saxton-Getty

-- RULE 1
-- Find the number of advertisements that tier X (ex: 1) administrators have hosted.
-- This is intended to be flexible inputs and is in Replit, however, for local test purposes I used hardcoded data.
SELECT 
COUNT(CASE WHEN advertisements_id THEN 1 ELSE NULL END) 
FROM 
    Hosts
        INNER JOIN 
    Administrator ON Administrator.administrator_id = Hosts.administrator_id
WHERE Administrator.Tier = 1;

-- RULE 2
-- For one user, find the number of comments and likes they have made.
-- This is intended to be flexible inputs and is in Replit, however, for local test purposes I used hardcoded data.
SELECT 
COUNT(DISTINCT co.comment_id) AS CommentCount
,COUNT(DISTINCT l.like_id) AS LikeCount
FROM Users u
LEFT JOIN `Comment` co ON co.users_id = u.users_id
LEFT JOIN `Like` l ON l.users_id = u.users_id
WHERE u.first_name LIKE ('%Eldridge%') AND u.last_name LIKE('%Yungberry%');

-- RULE 3
-- Find the number of General Free User accounts that have created at least X (ex: 1) post(s).
-- This is intended to be flexible inputs and is in Replit, however, for local test purposes I used hardcoded data.
SELECT
COUNT(general_free_user_id) AS gfuCount
FROM Users u
JOIN `Create Post` cp ON cp.users_id = u.users_id
JOIN (SELECT COUNT(post_id) AS PostCount, post_id FROM Post GROUP BY post_id) p ON p.post_id = cp.post_id AND p.PostCount >= 1 
JOIN Account a ON a.users_id = u.users_id
JOIN `General Free User` gfu ON gfu.account_id = a.account_id;

-- RULE 4
-- For each technology, find the number of uses for each type (phone, computer, tablet).
SELECT 
COUNT(DISTINCT c.computer_id) AS ComputerCount
,COUNT(DISTINCT p.phone_id) AS PhoneCount
,COUNT(DISTINCT ta.tablet_id) AS TabletCount
FROM Technology t
LEFT JOIN Computer c on c.technology_id = t.technology_id
LEFT JOIN Phone p on p.technology_id = t.technology_id
LEFT JOIN Tablet ta on ta.technology_id = t.technology_id;

-- RULE 5
-- Find the total user ticket files that are created before DATE (ex: 2021-11-07).
-- This is intended to be flexible inputs and is in Replit, however, for local test purposes I used hardcoded data.
SELECT
COUNT(DISTINCT user_ticket_file_id) AS UserTicketCount
FROM `User Ticket File` u
WHERE u.date_created < '2021-11-01';

-- RULE 6
-- Find the most purchased account option after X (ex: 2) month(s) subscribed.
-- This is intended to be flexible inputs and is in Replit, however, for local test purposes I used hardcoded data.
SELECT 
COUNT(DISTINCT gf.general_free_user_id) AS GenFreeCount
,COUNT(DISTINCT gp.general_paid_user_id) AS GenPaidCount
,COUNT(DISTINCT bf.blog_free_user_id) AS BlogFreeCount
,COUNT(DISTINCT bp.blog_paid_user_id) AS BlogPaidCount
FROM Account a
LEFT JOIN `General Free User` gf ON gf.account_id = a.account_id AND gf.num_months_subscribed > 2
LEFT JOIN `General Paid User` gp ON gp.account_id = a.account_id AND gp.num_months_subscribed > 2
LEFT JOIN `Blog Free User` bf ON bf.account_id = a.account_id AND bf.num_months_subscribed > 2
LEFT JOIN `Blog Paid User` bp ON bp.account_id = a.account_id AND bp.num_months_subscribed > 2;

-- RULE 7
-- Find the number of distinct Look Ups stored by a Blog Paid User with a subscription longer than X month(s) (ex: 8) and a category look up count larger than X (ex: 10).
-- This is intended to be flexible inputs and is in Replit, however, for local test purposes I used hardcoded data.
SELECT
COUNT(DISTINCT lu.look_up_id) AS LookUpCount
FROM Users u
JOIN `Create Blog` cb ON cb.users_id = u.users_id
JOIN Blog b ON b.blog_id = cb.blog_id
JOIN `Blog Category` bc ON bc.blog_id = b.blog_id
JOIN Category c ON c.category_id = bc.category_id
JOIN Stores s ON s.category_id = c.category_id
JOIN `Look Up` lu ON lu.look_up_id = s.look_up_id
JOIN `Account` a ON a.users_id = u.users_id
JOIN `Blog Paid User` bpu ON bpu.account_id = a.account_id 
WHERE lu.count >= 10 AND bpu.num_months_subscribed >= 8;

-- RULE 8
-- For each demographic age X (ex: 18) and above, find the tier of permission total.
-- This is intended to be flexible inputs and is in Replit, however, for local test purposes I used hardcoded data.
SELECT 
COUNT(CASE WHEN p.tier = 1 THEN 1 ELSE NULL END) AS TierOne
,COUNT(CASE WHEN p.tier = 2 THEN 1 ELSE NULL END) AS TierTwo
,COUNT(CASE WHEN p.tier = 3 THEN 1 ELSE NULL END) AS TierThree
FROM Users u
LEFT JOIN `Contains` c ON c.users_id = u.users_id
LEFT JOIN Demographic d ON d.demographic_id = c.demographic_id
LEFT JOIN `Allows` a ON a.users_id = u.users_id
LEFT JOIN Permission p ON p.permission_id = a.permission_id
WHERE d.age >= 18;