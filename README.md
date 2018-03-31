# **Driftrock Tech Test - Ed Goold**

## **Introduction**

This repo contains my submission for the March 2018 Driftrock Tech Test.

The Tech Test challenge was to produce an application that could parse data from a public API concerning a shopping basket to answer the following questions:

- most_sold - which item in an inventory sold the most?
- total_spend - how much did a specific user spend in total?
- most_loyal - which user made the most purchases from the inventory?

## **Installation and Dependencies**

After cloning this repo, please run the following from the command line to install all necessary elements to run the program:

```
bundle install
```

## **Approach**

The language used in this repo is Ruby and the following technologies were also employed:

- Rspec - testing framework
- Simplecov - testing coverage
- Rubocop - linter

## **User Stories**

To start, I broke the challenge down into the following User Stories:

_**User Story 1**_

```
As a User
So that I can find the most popular item in my inventory
I would like to see which has sold the most
```

_**User Story 2**_

```
As a User
So that I can see revenues from a customer
I would like to see the total spend associated with their e-mail address 
```

_**User Story 3**_

```
As a User
So that I can identify my most loyal customer
I would like to find the e-mail address associated with the most purchases
```

## **APIs**

The data concerning the shopping basket is featured in a public API hosted on the Heroku platform at the following address:

```
https://driftrock-dev-test.herokuapp.com 
```

The API features two endpoints - i) user data (/users) and ii) purchase data (/purchases).  It outputs the data in JSON format.

## **Methods**

The application parses data from those two endpoints through the following methods:

#### **1. most_sold**

This method identifies the item that has sold the most, meeting User Story 1 through:

```
- creates an item=>sales hash
- iterates over the API purchases data to either i) create a key=>value  pair for a given item
 if one does not exist, or ii) adds the purchase of an item to the value of the existing hash
- outputs the item with the greatest number of sales from  the hash, which finally represents
 item=>total sales structure
```

#### **2. total_spend**

This method calculates the total spend by one user, meeting User Story 2 through:

###### user e-mail/id

```
- takes an e-mail address as an argument to iterate over  the user data and identify the relevant data point
- identifies the user_id from that data point 
```

###### user id/spend

```
- takes the user_id above as an argument to iterate over  the purchases data and identify relevant data points
- takes the spend value from those data points and pushes them into an array
- outputs the sum of that array
```

#### **3. most_loyal**

This method identifies the user who has made the greatest number of purchases, meeting User Story 3 through:

###### user_ids array

```
- iterates over the user data endpoint to create an array of user_ids
```

###### user_ids/spend

```
- takes the user_ids array as an argument and the purchases endpoint as another
- creates a user_id=>spend hash 
- iterates over the user_ids array to either i) create a key=>value pair for a given user
 if one does not exist, or ii) add the spend of a purchase to the value of a user_id
- sorts the resulting user_id=>spend hash to identify the user_id with the greatest spend 
```

###### user_id/e-mail

```
- takes the user_id identified above as an argument
- iterates over the purchases endpoint to find the relevant user_id data point 
- outputs the e-mail address associated with that data point

```



