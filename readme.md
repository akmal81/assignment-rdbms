### 1. What is PostgreSQL?
-------------------------------
PostgreSql হলো একটি database management system যাকে object-relational  
database management system (RDBMS) ও বলা হয়| 

PostgreSql Open source platform অর্থাৎ এটা সম্পূর্ণ free এবং যে কেউ এটাকে customize 
এবং share করতে পারে| 

এটি SQL এর সমস্ত feature যেমন join, subquery, Aggregate Function ইত্যাদি ব্যবহার করে
 data management করা যায়| এটি pl/pgSql, pyhon, javascript  বিভিন্ন language support করে|
PostgreSql rlational database এর পাশাপাশি Nosql data (json) ও  support করে| 

বিভিন্ন ধরনের web-application এবং mobile application তৈরীর কাজে ব্যবহার করা হয়|

### 2. What is the purpose of a database schema in PostgreSQL?
-------------------------------

Database schema কে আমরা গ্রুপ হিসেবে কল্পনা করতে পারি| যেখানে একটি database 
মধ্যে থাকা বিভিন্ন অবজেক্ট যেমন table, view,  function ইত্যাদি কে গ্রুপ  করে রাখতে পারি|

ডাটাবেজে বিভিন্ন module যেমন admin modul, public মডিউল এগুলোকে বিভিন্ন schema 
মাধ্যমে গ্রুপ করে data organize করে রাখা যায়|

প্রতিটি  schema জন্য আলাদা role সেট করা যায়। যা সিকিউরিটি নিশ্চিত করে|
একজন userকে নির্দিষ্ট কিছু resources উপর কাজ করার জন্য shcema
সাহায্যকারীর ভূমিকা পালন করেন|

schema database maintenance  সহজ করে|



### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
-------------------------------

###### Primary Key:
Primary Key একটি constraint| 
এক বা একাধিক কলামের সমন্বয়ে Primary Key হতে পারে|
Primary Key একটি table এর প্রত্যেকটি data  বা row কে আলাদা আলাদা ভাবে এবং unique ভাবে চিহ্নিত করতে পারে|
প্রাইমারি কি ইউনিক হয়|
প্রাইমারি কি নাল হতে পারে না|

Example: 
```
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INT
);```
Students table এর primary key হলো id.

###### Foreign Key:

একটি একটি টেবিলের Primary Key যখন অন্য একটি টেবিলকে সংযুক্ত করার জন্য ওই টেবিলে  কলাম হিসেবে ব্যবহার করা হয় তখন তাকে Foreign Key বলে
মনে করি দুটি টেবিল Students এবং Enrollment| এখন, enrollmant টেবিলের student_id রেফারেন্স করে  Students টেবিলের id column কে | তাহলে enrollmant টেবিলের
student_id কে বলা হয় Foreign Key| Foreign Key প্রধান কাজ হল দুটি টেবলের মধ্যে connection করে|

CREATE TABLE enrollments (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(id),
  course_name VARCHAR(100)
);



### 4. What is the difference between the VARCHAR and CHAR data types?
-------------------------------

###### VARCHAR Vs CHAR:
VARCHAR পরিবর্তনশীল দৈর্ঘ্যের data type. 

CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
);
উপরাক্ত টেবিলে name column টিকে VARCHAR(50) data type এ  declear করা হয়েছে|
যেখানে 50 টি ক্যারেক্টার রাখা যাবে, কিন্তু যদি এমন হয় যে কারোর নাম ২০ কারেক্টর তাহলে, ২০ কারেক্টরের জায়গায় নিবে, এর বেশি নিবেনা|

অপরদিকে: 
CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name CHAR(50),
);

CHAR দিয়ে যদি name declear করা হয় তাহলে সে ৫০ ক্যারেক্টার জায়গায় নিবে, যদিও কারো নাম যদি 20 কারেক্টার হয় তাহলেও সে ৫০ ক্যারেক্টরের জায়গায় নিবে|

তাহলে আমরা বলতে পারি যে VARCHAR ব্যবহার করা হয় পরিবর্তন করা যায় এমন দৈর্ঘ্যের ক্যারেক্টর এর জন্য| যেমন: first_name, last_name, email,
আর CHAR ব্যবহার করা হয় নির্দিষ্ট দৈর্ঘ্যের ক্যারেক্টর এর জন্য|  যেমন: blood_groop, 



### 5. Explain the purpose of the WHERE clause in a SELECT statement.
-------------------------------

কোন একটি SQL query যদি শর্তসাপেক্ষে execute করাতে হয় তাহলে আমরা WHERE ব্যবহার করে থাকি|

SELECT * FROM student
WHERE age < 21

একটি students টেবিলে কোন স্টুডেন্টকে বের করতে বলা হয় যাদের বয়স ২১, তাহলে এখানে, একটি শর্ত প্রযোজ্য হয় সেটি হচ্ছে বয়স একুশের কম| এক্ষেত্রে WHERE clause এ age< ২১ ব্যবহার করে আমরা query টি সঠিকভাবে এক্সিকিউ করতে পারি| 

সারিগুলোর মধ্যে থেকে নির্দিষ্ট শর্ত অনুযায়ী ফিল্টার করে
তাহলে আমরা বলতে পারি,  WHERE clause একটি টেবিলের row গুলোর মধ্য থেকে  শর্ত অনুযায়ী ফিল্টার করে|
