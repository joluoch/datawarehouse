# datawarehouse
In this project we are making an ELT data pipeline.
Before we start lets define the abbreviations

1. E: Extract, refers to the process of getting data from the source.
2. T: Transform, refers to the process of transforming the raw data from the source (eg: joins with other tables, group by, column mapping,    denormalizing, lookups on external database, machine learning modeling, etc).
3. L: Load, refers to the process of loading the data into a table to be used.

ELT is mostly used when we don't really know the type of transformation needed foor the data. 

# TOOLS
1. SQL
2. DBT
3. REDASH 

# DATA
The data used is provided in https://anson.ucdavis.edu/~clarkf/  it contains station and traffic movement on those stations over time.

# Approach 

1. we will load the data from the different csv's into our Mysql database with the help of ariflow.
2. with dbt we will make models to perform some tranformations on the  data
3. we will display the queried columns on redash 




### Resources:
- https://dev.mysql.com/doc/connector-python/en/connector-python-example-ddl.html
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
- https://medium.com/@ikishan/creating-a-new-age-dashboard-with-self-hosted-open-source-redash-41e91434390
