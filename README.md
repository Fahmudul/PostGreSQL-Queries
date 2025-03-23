# PostGreSQL-Queries

> **⚠️ Important Notice:**
> I used ChatGPT just for the styling and font sizing for the answers below. The original can be found here [PostGresSQL](https://docs.google.com/document/d/1fPB6Ow9BFc8QM2Ag75LoLjR6VyKoK_XCiVbqDZsG9xQ/edit?usp=sharing). It is the same as below just without style.


---

## 1️⃣ **What is PostgreSQL?**  
**PostgreSQL** একটি পাওয়ারফুল **অবজেক্ট রিলেশনাল ডেটাবেজ ম্যানেজমেন্ট সিস্টেম**। এটি খুবই ফেমাস তার **এক্সটেন্সিভ ফিচার সেট** এবং **SQL & JSON** ডাটার উপর কুয়েরি করার ক্ষমতার জন্য।

---

## 2️⃣ **What is the purpose of a database schema in PostgreSQL?**  
**PostgreSQL** এ **স্কিমা** হচ্ছে এক ধরনের **নেইমস্পেস** যা **মাল্টিপল ইউজার** একসাথে ব্যবহার করার সময় যেন কোন **কলিশন** না হয়। অন্য কথায়, এটি ডাটাবেজ সিস্টেমটাকে অনেক বেশি **ম্যানেজেবল** করে, ডাটাবেজ অবজেক্ট যেমন **ভিউস**, **ফাংশন**, **টেবিল** এগুলোকে **অর্গানাইজ** করে।

---

## 3️⃣ **Explain the Primary Key and Foreign Key concepts in PostgreSQL.**

### 🔹 **Primary Key:**  
কোন একটি টেবিলে যে কি সেই টেবলের যেকোন **row** কে **ইউনিকভাবে** খুঁজে বের করতে পারে তাকে ওই টেবিলের **প্রাইমারি কি** বলা হয়।

### 🔹 **Foreign Key:**  
কোন একটি টেবিলের **foreign key** হচ্ছে অন্য একটি টেবিলের **প্রাইমারি key**। **Foreign key** এর মাধ্যমে টেবিলের মধ্যে **রিলেশন** বজায় রাখা যায়।

---

## 4️⃣ **What is the difference between the VARCHAR and CHAR data types?**  

### 🔹 **VARCHAR:**  
এটি একটি নির্দিষ্ট সাইজ নেয় এবং **অব্যবহৃত জায়গাগুলো** ব্যবহার করে না।  

### 🔹 **CHAR:**  
এটি নির্দিষ্ট সাইজ নেয় কিন্তু **অব্যবহৃত জায়গাগুলোকে হোয়াইট স্পেস দিয়ে পূরণ** করে ফেলে।

---

## 5️⃣ **Explain the purpose of the WHERE clause in a SELECT statement.**  
**WHERE** ক্লজ দিয়ে **টেবিলের মধ্যে ডাটা খোজার সময় শর্ত** এপ্লাই করা যায়।  

**উদাহরণ:**  
```sql
SELECT * FROM orders WHERE quantity > 0;

এখানে **অর্ডার নামক টেবিল** থেকে সেই সকল **ডাটা** দেখানো হবে যেখানে **কোয়ান্টিটি** শূন্য থেকে বেশি।

---
```
## 6️⃣ **What are the LIMIT and OFFSET clauses used for?**  

### 🔹 **LIMIT:**  
নির্দিষ্ট পরিমাণ ডাটা দেখানোর জন্য **LIMIT** ব্যবহার করা হয়।  

### 🔹 **OFFSET:**  
নির্দিষ্ট পরিমাণ ডাটা **স্কিপ** করে তার পরবর্তী ডাটা দেখানোর জন্য **OFFSET** ব্যবহার করা হয়।

**উদাহরণ:**  
```sql
SELECT * FROM actors LIMIT 10 OFFSET 2;

এখানে প্রথম দুটি **row** বাদ দিবে **OFFSET** প্রোপার্টি এবং তৃতীয় থেকে শুরু করে **১০টি row** রিটার্ন করবে যা **LIMIT** এর কাজ।

---
```
## 7️⃣ **How can you modify data using UPDATE statements?**  
**UPDATE** কিওয়ার্ড ব্যবহার করা হয় টেবিলের **রো তে কলামের ডাটা** পরিবর্তন করার জন্য।  

**উদাহরণ:**  
```sql
UPDATE table_name SET field_name = new_value WHERE age < 15;

এখানে **age < 15** হলে সেই **ডাটা** পরিবর্তন হবে।

---
```
## 8️⃣ **What is the significance of the JOIN operation, and how does it work in PostgreSQL?**  
**JOIN:** এটি ব্যবহার করা হয় দুটি টেবিলকে **একটি টেবিলে রূপান্তর** করার জন্য।

**উদাহরণ:**  
```sql
SELECT * FROM orders JOIN customers ON orders.customer_id = customers.id;

এখানে **কাস্টমার টেবিলের সাথে অর্ডার টেবিল** যুক্ত হবে, যেখানে **অর্ডার টেবিলের কাস্টমার আইডির সাথে কাস্টমার টেবিলের আইডি মিললেই** সেই সকল রো নিয়ে নতুন একটি টেবিল তৈরি হবে।

---
```

## 9️⃣ **Explain the GROUP BY clause and its role in aggregation operations.**  
**GROUP BY**: এটি দিয়ে কোন একটি টেবিলের একটি নির্দিষ্ট কলামের উপর ভিত্তি করে **row ভাগ** করা হয়।  

**উদাহরণ:**  
```sql
SELECT SUM(quantity) FROM orders GROUP BY email;

এখানে **অর্ডার টেবিলে ইমেইলের মাধ্যমে** টেবিলের **row গুলোকে বিভক্ত** করা হবে, যেমন অর্ডার টেবিলে যতগুলো **ই-মেইল** থাকবে সেই **ইমেইল এর উপর ভিত্তি** করে গ্রুপ করা হবে।

---
```
## 🔟 **How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?**  
**Aggregate ফাংশন** হল এমন এক ধরনের ফাংশন যা কোন একটা টেবিলের সবগুলো **row** এর উপর অপারেশন করে এবং একটি ফলাফল দেয়।

### 🔹 **COUNT:**  
```sql
SELECT COUNT(*) FROM students;

এটি **students টেবিলে** যতগুলো ছাত্র আছে তাদের সংখ্যা দেখাবে।

### 🔹 **SUM:**  
```sql
SELECT SUM(price) FROM orders;
```
এটি **অর্ডার টেবিলের থেকে** প্রতিটি রোতে থাকা **price** যোগ করে **টোটাল প্রাইস** দেখাবে।

### 🔹 **AVG:**  
```sql
SELECT AVG(age) FROM students;
```
এটি **students টেবিলে** প্রত্যেকটি **স্টুডেন্টের age** যোগ করবে এবং **টোটাল নাম্বার অফ স্টুডেন্ট** দিয়ে ভাগ করবে এবং **এভারেজ age** শো করবে।

---

```

