import yfinance as yf
import pandas as pd
import requests
from bs4 import BeautifulSoup
import matplotlib.pyplot as plt

def get_stock_data(ticker):
    stock = yf.Ticker(ticker)
    stock_data = stock.history(period='max')
    return stock_data

def get_revenue_data(url, table_index=0):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    tables = pd.read_html(str(soup))
    revenue_data = tables[table_index]
    return revenue_data

# Extract Tesla stock data
tesla_stock = get_stock_data("TSLA")
# Extract GameStop stock data
gme_stock = get_stock_data("GME")

# Tesla revenue data URL (Yahoo Finance or Macrotrends suggested)
tesla_revenue_url = "https://www.macrotrends.net/stocks/charts/TSLA/tesla/revenue"
tesla_revenue = get_revenue_data(tesla_revenue_url)

# GameStop revenue data URL
gme_revenue_url = "https://www.macrotrends.net/stocks/charts/GME/gamestop/revenue"
gme_revenue = get_revenue_data(gme_revenue_url)

# Display sample data
print("Tesla Stock Data:")
print(tesla_stock.head())
print("\nTesla Revenue Data:")
print(tesla_revenue.head())

print("\nGameStop Stock Data:")
print(gme_stock.head())
print("\nGameStop Revenue Data:")
print(gme_revenue.head())
