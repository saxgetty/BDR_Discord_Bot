# database.py
# Samantha Saxton-Getty
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import datetime
import os
import pymysql.cursors

db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']

prefix = "/"
lackingInputError = "You are missing an argument or more."
wrongDataError = "Please enter the right data format."
wrongDateError = "Incorrect date format. It should be YYYY-MM-DD, please try the command again."

def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except:
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

#
# This is a helper method to get the response from input and call the corresponding methods.
#
def get_response(msg):

  splitCommand = msg.split()

  #
  # This is the command for business rule # 1.
  #
  if prefix + "admin-advertisements" in msg:
    
    if 2 > len(splitCommand):

      response = lackingInputError

    else:

      # If the current index is a number, we want to pass it into the function call.
      if splitCommand[1].isnumeric():

        response = admin_advertisements(splitCommand[1])

      else:

        response = wrongDataError

  #
  # This is the command for business rule # 2.
  #
  elif prefix + "user-social" in msg:
    
      if 3 > len(splitCommand):

        response = lackingInputError
        
      else:
        
        response = user_social(splitCommand[1], splitCommand[2])

  #
  # This is the command for business rule # 3.
  #
  elif prefix + "account-post" in msg:

    if 2 > len(splitCommand):

      response = lackingInputError

    else:

      # If the current index is a number, we want to pass it into the function call.
      if splitCommand[1].isnumeric():

        response = account_post(splitCommand[1])

      else:

        response = wrongDataError
  #
  # This is the command for business rule # 4.
  #
  elif prefix + "technology" in msg:

    response = technology()

  #
  # This is the command for business rule # 5.
  #
  elif prefix + "user-ticket-files" in msg:

    if 2 > len(splitCommand):

      response = lackingInputError

    else:

      # If the current index is a number, we want to pass it into the function call.
      if validate_date(splitCommand[1]) == 0:

        response = wrongDateError

      else: 

        response = user_ticket_files(splitCommand[1])
  
  #
  # This is the command for business rule # 6.
  #
  elif prefix + "hot-account" in msg:

    if 2 > len(splitCommand):

      response = lackingInputError

    else:

      # If the current index is a number, we want to pass it into the function call.
      if splitCommand[1].isnumeric():

        response = hot_account(splitCommand[1])

      else:

        response = wrongDataError

  #
  # This is the command for business rule # 7.
  #
  elif prefix + "look-up" in msg:

    if 3 > len(splitCommand):

      response = lackingInputError

    else:

      # If the current index is a number, we want to pass it into the function call.
      if splitCommand[1].isnumeric() and splitCommand[2].isnumeric():

        response = look_up(splitCommand[1], splitCommand[2])

      else:

        response = wrongDataError
  
  #
  # This is the command for business rule # 8.
  #
  elif prefix + "permission" in msg:

    if 2 > len(splitCommand):

      response = lackingInputError

    else:

      # If the current index is a number, we want to pass it into the function call.
      if splitCommand[1].isnumeric():

        response = permission(splitCommand[1])
      
      else:

        response = wrongDataError
      
  #
  # This is the command to display the Business Requirements.
  #
  elif prefix + "business-requirements" in msg:

      response = """
      
      **__BUSINESS REQUIREMENTS__**

      **1.** Find the number of advertisements that tier X (ex: 1) administrators have hosted.
      **2.** For one user, find the number of comments and likes they have made.
      **3.** Find the number of General Free User accounts that have created at least X (ex: 1) post(s).
      **4.** For each technology, find the number of uses for each type (phone, computer, tablet).
      **5.** Find the total user ticket files that are created before DATE (ex: 2021-11-07).
      **6.** Find the most purchased account option after X (ex: 2) month(s) subscribed.
      **7.** Find the number of distinct Look Ups stored by a Blog Paid User with a subscription longer than X month(s) (ex: 8) and a category look up count larger than X (ex: 10).
      **8.** For each demographic age X (ex: 18) and above, find the tier of permission total.

      """

  #
  # This is the command to display the Commands.
  #
  elif prefix + "commands" in msg:

      response = """
      
      **__COMMANDS__**

      **1.** /admin-advertisements <Tier #>
          (e.g., /admin-advertisements 1)

      **2.** /user-social <First Name> <Last Name> 
          (e.g., /user-social Eldridge Yungberry)

      **3.** /account-post <Post # Amount>
          (e.g., /account-post 1)

      **4.** /technology

      **5.** /user-ticket-files <Date>
          (e.g., /user-ticket-files 2021-11-07)

      **6.** /hot-account <# Subscribed>
          (e.g., /hot-account 2)

      **7.** /look-up <# Count of Look Ups> <# Subscribed>
          (e.g., /look-up 10 8)

      **8.** /permission <Age #>
          (e.g., /permission 18)

      """

  return response

