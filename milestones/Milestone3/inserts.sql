-- Script name: inserts.sql
-- Author:      Samantha Saxton-Getty
-- Purpose:     insert sample data to test the integrity of this database system

-- the database used to insert the data into.
USE blogManagementDB;

-- Administrator table inserts
DELETE FROM Administrator;
INSERT INTO Administrator (administrator_id, tier, full_name) 
VALUES 
(1, 1, 'Janice Mack'), 
(2, 2, 'John Stank'), 
(3, 3, 'Henry Jones'),
(4, 1, 'James Jones'),
(5, 1, 'Leslia Lames'),
(6, 3, 'Rebecca Thomas');

-- Advertisements table inserts
DELETE FROM Advertisements;
INSERT INTO Advertisements (advertisements_id, title, body) 
VALUES 
(1, 'Type about yourself!', 'Awdiawjnlkfgnsjlngjrndsgnrusuinosefsoe'), 
(2, 'FREE BLOGS HERE', 'awdadddddddddddddgsrgrsgsdrgsedcas'), 
(3, 'SIGN UP NOW!', 'uihfguierhnagkihjternhjgbntrpr'),
(4, 'We would love to hear about you!', 'afawefwa'),
(5, 'Join us now and get $30 off.', 'hrsthr'),
(6, 'FREE POSTS TODAY!', 'wuiahndjaw');

