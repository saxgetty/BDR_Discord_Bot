-- Script name: tests.sql
-- Author:      Samantha Saxton-Getty
-- Purpose:     insert sample data to test the integrity of this database system

-- the database used to insert the data into.
USE blogManagementDB;

-- 1. Testing Comment Table
DELETE FROM Comment WHERE content = 'I agree with this.';
UPDATE Comment SET comment_id = 4 WHERE content = 'I really like the content of this blog.';

-- 2. Testing Like Table
DELETE FROM `Like` WHERE type = 'Thumbs Down';
UPDATE `Like` SET like_id = 4 WHERE type = 'Thumbs Up';

-- 3. Testing Contains Table
DELETE FROM Contains WHERE contains_id = 3;
UPDATE Contains SET contains_id = 4 WHERE contains_id = 2;

-- 4. Testing Demographic Table
DELETE FROM Demographic WHERE gender = 'Female';
UPDATE Demographic SET demographic_id = 4 WHERE gender = 'Non-Binary';

-- 5. Testing Shares Table
DELETE FROM Shares WHERE shares_id = 3;
UPDATE Shares SET shares_id = 4 WHERE shares_id = 2;

-- 6. Testing Friends Table
DELETE FROM Friends WHERE full_name = 'Jim Gam';
UPDATE Friends SET friends_id = 4 WHERE full_name = 'Shereya Town';

-- 7. Testing Allows Table
DELETE FROM Allows WHERE allows_id = 3;
UPDATE Allows SET allows_id = 4 WHERE allows_id = 2;

-- 8. Testing Permission Table
DELETE FROM Permission WHERE description = 'Entry';
UPDATE Permission SET permission_id = 4 WHERE description = 'Intermediate';

-- 9. Testing Communicates Table
DELETE FROM Communicates WHERE communicates_id = 3;
UPDATE Communicates SET communicates_id = 4 WHERE communicates_id = 2;

-- 10. Testing Server Table
DELETE FROM Server WHERE location = 'Denver';
UPDATE Server SET server_id = 4 WHERE location = 'New York';

-- 11. Testing Streams Table
DELETE FROM Streams WHERE streams_id = 3;
UPDATE Streams SET streams_id = 4 WHERE streams_id = 2;

-- 12. Testing Host Table
DELETE FROM Host WHERE name = 'Secure';
UPDATE Host SET host_id = 4 WHERE name = 'Administrator';

-- 13. Testing Connects Table
DELETE FROM Connects WHERE connect_id = 3;
UPDATE Connects SET connect_id = 4 WHERE connect_id = 2;

-- 14. Testing URL Table
DELETE FROM URL WHERE link = 'www.blogdatabaserepository.gov';
UPDATE URL SET url_id = 4 WHERE link = 'www.blogdatabaserepository.com';

-- 15. Testing General Free User Table
DELETE FROM `General Free User` WHERE num_months_subscribed = 5;
UPDATE `General Free User` SET general_free_user_id = 4 WHERE num_months_subscribed = 10;

-- 16. Testing General Paid User Table
DELETE FROM `General Paid User` WHERE num_months_subscribed = 32;
UPDATE `General Paid User` SET general_paid_user_id = 4 WHERE num_months_subscribed = 3;

-- 17. Testing Blog Free User Table
DELETE FROM `Blog Free User` WHERE num_months_subscribed = 2;
UPDATE `Blog Free User` SET blog_free_user_id = 4 WHERE num_months_subscribed = 13;

-- 18. Testing Blog Paid User Table
DELETE FROM `Blog Paid User` WHERE num_months_subscribed = 23;
UPDATE `Blog Paid User` SET blog_paid_user_id = 4 WHERE num_months_subscribed = 3;

-- 19. Testing Options Table
DELETE FROM `Options` WHERE theme = 'Dark Theme';
UPDATE `Options` SET options_id = 4 WHERE theme = 'Bright Theme';

-- 20. Testing Account Table
DELETE FROM Account WHERE password = 'adwaaers';
UPDATE Account SET account_id = 4 WHERE password = 'awdhrsy^&*';

-- 21. Testing Hosts Table
DELETE FROM Hosts WHERE hosts_id = 2;
UPDATE Hosts SET hosts_id = 4 WHERE hosts_id = 1;

-- 22. Testing Works With Table
DELETE FROM `Works With` WHERE works_with_id = 2;
UPDATE `Works With` SET works_with_id = 4 WHERE works_with_id = 1;

-- 23. Testing Files Table
DELETE FROM Files WHERE files_id = 2;
UPDATE Files SET files_id = 4 WHERE files_id = 1;

-- 24. Testing Ticket Table
DELETE FROM Ticket WHERE ticket_id = 2;
UPDATE Ticket SET ticket_id = 4 WHERE ticket_id = 1;