# This is a short helper method to help validate dates inputted to ensure they are 
# the proper date format for MySQL.
#
def validate_date(inputDate):

  try:

    datetime.datetime.strptime(inputDate, '%Y-%m-%d')
    
  except: 

    return 0

# BUSINESS REQUIREMENT # 1 
#
# Find the number of advertisements that tier X (ex: 1) administrators have hosted.
#
def admin_advertisements(index):

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """
    
      SELECT 
      COUNT(CASE WHEN advertisements_id THEN 1 ELSE NULL END) 
      FROM Hosts 
      INNER JOIN Administrator 
      ON Administrator.administrator_id = Hosts.administrator_id 
      WHERE Administrator.Tier = """ + str(index)

    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      count = row["COUNT(CASE WHEN advertisements_id THEN 1 ELSE NULL END)"]

    if count == 0 or count == 'NULL':

      response = "There have been no advertisements hosted by any administrators with the tier specified."

    else:

      response = "The total number of company advertisements that tier **" + str(index) + "** company administrators have hosted is **" + str(count) + "**."

    conn.close()
    return response

  else:
    
    conn.close()
    return "You are not connected to a database."

# BUSINESS REQUIREMENT # 2  
#
# For one user, find the number of comments and likes they have made.
#
def user_social(firstName, lastName):

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """

      SELECT 
      COUNT(DISTINCT co.comment_id) AS CommentCount
      ,COUNT(DISTINCT l.like_id) AS LikeCount
      FROM Users u
      LEFT JOIN `Comment` co ON co.users_id = u.users_id
      LEFT JOIN `Like` l ON l.users_id = u.users_id
      WHERE u.first_name LIKE ('%""" + firstName + "%') AND u.last_name LIKE('%" + lastName + "%')"

    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      commentCount = row["CommentCount"]
      likeCount = row["LikeCount"]

    if commentCount == 0 and likeCount == 0:

      response = "The user **" + firstName.capitalize() + " " + lastName.capitalize() + "** has no likes and comments yet or this user does not exist."

    else: 

      response = "The user **" + firstName.capitalize() + " " + lastName.capitalize() + "** has the following amount of likes and comments:\n\n" + "**Comments:** " + str(commentCount) + "\n**Likes:** " + str(likeCount)

    conn.close()
    return response

  else:

    conn.close()
    return "You are not connected to a database."

# BUSINESS REQUIREMENT # 3 
#
# Find the number of General Free User accounts that have created at least X (ex: 1) post(s).
#
def account_post(numPosts):

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """

    SELECT
    COUNT(general_free_user_id) AS gfuCount
    FROM Users u
    JOIN `Create Post` cp ON cp.users_id = u.users_id
    JOIN (SELECT COUNT(post_id) AS PostCount, post_id FROM Post GROUP BY post_id) p ON p.post_id = cp.post_id AND p.PostCount >= """ + str(numPosts) + "\nJOIN Account a ON a.users_id = u.users_id\nJOIN `General Free User` gfu ON gfu.account_id = a.account_id"
    
    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      gfuPostCount = row["gfuCount"]

    if gfuPostCount == 0:

      response = "There are no General Free User accounts with **" + str(numPosts) + "** post(s)."

    else: 

      response = "There are **" + str(gfuPostCount) + "** General Free User accounts with **" + str(numPosts) + "** post(s)."

    conn.close()
    return response

  else:

    conn.close()
    return "You are not connected to a database."