-- Hosts table inserts
DELETE FROM Hosts;
INSERT INTO Hosts (hosts_id, advertisements_id, administrator_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- Product table inserts
DELETE FROM Product;
INSERT INTO Product (product_id, date_created, full_name) 
VALUES 
(1, '2021-11-01', 'Blog Database Repository'), 
(2, '2019-06-14', 'Blogmart'), 
(3, '2020-10-20', 'Blogs R Us');

-- Manages table inserts
DELETE FROM Manages;
INSERT INTO Manages (manages_id, product_id, administrator_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Technology table inserts
DELETE FROM Technology;
INSERT INTO Technology (technology_id, age, type) 
VALUES 
(1, 10, 'Apple'), 
(2, 4, 'Microsoft'), 
(3, 16, 'Android');

-- Is Ran On table inserts
DELETE FROM `Is Ran On`;
INSERT INTO `Is Ran On` (is_ran_on_id, product_id, technology_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Computer table inserts
DELETE FROM Computer;
INSERT INTO Computer (computer_id, make, model, technology_id) 
VALUES 
(1, 'Acer', 'D737855', 1), 
(2, 'Apple', 'E456486', 2), 
(3, 'Dell', 'F721901', 3),
(4, 'Dell', 'F270123', 3);

-- Tablet table inserts
DELETE FROM Tablet;
INSERT INTO Tablet (tablet_id, make, model, technology_id) 
VALUES 
(1, 'Ipad Pro', 'SMT585', 1), 
(2, 'Ipad Air', 'GTM479', 2), 
(3, 'Ipad Mini', 'HTY675', 3);

-- Phone table inserts
DELETE FROM Phone;
INSERT INTO Phone (phone_id, make, model, technology_id) 
VALUES 
(1, 'Iphone 11', 'G647028', 1), 
(2, 'Iphone 10R', 'K812083', 2), 
(3, 'Iphone 12 Pro Max', 'Y765387', 2),
(4, 'Iphone 8 Pro', 'G879512', 1),
(5, 'Iphone 7', 'H789564', 1);

-- News table inserts
DELETE FROM News;
INSERT INTO News (news_id, title, body) 
VALUES 
(1, 'Breaking News, it is Important to Hydrate your Homies.', 'This just in, the team from the Socal region has reported after vigorous amounts of research that we must hydrate our homies.'), 
(2, 'Pop Sockets are OUT OF CONTROL!', 'This new trend of using pop sockets is a SHAM. They fall off my phone.'), 
(3, 'Apples are banned.', 'Would you believe it, the U.S.A has just mandated a country wide ban on Apples, ranging for all types of Apples.');

-- Provides table inserts
DELETE FROM Provides;
INSERT INTO Provides (provides_id, product_id, news_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Users table inserts
DELETE FROM Users;
INSERT INTO Users (users_id, first_name, last_name) 
VALUES 
(1, 'Joe', 'Storm'), 
(2, 'Henry', 'Yoddle'), 
(3, 'Eldridge', 'Yungberry'),
(4, 'Johannas', 'Cream');

-- Interacts table inserts
DELETE FROM Interacts;
INSERT INTO Interacts (interacts_id, product_id, users_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- User Ticket File table inserts
DELETE FROM `User Ticket File`;
INSERT INTO `User Ticket File` (user_ticket_file_id, date_created, description) 
VALUES 
(1, '2020-10-05', 'I am having issues with logging into my account.'), 
(2, '2021-06-02', 'How do I change my settings?'), 
(3, '2021-11-01', 'This button will not work on this browser.');

-- Ticket table inserts
DELETE FROM Ticket;
INSERT INTO Ticket (ticket_id, administrator_id, users_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Files table inserts
DELETE FROM Files;
INSERT INTO Files (files_id, ticket_id, user_ticket_file_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- URL table inserts
DELETE FROM URL ;
INSERT INTO URL  (url_id, type, link) 
VALUES 
(1, 'com', 'www.blogdatabaserepository.com'), 
(2, 'org', 'www.blogdatabaserepository.org'), 
(3, 'gov', 'www.blogdatabaserepository.gov');

-- Connects table inserts
DELETE FROM Connects;
INSERT INTO Connects (connect_id, product_id, url_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Server table inserts
DELETE FROM Server;
INSERT INTO Server (server_id, name, location) 
VALUES 
(1, 'Secure', 'New York'), 
(2, 'Guest', 'Los Angeles'), 
(3, 'Administrator', 'Denver');

-- Host table inserts
DELETE FROM Host;
INSERT INTO Host (host_id, port, name) 
VALUES 
(1, 739, 'Secure'), 
(2, 336, 'Guest'), 
(3, 567, 'Administrator');

-- Communicates table inserts
DELETE FROM Communicates;
INSERT INTO Communicates (communicates_id, host_id, server_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Streams table inserts
DELETE FROM Streams;
INSERT INTO Streams (streams_id, product_id, host_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Permission table inserts
DELETE FROM Permission;
INSERT INTO Permission (permission_id, tier, description) 
VALUES 
(1, 1, 'Entry'), 
(2, 2, 'Intermediate'), 
(3, 3, 'Advanced');

-- Allows table inserts
DELETE FROM Allows;
INSERT INTO Allows (allows_id, users_id, permission_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3),
(4, 4, 3);

-- Friends table inserts
DELETE FROM Friends;
INSERT INTO Friends (friends_id, age, full_name) 
VALUES 
(1, 25, 'Jim Gam'), 
(2, 35, 'Esther Ripe'), 
(3, 19, 'Shereya Town');

-- Shares table inserts
DELETE FROM Shares;
INSERT INTO Shares (shares_id, users_id, friends_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Demographic table inserts
DELETE FROM Demographic;
INSERT INTO Demographic (demographic_id, age, gender) 
VALUES 
(1, 66, 'Female'), 
(2, 42, 'Male'), 
(3, 26, 'Non-Binary'),
(4, 18, 'No Answer');

-- Contains table inserts
DELETE FROM Contains;
INSERT INTO Contains (contains_id, users_id, demographic_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3),
(4, 4, 4);

-- Comment table inserts
DELETE FROM Comment;
INSERT INTO Comment (comment_id, date_created, content, users_id) 
VALUES 
(1, '2021-10-13', 'This blog sucks!', 1), 
(2, '2021-05-20', 'I really like the content of this blog.', 2), 
(3, '2021-03-02', 'I agree with this.', 3),
(4, '2021-06-11', 'This is a great take.', 3);

-- Like table inserts
DELETE FROM `Like`;
INSERT INTO `Like` (like_id, count, type, users_id) 
VALUES 
(1, 3, 'Thumbs Neutral', 1), 
(2, 40, 'Thumbs Down', 2), 
(3, 150, 'Thumbs Up', 3);

-- Account table inserts
DELETE FROM Account;
INSERT INTO Account (account_id, username, password, users_id) 
VALUES 
(1, 'johnny5', 'awdhrsy^&*', 1), 
(2, 'swamisami', 'wdage$^', 2), 
(3, 'carrotstick2', 'adwaaers', 3),
(4, 'jcream78', 'aiuojnf37!', 4);

-- General Free User table inserts
DELETE FROM `General Free User`;
INSERT INTO `General Free User` (general_free_user_id, subscription_length, num_months_subscribed, account_id) 
VALUES 
(1, 6, 5, 1), 
(2, 12, 10, 2), 
(3, 18, 22, 3),
(4, 6, 54, 4);

-- General Paid User table inserts
DELETE FROM `General Paid User`;
INSERT INTO `General Paid User` (general_paid_user_id, subscription_length, num_months_subscribed, account_id) 
VALUES 
(1, 6, 32, 1), 
(2, 12, 11, 2), 
(3, 18, 3, 3);

-- General Free User table inserts
DELETE FROM `Blog Free User`;
INSERT INTO `Blog Free User` (blog_free_user_id, subscription_length, num_months_subscribed, account_id) 
VALUES 
(1, 6, 34, 1), 
(2, 12, 2, 2), 
(3, 18, 13, 3);

-- Blog Paid User table inserts
DELETE FROM `Blog Paid User`;
INSERT INTO `Blog Paid User` (blog_paid_user_id, subscription_length, num_months_subscribed, account_id) 
VALUES 
(1, 6, 1, 1), 
(2, 12, 23, 2), 
(3, 18, 3, 2),
(4, 12, 12, 1),
(5, 6, 6, 3);

-- Options table inserts
DELETE FROM `Options`;
INSERT INTO `Options` (options_id, mode, theme, account_id) 
VALUES 
(1, 'Light Mode', 'Bright Theme', 1), 
(2, 'Dark Mode', 'Bright Theme', 2), 
(3, 'Inverted Mode', 'Dark Theme', 3);

-- Blog table inserts
DELETE FROM Blog;
INSERT INTO Blog (blog_id, date_created, blog_name) 
VALUES 
(1, '2021-06-25', 'Funky & Groovy'), 
(2, '2021-07-10', 'My Weightloss'), 
(3, '2021-10-02', 'How to Make Healthy Foods');

-- Post table inserts
DELETE FROM Post;
INSERT INTO Post (post_id, subject, body) 
VALUES 
(1, 'Love That For You', 'This is so cute, omg!'), 
(2, 'My take on this blog', 'I think this blog is pretty awesome, keep it up.'), 
(3, 'I approve!', 'I LOVE THIS!');

-- Category table inserts
DELETE FROM Category;
INSERT INTO Category (category_id, count, type) 
VALUES 
(1, 650, 'Video Gaming'), 
(2, 30, 'Movies'), 
(3, 245, 'Fitness');

-- Look Up table inserts
DELETE FROM `Look Up`;
INSERT INTO `Look Up` (look_up_id, count, type) 
VALUES 
(1, 45, 'Search'), 
(2, 100, 'Click'), 
(3, 23, 'Suggested');

-- Create Blog table inserts
DELETE FROM `Create Blog`;
INSERT INTO `Create Blog` (create_blog_id, users_id, blog_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Create Post table inserts
DELETE FROM `Create Post`;
INSERT INTO `Create Post` (create_post_id, users_id, post_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Blog Post table inserts
DELETE FROM `Blog Post`;
INSERT INTO `Blog Post` (blog_post_id, post_id, blog_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Blog Category table inserts
DELETE FROM `Blog Category`;
INSERT INTO `Blog Category` (blog_category_id, category_id, blog_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Stores table inserts
DELETE FROM Stores;
INSERT INTO Stores (stores_id, look_up_id, category_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

-- Works With table inserts
DELETE FROM `Works With`;
INSERT INTO `Works With` (works_with_id, administrator_1_id, administrator_2_id) 
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3);

CALL get_passwords();