-- 25. Testing User Ticket File Table
DELETE FROM `User Ticket File` WHERE description = 'I am having issues with logging into my account.';
UPDATE `User Ticket File` SET user_ticket_file_id = 4 WHERE description = 'This button will not work on this browser.';

-- 26. Testing Advertisements Table
DELETE FROM Advertisements WHERE body = 'awdadddddddddddddgsrgrsgsdrgsedcas';
UPDATE Advertisements SET advertisements_id = 4 WHERE body = 'Awdiawjnlkfgnsjlngjrndsgnrusuinosefsoe';

-- 27. Testing Administrator Table
DELETE FROM Administrator WHERE full_name = 'Henry Jones';
UPDATE Administrator SET administrator_id = 4 WHERE full_name = 'John Stank';

-- 28. Testing Phone Table
DELETE FROM Phone WHERE model = 'G647028';
UPDATE Phone SET phone_id = 4 WHERE model = 'K812083';

-- 29. Testing Tablet Table
DELETE FROM Tablet WHERE model = 'SMT585';
UPDATE Tablet SET tablet_id = 4 WHERE model = 'GTM479';

-- 30. Testing Computer Table
DELETE FROM Computer WHERE model = 'D737855';
UPDATE Computer SET computer_id = 4 WHERE model = 'E456486';

-- 31. Testing Technology Table
DELETE FROM Technology WHERE type = 'Microsoft';
UPDATE Technology SET technology_id = 4 WHERE type = 'Android';

-- 32. Testing News Table
DELETE FROM News WHERE title = 'Breaking News, it is Important to Hydrate your Homies.';
UPDATE News SET news_id = 4 WHERE title = 'Pop Sockets are OUT OF CONTROL!';

-- 33. Testing Provides Table
DELETE FROM Provides WHERE provides_id = 3;
UPDATE Provides SET provides_id = 4 WHERE provides_id = 2;

-- 34. Testing Create Post Table
DELETE FROM `Create Post` WHERE create_post_id = 3;
UPDATE `Create Post` SET create_post_id = 4 WHERE create_post_id = 2;

-- 35. Testing Blog Post Table
DELETE FROM `Blog Post` WHERE blog_post_id = 3;
UPDATE `Blog Post` SET blog_post_id = 4 WHERE blog_post_id = 2;

-- 36. Testing Blog Category Table
DELETE FROM `Blog Category` WHERE blog_category_id = 3;
UPDATE `Blog Category` SET blog_category_id = 4 WHERE blog_category_id = 2;

-- 37. Testing Create Blog Table
DELETE FROM `Create Blog` WHERE create_blog_id = 3;
UPDATE `Create Blog` SET create_blog_id = 4 WHERE create_blog_id = 2;

-- 38. Testing Stores Table
DELETE FROM `Stores` WHERE stores_id = 3;
UPDATE `Stores` SET stores_id = 4 WHERE stores_id = 2;

-- 39. Testing Blog Table
DELETE FROM Blog WHERE blog_name = 'Funky & Groovy';
UPDATE Blog SET blog_id = 4 WHERE blog_name = 'My Weightloss';

-- 40. Testing Post Table
DELETE FROM Post WHERE body = 'This is so cute, omg!';
UPDATE Post SET post_id = 4 WHERE body = 'I think this blog is pretty awesome, keep it up.';

-- 41. Testing Look Up Table
DELETE FROM `Look Up` WHERE type = 'Search';
UPDATE `Look Up` SET look_up_id = 4 WHERE type = 'Suggested';

-- 42. Testing Category Table
DELETE FROM Category WHERE type = 'Video Gaming';
UPDATE Category SET category_id = 4 WHERE type = 'Fitness';

-- 43. Testing Interacts Table
DELETE FROM Interacts WHERE interacts_id = 3;
UPDATE Interacts SET interacts_id = 4 WHERE interacts_id = 1;

-- 44. Testing Users Table
DELETE FROM Users WHERE last_name = 'Storm';
UPDATE Users SET users_id = 4 WHERE last_name = 'Yoddle';

-- 45. Testing Manages Table
DELETE FROM Manages WHERE manages_id = 2;
UPDATE Manages SET manages_id = 4 WHERE manages_id = 1;

-- 46. Testing Is Ran On Table
DELETE FROM `Is Ran On` WHERE is_ran_on_id = 3;
UPDATE `Is Ran On` SET is_ran_on_id = 4 WHERE is_ran_on_id = 1;

-- 47. Testing Product Table
DELETE FROM Product WHERE full_name = 'Blog Database Repository';
UPDATE Product SET product_id = 4 WHERE full_name = 'Blogmart';