# BUSINESS REQUIREMENT # 4 
#
# For each technology, find the number of uses for each type (phone, computer, tablet).
#
def technology():

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """
    
    SELECT 
    COUNT(DISTINCT c.computer_id) AS ComputerCount
    ,COUNT(DISTINCT p.phone_id) AS PhoneCount
    ,COUNT(DISTINCT ta.tablet_id) AS TabletCount
    FROM Technology t
    LEFT JOIN Computer c on c.technology_id = t.technology_id
    LEFT JOIN Phone p on p.technology_id = t.technology_id
    LEFT JOIN Tablet ta on ta.technology_id = t.technology_id
      
    """

    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      computerCount = row["ComputerCount"]
      phoneCount = row["PhoneCount"]
      tabletCount = row["TabletCount"]

    if computerCount == 0 and phoneCount == 0 and tabletCount == 0:

      response = "There have been no uses for computers, phones, or tablets."

    else:

      response = "**User Technology Count:**\n"
      response = response + "\n**Computer:** " + str(computerCount)
      response = response + "\n**Phone:** " + str(phoneCount)
      response = response + "\n**Tablet:** " + str(tabletCount)  

    conn.close()  
    return response

  else:

    conn.close()
    return "You are not connected to a database."

# BUSINESS REQUIREMENT # 5 
#
# Find the total user ticket files that are created before DATE (ex: 2021-11-07).
#
def user_ticket_files(inputDate):

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """

    SELECT
    COUNT(DISTINCT user_ticket_file_id) AS UserTicketCount
    FROM `User Ticket File` u
    WHERE u.date_created < '""" + str(inputDate) + "'"

    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      count = row["UserTicketCount"]

    if count == 0 or count == 'NULL':

      response = "There are no user ticket files created before **" + str(inputDate) + "**."

    else:

      response = "The total user ticket files created before **" + str(inputDate) + "** is **" + str(count) + "**."

    conn.close()
    return response

  else:
    
    conn.close()
    return "You are not connected to a database."

# BUSINESS REQUIREMENT # 6 
#
# Find the most purchased account option after X (ex: 2) month(s) subscribed.
#
def hot_account(numMonths):

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """

    SELECT 
    COUNT(DISTINCT gf.general_free_user_id) AS GenFreeCount
    ,COUNT(DISTINCT gp.general_paid_user_id) AS GenPaidCount
    ,COUNT(DISTINCT bf.blog_free_user_id) AS BlogFreeCount
    ,COUNT(DISTINCT bp.blog_paid_user_id) AS BlogPaidCount
    FROM Account a
    LEFT JOIN `General Free User` gf ON gf.account_id = a.account_id AND gf.num_months_subscribed > """ + str(numMonths) + "\nLEFT JOIN `General Paid User` gp ON gp.account_id = a.account_id AND gp.num_months_subscribed > " + str(numMonths) + "\nLEFT JOIN `Blog Free User` bf ON bf.account_id = a.account_id AND bf.num_months_subscribed > " + str(numMonths) + "\nLEFT JOIN `Blog Paid User` bp ON bp.account_id = a.account_id AND bp.num_months_subscribed > " + str(numMonths) 

    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      genFreeCount = row["GenFreeCount"]
      genPaidCount = row["GenPaidCount"]
      blogFreeCount = row["BlogFreeCount"]
      blogPaidCount = row["BlogPaidCount"]
    
    if genFreeCount == 0 and genPaidCount == 0 and blogFreeCount == 0 and blogPaidCount == 0:

      response = "There are no accounts that have been subscribed longer than **" + str(numMonths) + "** months." 

    else:

      popularList = [genFreeCount, genPaidCount, blogFreeCount,  blogPaidCount]

      mostPopularNum = 0

      for numbers in popularList:

        if (mostPopularNum == 0 or numbers > mostPopularNum):

          mostPopularNum = numbers
          popularIndex = popularList.index(numbers)

      if popularIndex == 0:

        mostPopularAccount = "General Free User"
      
      elif popularIndex == 1:

        mostPopularAccount = "General Paid User"

      elif popularIndex == 2:

        mostPopularAccount = "Blog Free User"

      elif popularIndex == 3:

        mostPopularAccount = "Blog Paid User"

      response = "The most purchased account option after **" + str(numMonths) + "** month(s) subscribed is **" + str(mostPopularAccount) + "**."

    conn.close()
    return response
  
  else:

    conn.close()
    return "You are not connected to a database."

