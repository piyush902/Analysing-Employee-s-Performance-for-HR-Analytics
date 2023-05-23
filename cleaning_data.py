import pandas as pd 
import os

os.getcwd()

cleaned_df=pd.read_csv('Uncleaned_employees_final_dataset.csv')

cleaned_df.drop_duplicates(inplace=True) #remove duplicate row

cleaned_df.info()

print(cleaned_df.isnull().sum())

cleaned_df.dropna(subset=['education','previous_year_rating'],inplace=True)

print(cleaned_df.isnull().sum())
#cleaned_df['previous_year_rating']=cleaned_df['previous_year_rating'].astype(int)

cleaned_df.info()
cleaned_df.describe()
cleaned_df.drop_duplicates(inplace=True)
cleaned_df.to_csv('employee.csv',encoding='UTF-8',index=False)