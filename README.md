# E-Commerce Data Pipeline

## The Business problem

The Data Science team has been tasked with analyzing company data for one of the largest E-commerce platforms in Latam to assess performance in key metrics between 2016 and 2018.

The analysis focuses on two main areas:
	1.	Revenue Analysis:
	•	Total revenue per year.
	•	Most and least popular product categories.
	•	Revenue distribution by state.
	2.	Delivery Performance:
	•	Average delivery time per month.
	•	Difference between estimated and actual delivery dates.

This study aims to provide insights into sales trends and logistics efficiency to improve decision-making and optimize operations.

## About the data

You will consume and use data from two sources.

The first one is a Brazilian e-commerce public dataset of orders made at the Olist Store, provided as CSVs files. This is real commercial data, that has been anonymized. The dataset has information on 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil. Its features allow viewing orders from multiple dimensions: from order status, price, payment, and freight performance to customer location, product attributes and finally reviews written by customers. You will find an image showing the database schema at `images/data_schema.png`. 

To get the dataset please:
1.1.  Download it from this [link](https://drive.google.com/file/d/1HIy4LNNQESuXUj-u_mNJTCGCRrCeSbo-/view?usp=share_link)
1.2. Extract the `dataset` folder from the `.zip` file and place it into the root project folder. 
1.3. See `ASSIGNMENT.md`, section **Project Structure** to validate you've placed the dataset as it's needed.

2. The second source is a public API: https://date.nager.at. You will use it to retrieve information about Brazil's Public Holidays and correlate that with certain metrics about the delivery of products.

## Technical aspects

Because the team knows the data will come from different sources and formats, also, probably you will have to provide these kinds of reports on a monthly or annual basis. They decided to build a data pipeline (ELT) they can execute from time to time to produce the results.

The technologies involved are:

- Python as the main programming language
- Pandas for consuming data from CSVs files
- Requests for querying the public holidays API
- SQLite as a database engine
- SQL as the main language for storing, manipulating, and retrieving data in our Data Warehouse
- Matplotlib and Seaborn for the visualizations
- Jupyter notebooks to make the report an interactive way

## Instalation

A `requirements.txt` file is provided with all the needed Python libraries for running this project. For installing the dependencies just run:

```console
$ pip install -r requirements.txt
```

*Note:* We encourage you to install those inside a virtual environment.


## Tests

We provide unit tests along with the project that you can run and check from your side the code meets the minimum requirements of correctness needed to approve. To run just execute:

```console
$ pytest tests/
```