# BUSINESS REQUIREMENT # 7 
#
# Find the number of distinct Look Ups stored by a Blog Paid User with a subscription longer than X month(s) (ex: 8) and a category look up count larger than X (ex: 10).
#
def look_up(lookUpCount, monthsSubbed):

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """

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
    WHERE lu.count >= """ + str(lookUpCount) + "\nAND bpu.num_months_subscribed >= " + str(monthsSubbed)

    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      lookUpCount = row["LookUpCount"]

    if lookUpCount == 0:

      response = "There are no Blog Paid Users subscribed on or after **" + str(monthsSubbed) + "**. Therefore, there are no distinct category look ups to count."

    elif lookUpCount == 1:

      response = "There are **" + str(lookUpCount) + "** Blog Paid User(s) with a subscription longer than **" + str(monthsSubbed) + "** month(s) that have also looked up **" + str(lookUpCount) + "** category."
    
    else: 

      response = "There are **" + str(lookUpCount) + "** Blog Paid User(s) with a subscription longer than **" + str(monthsSubbed) + "** month(s) that have also looked up **" + str(lookUpCount) + "** categories."

    conn.close()
    return response

  else:
    
    conn.close()
    return "You are not connected to a database."

# BUSINESS REQUIREMENT # 8 
#
# For each demographic age X (ex: 18) and above, find the tier of permission total.
#
def permission(age):

  conn = connect()

  if conn:
    
    cursorObject = conn.cursor()

    sqlQuery = """
      
    SELECT 
    COUNT(CASE WHEN p.tier = 1 THEN 1 ELSE NULL END) AS TierOne
    ,COUNT(CASE WHEN p.tier = 2 THEN 1 ELSE NULL END) AS TierTwo
    ,COUNT(CASE WHEN p.tier = 3 THEN 1 ELSE NULL END) AS TierThree
    FROM Users u
    LEFT JOIN `Contains` c ON c.users_id = u.users_id
    LEFT JOIN Demographic d ON d.demographic_id = c.demographic_id
    LEFT JOIN `Allows` a ON a.users_id = u.users_id
    LEFT JOIN Permission p ON p.permission_id = a.permission_id
    WHERE d.age >= """ + str(age) 
    
    cursorObject.execute(sqlQuery)
    rows = cursorObject.fetchall()

    for row in rows:

      tierOne = row["TierOne"]
      tierTwo = row["TierTwo"]
      tierThree = row["TierThree"]

    if tierOne == 0 and tierTwo == 0 and tierThree == 0:

      response = "There are no accounts with permissions at a demographic age of **" + str(age) + "** or older. Therefore, no accounts with this age exist."

    else:

      response = "**Types of Persmission:**\n\nTier One - Entry\n Tier Two - Intermediate\n Tier Three - Advanced\n\nAccounts with a demographic age **" + str(age) + "** or older:\n\n**Tier One:** " + str(tierOne) + "\n**Tier Two:** " + str(tierTwo) + "\n**Tier Three:** " + str(tierThree)

    conn.close()
    return response

  else:

    conn.close()
    return "You are not connected to a database."
